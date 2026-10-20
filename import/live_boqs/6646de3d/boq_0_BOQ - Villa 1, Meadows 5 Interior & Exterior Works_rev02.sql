set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and source_file = 'BOQ - Villa 1, Meadows 5 Interior & Exterior Works_rev02.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 'QUOTE', 2, v, 'The Meadows 5, Villa 1 Renovation & Extension', 'BBC/012026/00051_rev02', 'DRAFT', '2026-01-28', 100, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Villa 1, Meadows 5 Interior & Exterior Works_rev02.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Mobilization to site, gate passes, including rubbish removal to DM site, site protection, construction cleaning allowed for site, manual handling/hauling and site supervision.', 1.0, 'LS', 26975.0, null, 2178750.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Obtaining an approval from Emaar, DDA,
allowed to arrange a structural, architectural,
MEP drawing required from authorities.
 
Note: DDA and Emaar authorities payment provided by the client.', 1.0, 'LS', 26000.0, null, 2100000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'B', 'Removal, Demolition & Other Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'B1.', null, 'Careful demolition and removal of existing RCC wall, including cutting, breaking, and making good with plastering and surface finishing to match adjacent surfaces.

Location: Wall between Laundry Room & DB Room', 1.0, 'Nos.', 5850.0, null, 472500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'B2.', null, 'Careful removal of existing window, enlarging the opening as per site requirements, making good the surrounding wall, plastering, surface finishing, and preparing the opening to receive new window.

Location: Kitchen Area', 1.0, 'Nos.', 5057.0, null, 408450.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'B3.', null, 'Careful removal of non-structural pillar and existing window, including dismantling, chipping, and making good the surrounding surfaces with plastering, leveling, and finishing to receive new works.

Location: Kitchen Island Area', 1.0, 'Nos.', 4290.0, null, 346500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'B4.', null, 'Careful demolition and removal of existing RCC wall and glass door, including breaking, chipping, and making good surrounding finishes (plastering, leveling, and preparation) to create a larger opening.

Location: GF Living Area', 1.0, 'Nos.', 7020.0, null, 567000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'B5.', null, 'Careful removal of existing fixed window, including frame, glazing, and associated fixings, and making good surrounding finishes (plastering, leveling, and preparation) to receive new sliding door.

Location: GF Living Area', 1.0, 'Nos.', 1300.0, null, 105000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'B6.', null, 'Careful removal of existing fixed window, including frame, glazing, and associated fixings, and making good surrounding finishes (plastering, leveling, and preparation) to receive new sliding door.

Location: FF Hallway Area', 1.0, 'Nos.', 1300.0, null, 105000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'B7.', null, 'Careful demolition and removal of existing RCC wall to create new door opening, including cutting, chipping, and making good surrounding surfaces (plastering, leveling, and finishing) to receive door.

Location: In Between GF Living area to external Area', 1.0, 'Nos.', 10270.0, null, 829500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'B8.', null, 'Careful demolition and removal of non-structural wall to create a new door opening, glass window, and enlarged window opening, including cutting, chipping, plastering, leveling, and finishing of surrounding surfaces.

Location: Master Bedroom Area', 1.0, 'Nos.', 4420.0, null, 357000.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'B9.', null, 'Careful demolition and removal of non-structural wall near existing door, including cutting, chipping, and making good surrounding surfaces.

Location: Near Door in Master Bedroom Area', 1.0, 'Nos.', 5460.0, null, 441000.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'B10.', null, 'Careful demolition of existing wall to create a window opening, including cutting, chipping, and making good surrounding surfaces ready for new window installation.

Location: Master Bedroom Dressing Area', 1.0, 'Nos.', 1950.0, null, 157500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'B11.', null, 'Careful demolition of non-structural wall and modification of existing door opening, including cutting, chipping, making good surrounding surfaces, and preparing for new door installation.

Location: FF Suite Joud Bedroom Area', 1.0, 'Nos.', 3120.0, null, 252000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'B12.', null, 'Careful demolition of existing RCC wall to create a window opening, including cutting, chipping, making good edges and surrounding surfaces, and preparing for new window installation.

Location: GF Suite Invitee', 1.0, 'Nos.', 5031.0, null, 406350.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'B13.', null, 'Careful removal of existing column to create a larger window opening, including controlled demolition, cutting, making good to adjacent walls, plastering, finishing, and preparation ready to receive new window installation.

Location: Master Bedroom — Optional: Rate Only', 1.0, 'Nos.', 4420.0, null, 357000.0, false, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'C', 'Civil & Finishing Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'C1.', null, 'Supply and construction of blockwork to close existing window openings, including cement mortar, plaster finish, and surface preparation ready for painting.

Location: GF Suite Invitee', 1.0, 'Nos.', 5031.0, null, 406350.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'C2.', null, 'Supply and Installation of new walls including plastering and make good finished.

Location: Side of the Staircase Area', 1.0, 'Nos.', 2860.0, null, 231000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'C3.', null, 'Supply and Installation of new walls including plastering and make good finished.

Location: GF Dining Area & Hallway Area', 1.0, 'Nos.', 4160.0, null, 336000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'C4.', null, 'Supply and Installation of new walls including plastering and make good finished.

Location: Front of Staircase Area', 1.0, 'Nos.', 1430.0, null, 115500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'C5.', null, 'Modification of existing bulkhead ceiling to replace curved corners with right-angled (90°) corners, including all necessary setting out, cutting, framing adjustments, plasterboard works, jointing, finishing, sanding and painting.

Location: Salon & Salle A Manger', 3.0, 'Nos.', 2535.0, null, 204750.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'C6.', null, 'Modification of existing bulkhead ceiling to create a flat ceiling, including removal of projections, alignment works, finishing, and application of primer and final paint coats.

Location: Master Bedroom', 26.675, 'sqm', 234.0, null, 18900.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'C7.', null, 'Supply and installation of LVT (Luxury Vinyl Tiles) flooring in chevron pattern, 3 mm thickness with self-leveling subfloor preparation, including surface cleaning, adhesive application, precise laying, pattern alignment, jointing, finishing, and protection of finished surfaces.

Brand/Type: Meter Squared
Location: Salle De Sport', 48.0, 'sqm', 235.3, null, 19005.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'C8.', null, 'Supply and installation of engineered wood flooring in chevron pattern, including surface preparation, leveling, adhesive application (if required), precise laying, joint alignment, finishing, and protection of completed surfaces.

Brand/Type: Meter Squared
Location: Salle De Sport — Optional: Rate Only', 48.0, 'sqm', 728.0, null, 58800.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'C9.', null, 'Supply and application of interior paint on demolished affected walls and newly constructed walls, including surface preparation, filling cracks/imperfections, sanding, priming, two coats of finish paint, and protection of adjacent finishes.', 250.7274, 'sqm', 58.5, null, 4725.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'C10.', null, 'Surface preparation, pressure washing, crack repair, texturing where required, and application of 2 coats of exterior paint on demolished and new walls, including protection of adjacent finishes on the affected demolished walls and new walls.', 104.467, 'sqm', 65.0, null, 5250.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'C11.', null, 'Supply, cutting to size, and installation of Travertine Marble cladding on staircase front, including surface preparation, adhesive application, fixing, leveling, grouting, edge finishing, cleaning, and protection of adjacent finishes.

PC Rate Travertine Beige Marble (18-20mm): 350/sqm
Location: front of staircase and hall D''entree', 19.745, 'sqm', 910.0, null, 73500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'C12.', null, 'Supply and installation of double-sided gypsum board partition, including metal framing, boards, fixing, jointing, alignment, and surface preparation, ready to receive wooden cladding.

Location: Master Bedroom
Note: Wooden cladding not included', 9.75, 'sqm', 325.0, null, 26250.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'C13.', null, 'Supply and installation of gypsum board bulkhead, including metal framing, gypsum boards, fixing, jointing, alignment, and surface preparation, ready to receive wooden cladding.

Location: Salle de Sport
Note: Wooden cladding not included', 6.6, 'sqm', 286.0, null, 23100.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'C14.', null, 'Cutting and preparation of openings for trimless A/C grille in gypsum board ceiling/wall, including accurate marking, cutting, edge finishing, making good, alignment, and protection of surrounding finishes.

Location: Salle de Sport', 3.0, 'LM', 39.0, null, 3150.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'C15.', null, 'Supply and installation of stone-look sheet cladding for exterior walls (thin stone veneer sheets), including surface preparation, adhesive fixing, jointing, leveling, cleaning, and protection of adjacent finishes.

Thickness: 10mm thk.
Location: Patio D''Entrée', 90.0081, 'sqm', 260.0, null, 21000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, 'C16.', null, 'Supply, fabrication, and installation of customized CNC-cut aluminum structure, fabricated from 2.8 mm thick aluminum, single solid color finish (non-wood-grain), including CNC cutting, powder coating, fixing system, installation, alignment, and protection of adjacent finishes.

Location: Patio D''Entrée', 24.2466, 'sqm', 1105.0, null, 89250.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, 'C17.', null, 'Supply, fabrication, and installation of motorized aluminum gate, including aluminum frame and infill, welding, finishing, heavy-duty hinges, motorized operator, control panel, remote controls, safety accessories, testing, and commissioning.

Size: 380 cm L x 240cm Ht
Location: Main Gate', 1.0, 'Nos', 17784.0, null, 1436400.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, 'C18.', null, 'Supply and Installation of H-beam structural steel, including base support.

Location: Master Bedroom — Optional: Rate Only', 1.0, 'Nos', 7020.0, null, 567000.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, null, null, 'The main entrance door and matching aluminium-framed wall at the patio d’entrée are excluded and will be confirmed and quoted separately.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 3, 'D', 'Electrical Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'D1.', null, 'Installation only of electrical sockets, switches, speaker provision, data provision, lights, cable pulling, wall chasing, testing and commissioning.

Note: Electrical fixtures to be supplied by client.', 1.0, 'LS', 21385.0, null, 1727250.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 4, 'E', 'Glass Doors/Window Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'E1.', null, 'Supply, fabrication, and installation of a black matt aluminum patio door system (2.2 mm thick aluminum profile), complete with double-glazed glass comprising 6 mm clear glass + 6 mm Guardian reflective glass, including frame, sash, rollers/hinges, locking system, handles, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 80mm L x 220cm H
Location: Master Bedroom (Patio Door)', 1.0, 'Nos.', 2059.2, 2939.0, 166320.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'E2.', null, 'Supply, fabrication, and installation of a sliding aluminum window, complete with aluminum frame and sash, glazing, rollers, locking handle, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 260cm L x 170cm H
Location: Sejour Enfant', 1.0, 'Nos.', 5458.7, 9812.0, 440895.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'E3.', null, 'Supply, fabrication, and installation of a fixed aluminum-framed glass window, complete with black matte aluminum frame, tempered glass, gaskets, silicone sealing, fixing accessories, alignment, leveling, and final cleaning.

Size: 280cm L x 240cm H
Location: Salon', 1.0, 'Nos.', 8299.2, 10080.0, 670320.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'E4.', null, 'Supply, fabrication, and installation of a black matt aluminum patio door system (2.2 mm thick aluminum profile), complete with double-glazed glass comprising 6 mm clear glass + 6 mm Guardian reflective glass, including frame, sash, rollers/hinges, locking system, handles, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 280cm L x 240cm H
Location: Salon', 1.0, 'Nos.', 9172.8, 14918.0, 740880.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'E5.', null, 'Supply, fabrication, and installation of a fixed aluminum-framed glass window, complete with black matte aluminum frame, tempered glass, gaskets, silicone sealing, fixing accessories, alignment, leveling, and final cleaning.

Size: 110cm L x 240cm H
Location: Salon', 1.0, 'Nos.', 3260.4, 2561.0, 263340.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'E6.', null, 'Supply, fabrication, and installation of a sliding aluminum-framed glass window, complete with black matte aluminum frame, tempered glass, sliding tracks, gaskets, rollers, handles, locking mechanism, alignment, leveling, and final cleaning.

Size: 110cm L x 130cm H
Location: Kitchen Area', 1.0, 'Nos.', 1766.05, 3175.0, 142642.5, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'E7.', null, 'Supply, fabrication, and installation of a fixed aluminum-framed glass window, complete with black matte aluminum frame, tempered glass, gaskets, alignment, leveling, and final cleaning.

Size: 60cm L x 80cm H
Location: Chambre De Bonne', 1.0, 'Nos.', 592.8, 1050.0, 47880.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'E8.', null, 'Supply, fabrication, and installation of hinged aluminum-framed glass window, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, and final cleaning.

Size: 60cm L x 130cm H
Location: Chambre De Bonne — Descoped', 1.0, 'Nos.', 1064.7, null, 85995.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'E9.', null, 'Supply, fabrication, and installation of hinged aluminum-framed glass window, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, and final cleaning.

Size: 280cm L x 240cm H
Location: Suite Invitee', 2.0, 'Nos.', 9609.6, 22444.0, 776160.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'E10.', null, 'Supply, fabrication, and installation of a fixed aluminum-framed glass window, complete with black matte aluminum frame, tempered glass, gaskets, alignment, leveling, and final cleaning.

Size: 131cm L x 70cm H
Location: Salle de Sport', 3.0, 'Nos.', 1132.495, 1050.0, 91470.75, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'E11.', null, 'Supply, fabrication, and installation of fixed glass panel with hinged aluminum door, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, and final cleaning.

Size: 430cm L x 230cm H
Location: Salle de Sport', 1.0, 'Nos.', 14142.7, 15364.0, 1142295.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'E12.', null, 'Supply, fabrication, and installation of double hinged glass door with wood leaf coated frame, including hinges, handles, lock, sealing, alignment, and finishing.

Size: 113cm L x 220cm H
Location: In between Sejour & Salle A Manger', 3.0, 'Nos.', 7440.42, 28500.0, 600957.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'E13.', null, 'Supply, fabrication, and installation of single hinged glass door with aluminum frame, including hinges, handle, lock, sealing, alignment, and finishing.

Size: 111cm L x 270cm H
Location: Salle de Sport', 1.0, 'Nos.', 4285.71, null, 346153.5, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'E14.', null, 'Supply, fabrication, and installation of a black matt aluminum patio door system (2.2 mm thick aluminum profile), complete with double-glazed glass comprising 6 mm clear glass + 6 mm Guardian reflective glass, including frame, sash, rollers/hinges, locking system, handles, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 112cm L x 220cm H
Location: Cuisine De Finition', 1.0, 'Nos.', 3043.04, 4115.0, 245784.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'E15.', null, 'Supply, fabrication, and installation of single hinged glass door with aluminum frame, including hinges, handle, lock, sealing, alignment, and finishing.

Size: 86cm L x 270cm H
Location: Cabine de Massage', 1.0, 'Nos.', 3320.46, null, 268191.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, 'E16.', null, 'Supply, fabrication, and installation of a black matt aluminum patio door system (2.2 mm thick aluminum profile), complete with double-glazed glass comprising 6 mm clear glass + 6 mm Guardian reflective glass, including frame, sash, rollers/hinges, locking system, handles, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 135cm L x 220cm H
Location: Cabine de Massage', 1.0, 'Nos.', 4054.05, 6593.0, 327442.5, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, 'E17.', null, 'Supply, fabrication, and installation of glass panel and hinged/frameless door, including cutting to size, tempered glass supply, hinges, handles, seals, alignment, leveling, fixing, and protection of adjacent finishes.

Location: Salle De Sport', 1.0, 'Nos.', 8373.3, null, 676305.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, 'E18.', null, 'Supply, fabrication, and installation of hinged aluminum-framed glass window, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, and final cleaning.

Size: 120cm L x 240cm Ht
Location: Master Bedroom & Suite Joud', 5.0, 'Nos.', 4118.4, 24050.0, 332640.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, 'E19.', null, 'Supply, fabrication, and installation of hinged aluminum-framed glass window, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, and final cleaning.

Size: 63cm L x 130cm Ht
Location: Master Bedroom Dressing Area', 1.0, 'Nos.', 995.41, 1670.0, 80398.5, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, 'E20.', null, 'Supply, fabrication, and installation of a fixed aluminum-framed glass window, complete with black matte aluminum frame, tempered glass, gaskets, alignment, leveling, and final cleaning.

Size: 53cm L x 470cm Ht
Location: Patio D''Entree', 1.0, 'Nos.', 3076.385, 4982.0, 248477.25, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, 'E21.', null, 'Supply, fabrication, and installation of a fixed aluminum-framed glass window, complete with black matte aluminum frame, tempered glass, gaskets, alignment, leveling, and final cleaning.

Size: 440cm L x 240cm Ht
Location: Master Bedroom — Optional: Rate Only', 1.0, 'Nos.', 13041.6, null, 1053360.0, false, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 5, 'F', 'Extension & Enclosed Garaged Work') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'F1.', null, 'Maids Room extension (1.30 x 2.60 cm)

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
m. Installation of non structural block works 
including lintel and plastering.
n. Electrical works for socket and switches — Descoped', 1.0, 'LS', 60970.0, null, 4924500.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'F2.', null, 'Enclosed of Garage area.

a. Backfilling of the flooring with sand and compaction to make same level in the internal flooring.
b. Concrete screeding of the flooring and ready to accept flooring finished.
c. Block wall works for the door opening including pastering and lintel support.
d. Closing of windows and make a dummy wall.
e. Block wall adding and shift the door opening.
f. Block wall adding including plastering for storage and massage room.
g. Supply and Installation of AC ducting unit 
and AC grill including ducting, plenum box, thermostat and outdoor unit.
h. Supply and Installation of electrical 
provion, sockets, lighting, switches, testing 
and commissioning.', 1.0, 'LS', 56797.0, null, 4587450.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 6, 'G', 'Landscaping, Pergola, Swimming Pool & Other Exterior Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'G1.', null, 'Removal of existing interlock and tiles surfaces, including loading, pickup, and proper disposal of all debris.', 1.0, 'LS', 16250.0, null, 1312500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'G2.', null, 'Removal of existing plants and palm tree, including pick up and disposal of all debris.

Qty: 5 Nos.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'G3.', null, 'Supply and Installation of new outdoor tiles including glue and tile grouting

Travertine Outdoor Tile PC Rate: 120/sqm
Brand: Local Brand', 232.0, 'sqm', 299.0, null, 24150.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'G4.', null, 'Swimming Pool Work:

- Removal of existing swimming pooltiles, including collection and disposal of debris with pickup
- Application of plaster work (pool plastering)
- Application of swimming pool waterproofing
- Installation of new swimming pool tiles including glue and tiles grouting (Pool Size: 8m x 4m)

Note: Tiles will be provided by client.', 1.0, 'LS', 28990.0, null, 2341500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'G5.', null, 'Electrical Work Garden Area:

- Fixing of new conduit pipe
- Fixing of new cables and fixing of new DB Box
- Installation of new lights
- Installation of new junction box

Note: Lights will be provided by client.', 1.0, 'LS', 7540.0, null, 609000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'G6a.', null, 'Aluminium Pergola Work @ New Pool Area:

1. Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (10.80 m x 5.05 m), as per approved drawings.
- Supply and installation of Steel provisions inside the longer beams.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Rafters: 10 cm x 4 cm aluminium tube profile, RAL colour powder-coated

2. Supply and installation of vertical aluminium tube structure on top of the BBQ area, as per approved drawings, with an overall size of (3.48 m x 1.90 m).

Specifications:
Tubes: 10 cm x 10 cm aluminium tube profile
Finish: RAL colour powder-coated

Notes:
Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.', 1.0, 'LS', 58057.1836, null, 4689234.06, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'G6b.', null, 'Aluminium Pergola Work @ New Pool Area:

1. 
- Supply and installation of A-grade powder-coated aluminium closed pergola with an overall size of (10.80 m x 5.05 m), as per approved drawings.
- Supply and installation of Steel provisions inside the longer beams.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Ceiling: Aluminium krick plates (10 cm x 1 cm), RAL colour powder-coated
Top: 5 cm thick sandwich panels with waterproof silicone sealing

2. Supply and installation of vertical aluminium tube structure on top of the BBQ area, as per approved drawings, with an overall size of (3.48 m x 1.90 m).

Specifications:
Tubes: 10 cm x 10 cm aluminium tube profile
Finish: RAL colour powder-coated

Notes:
Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation. — Optional: Rate Only', 1.0, 'LS', 73756.956, null, 5957292.6, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'G7a.', null, 'Aluminium Pergola Work @ Villa Front Side:

- Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (5.22 m x 5.06 m), as per approved drawings.
- Supply and installation of Steel provisions inside the longer beams.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Rafters: 10 cm x 4 cm aluminium tube profile, RAL colour powder-coated

Notes:
Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.', 1.0, 'LS', 26973.7377, null, 2178648.04, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'G7b.', null, 'Aluminium Pergola Work @ Villa Front Side:

- Supply and installation of A-grade powder-coated aluminium closed pergola with an overall size of (5.22 m x 5.06 m), as per approved drawings.
- Supply and installation of Steel provisions inside the longer beams.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Ceiling: Aluminium krick plates (10 cm x 1 cm), RAL colour powder-coated
Top: 5 cm thick sandwich panels with waterproof silicone sealing

Notes:
Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation. — Optional: Rate Only', 1.0, 'LS', 33463.4527, null, 2702817.34, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'G8.', null, 'Aluminium Pergola Work @ Outside Salon:

Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (4.75 m x 1.2 m), as per approved drawings.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Rafters: 10 cm x 4 cm aluminium tube profile, wooden texture powder-coated

Notes:
Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.', 1.0, 'LS', 7234.5, null, 584325.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'G9.', null, 'Supply and construction of reinforced concrete column to support proposed pergola aluminum tube columns (150 mm × 150 mm), including excavation, formwork, reinforcement, concrete casting, curing, alignment, surface finishing, and making good.', 1.0, 'LS', 4160.0, null, 336000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'G10.', null, 'BBQ Work:

- Construction of BBQ Counter, including concrete structure finished with tiles, timber shutter, and storage (including electrical provision)

Note: Grill Machine and appliances will be supplied by the client.', 1.0, 'LS', 14950.0, null, 1207500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'G11.', null, 'Pump Room:

- Removal of the existing pump room and reinstallation of same pump room new location as per client requirement.', 1.0, 'LS', 5460.0, null, 441000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'G12.', null, 'Supply and construction of wall with holes made of blocks, including plastering on both sides, surface preparation, and application of two coats of exterior weather-resistant paint on exposed sides.

Size: 475cm L x 120cm W - (2 Nos)
Location: Pump Room Area', 1.0, 'LS', 6890.0, null, 556500.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 7, 'H', 'Plants & Automatic Irrigation Work') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'H1.', null, 'Automatic Irrigation System

Supply and Installation of a new automatic irrigation system, including timer panel, solenoid valve, drip tubes for plants, etc.', 1.0, 'LS', 4556.5, null, 368025.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'H2.', null, 'Excavation of plant areas: 50 cm for shrubs and 1 meter for trees, and removal of all garbage with a pickup.

Qty: 56 sqm', 1.0, 'LS', 4550.0, null, 367500.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'H3.', null, 'Supply and Laying of new sweet sand.

Qty: 56 sqm', 1.0, 'LS', 5200.0, null, 420000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'H4.', null, 'Plants Work:

Supply of washingtonia plant 3 meter', 2.0, 'Nos', 3120.0, null, 252000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'H5.', null, 'Plants Work:

Supply of traveler plants', 10.0, 'Nos', 494.0, null, 39900.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'H6.', null, 'Plants Work:

Supply of oliver tree', 1.0, 'Nos', 6500.0, null, 525000.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'H7.', null, 'Plants Work:

Supply of Hibiscus plants Size 40cm to 50cm', 25.0, 'Nos', 41.6, null, 3360.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'H8.', null, 'Plants Work:

Supply of Eranthemum plant green', 35.0, 'Nos', 35.1, null, 2835.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'H9.', null, 'Plants Work:

Supply of Haemonculus plant', 40.0, 'Nos', 52.0, null, 4200.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'H10.', null, 'Plants Work:

Supply of Jasmine Murraya plants 50cm to 60cm', 20.0, 'Nos', 58.5, null, 4725.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'H11.', null, 'Plants Work:

Supply of Canna Lily Plants', 20.0, 'Nos', 18.2, null, 1470.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'H12.', null, 'Plants Work:

Supply of Ixora small plants', 20.0, 'Nos', 45.5, null, 3675.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'H13.', null, 'Plants Work:

Supply of Seasonal Flower', 400.0, 'Nos', 1.95, null, 157.5, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'H14.', null, 'Plants Work:

Supply of Gravel Stone', 40.0, 'bags', 28.6, null, 2310.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'H15.', null, 'Plants Work:

Plantation charges', 1.0, 'LS', 5850.0, null, 472500.0, false, false);
update boqs set discount = 42748.81 where id = b;  -- Progress Billing Report no. 1: 757,401.73 less 42,748.81 = 714,652.92
update boqs set status = 'APPROVED' where id = b;
end $x$;
