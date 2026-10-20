set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and source_file = 'Additional Work No. 3 - Villa 1 Meadows 5 - 19.06.26.xlsx';
insert into variations(project_id, vo_no, description, value) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 3, 'Additional Work No. 3 - Villa 1 Meadows 5 - 19.06.26', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and vo_no = 3;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 'VARIATION', 0, v, 'Additional Work No. 3 - Villa 1 Meadows 5 - 19.06.26', null, 'DRAFT', '2026-06-23', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in the BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'Additional Work No. 3 - Villa 1 Meadows 5 - 19.06.26.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'VARIATION WORK NO. 3') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', 'Electrical Supplies', 'Supply of 1-gang, 1-way smart light touch switch (Zigbee type), complete with touch switch mechanism, tempered glass faceplate, aluminum frame.

Specifications:

Type: Light Touch Switch (Zigbee)
Configuration: 1 Gang / 1 Way
Load Capacity: 800W/Gang
Face Material: Tempered Glass
Frame Material: Aluminum
Color: Black
Brand: Equivalent Approved', 9.0, 'Nos.', 231.0, 132.0, 75.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', 'Electrical Supplies', 'Supply of 2-gang, 1-way smart light touch switch (Zigbee type), complete with touch switch mechanism, tempered glass faceplate, and aluminum frame.

Specifications:
Type: Light Touch Switch (Zigbee)
Configuration: 2 Gang / 1 Way
Load Capacity: 800W/Gang
Face Material: Tempered Glass
Frame Material: Aluminum
Color: Black
Brand: Equivalent Approved', 23.0, 'Nos.', 250.25, 143.0, 75.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', 'Electrical Supplies', 'Supply of recessed 2P+T (2 Pole + Earth) power outlet, 2-gang type, complete with socket mechanism, faceplate, flush back box, and mounting accessories', 2.0, 'Nos.', 279.125, 159.5, 75.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', 'Electrical Supplies', 'Supply of 20A high-powered rocker switch, complete with switch mechanism, tempered glass faceplate, mounting frame, and fixing accessories.

Specifications:

Type: High-Powered Rocker Switch
Rating: 20A
Style: Edge
Face Material: Tempered Glass
Color: Black
Operation: Rocker Type
Brand: Approved Equivalent', 7.0, 'Nos.', 125.125, 71.5, 75.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', 'Electrical Supplies', 'Supply of single-gang data outlet complete with RJ45 data module, black tempered glass faceplate, mounting frame, and fixing accessories

Specifications:

Type: Single Data Socket (1 Gang)
Outlet: RJ45 Data Port
Style: Edge
Face Material: Tempered Glass
Color: Black
Brand: Approved Equivalent', 4.0, 'Nos.', 86.625, 49.5, 75.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', 'Electrical Supplies', 'Supply of single-gang wall power socket, complete with socket mechanism, tempered glass faceplate, and mounting accessories.

Specifications:

Type: Standard Wall Socket (Non-Smart)
Configuration: Single Gang
Finish: Black Glass
Style: Edge Type
Face Material: Tempered Glass
Color: Black
Brand: Approved Equivalent', 15.0, 'Nos.', 67.375, 38.5, 75.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', 'Electrical Supplies', 'Supply of double-gang wall power socket, complete with socket mechanism, tempered glass faceplate, and mounting accessories.

Specifications:

Type: Standard Wall Socket (Non-Smart)
Configuration: Double Gang
Finish: Black Glass
Style: Edge Type
Face Material: Tempered Glass
Color: Black
Brand: Approved Equivalent', 6.0, 'Nos.', 132.825, 75.9, 75.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', 'Electrical Supplies', 'Supply of single-gang wall socket with integrated USB Type-C charging ports, complete with socket mechanism, tempered glass faceplate, mounting accessories, and black finish.

Specifications:

Type: Single Wall Socket with USB + Type-C
Smart Function: Non-Smart
Faceplate Style: Edge
Material: Tempered Glass
Color: Black
USB Ports: USB Type-C
Brand: Approved Equivalent', 6.0, 'Nos.', 134.75, 77.0, 75.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', 'Electrical Supplies', 'Supply of 20A flex outlet connection unit, complete with terminal mechanism, tempered glass faceplate, mounting accessories, and black finish.

Specifications:

Type: Flex Outlet Connection Unit
Rating: 20A
Smart Function: Non-Smart
Style: Edge
Face Material: Tempered Glass
Color: Black
Brand: Approved Equivalent', 4.0, 'Nos.', 115.5, 66.0, 75.0, false, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
