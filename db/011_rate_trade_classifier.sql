-- 011: file library rates under 17 fixed trades, not raw bill section titles.
-- Applied 15 Oct 2026 (after the sweep seed). rate_trade() mirrors TRADES in import/rates_from_sweep.py — keep them in step.
set search_path = scheduler, public;

create or replace function rate_trade(section text, descr text default '') returns text language sql immutable as $$
  with rules(ord, trade, pat) as (values
    (1,'Preliminaries','prelim|mobili[sz]ation|insurance|site supervision|site management|scaffold|hoarding|temporary'),
    (2,'Demolition & Site Works','demoli|dismantl|removal of|remove existing|strip(ping)? out|debris|disposal|site clearance|site works|excavat|hacking'),
    (3,'Concrete & Masonry','concrete|rcc|slab|screed|block ?work|masonry|brick|partition|plaster(?!board)|render|lintel|foundation|footing'),
    (4,'Waterproofing & Insulation','waterproof|membrane|insulation|thermal|damp|moisture'),
    (5,'Metal Works','metal work|steel|railing|handrail|balustrade|mild steel|stainless|iron ?work|canopy|pergola'),
    (6,'Doors & Windows','\mdoors?\M|window|frame|ironmongery|shutter|louv|pivot|sliding|bi-?fold|sch(ü|u)co'),
    (7,'Glass & Glazing','glass|glazing|mirror|curtain wall|skylight'),
    (8,'Flooring','floor|tile|tiling|marble|porcelain|ceramic|parquet|laminate|vinyl|spc|decking|epoxy|terrazzo|carpet|skirting|threshold|finishes'),
    (9,'Wall Finishes','wall finish|paint|emulsion|wallpaper|cladding|microcement|stucco|venetian|wall panel|fluted|texture'),
    (10,'Ceilings','ceiling|gypsum|cornice|cove|bulkhead'),
    (11,'Joinery','joiner|wardrobe|cabinet|vanity|kitchen|cupboard|shelv|shelf|drawer|tv unit|tv wall|headboard|wood ?work|veneer|mdf|plywood|dresser|console|closet|counter|bookcase|accessor'),
    (12,'Furniture','furniture|sofa|chair|table|\mbed\M|stool|bench|ottoman|loose'),
    (13,'Sanitary & Plumbing','sanitar|plumb|bathroom|\mwc\M|basin|shower|bathtub|\mtap\M|mixer|drain|water heater|faucet|toilet|bidet'),
    (14,'Electrical & Lighting','electric|lighting|light fitting|downlight|switch|socket|wiring|cable|chandelier|\mled\M|spotlight|pendant'),
    (15,'HVAC & MEP','hvac|\mac\M|a/c|air ?con|duct|fcu|split unit|vrf|\mmep\M|fire|sprinkler|compressor|ventilation|exhaust'),
    (16,'Landscaping & Outdoor','landscap|garden|irrigation|planter|outdoor|exterior|pool|lawn|turf|paving|fenc|gate|bbq|roof'))
  select coalesce(
    (select trade from rules where lower(regexp_replace(coalesce(section,''), '^[A-Z]{1,3}[.)]\s*', '')) ~ pat order by ord limit 1),
    (select trade from rules where lower(coalesce(descr,'')) ~ pat order by ord limit 1),
    'Misc')
$$;

-- seed_rates_from_approved() now files under rate_trade(section, description) instead of the raw section title.
-- (Body otherwise identical to 010 — see that file.)
create or replace function seed_rates_from_approved() returns int language plpgsql set search_path = scheduler, public as $$
declare n int := 0; r record; pfx text; seq int;
begin
  for r in
    select distinct on (lower(btrim(i.description)), lower(coalesce(i.unit,'')))
      rate_trade(case when s.title ~* '^(additional|variation)' then coalesce(i.subheading, '') else s.title end, i.description) as category,
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

-- One-off: re-file the 80 Sidra rates seeded by 010 under their raw section names (run 15 Oct).
-- update rate_items set category = case category when 'Joinery Works' then 'Joinery' when 'Kitchen' then 'Joinery' when 'Accessories' then 'Joinery'
--   when 'Doors and Windows' then 'Doors & Windows' when 'Finishes' then 'Flooring' when 'Site Works' then 'Demolition & Site Works'
--   when 'Thermal and Moisture Protection' then 'Waterproofing & Insulation' when 'MEP Works' then 'HVAC & MEP'
--   when 'Skylights' then 'Glass & Glazing' when 'Glazing Works' then 'Glass & Glazing'
--   when 'Masonry / Partition Works' then 'Concrete & Masonry' when 'Concrete Works' then 'Concrete & Masonry' else category end;
