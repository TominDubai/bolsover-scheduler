-- 020: Programme imports — a record of every P6 load (session 5, 29 Oct 2026; brief section 5 `programme_imports`).
-- The loader (`import/programme_to_sql.py` → `import/<project>_programme.sql`) upserts `programme_packages` on
-- (project_id, code) and changes ONLY the planned dates / days and the activities. Trade, supplier, value, owner,
-- milestones, approval line, sort and the name the team may have tidied are left alone, so re-baselining a job from a
-- new P6 export never undoes what the PM has recorded. Each run writes one row here so the project page can say where
-- its planned dates came from and when.
--
-- Apply with execute_sql. Nothing dropped.
set search_path = scheduler, public;

create table if not exists programme_imports (
  id            uuid primary key default gen_random_uuid(),
  project_id    uuid not null references projects(id),
  source        text not null,                  -- the P6 export file name, e.g. New_Schedule.pdf
  data_date     date,                           -- P6 data date on the export
  packages      int  not null default 0,        -- rows upserted
  activities    int  not null default 0,
  new_packages  int  not null default 0,        -- rows that did not exist before this run
  note          text,
  imported_by   uuid references people(id) default current_person_id(),
  imported_at   timestamptz not null default now()
);
create index if not exists programme_imports_project_idx on programme_imports(project_id, imported_at desc);

alter table programme_imports enable row level security;
create policy read_all on programme_imports for select to authenticated using (true);
create policy write_projects on programme_imports for insert to authenticated with check ((me()).can_edit_projects);
grant select, insert on programme_imports to authenticated, service_role;
