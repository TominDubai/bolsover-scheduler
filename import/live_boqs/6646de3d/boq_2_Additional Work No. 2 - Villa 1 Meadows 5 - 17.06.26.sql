set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and source_file = 'Additional Work No. 2 - Villa 1 Meadows 5 - 17.06.26.xlsx';
insert into variations(project_id, vo_no, description, value) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 2, 'Additional Work No. 2 - Villa 1 Meadows 5 - 17.06.26', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and vo_no = 2;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 'VARIATION', 0, v, 'Additional Work No. 2 - Villa 1 Meadows 5 - 17.06.26', null, 'DRAFT', '2026-06-18', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in the BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'Additional Work No. 2 - Villa 1 Meadows 5 - 17.06.26.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'VARIATION WORK NO. 2') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and installation of recessed LED spotlight, Brand: Lumibright or approved equivalent, complete with LED module, driver, housing, mounting accessories, wiring connection, testing and commissioning.

Specification:
- Input: 350mA / 500mA
- Power: 9.3W / 13.3W
- Lumen Output: 452lm / 609lm
- Color Temperature: 2700K
- Dimensions: Ø120 × 123mm
- Finish: White with Sand Finish
- IP Rating: IP20
- Mounting: Ceiling Recessed
- Warranty: 5 Years', 11.0, 'Nos.', 377.0, 290.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply and installation of LED driver, Brand: Tridonic or approved equivalent, complete with wiring connections, mounting accessories, testing and commissioning.

Specification:
- Input Voltage: 198–264 VAC
- Output Power: 20W
- Dimensions: 97 × 43 × 22.5 mm
- IP Rating: IP20
- Warranty: 5 Years', 11.0, 'Nos.', 117.0, 90.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and installation of garden light, Brand: Lumibright or approved equivalent, complete with LED light source, die-cast aluminum housing, mounting base, fixing accessories, wiring connection, testing and commissioning.

Specification:
- Input Voltage: 200–240VAC
- Power: 7W
- Lumen Output: 436lm
- Color Temperature: 3000K
- Dimensions: Ø73 × 107 × 380mm
- Material: Die-Cast Aluminum
- Finish: Black with Sand Finish
- Mounting: Floor Surface Mounted
- Warranty: 5 Years', 40.0, 'Nos.', 417.443, 321.11, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply and installation of LED bollard light, Brand: Lumibright or approved equivalent, complete with LED light source, die-cast aluminum housing, mounting base plate, anchor bolts, fixing accessories, wiring connection, testing and commissioning.

Specification:
- Input Voltage: 110–240VAC
- Power: 6W
- Lumen Output: 520lm
- Color Temperature: 3000K
- Dimensions: 235 × 800mm
- Material: Die-Cast Aluminum
- Finish: Black
- IP Rating: IP54
- Mounting: Floor Surface Mounted
- Warranty: 3 Years', 10.0, 'Nos.', 572.0, 440.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Supply and installation of LED wall light, Brand: Lumibright or approved equivalent, complete with integrated LED light source, concrete housing, mounting bracket, fixing accessories, wiring connection, testing and commissioning.

Specification:
- Input Voltage: 220–240VAC
- Power: 10.2W
- Lumen Output: 630lm
- Color Temperature: 2700K
- Dimensions: 190 × 130 × 119.7mm
- Material: Concrete
- Finish: White with Sand Finish
- IP Rating: IP65
- Mounting: Wall Mounted
- Warranty: 3 Years', 9.0, 'Nos.', 455.0, 350.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply and installation of recessed inground LED light, Brand: Lumibright or approved equivalent, complete with integrated LED light source, stainless steel trim, aluminum housing, recessed mounting sleeve, fixing accessories, wiring connection, testing and commissioning.

Specification:
- Input Voltage: 100–240VAC
- Power: 3W
- Lumen Output: 195–240lm
- Color Temperature: 3000K
- Dimensions: Ø50 × 68mm
- Material: Stainless Steel + Aluminum
- Finish: Stainless Steel
- IP Rating: IP67
- Mounting: Floor Recessed
- Warranty: 3 Years', 9.0, 'Nos.', 325.0, 250.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Supply and installation of LED wall light, Brand: Lumiville or approved equivalent, complete with integrated LED light source, die-cast aluminum housing, mounting bracket, fixing accessories, wiring connection, testing and commissioning, and all necessary materials and workmanship required for a complete installation.

Specification:

- Input Voltage: 90–260VAC
- Power: 8W
- Lumen Output: 600lm
- Color Temperature: 3000K
- Dimensions: 140 × 140 × 350mm
- Material: Die-Cast Aluminum
- IP Rating: IP54
- Mounting: Wall Mounted
- Warranty: 5 Years', 4.0, 'Nos.', 416.0, 320.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Supply and installation of LED wall light, Brand: Lumibright or approved equivalent, complete with integrated LED light source, aluminum housing, mounting bracket, fixing accessories, wiring connection, testing and commissioning, and all necessary materials and workmanship required for a complete installation.

Specification:
- Input Voltage: 90–260VAC
- Power: 2 × 2.5W (5W Total)
- Lumen Output: 406lm
- Color Temperature: 3000K
- Dimensions: 60 × 60 × 160mm
- Material: Aluminum
- Finish: White + Black
- IP Rating: IP65
- Mounting: Wall Mounted
- Warranty: 5 Years', 5.0, 'Nos.', 260.0, 200.0, 30.0, false, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
