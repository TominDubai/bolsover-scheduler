-- 005 (13 Oct 2026): weekly PM check-ins + programme health on the live view.
-- Applied through execute_sql (the view has to be dropped and recreated, which the migration tool blocks).
set search_path = scheduler, public;

-- ---------- weekly check-in from the PM ----------
create type checkin_status as enum ('ON_TRACK','SLIPPING','BLOCKED');

create table checkins (
  id          uuid primary key default gen_random_uuid(),
  project_id  uuid not null references projects(id) on delete cascade,
  person_id   uuid references people(id),
  status      checkin_status not null,
  note        text,
  week_start  date not null default (date_trunc('week', (now() at time zone 'Asia/Dubai'))::date),  -- Monday of the week, Dubai time
  created_at  timestamptz not null default now()
);
create index on checkins(project_id, created_at desc);

alter table checkins enable row level security;
create policy read_all on checkins for select to authenticated using (true);
-- the PM, second PM or site engineer on the project can check in even without the Projects permission
create policy add_checkin on checkins for insert to authenticated with check (
  (me()).can_edit_projects
  or exists (select 1 from projects p where p.id = project_id and current_person_id() in (p.pm_id, p.pm2_id, p.site_engineer_id))
);
grant all on checkins to authenticated, service_role;

create or replace function log_checkin() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
begin
  if new.person_id is null then new.person_id := current_person_id(); end if;
  insert into change_log(project_id, kind, field, new_value, changed_by)
  values (new.project_id, 'checkin', new.status::text, new.note, new.person_id);
  return new;
end $$;
create trigger trg_checkin before insert on checkins for each row execute function log_checkin();

-- ---------- programme health + last check-in on the live view ----------
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
  ck.person_id as checkin_by
from projects p
left join contractors c on c.id = p.contractor_id
left join people pm  on pm.id  = p.pm_id
left join people pm2 on pm2.id = p.pm2_id
left join people se  on se.id  = p.site_engineer_id
left join people es  on es.id  = p.estimator_id
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
) ck on true;
grant select on projects_live to authenticated;
