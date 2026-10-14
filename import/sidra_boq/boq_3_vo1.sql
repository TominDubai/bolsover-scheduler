set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '39688550-ec6c-460e-b6e7-41b96859f44c' and source_file = 'vo1.xlsx';
insert into variations(project_id, vo_no, description, value) values ('39688550-ec6c-460e-b6e7-41b96859f44c', 1, 'Villa 170, Sidra 2, Dubai Hills Additional Work no. 1', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '39688550-ec6c-460e-b6e7-41b96859f44c' and vo_no = 1;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('39688550-ec6c-460e-b6e7-41b96859f44c', 'VARIATION', 0, v, 'Villa 170, Sidra 2, Dubai Hills Additional Work no. 1', 'BBC/042026/00072_rev00', 'DRAFT', '2026-04-29', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'vo1.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, null, null, 'Preparation, coordination, and procurement of all necessary approvals (authority submissions, revisions, and NOC) for Additional Work 
no. 1 at Villa 170, Sidra 2, Dubai Hills Renovation Work — by Client.', null, null, null, null, null, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'II', 'Additional Work no. 1') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Removal Works', 'Removal of existing windows including frames and glass, carting away and disposal to approved DM site, and preparation of openings including edge trimming, leveling, and making good, ready for installation of new large windows.

Location: Living & Dining Area Only (Elevation C)', 1.0, 'LS', 5820.0, 4850.0, 20.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Glazing Works', 'Supply and Installation of fixed curtain wall window (JUMBO)

Brand: Schuco
Colour: Gun Metal Gray (Sample to be approved)
Glass: Climaguard Neutral PN70 DGU (or similar)
Size: 5.185m W x 2.700m Ht
Location: Living Area Only (Elevation C)', 1.0, 'Nos', 42348.49, 42348.49, 0.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', 'Glazing Works', 'Supply and Installation of fixed curtain wall window

Brand: Schuco
Colour: Gun Metal Gray (Sample to be approved)
Glass: Climaguard Neutral PN70 DGU (or similar)
Size: 3.050m W x 2.700m Ht
Location: Dining Area Only (Elevation C)', 1.0, 'Nos', 18117.0, 18117.0, 0.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, null, 'Glazing Works', 'Additional Cost for Kitchen as per new Design', null, null, null, null, null, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'D.', 'Glazing Works', 'Supply and Installation of Kitchen Cabinet with Island, including base cabinets, wall cabinets, island carcass, MDF carcass with melamine finish, internal shelving, drawers/doors, standard cabinet hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Kitchen Cabinet Size: 2500mm ht x 700mm D x 6210mm L
Kitchen Island Size: 3600mm L x 1300mm D x 900mm ht

Location: GF Kitchen Cabinet
Note: Including Corian top for cabinet and ceiling frame', 1.0, 'Nos', 41027.5, 41027.5, 0.0, false);
update boqs set status = 'APPROVED' where id = b;
end $x$;
