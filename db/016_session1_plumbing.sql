-- 016: Session 1 of the catch-up to the Concept 5 scheduler (28 Oct 2026).
-- Copied from C5 db/012 (remove projects), db/013 (target revisions), db/015 (watchers + signing email)
-- and the Team-page columns from C5's workflow branch, renamed for Bolsover's columns
-- (site_engineer_id, job_ref, statuses PENDING/QUOTED/WON …).
--
-- Apply through execute_sql (the MCP migration tool refuses `drop trigger if exists` / `drop view`).
-- Sections are independent; run them in order.
set search_path = scheduler, public;

-- =====================================================================================
-- 1. People: the flags the notifications and Team page need. Names stay in the data.
-- =====================================================================================
alter table people
  add column if not exists is_admin            boolean not null default false,   -- override everything (later: workflow admin)
  add column if not exists notify_on_award     boolean not null default false,   -- gets the "project signed" email
  add column if not exists handles_escalations boolean not null default false,   -- gets what nobody else answered
  add column if not exists can_sign_in         boolean not null default true,    -- false = WhatsApp-only site staff, no email, no login
  add column if not exists position            text;                             -- job title shown on the Team page

-- Flags can only be set by someone with the Team permission; nobody can remove their own Team permission.
create or replace function protect_people_flags() returns trigger language plpgsql set search_path = scheduler, public as $$
declare mgr boolean := coalesce((me()).can_manage_team, false);
begin
  if auth.role() = 'authenticated' then
    if not mgr and (
         new.can_edit_projects   is distinct from old.can_edit_projects
      or new.can_edit_estimation is distinct from old.can_edit_estimation
      or new.can_manage_team     is distinct from old.can_manage_team
      or new.is_admin            is distinct from old.is_admin
      or new.notify_on_award     is distinct from old.notify_on_award
      or new.handles_escalations is distinct from old.handles_escalations
      or new.can_sign_in         is distinct from old.can_sign_in) then
      raise exception 'Permissions can only be changed by someone with the Team permission';
    end if;
    if mgr and old.id = current_person_id() and old.can_manage_team and not new.can_manage_team then
      raise exception 'You cannot remove your own team permission';
    end if;
    if new.is_admin and not old.is_admin then
      raise exception 'The admin flag is set in the database, not from the Team page';
    end if;
  end if;
  return new;
end $$;
-- the Team page may add people but never as admin
alter policy insert_people on people with check ((me()).can_manage_team and is_admin = false);

-- =====================================================================================
-- 2. "Also keep updated": anyone tagged on a project gets its update emails (C5 db/015)
-- =====================================================================================
create table if not exists project_watchers (
  project_id  uuid not null references projects(id) on delete cascade,
  person_id   uuid not null references people(id)   on delete cascade,
  added_by    uuid references people(id),
  added_at    timestamptz not null default now(),
  primary key (project_id, person_id)
);
create index if not exists project_watchers_person on project_watchers(person_id);

create or replace function stamp_watcher() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
begin
  new.added_by := coalesce(new.added_by, current_person_id());
  return new;
end $$;
drop trigger if exists trg_stamp_watcher on project_watchers;
create trigger trg_stamp_watcher before insert on project_watchers for each row execute function stamp_watcher();

-- tagging someone rides the normal 10-minute digest, so they find out they're on it
create or replace function log_watcher_changes() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare who uuid := current_person_id();
begin
  if tg_op = 'INSERT' then
    insert into change_log(project_id, kind, field, new_value, changed_by)
    values (new.project_id, 'watcher_added', 'watcher', person_name(new.person_id), who);
    return null;
  end if;
  if not exists (select 1 from projects p where p.id = old.project_id) then return null; end if;  -- project deleted
  insert into change_log(project_id, kind, field, old_value, changed_by)
  values (old.project_id, 'watcher_removed', 'watcher', person_name(old.person_id), who);
  return null;
end $$;
drop trigger if exists trg_watcher_change_log on project_watchers;
create trigger trg_watcher_change_log after insert or delete on project_watchers for each row execute function log_watcher_changes();

alter table project_watchers enable row level security;
drop policy if exists read_all on project_watchers;
create policy read_all on project_watchers for select to authenticated using (true);
drop policy if exists write_team on project_watchers;
create policy write_team on project_watchers for all to authenticated
  using (current_person_id() is not null) with check (current_person_id() is not null);
grant all on project_watchers to authenticated, service_role;

-- =====================================================================================
-- 3. Target completion revisions: Rev 0, Rev 1, Rev 2 … with who, when and why (C5 db/013)
-- =====================================================================================
create table if not exists target_revisions (
  id          bigint generated always as identity primary key,
  project_id  uuid not null references projects(id) on delete cascade,
  rev_no      int  not null,                     -- 0 = original programme, then 1, 2, 3 …
  target_date date,                              -- null = target cleared
  prev_date   date,                              -- what it was before this revision
  reason      text,
  set_by      uuid references people(id),
  set_at      timestamptz not null default now(),
  unique (project_id, rev_no)
);
create index if not exists target_revisions_project on target_revisions(project_id, rev_no);

alter table target_revisions enable row level security;
drop policy if exists read_all on target_revisions;
create policy read_all on target_revisions for select to authenticated using (true);
-- no insert/update/delete policies for users: rows come only from the trigger below
grant select on target_revisions to authenticated;
grant all on target_revisions to service_role;

-- The form sends the reason alongside the new date. It is captured by the trigger and cleared,
-- so it never lingers on the project row.
alter table projects add column if not exists target_change_reason text;

create or replace function log_target_revision() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare next_rev int;
begin
  if tg_op = 'INSERT' then
    if tg_when = 'BEFORE' then return new; end if;
    if new.target_date is not null then
      insert into target_revisions(project_id, rev_no, target_date, prev_date, reason, set_by)
      values (new.id, 0, new.target_date, null, nullif(trim(coalesce(new.target_change_reason, '')), ''), current_person_id());
    end if;
    return null;
  end if;
  -- BEFORE update: capture the reason into the revision, then clear it off the project row
  if new.target_date is distinct from old.target_date then
    select coalesce(max(rev_no) + 1, 0) into next_rev from target_revisions where project_id = new.id;
    insert into target_revisions(project_id, rev_no, target_date, prev_date, reason, set_by)
    values (new.id, next_rev, new.target_date, old.target_date, nullif(trim(coalesce(new.target_change_reason, '')), ''), current_person_id());
  end if;
  new.target_change_reason := null;
  return new;
end $$;
drop trigger if exists trg_target_revision_upd on projects;
create trigger trg_target_revision_upd before update on projects for each row execute function log_target_revision();
drop trigger if exists trg_target_revision_ins on projects;
create trigger trg_target_revision_ins after insert on projects for each row execute function log_target_revision();

-- Backfill: every project that already has a target gets it recorded as Rev 0 (the original programme).
insert into target_revisions(project_id, rev_no, target_date, prev_date, reason, set_at)
select p.id, 0, p.target_date, null, 'Imported from register', coalesce(p.created_at, now())
from projects p
where p.target_date is not null
  and not exists (select 1 from target_revisions r where r.project_id = p.id);

-- =====================================================================================
-- 4. Remove (soft-delete) projects: keeps the row, VOs, bills and history; off every list (C5 db/012)
-- =====================================================================================
alter table projects
  add column if not exists deleted_at     timestamptz,
  add column if not exists deleted_by     uuid references people(id),
  add column if not exists deleted_reason text;
create index if not exists projects_deleted on projects(deleted_at) where deleted_at is not null;

create or replace function guard_project_removal() returns trigger language plpgsql set search_path = scheduler, public as $$
begin
  if new.deleted_at is distinct from old.deleted_at then
    if auth.role() = 'authenticated' and not coalesce((me()).can_manage_team, false) then
      raise exception 'Only people with the Team permission can remove or restore a project';
    end if;
    if new.deleted_at is not null then
      if coalesce(trim(new.deleted_reason), '') = '' then raise exception 'Give a reason for removing the project'; end if;
      new.deleted_by := coalesce(current_person_id(), new.deleted_by);
    else
      new.deleted_by := null; new.deleted_reason := null;
    end if;
  elsif new.deleted_at is not null and (new.deleted_reason is distinct from old.deleted_reason or new.deleted_by is distinct from old.deleted_by) then
    new.deleted_reason := old.deleted_reason; new.deleted_by := old.deleted_by;   -- not editable sideways
  end if;
  return new;
end $$;
drop trigger if exists trg_guard_project_removal on projects;
create trigger trg_guard_project_removal before update on projects for each row execute function guard_project_removal();

-- change log v2: removal / restore show up in the digest; everything else as 001
create or replace function log_project_changes() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare who uuid := current_person_id();
begin
  if tg_op = 'INSERT' then
    insert into change_log(project_id, kind, changed_by) values (new.id, 'created', who);
    return null;
  end if;
  if new.deleted_at is distinct from old.deleted_at then
    if new.deleted_at is not null then
      insert into change_log(project_id, kind, new_value, changed_by) values (new.id, 'removed', new.deleted_reason, who);
    else
      insert into change_log(project_id, kind, changed_by) values (new.id, 'restored', who);
    end if;
    return null; -- nothing else on this save matters
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

-- =====================================================================================
-- 5. projects_live rebuilt: p.* is frozen at creation, so the new project columns need a
--    drop + create. Body = 005 + archived_at (009) + removal stamps + current target revision.
--    Keep the programme and check-in lateral joins or the site health line breaks.
-- =====================================================================================
drop view if exists projects_live;
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
  tr.target_rev0_date
from projects p
left join contractors c on c.id = p.contractor_id
left join people pm  on pm.id  = p.pm_id
left join people pm2 on pm2.id = p.pm2_id
left join people se  on se.id  = p.site_engineer_id
left join people es  on es.id  = p.estimator_id
left join people db  on db.id  = p.deleted_by
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
) tr on true;
grant select on projects_live to authenticated;

-- =====================================================================================
-- 6. Seed from Tom's decisions, 28 Oct 2026 (data, keyed by name — run as its own statement)
-- =====================================================================================
-- update people set notify_on_award = true where name in ('TOM','ROSANO','MYE');
-- update people set handles_escalations = true where name in ('TOM','ROSANO');
-- update people set is_active = false where name = 'PAO';
-- insert into people (name, full_name, role, email, can_edit_estimation, position)
--   values ('BLESSIE', 'Blessie', 'QS', 'blessie@bolsovercontracting.com', true, 'Quantity surveyor')
--   on conflict (name) do nothing;
