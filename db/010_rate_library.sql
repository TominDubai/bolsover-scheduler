-- 010: rate library — seed from approved bills, keep it fed from use.
-- Run after 007/008. Idempotent. Applied 15 Oct 2026 (via MCP: drop/grant lines rejected, so they were run without; functions need `set search_path` or they can't see the tables).
set search_path = scheduler, public;

-- One entry per (description, unit). Codes are CAT-NNN, generated.
create unique index if not exists rate_items_desc_unit on rate_items (lower(btrim(description)), lower(coalesce(unit,'')));

-- Category prefix for a code: first letters of the section title, max 4 chars.
create or replace function rate_code_prefix(cat text) returns text language sql immutable as $$
  select case
    when (regexp_split_to_array(btrim(coalesce(cat,'MISC')), '\s+'))[1] ~ '^[A-Z]{2,5}$' then (regexp_split_to_array(btrim(cat), '\s+'))[1]   -- MEP Works → MEP
    else upper(left(regexp_replace(
      (select string_agg(left(w,1), '') from regexp_split_to_table(regexp_replace(coalesce(cat,'MISC'), '[^A-Za-z ]', ' ', 'g'), '\s+') w where w <> ''),
      '[^A-Z]', '', 'gi'), 4))                                                                                                      -- Joinery Works → JW
  end
$$;

-- Pull every priced, costed unit-rate line from APPROVED bills into the library.
-- Skips LS lump sums (project-specific), text rows, excluded rows and anything already in the library.
-- VO sections ("Additional Work no. 1") are filed under the item's sub-heading, or "Variations".
create or replace function seed_rates_from_approved() returns int language plpgsql set search_path = scheduler, public as $$
declare n int := 0; r record; pfx text; seq int;
begin
  for r in
    select distinct on (lower(btrim(i.description)), lower(coalesce(i.unit,'')))
      case when s.title ~* '^(additional|variation)' then coalesce(i.subheading, 'Variations') else s.title end as category,
      btrim(i.description) as description, i.unit, i.cost_rate, i.rate as sell_rate,
      case when i.cost_rate > 0 then round((i.rate / i.cost_rate - 1) * 100, 2) else i.markup_pct end as markup_pct,
      b.project_id, coalesce(b.issue_date, b.created_at::date) as used_on
    from boq_items i
    join boq_sections s on s.id = i.section_id
    join boqs b on b.id = i.boq_id
    where b.status = 'APPROVED' and not i.is_note and not i.excluded
      and i.rate is not null and i.rate > 0 and i.cost_rate is not null and i.cost_rate > 0
      and coalesce(i.qty,0) > 0 and coalesce(i.unit,'') not in ('', 'LS')
      and not exists (select 1 from rate_items x where lower(btrim(x.description)) = lower(btrim(i.description)) and lower(coalesce(x.unit,'')) = lower(coalesce(i.unit,'')))
    order by lower(btrim(i.description)), lower(coalesce(i.unit,'')), b.issue_date desc nulls last
  loop
    pfx := rate_code_prefix(r.category);
    select coalesce(max(substring(code from '\d+$')::int), 0) + 1 into seq from rate_items where code like pfx || '-%';
    insert into rate_items (code, category, description, unit, cost_rate, sell_rate, markup_pct, source_project_id, last_used, use_count)
    values (pfx || '-' || lpad(seq::text, 3, '0'), r.category, r.description, r.unit, r.cost_rate, r.sell_rate, r.markup_pct, r.project_id, r.used_on, 1);
    n := n + 1;
  end loop;
  return n;
end $$;

-- Using a library item on a bill bumps its usage. Linked by rate_item_id from the item form.
create or replace function rate_item_used() returns trigger language plpgsql set search_path = scheduler, public as $$
begin
  if new.rate_item_id is not null and (tg_op = 'INSERT' or new.rate_item_id is distinct from old.rate_item_id) then
    update rate_items set use_count = use_count + 1, last_used = current_date, updated_at = now() where id = new.rate_item_id;
  end if;
  return new;
end $$;
drop trigger if exists boq_items_rate_used on boq_items;
create trigger boq_items_rate_used after insert or update of rate_item_id on boq_items for each row execute function rate_item_used();

-- Approving a bill feeds the library from that bill's items (new descriptions only; existing rates are left alone).
create or replace function boq_approved_feeds_rates() returns trigger language plpgsql set search_path = scheduler, public as $$
begin
  if new.status = 'APPROVED' and (tg_op = 'INSERT' or old.status is distinct from 'APPROVED') then perform seed_rates_from_approved(); end if;
  return new;
end $$;
drop trigger if exists boqs_feed_rates on boqs;
create trigger boqs_feed_rates after insert or update of status on boqs for each row execute function boq_approved_feeds_rates();

grant execute on function seed_rates_from_approved(), rate_code_prefix(text) to authenticated, service_role;

-- Initial seed (Sidra 170 rev03 + VO1 as of 15 Oct 2026).
select seed_rates_from_approved() as seeded;
