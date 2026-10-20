set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '4291c212-071c-4dad-89ff-bea72c7bc7ed' and source_file = 'BOQ - Villa 21, Carmen St. Victory Heights Additional Works_rev00.xlsx';
insert into variations(project_id, vo_no, description, value) values ('4291c212-071c-4dad-89ff-bea72c7bc7ed', 1, 'Villa 21, Carmen St. Victory Heights Additional Works_rev00', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '4291c212-071c-4dad-89ff-bea72c7bc7ed' and vo_no = 1;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('4291c212-071c-4dad-89ff-bea72c7bc7ed', 'VARIATION', 0, v, 'Villa 21, Carmen St. Victory Heights Additional Works_rev00', null, 'DRAFT', '2026-10-07', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Villa 21, Carmen St. Victory Heights Additional Works_rev00.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Preliminaries – mobilization/demobilization, protection, manual handling, tools/equipment, supervision, cleaning and disposal of debris. — Included', 1.0, 'LS', 0.0, null, 0.0, false, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'II', 'Additional Work no. 1') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'TV wiring concealment – wall chipping/chasing from existing TV location, concealed conduit/wiring, wall reinstatement and making good.', 1.0, 'LS', 0.0, null, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '1', null, 'Carefully remove existing WPC decking to the outdoor seating areas, including 

- temporary removal and safe relocation of loose outdoor furniture; 
- prepare existing substrate, 
- carry out cementitious screeding to required levels/falls, and 
- supply & install approved outdoor wood-look porcelain tiles to match the existing outdoor finish, including tile adhesive, grout, curved/straight cutting, edge finishing, movement joints, making good, final cleaning and reinstatement of loose furniture, complete.

Note: 
1. Approximate quantity is based on circular area with return at the seating area and semi-circular area adjacent to the swimming pool. Final quantity and dimensions to be verified on site prior to commencement. Outdoor porcelain tile PC allowance: AED 120/m². Any difference in selected tile cost above/below the PC allowance shall be adjusted accordingly.
2. Provisional Quantity: 30 m2', 1.0, 'LS', 12500.0, 12500.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Remove existing glass half-height partition and construct new 2.0m L × 3.0m H partition with GI framing, plywood to both sides and gypsum board over plywood to both faces, including jointing, sanding and painting.', 1.0, 'LS', 0.0, null, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Concealed electrical/data wiring within new partition, including conduits, boxes, supports, connections and testing.', 1.0, 'LS', 0.0, null, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '2', null, 'Refurbishment of existing outdoor wooden double door, including sanding, minor timber repairs, exterior wood treatment/stain, refinishing and hardware adjustment.', 1.0, 'LS', 3850.0, 3850.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, null, null, 'Important BOQ notes:

- Tile rate includes a PC allowance of AED 120/m² for approved outdoor wood-look porcelain tiles.
- Final tile quantity is subject to actual site measurement.
- Existing substrate is assumed to be generally sound; major screed repair, waterproofing or extensive levelling is excluded.
- Door refurbishment assumes the existing timber door and frame are structurally serviceable. Major timber replacement or complete door replacement is excluded.
- Final paint/stain colour to match existing/approved sample.', null, null, null, null, null, true, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
