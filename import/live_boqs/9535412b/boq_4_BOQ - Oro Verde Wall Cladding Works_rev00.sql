set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '9535412b-2133-4ec3-8616-7915c64c787b' and source_file = 'BOQ - Oro Verde Wall Cladding Works_rev00.xlsx';
insert into variations(project_id, vo_no, description, value) values ('9535412b-2133-4ec3-8616-7915c64c787b', 4, 'Oro Verde Wall Cladding Works_rev00', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '9535412b-2133-4ec3-8616-7915c64c787b' and vo_no = 4;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('9535412b-2133-4ec3-8616-7915c64c787b', 'VARIATION', 0, v, 'Oro Verde Wall Cladding Works_rev00', 'BBC/092026/000106_rev00', 'DRAFT', '2026-09-29', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Oro Verde Wall Cladding Works_rev00.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'All construction drawings, specifications, and other necessary details required for the execution of the works by client', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, null, null, 'Coordination, submission, and follow-up for all required approvals and fees from relevant authorities & government by client.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'II', 'Joinery') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'WALL CLADDING:

Supply and Installation of wall cladding in veneered MDF for termination between window and tile

Cladding: 18mm thk MDF in veneer finish
Size: (120 + 50)mm W x 3000mmht x 20mm D', 12.0, 'Nos.', 990.0, 900.0, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'FRAME:

Supply and Installation of wooden frame in veneered MDF, to have provision for LED lighting.

Note: LED lighting and back panel by main contractor
Cladding: 18mm thk MDF in veneer finish
Size: (4855 + 2000 + 4855 + 2000)mm W x 100mm x 40mm', 13.71, 'LM', 330.0, 300.0, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'FRAME:

Supply and Installation of wooden frame in veneered MDF, to have provision for LED lighting.

Note: LED lighting and back panel by main contractor
Cladding: 18mm thk MDF in veneer finish
Size: (4200 + 900 + 4200 + 900)mm W x 100mm x 40mm', 10.2, 'LM', 330.0, 300.0, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'SKIRTING:

Supply and Installation of profiled skirting board in green PU-painted MDF, 250mm height, with concealed fixings and a smooth, uniform finish.', 8.0, 'LM', 440.0, 400.0, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, null, null, 'Note: Any changes to the quoted specifications or materials, and any additional scope of work, shall be treated as a variation and priced separately.', null, null, null, null, null, true, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
