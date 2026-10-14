-- 008: rates at 4 dp (Pao's sheets carry half-fils) and `excluded` folded into the generated amounts.
-- Needs the drop/re-add of two generated columns — run from the Supabase SQL editor.
set search_path = scheduler, public;
drop view if exists project_contract; drop view if exists boq_summary;
alter table boq_items drop column amount, drop column cost_amount;
alter table boq_items alter column rate type numeric(14,4), alter column cost_rate type numeric(14,4);
alter table rate_items alter column sell_rate type numeric(14,4), alter column cost_rate type numeric(14,4);
alter table boq_items add column amount numeric(14,2) generated always as (case when excluded then 0 else round(coalesce(qty,0) * coalesce(rate,0), 2) end) stored;
alter table boq_items add column cost_amount numeric(14,2) generated always as (case when excluded then 0 else round(coalesce(qty,0) * coalesce(cost_rate,0), 2) end) stored;
create or replace view boq_summary as
select b.id as boq_id, b.project_id, b.kind, b.rev_no, b.variation_id, b.title, b.status, b.vat_pct,
       count(i.id) filter (where not i.is_note) as item_count,
       coalesce(sum(i.amount) filter (where not i.is_note),0) as total,
       coalesce(sum(i.cost_amount) filter (where not i.is_note),0) as cost_total,
       coalesce(sum(i.amount * i.installed_pct / 100) filter (where not i.is_note),0) as installed_value,
       case when coalesce(sum(i.amount) filter (where not i.is_note),0) > 0
            then round(100 * sum(i.amount * i.installed_pct / 100) filter (where not i.is_note) / sum(i.amount) filter (where not i.is_note), 2) else 0 end as installed_pct
from boqs b left join boq_items i on i.boq_id = b.id group by b.id;
grant select on boq_summary to authenticated;
create or replace view project_contract as
select p.id as project_id, coalesce(sum(s.total),0) as contract_value, coalesce(sum(s.cost_total),0) as cost_value, coalesce(sum(s.installed_value),0) as installed_value,
       case when coalesce(sum(s.total),0) > 0 then round(100 * sum(s.installed_value) / sum(s.total), 2) else 0 end as installed_pct, count(s.boq_id) as approved_boqs
from projects p left join boq_summary s on s.project_id = p.id and s.status = 'APPROVED' group by p.id;
grant select on project_contract to authenticated;
-- then re-run import/sidra_boq/boq_1_boq_rev03.sql so the 4-dp rates land.
