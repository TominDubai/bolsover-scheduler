-- 019: Packages — the layer below the project card (catch-up session 4, 28 Oct 2026; brief section 3 "Items → Packages").
-- Concept 5 breaks a project into joinery items; Bolsover breaks it into WORK PACKAGES, one per trade, each with a
-- subcontractor / supplier, a value, planned vs actual dates and five milestones:
--   awarded → approvals done → on site → complete → snagged
-- The package rows ARE the programme rows: `programme_packages` (db/004, P6 baseline dates) gains the package columns
-- rather than a second table, so the programme panel, the prog_* health columns on projects_live, the 07:00 alerts and
-- the daily report keep reading the same data. Nothing is duplicated and nothing existing changes shape.
--
-- Milestones and the programme columns are the same facts seen twice, kept in step by trigger:
--   on_site_on  ↔ actual_start        complete_on ↔ actual_finish (and pct_complete = 100)
-- Trades (18, agreed with Tom 28 Oct) and suppliers are data, not code. Names of people and companies live in the
-- database only.
--
-- Submittal register NOT built (Tom, 28 Oct: milestones only; authority approvals matter more than consultant
-- submittals on villa work). Each package instead carries one approval line: authority, submitted, received.
--
-- Apply with execute_sql section by section. The MCP refuses `drop …`; nothing here drops.
set search_path = scheduler, public;

-- =====================================================================================
-- 1. trades (editable list; seed = Tom's 18)
-- =====================================================================================
create table if not exists package_trades (
  id          uuid primary key default gen_random_uuid(),
  name        text not null unique,
  short       text not null unique,          -- code prefix, e.g. MEP, JOIN
  sort_order  int  not null default 0,
  is_active   boolean not null default true
);
insert into package_trades(name, short, sort_order) values
  ('Preliminaries & site set-up', 'PREL', 1),
  ('Demolition & strip-out', 'DEMO', 2),
  ('Civil, concrete & masonry', 'CIV', 3),
  ('Waterproofing & insulation', 'WP', 4),
  ('MEP (HVAC, electrical, plumbing)', 'MEP', 5),
  ('Metal works', 'MET', 6),
  ('Doors & windows', 'DW', 7),
  ('Glass & glazing', 'GLZ', 8),
  ('Flooring & tiling', 'FLR', 9),
  ('Stone', 'STN', 10),
  ('Wall finishes & paint', 'PNT', 11),
  ('Ceilings & gypsum', 'CLG', 12),
  ('Joinery', 'JOIN', 13),
  ('Furniture & FF&E', 'FFE', 14),
  ('Sanitary & plumbing fixtures', 'SAN', 15),
  ('Lighting', 'LGT', 16),
  ('Landscaping & outdoor', 'LND', 17),
  ('Snagging & handover', 'SNAG', 18)
on conflict (name) do nothing;

-- =====================================================================================
-- 2. suppliers (subcontractors and suppliers; `contractors` stays the main-contractor list a job came through)
-- =====================================================================================
create table if not exists suppliers (
  id          uuid primary key default gen_random_uuid(),
  name        text not null unique,
  trade_id    uuid references package_trades(id),   -- their usual trade, for the picker
  contact     text,
  phone       text,
  email       text,
  notes       text,
  is_active   boolean not null default true,
  created_by  uuid references people(id),
  created_at  timestamptz not null default now()
);

-- =====================================================================================
-- 3. the package columns on programme_packages
-- =====================================================================================
create type package_status as enum ('NOT_AWARDED','AWARDED','APPROVED','ON_SITE','COMPLETE','SNAGGED','CANCELLED');

alter table programme_packages
  add column if not exists trade_id            uuid references package_trades(id),
  add column if not exists supplier_id         uuid references suppliers(id),
  add column if not exists value               numeric(14,2),            -- package order value, ex VAT (cost side of the P&L later)
  add column if not exists status              package_status not null default 'NOT_AWARDED',   -- maintained by trigger from the milestones
  add column if not exists owner_id            uuid references people(id),   -- who chases it; defaults to the project PM
  add column if not exists awarded_on          date,
  add column if not exists approved_on         date,                     -- submittals / materials / authority approvals all in hand
  add column if not exists on_site_on          date,                     -- = actual_start
  add column if not exists complete_on         date,                     -- = actual_finish
  add column if not exists snagged_on          date,
  add column if not exists cancelled           boolean not null default false,
  add column if not exists approval_authority  text,                     -- DM / Emaar / Nakheel / Trakhees / DDA / consultant / none
  add column if not exists approval_submitted  date,
  add column if not exists approval_received   date,
  add column if not exists approval_note       text,
  add column if not exists created_by          uuid references people(id),
  add column if not exists created_at          timestamptz not null default now();
create index if not exists programme_packages_supplier_idx on programme_packages(supplier_id);
create index if not exists programme_packages_owner_idx on programme_packages(owner_id);

-- =====================================================================================
-- 4. alert thresholds (data, like C5's alert_settings) — package rules P1/P4/P6 + authority approval PA
-- =====================================================================================
create table if not exists alert_settings (
  rule       text primary key,
  label      text not null,
  threshold  int,
  enabled    boolean not null default true
);
insert into alert_settings(rule, label, threshold) values
  ('P1', 'Package slipping (planned finish passed, not complete) — PM + site engineer + escalations', 0),
  ('P4', 'Package awarded, no planned dates after N working days — PM + QS', 3),
  ('P6', 'Site works started, package still not awarded — PM + QS', 0),
  ('PA', 'Authority approval submitted, nothing back after N days — PM', 14)
on conflict (rule) do nothing;

-- =====================================================================================
-- 5. trade guess for existing P6 packages (names like "FINISHES (WET TRADES)"); used by the backfill below
-- =====================================================================================
create or replace function package_trade_guess(nm text) returns uuid language plpgsql stable set search_path = scheduler, public as $$
declare s text := upper(coalesce(nm, '')); sh text;
begin
  sh := case
    when s ~ 'PRELIM|SITE SET|MOBILI|SITE WORK'            then 'PREL'
    when s ~ 'DEMOL|STRIP'                                  then 'DEMO'
    when s ~ 'CONCRETE|MASONRY|BLOCK|PARTITION|CIVIL|STRUCT' then 'CIV'
    when s ~ 'WATERPROOF|THERMAL|MOISTURE|INSUL'            then 'WP'
    when s ~ 'MEP|HVAC|ELECTRIC|PLUMB|MECHAN'               then 'MEP'
    when s ~ 'METAL|STEEL|RAILING|BALUSTRADE'               then 'MET'
    when s ~ 'DOOR|WINDOW|SKYLIGHT'                         then 'DW'
    when s ~ 'GLASS|GLAZ'                                   then 'GLZ'
    when s ~ 'FLOOR|TIL|HARD FINISH'                        then 'FLR'
    when s ~ 'STONE|MARBLE|GRANITE'                         then 'STN'
    when s ~ 'PAINT|WET TRADE|PLASTER|WALL FINISH'          then 'PNT'
    when s ~ 'CEILING|GYPSUM'                               then 'CLG'
    when s ~ 'JOINER|WARDROBE|KITCHEN|CARPENT'              then 'JOIN'
    when s ~ 'FURNIT|FF&E|LOOSE|ACCESSOR'                   then 'FFE'
    when s ~ 'SANITARY|FIXTURE'                             then 'SAN'
    when s ~ 'LIGHT'                                        then 'LGT'
    when s ~ 'EXTERNAL|LANDSCAP|POOL|OUTDOOR|GARDEN'        then 'LND'
    when s ~ 'SNAG|HANDOVER|CLOSE'                          then 'SNAG'
  end;
  if sh is null then return null; end if;
  return (select id from package_trades where short = sh);
end $$;

-- =====================================================================================
-- 6. stamp + keep milestones and programme dates in step
-- =====================================================================================
create or replace function stamp_package() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare who uuid := current_person_id(); tsh text;
begin
  if tg_op = 'INSERT' then
    new.created_by := coalesce(new.created_by, who);
    if new.owner_id is null then select pm_id into new.owner_id from projects where id = new.project_id; end if;
    if new.sort = 0 then select coalesce(max(sort), 0) + 1 into new.sort from programme_packages where project_id = new.project_id; end if;
    if new.trade_id is null then new.trade_id := package_trade_guess(new.name); end if;
    if new.code is null then
      select short into tsh from package_trades where id = new.trade_id;
      new.code := coalesce(tsh, 'PKG') || '-' || lpad((select count(*) + 1 from programme_packages k where k.project_id = new.project_id and k.trade_id is not distinct from new.trade_id)::text, 2, '0');
      -- keep it unique per project
      while exists (select 1 from programme_packages k where k.project_id = new.project_id and k.code = new.code) loop
        new.code := new.code || 'a';
      end loop;
    end if;
  end if;
  -- milestones ↔ programme columns (whichever side was touched wins)
  if tg_op = 'UPDATE' then
    if new.on_site_on is distinct from old.on_site_on then new.actual_start := new.on_site_on;
    elsif new.actual_start is distinct from old.actual_start then new.on_site_on := new.actual_start; end if;
    if new.complete_on is distinct from old.complete_on then
      new.actual_finish := new.complete_on;
      if new.complete_on is not null then new.pct_complete := 100; end if;
    elsif new.actual_finish is distinct from old.actual_finish then new.complete_on := new.actual_finish;
      if new.actual_finish is not null then new.pct_complete := 100; end if;
    elsif new.pct_complete >= 100 and old.pct_complete < 100 and new.complete_on is null then
      new.complete_on := current_date; new.actual_finish := coalesce(new.actual_finish, current_date);
    end if;
  else
    new.actual_start := coalesce(new.actual_start, new.on_site_on); new.on_site_on := coalesce(new.on_site_on, new.actual_start);
    new.actual_finish := coalesce(new.actual_finish, new.complete_on); new.complete_on := coalesce(new.complete_on, new.actual_finish);
  end if;
  -- a later milestone implies the earlier ones
  if new.snagged_on is not null then new.complete_on := coalesce(new.complete_on, new.snagged_on); new.actual_finish := coalesce(new.actual_finish, new.complete_on); new.pct_complete := 100; end if;
  if new.complete_on is not null then new.on_site_on := coalesce(new.on_site_on, new.complete_on); new.actual_start := coalesce(new.actual_start, new.on_site_on); end if;
  if new.on_site_on is not null then new.awarded_on := coalesce(new.awarded_on, new.on_site_on); end if;
  if new.approved_on is not null then new.awarded_on := coalesce(new.awarded_on, new.approved_on); end if;
  if new.approval_received is not null and new.approval_submitted is null then new.approval_submitted := new.approval_received; end if;
  -- status is a function of the milestones
  new.status := case
    when new.cancelled then 'CANCELLED'
    when new.snagged_on is not null then 'SNAGGED'
    when new.complete_on is not null then 'COMPLETE'
    when new.on_site_on is not null then 'ON_SITE'
    when new.approved_on is not null then 'APPROVED'
    when new.awarded_on is not null then 'AWARDED'
    else 'NOT_AWARDED' end;
  return new;
end $$;
-- runs BEFORE the existing log_programme_changes (alphabetical: trg_package_stamp < trg_programme_change_log), so the
-- progress log sees the reconciled dates
create trigger trg_package_stamp before insert or update on programme_packages for each row execute function stamp_package();

-- =====================================================================================
-- 7. change log: package events ride on the project (same 10-minute digest; kind 'package')
-- =====================================================================================
create or replace function supplier_name(s uuid) returns text language sql stable set search_path = scheduler, public as $$ select name from suppliers where id = s $$;

create or replace function log_package_changes() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare who uuid := current_person_id(); lbl text := initcap(lower(new.name));
begin
  if tg_op = 'INSERT' then
    insert into change_log(project_id, kind, field, new_value, changed_by) values (new.project_id, 'package_created', lbl, new.name, who);
    return null;
  end if;
  if new.cancelled and not old.cancelled then
    insert into change_log(project_id, kind, field, changed_by) values (new.project_id, 'package_cancelled', lbl, who); return null; end if;
  if new.status is distinct from old.status then
    insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'package_status', lbl, old.status::text, new.status::text, who); end if;
  if new.supplier_id is distinct from old.supplier_id then
    insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'package_supplier', lbl, supplier_name(old.supplier_id), supplier_name(new.supplier_id), who); end if;
  if new.value is distinct from old.value then
    insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'package_value', lbl, old.value::text, new.value::text, who); end if;
  if new.owner_id is distinct from old.owner_id then
    insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'package_owner', lbl, person_name(old.owner_id), person_name(new.owner_id), who); end if;
  if new.planned_start is distinct from old.planned_start or new.planned_finish is distinct from old.planned_finish then
    insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'package_planned', lbl,
      coalesce(old.planned_start::text, '—') || ' → ' || coalesce(old.planned_finish::text, '—'), coalesce(new.planned_start::text, '—') || ' → ' || coalesce(new.planned_finish::text, '—'), who); end if;
  if new.approval_received is distinct from old.approval_received and new.approval_received is not null then
    insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'package_approval', lbl, new.approval_authority, new.approval_received::text, who); end if;
  return null;
end $$;
create trigger trg_package_change_log after insert or update on programme_packages for each row execute function log_package_changes();

-- =====================================================================================
-- 8. the computed views
-- =====================================================================================
create view packages_live with (security_invoker = true) as
select
  k.*,
  t.name  as trade,
  t.short as trade_short,
  s.name  as supplier,
  o.name  as owner,
  p.name  as project_name, p.enquiry_no, p.status as project_status, p.client, p.deleted_at as project_deleted_at, p.archived_at as project_archived_at,
  p.pm_id, pm.name as pm, p.site_engineer_id,
  (not k.cancelled and k.complete_on is null and k.planned_finish is not null and k.planned_finish < current_date) as slipping,
  (not k.cancelled and k.complete_on is null and k.forecast_finish is not null and k.planned_finish is not null and k.forecast_finish > k.planned_finish) as forecast_late,
  (not k.cancelled and k.awarded_on is not null and k.planned_start is null) as no_dates,
  (not k.cancelled and k.approval_submitted is not null and k.approval_received is null) as approval_waiting,
  case when k.approval_submitted is not null and k.approval_received is null then current_date - k.approval_submitted end as approval_waiting_days,
  case when k.complete_on is null and k.planned_finish is not null and k.planned_finish < current_date then current_date - k.planned_finish end as days_overdue
from programme_packages k
join projects p on p.id = k.project_id
left join package_trades t on t.id = k.trade_id
left join suppliers s on s.id = k.supplier_id
left join people o on o.id = k.owner_id
left join people pm on pm.id = p.pm_id;

-- per-project counts for the board strip and the digest (projects_live is left alone; the app stitches these on)
create view project_package_counts with (security_invoker = true) as
select
  project_id,
  count(*) filter (where not cancelled)                                                        as pkg_total,
  count(*) filter (where not cancelled and status <> 'NOT_AWARDED')                            as pkg_awarded,
  count(*) filter (where not cancelled and status in ('ON_SITE'))                              as pkg_on_site,
  count(*) filter (where not cancelled and status in ('COMPLETE','SNAGGED'))                   as pkg_complete,
  count(*) filter (where not cancelled and (slipping or forecast_late))                        as pkg_slipping,
  count(*) filter (where not cancelled and status = 'NOT_AWARDED')                             as pkg_not_awarded,
  sum(value) filter (where not cancelled and status <> 'NOT_AWARDED')                          as pkg_value_awarded,
  min(planned_finish) filter (where not cancelled and complete_on is null and planned_finish < current_date) as earliest_slip
from packages_live
group by project_id;

-- =====================================================================================
-- 9. security
-- =====================================================================================
alter table package_trades enable row level security;
alter table suppliers enable row level security;
alter table alert_settings enable row level security;
create policy read_all on package_trades for select to authenticated using (true);
create policy read_all on suppliers for select to authenticated using (true);
create policy read_all on alert_settings for select to authenticated using (true);
create policy write_projects on suppliers for all to authenticated using ((me()).can_edit_projects or (me()).can_edit_estimation) with check ((me()).can_edit_projects or (me()).can_edit_estimation);
create policy write_admin on package_trades for all to authenticated using ((me()).is_admin or (me()).can_manage_team) with check ((me()).is_admin or (me()).can_manage_team);
create policy write_admin on alert_settings for all to authenticated using ((me()).is_admin) with check ((me()).is_admin);
-- the PM / second PM / site engineer on the job can move its packages, the same as site_reports (db/012); Projects permission can do anything
create policy write_own_job on programme_packages for all to authenticated
  using (exists (select 1 from projects p where p.id = project_id and current_person_id() in (p.pm_id, p.pm2_id, p.site_engineer_id)))
  with check (exists (select 1 from projects p where p.id = project_id and current_person_id() in (p.pm_id, p.pm2_id, p.site_engineer_id)));
grant all on package_trades, suppliers, alert_settings to authenticated, service_role;
grant select on packages_live, project_package_counts to authenticated, service_role;

-- =====================================================================================
-- 10. backfill: Sidra 170's 15 P6 packages get a trade and an owner (the project PM); dates already there
-- =====================================================================================
update programme_packages k set trade_id = package_trade_guess(k.name) where k.trade_id is null;
update programme_packages k set owner_id = p.pm_id from projects p where p.id = k.project_id and k.owner_id is null;
-- (the update fires stamp_package → status recomputed from the milestones: all NOT_AWARDED until someone says otherwise)
-- the backfill is housekeeping, not news: don't let the 10-minute digest tell the Sidra team about it
update change_log set notified_at = now() where kind like 'package_%' and notified_at is null;
