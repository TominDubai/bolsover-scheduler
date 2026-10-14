-- 009: archive completed projects off the board (14 Oct 2026). Applied.
set search_path = scheduler, public;
alter table projects add column if not exists archived_at timestamptz;
create or replace function archive_project(p uuid) returns void language sql security definer set search_path = scheduler, public as $$
  update projects set archived_at = now() where id = p and status = 'COMPLETED' and (select can_edit_projects from people where id = current_person_id());
$$;
create or replace function unarchive_project(p uuid) returns void language sql security definer set search_path = scheduler, public as $$
  update projects set archived_at = null where id = p and (select can_edit_projects from people where id = current_person_id());
$$;
grant execute on function archive_project(uuid), unarchive_project(uuid) to authenticated;
-- projects_live re-created with p.archived_at appended (same body as 005, plus the column).
