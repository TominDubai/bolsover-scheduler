set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = 'cf7d4f74-b23e-4bde-8a3b-5cb783784a74' and source_file = 'BOQ - Sunrise Villa 21, Jumeirah Park Extension Works_rev02.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('cf7d4f74-b23e-4bde-8a3b-5cb783784a74', 'QUOTE', 2, v, 'Sunrise Villa 21, Jumeirah Park Extension Works', 'BBC/052026/00077_rev02', 'DRAFT', '2026-05-19', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Sunrise Villa 21, Jumeirah Park Extension Works_rev02.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Mobilization to site, gate passes, including rubbish removal to DM site, site protection, construction cleaning allowed for site, manual handling/hauling and site supervision.', 1.0, 'LS', 17250.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Obtaining an approval from Nakheel & Trakhees allowed to arrange a structural, architectural, MEP drawing required from authorities.
 
Note: Nakheel & Trakhees authorities payment provided by the client.', 1.0, 'LS', 34450.0, 26500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'B', 'Construction of Extension Area: (5.15m x 3.50m)') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Building a new room in GF Area:
a. Removal of existing flooring and excavation for footing foundation.
b. Compaction test and Anti termite third party inspection.
c. Lean concreting for footing foundation 
d. Installation steel rebar reinforcement for footing foundation.
e. Shuttering of the foundation and concreting.
f. Installation of steel rebar for column and tie beam.
g. Shuttering of the column and concreting.
h. Application bitumen paint.
i. Backfilling of the excavation and compaction.
j. Installation of steel rebar for column and tie beam and concreting
k. Installation of slab shuttering and steel reinforcement.
l. Slab concreting.
m. Installation of non structural block works including lintel and plastering.
n. Roof waterproofing.', 1.0, 'LS', 95550.0, 73500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply and Installation of steel beam support on the wall extension area.', 1.0, 'LS', 9555.0, 7350.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and Installation of gypsum board flat ceiling, ready to receive primer

Location: Extension Area
Note: Cutting of ceiling for light frame to be confirmed and quoted separately.', 19.8275, 'sqm', 136.5, 105.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply and Application of Ceiling Paint (one coat primer, two coat stucco, two coat fenomastic mat white)

Location: Extension Area', 19.8275, 'sqm', 65.0, 50.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Supply and Application of Wall Paint (one coat primer, two coat stucco, two coat fenomastic mat white)

Location: Extension Area', 66.605, 'sqm', 65.0, 50.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply and apply of cement floor screeding of extension area.', 19.8275, 'sqm', 110.5, 85.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Supply and execution of complete electrical works for the extension area, including provision/modification of lighting points, switches, socket outlets, conduits, wiring, and connection to existing electrical system, including testing, commissioning, and making good.', 1.0, 'LS', 12402.0, 9540.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Supply and Installation of 2.5hp tonner split AC unit including copper pipes

Brand: Super General Split AC 2.5hp', 1.0, 'Nos.', 9750.0, 7500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', null, 'Removal of existing full-height fixed window assembly and preparation of opening for installation of new swing door system, including dismantling, disposal, modification/preparation of opening, required civil and structural support works, provision for swing door installation, alignment, and making good.', 1.0, 'Nos.', 2847.0, 2190.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, '10', null, 'Relocation, and reinstallation of existing window measuring approximately 3.0m height × 1.2m length, including transportation within site, preparation of new opening, fixing, alignment, sealing, and making good.', 1.0, 'Nos.', 1708.2, 1314.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, '11', null, 'Supply and installation of glass swing door including toughened safety glass, floor spring system, patch fittings, handles, locking accessories, fixing, alignment, sealing, and finishing.

Size: 2.70m ht x 1.20m L', 1.0, 'Nos.', 7686.9, 5913.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, '12', null, 'Supply and installation of new fixed window measuring approximately 2.10m height × 1.20m length, including aluminium frame, glass panel, fixing accessories, sealant, alignment, installation, weatherproofing, and making good.

Size: 2.10m ht x 1.20m L', 1.0, 'Nos.', 4839.9, 3723.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, null, null, 'Note: Flooring Finishes, Other Decorative Finishes, Lighting Fixtures, Joineries and Loose Furnitures to be confirmed and quoted separately.', null, null, null, null, null, true, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
