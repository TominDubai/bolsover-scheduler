-- Bolsover Project Scheduler — programme (13 Oct 2026)
-- Package-level baseline dates per project, taken from the P6 "Classic Schedule Layout" export,
-- with site progress recorded against them. Activities are the read-only checkpoints under each package.
-- Migration name: bolsover_scheduler_programme_v1

set search_path = scheduler, public;

create table programme_packages (
  id              uuid primary key default gen_random_uuid(),
  project_id      uuid not null references projects(id) on delete cascade,
  code            text,                                  -- P6 WBS code, e.g. RW-26-001.3
  name            text not null,                         -- CONCRETE WORKS
  sort            int  not null default 0,
  planned_start   date,                                  -- baseline from the P6 export
  planned_finish  date,
  planned_days    int,
  actual_start    date,                                  -- site progress
  actual_finish   date,
  forecast_finish date,                                  -- PM's current expectation, when it differs from the baseline
  pct_complete    smallint not null default 0 check (pct_complete between 0 and 100),
  note            text,
  updated_by      uuid references people(id),
  updated_at      timestamptz not null default now(),
  unique (project_id, code)
);
create index on programme_packages(project_id);

create table programme_activities (
  id              uuid primary key default gen_random_uuid(),
  package_id      uuid not null references programme_packages(id) on delete cascade,
  code            text,                                  -- P6 activity ID, e.g. A1060
  name            text not null,
  sort            int  not null default 0,
  planned_start   date,
  planned_finish  date,
  planned_days    int,
  unique (package_id, code)
);
create index on programme_activities(package_id);

-- ---------- change log: progress updates go out with the digest ----------
create or replace function log_programme_changes() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare who uuid := current_person_id();
begin
  new.updated_at := now();
  new.updated_by := who;
  if tg_op = 'UPDATE' then
    if new.pct_complete is distinct from old.pct_complete then
      insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'programme', new.name || ' · progress', old.pct_complete || '%', new.pct_complete || '%', who);
    end if;
    if new.actual_start is distinct from old.actual_start then
      insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'programme', new.name || ' · started', old.actual_start::text, new.actual_start::text, who);
    end if;
    if new.actual_finish is distinct from old.actual_finish then
      insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'programme', new.name || ' · finished', old.actual_finish::text, new.actual_finish::text, who);
    end if;
    if new.forecast_finish is distinct from old.forecast_finish then
      insert into change_log(project_id, kind, field, old_value, new_value, changed_by) values (new.project_id, 'programme', new.name || ' · forecast finish', old.forecast_finish::text, new.forecast_finish::text, who);
    end if;
  end if;
  return new;
end $$;
create trigger trg_programme_change_log before update on programme_packages for each row execute function log_programme_changes();

-- ---------- row security ----------
alter table programme_packages   enable row level security;
alter table programme_activities enable row level security;
create policy read_all on programme_packages   for select to authenticated using (true);
create policy read_all on programme_activities for select to authenticated using (true);
create policy write_packages   on programme_packages   for all to authenticated using ((me()).can_edit_projects) with check ((me()).can_edit_projects);
create policy write_activities on programme_activities for all to authenticated using ((me()).can_edit_projects) with check ((me()).can_edit_projects);

grant all on programme_packages, programme_activities to authenticated, service_role;
