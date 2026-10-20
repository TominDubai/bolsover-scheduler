-- 014: lump-sum discount on a bill (Villa 45 rev08 carries a 4% discount line under its Total).
-- total = Σ live items − discount; installed value scales by the same ratio so valuations bill on the discounted contract.
set search_path = scheduler, public;

alter table boqs add column if not exists discount numeric(14,2) not null default 0;

create or replace function boq_total(b uuid) returns numeric language sql stable set search_path = scheduler, public as $$
  select coalesce(sum(i.amount),0) - (select discount from boqs where id = b)
  from boq_items i where i.boq_id = b and not i.is_note
$$;

create or replace view boq_summary as
select b.id as boq_id, b.project_id, b.kind, b.rev_no, b.variation_id, b.title, b.status, b.vat_pct,
       count(i.id) filter (where not i.is_note) as item_count,
       coalesce(sum(i.amount) filter (where not i.is_note),0) - b.discount as total,
       coalesce(sum(i.cost_amount) filter (where not i.is_note),0) as cost_total,
       round(coalesce(sum(i.amount * i.installed_pct / 100) filter (where not i.is_note),0)
             * case when coalesce(sum(i.amount) filter (where not i.is_note),0) > 0
                    then (coalesce(sum(i.amount) filter (where not i.is_note),0) - b.discount) / sum(i.amount) filter (where not i.is_note)
                    else 1 end, 2) as installed_value,
       case when coalesce(sum(i.amount) filter (where not i.is_note),0) > 0
            then round(100 * sum(i.amount * i.installed_pct / 100) filter (where not i.is_note) / sum(i.amount) filter (where not i.is_note), 2) else 0 end as installed_pct,
       coalesce(sum(i.amount) filter (where not i.is_note),0) as gross,   -- new columns go last: create-or-replace can only append
       b.discount
from boqs b left join boq_items i on i.boq_id = b.id group by b.id;
