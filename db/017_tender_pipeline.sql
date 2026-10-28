-- 017: Estimation as a tender pipeline (catch-up session 2, 28 Oct 2026).
-- Decisions (Tom, 28 Oct): every enquiry lands in a QUALIFYING column and management proceed / decline it before
-- Blessie prices it; enquiry source (word of mouth / Instagram / referral + who / designer + who); consultant,
-- client address, project type; site visit date + who; submitted by email and/or WhatsApp; win / loss reason;
-- a light "responsibility pass" (ball holder) until the Rev 3 workflow arrives in session 3; VO enquiries that
-- win straight into the parent project's VO list (C5 db/011 pattern on Bolsover's variations table).
--
-- Apply with execute_sql section by section (the MCP refuses `drop …`). Section 1 (enum values) must be
-- its own statement — new enum values can't be used in the same transaction they're added in.
set search_path = scheduler, public;

-- =====================================================================================
-- 1. enum values (own statement, own transaction)
-- =====================================================================================
alter type quote_stage add value if not exists 'QUALIFYING' before 'QUEUED';
alter type project_status add value if not exists 'MERGED';

-- =====================================================================================
-- 2. tender fields on projects
-- =====================================================================================
alter table projects
  add column if not exists source            text,            -- WORD_OF_MOUTH | INSTAGRAM | REFERRAL | DESIGNER | REPEAT_CLIENT | OTHER
  add column if not exists source_name       text,            -- who referred it / which designer
  add column if not exists consultant        text,
  add column if not exists client_address    text,
  add column if not exists project_type      text,            -- Villa fit-out, Apartment fit-out, Office, Retail / F&B, Landscaping, Renovation, Other
  add column if not exists site_visit_date   date,
  add column if not exists site_visit_by     uuid references people(id),
  add column if not exists submit_via        text,            -- "Email", "WhatsApp" or "Email, WhatsApp"
  add column if not exists outcome_reason    text,            -- why it was won / lost / declined
  add column if not exists qualified_at      timestamptz,     -- when management said proceed
  add column if not exists qualified_by      uuid references people(id),
  add column if not exists ball_with         uuid references people(id),   -- who the enquiry is waiting on right now
  add column if not exists ball_since        timestamptz,
  add column if not exists ball_note         text,
  add column if not exists parent_project_id uuid references projects(id) on delete set null;  -- VO enquiry → the live job it belongs to
create index if not exists projects_parent on projects(parent_project_id) where parent_project_id is not null;
create index if not exists projects_ball on projects(ball_with) where ball_with is not null;

alter table variations add column if not exists source_enquiry_id uuid references projects(id) on delete set null;

-- the pass log: who handed the enquiry to whom
create table if not exists enquiry_passes (
  id          bigint generated always as identity primary key,
  project_id  uuid not null references projects(id) on delete cascade,
  from_id     uuid references people(id),
  to_id       uuid references people(id),
  note        text,
  passed_at   timestamptz not null default now()
);
create index if not exists enquiry_passes_project on enquiry_passes(project_id, passed_at desc);
alter table enquiry_passes enable row level security;
drop policy if exists read_all on enquiry_passes;
create policy read_all on enquiry_passes for select to authenticated using (true);
grant select on enquiry_passes to authenticated, service_role;

-- =====================================================================================
-- 3. ball-holder trigger: every change of ball_with writes a pass row and a change_log line ('passed')
-- =====================================================================================
create or replace function log_ball_pass() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare who uuid := current_person_id();
begin
  if tg_op = 'UPDATE' and new.ball_with is distinct from old.ball_with then
    new.ball_since := now();
    insert into enquiry_passes(project_id, from_id, to_id, note) values (new.id, old.ball_with, new.ball_with, new.ball_note);
    insert into change_log(project_id, kind, field, old_value, new_value, changed_by)
    values (new.id, 'passed', coalesce(new.ball_note, ''), person_name(old.ball_with), person_name(new.ball_with), who);
  end if;
  if tg_op = 'UPDATE' and new.quote_stage = 'QUEUED' and old.quote_stage = 'QUALIFYING' and new.qualified_at is null then
    new.qualified_at := now(); new.qualified_by := who;
  end if;
  return new;
end $$;
drop trigger if exists trg_ball_pass on projects;
create trigger trg_ball_pass before update on projects for each row execute function log_ball_pass();

-- estimators may also set a quote to MERGED (through win_as_vo) — same policy shape as 001, plus MERGED
alter policy update_rows on projects
  with check ((me()).can_edit_projects or ((me()).can_edit_estimation and status in ('PENDING','QUOTED','WON','ON_HOLD','REJECTED','LOST','MERGED')));

-- =====================================================================================
-- 4. win_as_vo: a VO enquiry marked won becomes the next VO on its parent; the enquiry row is MERGED
-- =====================================================================================
create or replace function win_as_vo(enquiry uuid) returns int language plpgsql security definer set search_path = scheduler, public as $$
declare
  e projects%rowtype;
  n int;
begin
  if not coalesce((me()).can_edit_estimation, false) and not coalesce((me()).can_edit_projects, false) then
    raise exception 'You need estimation rights to do that';
  end if;
  select * into e from projects where id = enquiry for update;
  if e.id is null then raise exception 'Enquiry not found'; end if;
  if e.status not in ('PENDING','QUOTED') then raise exception 'That enquiry is no longer a quote'; end if;
  if e.parent_project_id is null then raise exception 'Pick which project this VO belongs to first'; end if;
  if coalesce(e.quoted_value, 0) = 0 then raise exception 'Enter the quoted value before marking it won (a credit is a minus figure)'; end if;

  select coalesce(max(vo_no), 0) + 1 into n from variations where project_id = e.parent_project_id;
  insert into variations(project_id, vo_no, description, value, approved_on, source_enquiry_id)
  values (e.parent_project_id, n, coalesce(nullif(e.quote_type, ''), 'VO') || ' — ' || e.name || coalesce(' (' || e.enquiry_no || ')', ''), e.quoted_value, current_date, e.id);

  update projects set status = 'MERGED', quote_stage = 'SUBMITTED', quote_submitted_date = coalesce(quote_submitted_date, current_date) where id = e.id;
  return n;
end $$;
grant execute on function win_as_vo(uuid) to authenticated;

-- =====================================================================================
-- 5. projects_live: p.* is frozen, so rename → create → (Tom drops the old one in the SQL editor).
--    Body = 016 + parent name / enquiry no, ball holder, site visit, latest quote-bill margin.
-- =====================================================================================
alter view projects_live rename to projects_live_016;
create view projects_live with (security_invoker = true) as
select
  p.*,
  c.name  as contractor,
  pm.name as pm,
  pm2.name as pm2,
  se.name as site_engineer,
  es.name as estimator,
  p.signed_quote + coalesce((select sum(value) from variations v where v.project_id = p.id),0) as project_value,
  (select count(*) from variations v where v.project_id = p.id) as vo_count,
  (select count(*) from quote_revisions r where r.project_id = p.id) as rev_count,
  (select count(*) filter (where not done) from premob_items i where i.project_id = p.id) as premob_open,
  p.target_date - p.start_date as days_to_completion,
  coalesce(p.completed_date, current_date) - p.start_date as duration_days,
  case when p.target_date is null then null else coalesce(p.completed_date, current_date) - p.target_date end as days_delayed,
  current_date - p.received_date as days_since_enquiry,
  current_date - p.quote_submitted_date as days_since_quoted,
  (select max(changed_at) from status_history h where h.project_id = p.id) as status_since,
  h.pkgs      as prog_pkgs,
  h.done      as prog_done,
  h.behind    as prog_behind,
  h.pct       as prog_pct,
  h.next_due  as prog_next_due,
  h.forecast_end as prog_forecast_end,
  ck.status::text as checkin_status,
  ck.note     as checkin_note,
  ck.created_at as checkin_at,
  ck.person_id as checkin_by,
  db.name     as deleted_by_name,
  tr.target_rev,
  tr.target_rev0_date,
  pp.name       as parent_name,
  pp.enquiry_no as parent_enquiry_no,
  bw.name       as ball_with_name,
  sv.name       as site_visit_by_name,
  bq.margin_pct as boq_margin_pct
from projects p
left join contractors c on c.id = p.contractor_id
left join people pm  on pm.id  = p.pm_id
left join people pm2 on pm2.id = p.pm2_id
left join people se  on se.id  = p.site_engineer_id
left join people es  on es.id  = p.estimator_id
left join people db  on db.id  = p.deleted_by
left join people bw  on bw.id  = p.ball_with
left join people sv  on sv.id  = p.site_visit_by
left join projects pp on pp.id = p.parent_project_id
left join lateral (
  select count(*)::int as pkgs,
         count(*) filter (where k.actual_finish is not null or k.pct_complete >= 100)::int as done,
         count(*) filter (where k.actual_finish is null and k.pct_complete < 100 and (
              k.planned_finish < current_date
           or (k.forecast_finish is not null and k.forecast_finish > k.planned_finish)
           or (k.actual_start is null and k.pct_complete = 0 and k.planned_start < current_date)))::int as behind,
         round(sum(coalesce(k.planned_days,1) * k.pct_complete)::numeric / nullif(sum(coalesce(k.planned_days,1)),0))::int as pct,
         min(k.planned_finish) filter (where k.actual_finish is null and k.pct_complete < 100) as next_due,
         max(coalesce(k.actual_finish, k.forecast_finish, k.planned_finish)) as forecast_end
  from programme_packages k where k.project_id = p.id
) h on true
left join lateral (
  select c2.status, c2.note, c2.created_at, c2.person_id from checkins c2 where c2.project_id = p.id order by c2.created_at desc limit 1
) ck on true
left join lateral (
  select max(r.rev_no) as target_rev,
         (select r0.target_date from target_revisions r0 where r0.project_id = p.id and r0.rev_no = 0) as target_rev0_date
  from target_revisions r where r.project_id = p.id
) tr on true
left join lateral (
  -- margin on the latest quote bill (approved first, else the newest revision), ex VAT
  select case when s.total > 0 and s.cost_total is not null then round((s.total - s.cost_total) / s.total * 100) end as margin_pct
  from boq_summary s where s.project_id = p.id and s.kind = 'QUOTE'
  order by (s.status = 'APPROVED') desc, s.rev_no desc limit 1
) bq on true;
grant select on projects_live to authenticated;
-- Tom, in the SQL editor:  drop view scheduler.projects_live_016;

-- =====================================================================================
-- 6. data: existing PENDING enquiries were already being priced — they skip qualifying
-- =====================================================================================
-- update projects set qualified_at = coalesce(qualified_at, created_at) where status = 'PENDING' and quote_stage <> 'QUALIFYING';
