-- Bolsover team, session 1. Tom = everything; Mye = office/admin who maintains the team list.
-- Permission flags are deliberately not editable from the app — change them here.
set search_path = scheduler, public;

insert into people(name, full_name, role, email, can_edit_estimation, can_edit_projects, can_manage_team) values
  ('TOM', 'Tom Brooks', 'MANAGEMENT', 'tom@bolsovercontracting.com',  true, true, true),
  ('MYE', 'Mye',        'ADMIN',      'info@bolsovercontracting.com', true, true, true)
on conflict (name) do update set email = excluded.email, role = excluded.role,
  can_edit_estimation = excluded.can_edit_estimation, can_edit_projects = excluded.can_edit_projects, can_manage_team = excluded.can_manage_team;

insert into contractors(name) values ('DIRECT') on conflict (name) do nothing;
