set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = 'cf7d4f74-b23e-4bde-8a3b-5cb783784a74' and source_file = 'BOQ - Sunrise Villa 21, Jumeirah Park Variation work no. 1_rev00.xlsx';
insert into variations(project_id, vo_no, description, value) values ('cf7d4f74-b23e-4bde-8a3b-5cb783784a74', 1, 'Sunrise Villa 21, Jumeirah Park Variation work no. 1_rev00', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = 'cf7d4f74-b23e-4bde-8a3b-5cb783784a74' and vo_no = 1;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('cf7d4f74-b23e-4bde-8a3b-5cb783784a74', 'VARIATION', 0, v, 'Sunrise Villa 21, Jumeirah Park Variation work no. 1_rev00', 'BBC/052026/00077_rev00', 'DRAFT', '2026-07-24', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Sunrise Villa 21, Jumeirah Park Variation work no. 1_rev00.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'F', 'Kitchen/Dining Area') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '3', null, 'Carefully dismantle and remove the existing door, frame, architraves, hardware, and accessories, including disposal of debris to an approved dumping site. 

Modify the existing opening and construct a new arched opening profile, including alteration, framing, shaping, and finishing works as required.

Fabrication, Supply & Installation Of 4.2cm Powder Coated Aluminum Framing With 8mm thick clear tempered floated glass & false strip arch Door including necessary accessories.
Size: 1000mm L x 2200mm ht

Location: Kitchen Area
Note: Newly Added Item', 1.0, 'Nos.', 12000.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, null, null, 'Note: Joinery Works to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'H', 'Master Washroom Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and installation of new porcelain wall tiles over existing tiles in shower area, including surface preparation, mechanical roughening of existing tiles, application of bonding agent/adhesive suitable for tile-on-tile installation, fixing of new tiles, grouting, cleaning, and finishing.

Location: Master Bathroom Shower & WC Area (3 walls + 1 niche)
Tiles PC Rate: 250 AED/sqm', 1.0, 'LS', 9783.78, 350.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply of new porcelain wall tiles over existing tiles in shower area

Note: Purchased by client.', 1.0, 'LS', 3305.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Note: Additional Works for Exterior Area will be  quoted separately after Nakheel Approval;
1. Garage Aluminum Louver
2. Decorative Wall
3. Pergola
4. Soft Landscaping Work
5. BBQ & Island Counter', null, null, null, null, null, true, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
