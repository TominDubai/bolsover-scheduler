set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = 'cf7d4f74-b23e-4bde-8a3b-5cb783784a74' and source_file = 'BOQ - Sunrise Villa 21, Jumeirah Park Interior Works_rev06.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('cf7d4f74-b23e-4bde-8a3b-5cb783784a74', 'QUOTE', 6, v, 'Sunrise Villa 21, Jumeirah Park Interior Works', 'BBC/052026/00077_rev06', 'DRAFT', '2026-07-24', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Sunrise Villa 21, Jumeirah Park Interior Works_rev06.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Mobilization to site, including rubbish removal to DM site, site protection, construction cleaning allowed for site, manual handling/hauling and site supervision.', 1.0, 'LS', 14000.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'B', 'GF Nook (Newly Added)') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Carry out electrical modification works including removal and relocation of existing power outlet, provision of concealed conduits and wiring, wall and floor chasing, making good of affected surfaces, and provision of lighting and switch wiring.

Location: GF Nook

Notes
1. Existing double socket outlet is to be reused.
2. Wall light to be supplied by client.
3. Switch to be supplied by Bolsover same as existing.
4. Rate includes conduits, wiring, chasing, patching, and testing.
5. Final locations shall be confirmed on site prior to commencement of works.', 1.0, 'Nos.', 3250.0, null, 30.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'C', 'Powder Room and Guest Bedroom Washroom') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Careful removal of existing vanity mirror including disconnection of any existing lighting connections, followed by supply and installation of new vanity mirror with integrated backlighting system, including electrical connections, fixing, alignment, testing, and commissioning.

Location: Powder Room', 1.0, 'Nos.', 4745.0, 3650.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Careful removal of existing wash basin and mixer including disconnection of hot and cold water supply lines and drainage connections, followed by installation of new client-supplied new mixer, including connection to existing plumbing points, sealing, alignment, testing, and commissioning.

Location: Powder Room', 1.0, 'LS', 2015.0, 1550.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and application of washable/hygienic paint over existing bathroom wall tiles, including surface preparation (cleaning and degreasing), sealing of grout joints to level the surface, application of primer coat, and two coats of washable/hygienic paint using brush/roller. 

Location: Powder Room Entire Walls', 21.827, 'sqm', 234.0, 180.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply and Installation of porcelain wall tiles (60 x 120cm) over existing tile surfaces, including thorough surface preparation, application of approved tile adhesive, precise setting out, cutting around edges, fixtures and openings, grouting with matching color, sealing if required, cleaning, and protection of finished surfaces. 

Location: Guest Washroom Shower wall area (3 walls + niche (50cm L x 30cm ht x 10cm D approx.)
Tiles PC Rate: 150 AED/sqm', 1.0, 'LS', 5204.69, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Supply, modification, and installation of electrical works for new hanging pendant lights and mirror backlighting, including wiring adjustments, switch connection, concealed conduiting (if required), driver/transformer installation, testing, and commissioning.

Location: Powder Room
Note: Pendant Light to be supplied by client.', 1.0, 'Nos.', 1500.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, null, null, 'Note: 
1. Keep Mirror and Vanity for the Guest Washroom only.
2. Wrapping of vanity countertop to be confirmed and quoted separately.
3. Wallpaper backwall or other design to be confirmed and quoted separately.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 3, 'D', 'GF Living/Show Kitchen Area') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and installation of decorative gypsum board arch at existing opening, including GI metal framework, gypsum board cladding, curved/arched shaping, joint treatment, finishing, and making good.

Location: Living Area', 1.0, 'Nos.', 5000.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, null, null, 'Note: Joinery Works to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 4, 'E', 'GF Hallway') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and installation of gypsum board cladding to cover existing fixed window frames and existing full fixed head window, including GI support framework, gypsum board lining, joint treatment, corner beads, surface preparation, primer coat, paint finish.', 1.0, 'Nos.', 5000.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Careful removal of existing wooden door including frame, accessories, and hardware, followed by preparation of opening for installation of new concealed (hidden) wooden door system, including surface adjustment, frame alignment preparation, minor civil works, and making good.', 1.0, 'Nos.', 2340.0, 1800.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and application of texture paint finish to walls, including surface preparation, primer/sealer as recommended by manufacturer, multiple coats of texture paint, and touch-ups.

Note: Sample subject for approval.', 44.85, 'sqm', 267.8, 206.0, 30.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 5, 'F', 'Laundry/Kitchen/Pantry Area (Newly Added)') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Careful removal of existing dryer unit along with associated electrical, plumbing, and drainage connections, including disconnection, isolation, dismantling, disposal, and preparation of area for installation of new countertop sink (approx. 0.6m × 0.6m), including necessary modifications to services and making good.

Location: Laundry Area', 1.0, 'LS', 2990.0, 2300.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Installation of client-supplied above countertop sink and mixer, including positioning, fixing on countertop, connection to existing water supply and drainage system, sealing, alignment, testing for leakage, and commissioning.

Location: Laundry Area', 1.0, 'Nos.', 2145.0, 1650.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Note: Joinery Works to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 6, 'G', 'Bedroom 3/Master Wardrobe Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Careful demolition and removal of existing non-structural partition wall to expand master wardrobe space, including disposal of debris, and closing of existing door opening with suitable blockwork, including plastering, finishing, and making good.', 1.0, 'LS', 9685.0, 7450.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Careful dismantling of existing wardrobe/cabinet system and relocation to new designated area within the same unit, including protection of components, transportation within site, reinstallation, alignment, fixing, and making good.

Length: 3.15m L + 2.50m L
Location: Master Wardrobe', 1.0, 'LS', 9035.0, 6950.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and construction of new non-structural partition wall using blockwork, including all materials, mortar, plastering on both sides, surface preparation, and complete painting works with approved finish.

Size: (1.5m L + 3.15m L) x 3.50m ht', 1.0, 'LS', 10725.0, 8250.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Careful cutting and formation of a new door opening in existing blockwall, including demolition of required portion, structural edge preparation, lintel provision (if required), reinforcement, plastering, alignment, and making good to surrounding finishes, ready for door installation.

Location: Bedroom 03/Office Room', 1.0, 'Nos.', 5300.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Careful dismantling, relocation, and reinstallation of existing wooden door including frame and ironmongery, from current position to new designated opening, including protection, transportation within site, re-fixing, alignment, adjustment, and making good.

Location: Bedroom 03/Office Room', 1.0, 'Nos.', 3225.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply and installation of decorative gypsum board arch at existing opening, including GI metal framework, gypsum board cladding, curved/arched shaping, joint treatment, finishing, and making good.

Location: Master Wardrobe', 1.0, 'Nos.', 3500.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Supply and Installation of gypsum board ceiling, ready to receive primer

Location: Affected Demolished area
Note: Cutting of ceiling for light frame and A/C grill to be confirmed and quoted separately.', 29.7, 'sqm', 136.5, 105.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Supply and Application of Ceiling Paint (one coat primer, two coat stucco, two coat fenomastic mat white).

Location: Affected Demolished area', 29.7, 'sqm', 65.0, 50.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, null, null, 'Note: No Modification of Bedroom 03/Office Washroom', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, null, null, 'Note: Joinery Works to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 7, 'H', 'Master Bedroom & Washroom Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Installation of client-supplied wall light, including electrical connection, alignment, and testing.

Location: Master Bedroom
Note: Newly Added Item', 2.0, 'Nos.', 1500.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Carefully dismantle and remove existing shower glass doors (2 Nos.) including all associated hardware, hinges, handles, brackets, seals, and fixing accessories without causing damage to adjacent finishes. 

Works shall include patching and making good of all holes, cut-outs, fixing points, and marks left by the removed accessories on the existing glass panels and surrounding surfaces, including cleaning and disposal of removed materials.

Location: Master Bathroom', 1.0, 'LS', 2112.5, 1625.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Note: Keep Mirror and Vanity for the Master Bathroom only', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, null, null, 'Note: Joinery Works to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 8, 'I', 'Bedroom 01 & 02 Room & Washrooms') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and installation of new porcelain tiles over existing tiles in shower area, including surface preparation, mechanical roughening of existing tiles, application of bonding agent/adhesive suitable for tile-on-tile installation, fixing of new tiles, grouting, cleaning, and finishing.

Location: Bedroom 01 & 02 Shower Area (one wall only +1 niche each bathroom)
Tiles PC Rate: 280 AED/sqm', 1.0, 'LS', 9500.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, null, null, 'Note: Keep Mirror and Vanity for the Bedroom 01 & 02 Washroom only', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Note: Joinery Works to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, null, null, 'Note: Additional Works for Exterior Area will be  quoted separately after Nakheel Approval;
1. Garage Aluminum Louver
2. Decorative Wall
3. Pergola
4. Soft Landscaping Work
5. BBQ & Island Counter', null, null, null, null, null, true, false);
update boqs set status = 'APPROVED' where id = b;
end $x$;
