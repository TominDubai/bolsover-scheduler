-- 012: daily site report — the PM's notes for the day, one row per project per day.
-- Progress figures are computed live from boq_progress; this table only holds the words.
set search_path = scheduler, public;

create table site_reports (
  id          uuid primary key default gen_random_uuid(),
  project_id  uuid not null references projects(id) on delete cascade,
  day         date not null,
  done        text,                 -- what happened on site today (free text, PM's words)
  tomorrow    text,                 -- plan for tomorrow
  issues      text,                 -- blockers, needs, client decisions
  by_id       uuid references people(id),
  sent_at     timestamptz,          -- when "Open in WhatsApp" was tapped
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  unique (project_id, day)
);
create index on site_reports(project_id, day desc);

alter table site_reports enable row level security;
create policy read_all on site_reports for select to authenticated using (true);
create policy write_report on site_reports for all to authenticated
  using ((me()).can_edit_projects or exists (select 1 from projects p where p.id = project_id and current_person_id() in (p.pm_id, p.pm2_id, p.site_engineer_id)))
  with check ((me()).can_edit_projects or exists (select 1 from projects p where p.id = project_id and current_person_id() in (p.pm_id, p.pm2_id, p.site_engineer_id)));
grant all on site_reports to authenticated, service_role;

create or replace function site_report_touch() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
begin
  if new.by_id is null then new.by_id := current_person_id(); end if;
  new.updated_at := now();
  return new;
end $$;
create trigger trg_site_report_touch before insert or update on site_reports for each row execute function site_report_touch();
