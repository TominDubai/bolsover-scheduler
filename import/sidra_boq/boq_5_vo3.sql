set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '39688550-ec6c-460e-b6e7-41b96859f44c' and source_file = 'vo3.xlsx';
insert into variations(project_id, vo_no, description, value) values ('39688550-ec6c-460e-b6e7-41b96859f44c', 3, 'Villa 170, Sidra 2, Dubai Hills Additional Work no. 2', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '39688550-ec6c-460e-b6e7-41b96859f44c' and vo_no = 3;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('39688550-ec6c-460e-b6e7-41b96859f44c', 'VARIATION', 0, v, 'Villa 170, Sidra 2, Dubai Hills Additional Work no. 2', null, 'DRAFT', '2026-06-12', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'vo3.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, null, null, 'Preparation, coordination, and procurement of all necessary approvals (authority submissions, revisions, and NOC) for Additional Work 
no. 6 at Villa 170, Sidra 2, Dubai Hills Renovation Work — by Client.', null, null, null, null, null, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'II', 'Additional Work no. 6') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A1.', 'Staircase Works', 'Survey & Design:

-Site preparation for scanning (cleaning, flags set out, templates set out, pre model)
-Detailed 3d scan or templates engineering survey
-Detailed 3D model preparation for customer''s/architect''s approval with up to two non principal design revisions
-Full fabrication drawings set

* Site to be prepared for clear view of scanning equipment by customer, wasted visits will be charged for (!)', 1.0, 'pkg', 156975.0, 120750.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'A2.', 'Staircase Works', 'Helical Staircase with Slotted Channels:

-Mild steel 3D plasma cut outer and inner stringers X2 ) ( to form slotted channel)
- 3100 inner dia
- 10mm, plasma cut treads mild steel treads
- 10 steps straight
- 7 steps shaped
- All the metal primed', 1.0, 'flr', null, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'A3.', 'Staircase Works', 'Glass Balustrade:

-17.5mm, tempered, polished all around clear curved laminated glass
- Installed into slotted channel
- Up to 1200mm above FFL', 12.0, 'LM', 7507.5, 5775.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'B1.', 'Staircase Works', 'OMIT: Supply and Installation of Steel staircase including railing as per the drawing including all necessary fittings and accessories including steelwork to the rooflights

Staircase Size: 10m
Note: Any changes on size will be quoted and charged separately', -1.0, 'Nos.', 127400.0, 98000.0, 30.0, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
