set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '9535412b-2133-4ec3-8616-7915c64c787b' and source_file = 'BOQ - Oro Verde Planter Box Only.xlsx';
insert into variations(project_id, vo_no, description, value) values ('9535412b-2133-4ec3-8616-7915c64c787b', 2, 'Oro Verde Planter Box Only', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '9535412b-2133-4ec3-8616-7915c64c787b' and vo_no = 2;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('9535412b-2133-4ec3-8616-7915c64c787b', 'VARIATION', 0, v, 'Oro Verde Planter Box Only', 'BBC/072026/00089_rev00', 'DRAFT', '2026-08-18', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Oro Verde Planter Box Only.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'All construction drawings, specifications, and other necessary details required for the execution of the works by client', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, null, null, 'Coordination, submission, and follow-up for all required approvals and fees from relevant authorities & government by client.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'A', 'Planter Box') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'BF-405C Production and installation of PLANTER BOX as per drawings and design. Comprising two-coat liquid-applied waterproof membrane with reinforcing fleece to all internal faces, protection board, drainage cell layer, filter geotextile membrane, drainage outlets and connection to the nearest available surface-water point, all as detailed on the drawings.

Ref: 405D
Area: Outdoor Wall Feature C', 1.0, 'pc', 11537.5, 9230.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'BF-405D Production and installation of PLANTER BOX as per drawings and design. Comprising two-coat liquid-applied waterproof membrane with reinforcing fleece to all internal faces, protection board, drainage cell layer, filter geotextile membrane, drainage outlets and connection to the nearest available surface-water point, all as detailed on the drawings.

Ref: 405D
Area: Outdoor Wall Feature D', 1.0, 'pc', 9250.0, 7400.0, 25.0, false, false);
update boqs set status = 'APPROVED' where id = b;
end $x$;
