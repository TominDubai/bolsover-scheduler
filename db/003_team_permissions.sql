-- 003 (13 Oct 2026): people with can_manage_team may set permissions from the Team page.
-- Guard: you cannot remove your own Team permission, so the last manager can't lock everyone out.
-- Applied via execute_sql (apply_migration was cancelled by the confirmation step).
set search_path = scheduler, public;
create or replace function protect_people_flags() returns trigger language plpgsql set search_path = scheduler, public as $$
declare mgr boolean := coalesce((me()).can_manage_team, false);
begin
  if auth.role() = 'authenticated' then
    if not mgr and (new.can_edit_projects is distinct from old.can_edit_projects or new.can_edit_estimation is distinct from old.can_edit_estimation or new.can_manage_team is distinct from old.can_manage_team) then
      raise exception 'Permissions can only be changed by someone with the Team permission';
    end if;
    if mgr and old.id = current_person_id() and old.can_manage_team and not new.can_manage_team then
      raise exception 'You cannot remove your own team permission';
    end if;
  end if;
  return new;
end $$;
alter policy insert_people on people with check ((me()).can_manage_team);
