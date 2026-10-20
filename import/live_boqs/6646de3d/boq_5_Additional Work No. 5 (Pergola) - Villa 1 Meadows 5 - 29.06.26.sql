set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and source_file = 'Additional Work No. 5 (Pergola) - Villa 1 Meadows 5 - 29.06.26.xlsx';
insert into variations(project_id, vo_no, description, value) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 5, 'Additional Work No. 5 (Pergola) - Villa 1 Meadows 5 - 29.06.26', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and vo_no = 5;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 'VARIATION', 0, v, 'Additional Work No. 5 (Pergola) - Villa 1 Meadows 5 - 29.06.26', null, 'DRAFT', '2026-06-29', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in the BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'Additional Work No. 5 (Pergola) - Villa 1 Meadows 5 - 29.06.26.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'VARIATION WORK NO. 5') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', 'Pergola @ Pool Area', 'Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (10.80 m x 5.05 m), as per approved drawings.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Rafters: 10 cm x 4 cm aluminium tube profile, Wooden textured powder-coated

Supply and installation of Steel provisions inside the longer beams.

Notes:
1. Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.
2. Footing works are not included in this quotation.
3. Electrical works are not included in this quotation', 1.0, 'LS', 70937.1, 54567.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', 'Pergola @ Front Villa Area', 'Supply and installation of A-grade powder-coated aluminium closed pergola with an overall size of (5.22 m x 5.06 m), as per approved drawings.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Rafters: 10cm x 1cm interconnected aluminium panals RAL colour powder-coated
Top: Closed with 5cm thick sandwich panels 

Supply and installation of Steel provisions inside the longer beams.

Notes:
1. Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.
2. Footing works are not included in this quotation.
3. Electrical works are not included in this quotation.', 1.0, 'LS', 38627.16, 29713.2, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', 'Pergola @ Outside Salon Area', 'Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (4.75 m x 1.2 m), as per approved drawings.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Rafters: 10 cm x 4 cm aluminium tube profile, wooden texture powder-coated

Notes:
1. Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.
2. Footing works are not included in this quotation.
3. Electrical works are not included in this quotation.', 1.0, 'LS', 8840.0, 6800.0, 30.0, false, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
