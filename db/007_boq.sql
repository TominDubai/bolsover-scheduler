-- Bolsover Scheduler — 007: BOQ, rate library, installed progress, valuations (14 Oct 2026)
-- The BOQ is the spine: every quote revision and every VO is a `boqs` row holding sections + items.
-- Items carry the sell rate (ex VAT), the supplier cost and the markup — the same three columns Pao kept
-- hidden in the Excel. Installed % per item drives the Progress Billing Report (valuations).
set search_path = scheduler, public;

-- ---------- rate library (seeded from priced BOQs; the QS's starting kit) ----------
create table rate_items (
  id            uuid primary key default gen_random_uuid(),
  code          text unique,                     -- short handle, e.g. DEM-BLOCK, JOIN-WARD
  category      text not null,                   -- BOQ section it normally lives in: Site Works, Joinery Works ...
  description   text not null,
  unit          text not null,                   -- sqm, LM, Nos, LS, item, m³
  cost_rate     numeric(14,2),                   -- supplier / subcon unit cost, ex VAT
  sell_rate     numeric(14,2),                   -- client unit price, ex VAT
  markup_pct    numeric(6,2),                    -- 30 = 30 %
  source_project_id uuid references projects(id) on delete set null,
  last_used     date,
  use_count     int not null default 0,
  notes         text,
  is_active     boolean not null default true,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);
create index on rate_items(category);
create index rate_items_search on rate_items using gin (to_tsvector('english', coalesce(description,'') || ' ' || coalesce(code,'')));

-- ---------- BOQ documents: one per quote revision, one per variation ----------
create type boq_kind   as enum ('QUOTE','VARIATION');
create type boq_status as enum ('DRAFT','SUBMITTED','APPROVED','SUPERSEDED','REJECTED');

create table boqs (
  id                 uuid primary key default gen_random_uuid(),
  project_id         uuid not null references projects(id) on delete cascade,
  kind               boq_kind not null default 'QUOTE',
  rev_no             int not null default 0,                   -- rev00, rev01 ... (per kind + variation)
  variation_id       uuid references variations(id) on delete cascade,  -- set when kind = VARIATION
  title              text not null,                            -- "Villa 170, Sidra 2 ... Renovation Works" / "Additional Work no. 3"
  quote_ref          text,                                     -- BBC/032026/00063_rev02
  status             boq_status not null default 'DRAFT',
  issue_date         date,
  vat_pct            numeric(5,2) not null default 5,
  default_markup_pct numeric(6,2) not null default 30,
  deposit_pct        numeric(5,2) not null default 30,         -- payment schedule: 30 % advance, balance on progress
  working_days       int,
  payment_terms      text,
  terms              text[],                                   -- general terms printed on the proposal
  notes              text,
  source_file        text,                                     -- the Excel it was imported from, if any
  created_by         uuid references people(id),
  created_at         timestamptz not null default now(),
  updated_at         timestamptz not null default now(),
  unique (project_id, kind, variation_id, rev_no)
);
create index on boqs(project_id);
create index on boqs(status);

create table boq_sections (
  id        uuid primary key default gen_random_uuid(),
  boq_id    uuid not null references boqs(id) on delete cascade,
  sort      int  not null default 0,
  code      text,                                              -- I, II, III ...
  title     text not null,                                     -- Preliminaries, Site Works ...
  notes     text
);
create index on boq_sections(boq_id);

create table boq_items (
  id            uuid primary key default gen_random_uuid(),
  boq_id        uuid not null references boqs(id) on delete cascade,
  section_id    uuid not null references boq_sections(id) on delete cascade,
  sort          int  not null default 0,
  ref           text,                                          -- A., B., 5a. ...
  subheading    text,                                          -- "Demolition Work", "Disposal Work" (grouping label under a section)
  description   text not null,
  qty           numeric(14,3),
  unit          text,
  rate          numeric(14,2),                                 -- client unit price, ex VAT
  cost_rate     numeric(14,2),                                 -- supplier / subcon unit cost, ex VAT (hidden from PMs in the UI)
  markup_pct    numeric(6,2),
  rate_item_id  uuid references rate_items(id) on delete set null,
  is_note       boolean not null default false,                -- text-only row (e.g. "By Client", exclusions)
  amount        numeric(14,2) generated always as (coalesce(qty,0) * coalesce(rate,0)) stored,
  cost_amount   numeric(14,2) generated always as (coalesce(qty,0) * coalesce(cost_rate,0)) stored,
  installed_pct numeric(5,2) not null default 0 check (installed_pct between 0 and 100),
  installed_at  timestamptz,
  installed_by  uuid references people(id),
  notes         text
);
create index on boq_items(boq_id);
create index on boq_items(section_id);

-- ---------- installed-progress log (every % change, who, when, note) ----------
create table boq_progress (
  id          bigint generated always as identity primary key,
  item_id     uuid not null references boq_items(id) on delete cascade,
  pct         numeric(5,2) not null check (pct between 0 and 100),
  prev_pct    numeric(5,2),
  note        text,
  photo_url   text,
  by_id       uuid references people(id),
  at          timestamptz not null default now()
);
create index on boq_progress(item_id, at desc);

create or replace function log_boq_progress() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
begin
  if tg_op = 'UPDATE' and new.installed_pct is distinct from old.installed_pct then
    insert into boq_progress(item_id, pct, prev_pct, by_id) values (new.id, new.installed_pct, old.installed_pct, current_person_id());
    new.installed_at := now();
    new.installed_by := current_person_id();
  end if;
  return new;
end $$;
create trigger trg_boq_progress before update on boq_items for each row execute function log_boq_progress();

-- ---------- valuations = Progress Billing Reports ----------
create type valuation_status as enum ('DRAFT','ISSUED','CERTIFIED','PAID');
create table valuations (
  id               uuid primary key default gen_random_uuid(),
  project_id       uuid not null references projects(id) on delete cascade,
  no               int  not null,                               -- Progress Billing Report no. 1, 2 ...
  period_from      date,
  period_to        date not null,
  issued_date      date,
  status           valuation_status not null default 'DRAFT',
  contract_value   numeric(14,2) not null default 0,           -- Σ approved BOQs + VOs, ex VAT, at the time
  installed_value  numeric(14,2) not null default 0,           -- Σ amount × installed %, ex VAT, cumulative to period_to
  prev_installed   numeric(14,2) not null default 0,           -- cumulative at the previous valuation
  deposit_received numeric(14,2) not null default 0,           -- advance(s) received inc VAT
  deposit_recovery numeric(14,2) not null default 0,           -- pro-rata deposit deducted this period
  vat_pct          numeric(5,2) not null default 5,
  amount_due       numeric(14,2) not null default 0,           -- this period, inc VAT, after deposit recovery
  paid_amount      numeric(14,2),
  paid_date        date,
  invoice_no       text,
  notes            text,
  snapshot         jsonb,                                      -- per-item { item_id, pct, amount } frozen at issue
  created_by       uuid references people(id),
  created_at       timestamptz not null default now(),
  unique (project_id, no)
);
create index on valuations(project_id);

-- ---------- approving a BOQ keeps the project / VO value in step ----------
create or replace function boq_total(b uuid) returns numeric language sql stable set search_path = scheduler, public as $$
  select coalesce(sum(amount),0) from boq_items where boq_id = b and not is_note
$$;
grant execute on function boq_total(uuid) to authenticated;

create or replace function on_boq_status() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
declare t numeric;
begin
  new.updated_at := now();
  if tg_op = 'UPDATE' and new.status = 'APPROVED' and old.status is distinct from 'APPROVED' then
    t := boq_total(new.id);
    if new.kind = 'QUOTE' then
      update boqs set status = 'SUPERSEDED' where project_id = new.project_id and kind = 'QUOTE' and id <> new.id and status = 'APPROVED';
      update projects set signed_quote = t, quoted_value = t where id = new.project_id;
    elsif new.variation_id is not null then
      update boqs set status = 'SUPERSEDED' where variation_id = new.variation_id and id <> new.id and status = 'APPROVED';
      update variations set value = t, approved_on = coalesce(approved_on, current_date) where id = new.variation_id;
    end if;
  end if;
  if tg_op = 'UPDATE' and new.status = 'SUBMITTED' and old.status is distinct from 'SUBMITTED' and new.kind = 'QUOTE' then
    update projects set quoted_value = boq_total(new.id) where id = new.project_id;
  end if;
  return new;
end $$;
create trigger trg_boq_status before update on boqs for each row execute function on_boq_status();

-- ---------- views ----------
create or replace view boq_summary as
select b.id as boq_id, b.project_id, b.kind, b.rev_no, b.variation_id, b.title, b.status, b.vat_pct,
       count(i.id) filter (where not i.is_note)                         as item_count,
       coalesce(sum(i.amount) filter (where not i.is_note),0)           as total,
       coalesce(sum(i.cost_amount) filter (where not i.is_note),0)      as cost_total,
       coalesce(sum(i.amount * i.installed_pct / 100) filter (where not i.is_note),0) as installed_value,
       case when coalesce(sum(i.amount) filter (where not i.is_note),0) > 0
            then round(100 * sum(i.amount * i.installed_pct / 100) filter (where not i.is_note) / sum(i.amount) filter (where not i.is_note), 2)
            else 0 end as installed_pct
from boqs b left join boq_items i on i.boq_id = b.id
group by b.id;
grant select on boq_summary to authenticated;

-- project-level roll-up of everything approved (quote + VOs)
create or replace view project_contract as
select p.id as project_id,
       coalesce(sum(s.total),0)           as contract_value,
       coalesce(sum(s.cost_total),0)      as cost_value,
       coalesce(sum(s.installed_value),0) as installed_value,
       case when coalesce(sum(s.total),0) > 0 then round(100 * sum(s.installed_value) / sum(s.total), 2) else 0 end as installed_pct,
       count(s.boq_id)                    as approved_boqs
from projects p left join boq_summary s on s.project_id = p.id and s.status = 'APPROVED'
group by p.id;
grant select on project_contract to authenticated;

-- ---------- RLS ----------
alter table rate_items   enable row level security;
alter table boqs         enable row level security;
alter table boq_sections enable row level security;
alter table boq_items    enable row level security;
alter table boq_progress enable row level security;
alter table valuations   enable row level security;

create policy read_all on rate_items   for select to authenticated using (true);
create policy read_all on boqs         for select to authenticated using (true);
create policy read_all on boq_sections for select to authenticated using (true);
create policy read_all on boq_items    for select to authenticated using (true);
create policy read_all on boq_progress for select to authenticated using (true);
create policy read_all on valuations   for select to authenticated using (true);

-- pricing side: anyone who can edit estimation or projects
create policy write_rates    on rate_items   for all to authenticated using ((me()).can_edit_estimation or (me()).can_edit_projects) with check ((me()).can_edit_estimation or (me()).can_edit_projects);
create policy write_boqs     on boqs         for all to authenticated using ((me()).can_edit_estimation or (me()).can_edit_projects) with check ((me()).can_edit_estimation or (me()).can_edit_projects);
create policy write_sections on boq_sections for all to authenticated using ((me()).can_edit_estimation or (me()).can_edit_projects) with check ((me()).can_edit_estimation or (me()).can_edit_projects);
create policy write_items    on boq_items    for insert to authenticated with check ((me()).can_edit_estimation or (me()).can_edit_projects);
create policy delete_items   on boq_items    for delete to authenticated using ((me()).can_edit_estimation or (me()).can_edit_projects);
-- items: editors update anything; the project's PM / site engineer may update too (the app limits them to installed_pct)
create policy update_items   on boq_items    for update to authenticated using (
  (me()).can_edit_estimation or (me()).can_edit_projects
  or exists (select 1 from boqs b join projects p on p.id = b.project_id
             where b.id = boq_items.boq_id and current_person_id() in (p.pm_id, p.pm2_id, p.site_engineer_id))
);
create policy add_progress   on boq_progress for insert to authenticated with check (true);
create policy write_vals     on valuations   for all to authenticated using ((me()).can_edit_projects) with check ((me()).can_edit_projects);

grant all on rate_items, boqs, boq_sections, boq_items, boq_progress, valuations to authenticated, service_role;
grant usage, select on all sequences in schema scheduler to authenticated, service_role;
