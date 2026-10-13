-- Bolsover Project Scheduler — schema v1 (13 Oct 2026)
-- Consolidated from the C5 scheduler migrations 001–009, re-pointed at the Bolsover pipeline.
-- Lives in the `scheduler` schema of the Bolsover Supabase project.

create schema if not exists scheduler;
set search_path = scheduler, public;

-- ---------- lookups ----------
-- PENDING (being priced) → QUOTED (sent, awaiting feedback) → WON → PRE_MOB → LIVE → COMPLETED
-- Exits from QUOTED: ON_HOLD, REJECTED (client dropped it), LOST (went elsewhere / by others)
create type project_status as enum (
  'PENDING','QUOTED','WON','PRE_MOB','LIVE','COMPLETED','ON_HOLD','REJECTED','LOST'
);
create type person_role as enum ('PM','SITE','QS','MANAGEMENT','ADMIN');
create type quote_stage as enum ('QUEUED','PRICING','AWAITING_SUPPLIER','SUBMITTED');

-- ---------- people ----------
create table people (
  id                  uuid primary key default gen_random_uuid(),
  name                text not null unique,          -- short name shown on cards: TOM, MYE, JED ...
  full_name           text,
  role                person_role not null,
  email               text unique,                   -- sign-in (6-digit code); must be @bolsovercontracting.com
  whatsapp            text,
  is_active           boolean not null default true,
  can_edit_estimation boolean not null default false,  -- quote side (PENDING / QUOTED)
  can_edit_projects   boolean not null default false,  -- project side (WON onwards)
  can_manage_team     boolean not null default false,  -- Team page: add / edit people
  created_at          timestamptz not null default now()
);

create table contractors (
  id    uuid primary key default gen_random_uuid(),
  name  text not null unique                           -- main contractor / who we work under; DIRECT for own clients
);

-- ---------- projects (one row per quote; revisions live in quote_revisions) ----------
create table projects (
  id                    uuid primary key default gen_random_uuid(),
  enquiry_no            text,                          -- BBC/MMYYYY/NNNNN (the register's quote number, without _revNN)
  name                  text not null,
  client                text,
  location              text,
  contractor_id         uuid references contractors(id),
  pm_id                 uuid references people(id),
  pm2_id                uuid references people(id),
  site_engineer_id      uuid references people(id),
  estimator_id          uuid references people(id),    -- the QS who priced it
  status                project_status not null default 'PENDING',
  quote_stage           quote_stage not null default 'QUEUED',
  difficulty            smallint check (difficulty between 0 and 3),
  received_date         date,
  quote_due_date        date,
  quote_submitted_date  date,
  quoted_value          numeric(14,2),                 -- latest revision, ex VAT
  signed_quote          numeric(14,2) not null default 0,  -- approved value, ex VAT
  job_ref               text,                          -- BBC-ARD-2025-01 — assigned on WON
  working_days          int,
  start_date            date,                          -- mobilisation / site start
  target_date           date,
  completed_date        date,
  quote_type            text,                          -- Full quote, Variation, Additional work, Option
  scope                 text,                          -- Fit-out, Renovation, Joinery, Landscaping, MEP, Furniture
  waiting_on            text,
  raised_by             text,
  folder_path           text,                          -- U:\Quotations - Pao\2026\...
  notes                 text,
  excel_row             int,                           -- provenance for the import
  created_at            timestamptz not null default now(),
  updated_at            timestamptz not null default now()
);
create index on projects(status);
create index on projects(pm_id);
create index on projects(enquiry_no);

-- ---------- quote revisions (rev00, rev01 ... from the register) ----------
create table quote_revisions (
  id              uuid primary key default gen_random_uuid(),
  project_id      uuid not null references projects(id) on delete cascade,
  rev_no          int not null,
  label           text,                                -- e.g. "Option 2" when one number carried two options
  submitted_date  date,
  value           numeric(14,2),
  working_days    int,
  status_text     text,                                -- the register's raw status for this row
  created_at      timestamptz not null default now(),
  unique (project_id, rev_no, label)
);

-- ---------- variation orders ----------
create table variations (
  id          uuid primary key default gen_random_uuid(),
  project_id  uuid not null references projects(id) on delete cascade,
  vo_no       int  not null,
  description text,
  value       numeric(14,2) not null default 0,
  approved_on date,
  created_at  timestamptz not null default now(),
  unique (project_id, vo_no)
);

-- ---------- pre-mobilisation checklist ----------
create table premob_items (
  id          uuid primary key default gen_random_uuid(),
  project_id  uuid not null references projects(id) on delete cascade,
  item        text not null,                           -- Approvals / NOCs, Permits, Materials ordered, Access cards & passes, Site ready ...
  done        boolean not null default false,
  done_by     uuid references people(id),
  done_at     timestamptz,
  sort        int not null default 0
);
create index on premob_items(project_id);

-- ---------- status history ----------
create table status_history (
  id          uuid primary key default gen_random_uuid(),
  project_id  uuid not null references projects(id) on delete cascade,
  from_status project_status,
  to_status   project_status not null,
  changed_by  uuid references people(id),
  changed_at  timestamptz not null default now(),
  note        text
);

-- ---------- alerts (digest bookkeeping) ----------
create table alerts (
  id              uuid primary key default gen_random_uuid(),
  rule            text not null,
  project_id      uuid references projects(id) on delete cascade,
  sent_to         uuid references people(id),
  channel         text not null default 'email',
  sent_at         timestamptz not null default now(),
  acknowledged_at timestamptz
);

-- ---------- change log for batched email notifications ----------
create table change_log (
  id          bigint generated always as identity primary key,
  project_id  uuid not null references projects(id) on delete cascade,
  kind        text not null,              -- created | field | vo_added | vo_changed | vo_removed
  field       text,
  old_value   text,
  new_value   text,
  changed_by  uuid references people(id),
  changed_at  timestamptz not null default now(),
  notified_at timestamptz
);
create index change_log_unsent on change_log(changed_at) where notified_at is null;

-- ---------- who am I ----------
create or replace function me() returns people language sql stable set search_path = scheduler, public as $$
  select * from scheduler.people where email is not null and lower(email) = lower(coalesce(auth.jwt()->>'email','')) limit 1
$$;
create or replace function current_person_id() returns uuid language sql stable set search_path = scheduler, public as $$
  select id from scheduler.people where email is not null and lower(email) = lower(coalesce(auth.jwt()->>'email','')) limit 1
$$;
grant execute on function me() to authenticated;
grant execute on function current_person_id() to authenticated;

create or replace function next_enquiry_no() returns text language sql stable set search_path = scheduler, public as $$
  select 'BBC/' || to_char(current_date,'MMYYYY') || '/' || lpad((
    coalesce(max(split_part(enquiry_no,'/',3)::int), 0) + 1
  )::text, 5, '0')
  from projects
  where enquiry_no ~ '^BBC/\d{6}/\d{5}$'
$$;
grant execute on function next_enquiry_no() to authenticated;

-- ---------- triggers: status history, date stamps ----------
create or replace function log_status_change() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
begin
  if tg_op = 'UPDATE' and new.status is distinct from old.status then
    insert into status_history(project_id, from_status, to_status, changed_by)
    values (new.id, old.status, new.status, current_person_id());
    if new.status = 'QUOTED' and new.quote_submitted_date is null then new.quote_submitted_date := current_date; end if;
    if new.status = 'LIVE' and new.start_date is null then new.start_date := current_date; end if;
  end if;
  if new.status = 'COMPLETED' and new.completed_date is null then new.completed_date := current_date; end if;
  new.updated_at := now();
  return new;
end $$;
create trigger trg_project_status before insert or update on projects for each row execute function log_status_change();

create or replace function log_status_insert() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
begin
  insert into status_history(project_id, from_status, to_status, changed_by) values (new.id, null, new.status, current_person_id());
  return null;
end $$;
create trigger trg_project_status_insert after insert on projects for each row execute function log_status_insert();

-- default pre-mob checklist when a project is won
create or replace function seed_premob() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
begin
  if tg_op = 'UPDATE' and new.status = 'WON' and old.status is distinct from 'WON'
     and not exists (select 1 from premob_items where project_id = new.id) then
    insert into premob_items(project_id, item, sort) values
      (new.id, 'Contract / LPO signed', 1),
      (new.id, 'Approvals & NOCs (community / developer / authority)', 2),
      (new.id, 'Permits', 3),
      (new.id, 'Long-lead materials ordered', 4),
      (new.id, 'Subcontractors confirmed', 5),
      (new.id, 'Access cards & passes', 6),
      (new.id, 'Site survey & readiness', 7),
      (new.id, 'Programme issued to client', 8);
  end if;
  return null;
end $$;
create trigger trg_seed_premob after update on projects for each row execute function seed_premob();

-- ---------- triggers: change log ----------
create or replace function person_name(p uuid) returns text language sql stable set search_path = scheduler, public as $$ select name from people where id = p $$;
create or replace function contractor_name(c uuid) returns text language sql stable set search_path = scheduler, public as $$ select name from contractors where id = c $$;

create or replace function log_project_changes() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare who uuid := current_person_id();
begin
  if tg_op = 'INSERT' then
    insert into change_log(project_id, kind, changed_by) values (new.id, 'created', who);
    return null;
  end if;
  if new.name is distinct from old.name then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','name',old.name,new.name,who); end if;
  if new.client is distinct from old.client then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','client',old.client,new.client,who); end if;
  if new.enquiry_no is distinct from old.enquiry_no then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','enquiry_no',old.enquiry_no,new.enquiry_no,who); end if;
  if new.status is distinct from old.status then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','status',old.status::text,new.status::text,who); end if;
  if new.quote_stage is distinct from old.quote_stage then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','quote_stage',old.quote_stage::text,new.quote_stage::text,who); end if;
  if new.pm_id is distinct from old.pm_id then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','pm_id',person_name(old.pm_id),person_name(new.pm_id),who); end if;
  if new.pm2_id is distinct from old.pm2_id then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','pm2_id',person_name(old.pm2_id),person_name(new.pm2_id),who); end if;
  if new.site_engineer_id is distinct from old.site_engineer_id then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','site_engineer_id',person_name(old.site_engineer_id),person_name(new.site_engineer_id),who); end if;
  if new.estimator_id is distinct from old.estimator_id then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','estimator_id',person_name(old.estimator_id),person_name(new.estimator_id),who); end if;
  if new.contractor_id is distinct from old.contractor_id then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','contractor_id',contractor_name(old.contractor_id),contractor_name(new.contractor_id),who); end if;
  if new.start_date is distinct from old.start_date then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','start_date',old.start_date::text,new.start_date::text,who); end if;
  if new.target_date is distinct from old.target_date then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','target_date',old.target_date::text,new.target_date::text,who); end if;
  if new.completed_date is distinct from old.completed_date then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','completed_date',old.completed_date::text,new.completed_date::text,who); end if;
  if new.quote_due_date is distinct from old.quote_due_date then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','quote_due_date',old.quote_due_date::text,new.quote_due_date::text,who); end if;
  if new.signed_quote is distinct from old.signed_quote then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','signed_quote',old.signed_quote::text,new.signed_quote::text,who); end if;
  if new.quoted_value is distinct from old.quoted_value then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','quoted_value',old.quoted_value::text,new.quoted_value::text,who); end if;
  if new.job_ref is distinct from old.job_ref then insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.id,'field','job_ref',old.job_ref,new.job_ref,who); end if;
  return null;
end $$;
create trigger trg_project_change_log after insert or update on projects for each row execute function log_project_changes();

create or replace function log_variation_changes() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare who uuid := current_person_id(); label text;
begin
  if tg_op = 'DELETE' then
    insert into change_log(project_id, kind, field, old_value, changed_by)
    values (old.project_id, 'vo_removed', 'VO' || old.vo_no, coalesce(old.description,'') || ' | ' || old.value::text, who);
    return null;
  end if;
  label := coalesce(new.description,'') || ' | ' || new.value::text;
  if tg_op = 'INSERT' then
    insert into change_log(project_id, kind, field, new_value, changed_by) values (new.project_id, 'vo_added', 'VO' || new.vo_no, label, who);
  elsif new.value is distinct from old.value or new.description is distinct from old.description or new.approved_on is distinct from old.approved_on then
    insert into change_log(project_id, kind, field, old_value, new_value, changed_by)
    values (new.project_id, 'vo_changed', 'VO' || new.vo_no, coalesce(old.description,'') || ' | ' || old.value::text, label, who);
  end if;
  return null;
end $$;
create trigger trg_variation_change_log after insert or update or delete on variations for each row execute function log_variation_changes();

-- ---------- protect permission flags from the app ----------
create or replace function protect_people_flags() returns trigger language plpgsql set search_path = scheduler, public as $$
begin
  if auth.role() = 'authenticated' and (new.can_edit_projects is distinct from old.can_edit_projects or new.can_edit_estimation is distinct from old.can_edit_estimation or new.can_manage_team is distinct from old.can_manage_team) then
    raise exception 'Permissions can only be changed by an administrator';
  end if;
  return new;
end $$;
create trigger trg_protect_people_flags before update on people for each row execute function protect_people_flags();

-- ---------- the calculated columns, live ----------
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
  (select max(changed_at) from status_history h where h.project_id = p.id) as status_since
from projects p
left join contractors c on c.id = p.contractor_id
left join people pm  on pm.id  = p.pm_id
left join people pm2 on pm2.id = p.pm2_id
left join people se  on se.id  = p.site_engineer_id
left join people es  on es.id  = p.estimator_id;

-- ---------- row security ----------
alter table people          enable row level security;
alter table contractors     enable row level security;
alter table projects        enable row level security;
alter table quote_revisions enable row level security;
alter table variations      enable row level security;
alter table premob_items    enable row level security;
alter table status_history  enable row level security;
alter table alerts          enable row level security;
alter table change_log      enable row level security;

create policy read_all on people          for select to authenticated using (true);
create policy read_all on contractors     for select to authenticated using (true);
create policy read_all on projects        for select to authenticated using (true);
create policy read_all on quote_revisions for select to authenticated using (true);
create policy read_all on variations      for select to authenticated using (true);
create policy read_all on premob_items    for select to authenticated using (true);
create policy read_all on status_history  for select to authenticated using (true);
create policy read_all on alerts          for select to authenticated using (true);
create policy read_all on change_log      for select to authenticated using (true);

create policy insert_rows on projects for insert to authenticated
  with check ((me()).can_edit_projects or ((me()).can_edit_estimation and status in ('PENDING','QUOTED')));
create policy update_rows on projects for update to authenticated
  using ((me()).can_edit_projects or ((me()).can_edit_estimation and status in ('PENDING','QUOTED')))
  with check ((me()).can_edit_projects or ((me()).can_edit_estimation and status in ('PENDING','QUOTED','WON','ON_HOLD','REJECTED','LOST')));
create policy delete_rows on projects for delete to authenticated using ((me()).can_edit_projects);
create policy write_revisions on quote_revisions for all to authenticated
  using ((me()).can_edit_projects or (me()).can_edit_estimation) with check ((me()).can_edit_projects or (me()).can_edit_estimation);
create policy write_vos on variations for all to authenticated using ((me()).can_edit_projects) with check ((me()).can_edit_projects);
create policy write_premob on premob_items for all to authenticated using ((me()).can_edit_projects) with check ((me()).can_edit_projects);
create policy add_contractor on contractors for insert to authenticated with check ((me()).can_edit_projects or (me()).can_edit_estimation);
create policy update_people on people for update to authenticated using ((me()).can_manage_team) with check ((me()).can_manage_team);
create policy insert_people on people for insert to authenticated
  with check ((me()).can_manage_team and can_edit_projects = false and can_edit_estimation = false and can_manage_team = false);

-- expose the schema to the API roles (anon gets nothing — sign-in required)
grant usage on schema scheduler to authenticated, service_role;
grant all on all tables in schema scheduler to authenticated, service_role;
grant usage, select on all sequences in schema scheduler to authenticated, service_role;
alter default privileges in schema scheduler grant all on tables to authenticated, service_role;
grant select on projects_live to authenticated;
