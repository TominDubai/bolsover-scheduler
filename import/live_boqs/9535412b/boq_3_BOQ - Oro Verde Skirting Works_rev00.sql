set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '9535412b-2133-4ec3-8616-7915c64c787b' and source_file = 'BOQ - Oro Verde Skirting Works_rev00.xlsx';
insert into variations(project_id, vo_no, description, value) values ('9535412b-2133-4ec3-8616-7915c64c787b', 3, 'Oro Verde Skirting Works_rev00', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '9535412b-2133-4ec3-8616-7915c64c787b' and vo_no = 3;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('9535412b-2133-4ec3-8616-7915c64c787b', 'VARIATION', 0, v, 'Oro Verde Skirting Works_rev00', 'BBC/092026/000104_rev00', 'DRAFT', '2026-09-21', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Oro Verde Skirting Works_rev00.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'All construction drawings, specifications, and other necessary details required for the execution of the works by client', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, null, null, 'Coordination, submission, and follow-up for all required approvals and fees from relevant authorities & government by client.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'II', 'Skirting Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'RECEPTION AREA BENCH:

Supply and installation of 50mm ht metal skirting.', 5.44, 'LM', 208.0, 160.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'DINING AREA BOOTH SEATING:

Supply and installation of 100mm ht metal skirting.', 4.8, 'LM', 390.0, 300.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'DINING AREA ROUND BOOTH SEATING:

Supply and installation of 100mm ht metal skirting.', 15.11, 'LM', 390.0, 300.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'DINING AREA BENCH SEATING:

Supply and installation of 100mm ht metal skirting.', 16.99, 'LM', 208.0, 160.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'DINING AREA FRONT BAR COUNTER:

Supply and installation of 150mm ht metal skirting.', 13.25, 'LM', 585.0, 450.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'DINING AREA BACK BAR COUNTER:

Supply and installation of 150mm ht metal skirting.', 8.45, 'LM', 585.0, 450.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'DINING AREA BAR BOOTH SEATING:

Supply and installation of 100mm ht metal skirting.', 10.13, 'LM', 390.0, 300.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, null, null, 'Note: Any changes to the quoted specifications or materials, and any additional scope of work, shall be treated as a variation and priced separately.', null, null, null, null, null, true, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
