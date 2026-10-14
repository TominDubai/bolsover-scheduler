set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '39688550-ec6c-460e-b6e7-41b96859f44c' and source_file = 'boq_rev00.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('39688550-ec6c-460e-b6e7-41b96859f44c', 'QUOTE', 0, v, 'Sidra 2, Dubai Hills Renovation Works', 'BBC/032026/00063_rev00', 'DRAFT', '2026-03-26', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'boq_rev00.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', null, 'General Requirements', 1.0, 'LS', 36000.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', null, 'Protection to all Internal Surfaces', 1.0, 'LS', 6750.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', null, 'Protection to all External Surfaces', 1.0, 'LS', 5175.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', null, 'Protection to Swimming Pool & Landscaping', 1.0, 'LS', 2250.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', null, 'Insurance for the Works', 1.0, 'LS', 2700.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', null, 'Management & Supervision', 1.0, 'LS', 13500.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, 'G.', null, 'Transportation & Fees', 1.0, 'LS', 4500.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, 'H.', null, 'Temporary Tools, Equipment and Scaffoldings', 1.0, 'LS', 6975.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, null, null, 'All construction drawings, specifications, and other necessary details required for the execution of the works by client', null, null, null, null, null, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, null, null, 'Coordination, submission, and follow-up for all required approvals and fees from relevant authorities & government by client.', null, null, null, null, null, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'II', 'Site Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Demolition Work', 'Demolition of non-load bearing block walls (External and Internal) as per drawings.', 287.0, 'sqm', 130.0, 100.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Demolition Work', 'Demolition of RCC Column at staircase as per the drawings', 1.0, 'Nos', 5460.0, 4200.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', 'Demolition Work', 'Demolition of RCC slab at roof level above staircase for skylight opening, including cutting with concrete cutter, controlled breaking, removal of reinforcement bars, complete as per approved drawings.', 5.0, 'sqm', 546.0, 420.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', 'Demolition Work', 'Removal of existing bathtub with concrete support from first-floor bathroom, including detachment from plumbing connections, breaking/removal of surrounding concrete structure if required, lifting, removal of fixtures.', 1.0, 'item', 650.0, 500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'Demolition Work', 'Removal of existing vanity counter from first-floor bathroom, including detachment of countertop, sink, plumbing connections, drawers/cabinets, and associated hardware.', 1.0, 'item', 585.0, 450.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', 'Demolition Work', 'Removal of steel railing, steel base plate and other accessories from first floor balcony

Total Length: 6 LM', 1.0, 'LS', 1404.0, 1080.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, 'G.', 'Demolition Work', 'Removal of existing doors', 10.0, 'Nos', 455.0, 350.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, 'H.', 'Demolition Work', 'Removal of existing windows', 1.0, 'item', 6240.0, 4800.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, 'I.', 'Demolition Work', 'Removal of Existing flooring through out the villa', 237.0, 'sqm', 78.0, 60.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, 'J.', 'Demolition Work', 'Removal of Kitchen Cabinet at ground Floor', 6.0, 'LM', 546.0, 420.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, 'K.', 'Demolition Work', 'Removal of existing concrete staircase and balustrading including preparation to receive new steel staircase and feature wall', 1.0, 'item', 14300.0, 11000.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 11, 'L.', 'Demolition Work', 'Removal of Existing Ceilings, including dismantling of gypsum board, plaster, false ceiling, or other ceiling finishes, removal of supporting framework, and light fixtures, complete in accordance with approved drawings and specifications.', 241.0, 'sqm', 71.5, 55.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 12, 'M.', 'Disposal Work', 'Cartway and Disposal of debris arised from the demolition to the approved location as per the relevant authorities.', 1.0, 'item', 19695.0, 15150.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'III', 'Concrete Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Reinforced Concrete', 'Reinforced in-situ concrete suspended slab (RCC), including supply and placing of concrete, reinforcement bars, formwork, shuttering, vibration, curing, and all necessary additives/admixtures, complete in accordance with drawings, specifications, and authority requirements.

Slab Thickness: 250 mm', 6.0, 'm³', 4621.5, 3555.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 3, 'IV', 'Masonry / Partition Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Superstructure', 'Hollow block masonry wall (200 mm thick), including supply and laying of hollow blocks, cement-sand mortar, expanded metal, galvanized wall ties, and other necessary accessories, constructed in compliance with local authority orders, approved drawings, and specifications.', 50.0, 'sqm', 331.5, 255.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Superstructure', 'Thermal block masonry wall (250 mm thick), including supply and laying of thermal blocks, cement-sand mortar, expanded metal, galvanized wall ties, and all necessary accessories, constructed in compliance with local authority requirements, approved drawings, and specifications.', 44.0, 'sqm', 461.5, 355.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', 'Superstructure', 'Plastering to block walls, including surface preparation, application of cement-sand plaster in two coats (scratch and finish), curing, and smoothing ready for painting or finishing, as per approved drawings and specifications.', 188.0, 'sqm', 130.0, 100.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 4, 'V', 'Metal Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Structural Steel Work', 'Supply and Installation of Steel staircase including railing as per the drawing including all necessary fittings and accessories

Size: 10m
Note: Any changes on size will be quoted and charged separately', 1.0, 'item', 111150.0, 85500.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 5, 'VI', 'Joinery Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', null, 'Supply and installation of wooden wardrobe including all the necessary fitting and accessories required all in accordance with the drawings.

Size: 2800mm ht x 600mm D
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware', 12.0, 'LM', 3185.0, 2450.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', null, 'Supply and installation of vanity counter including all the necessary fitting and accessories required all in accordance with the drawings and specifications

Size: 900mm ht x 600mm D
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Countertop material to be confirmed and quoted separately', 2.0, 'LM', 2600.0, 2000.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', null, 'Supply and installation of kitchen cabinet including all the necessary fitting and accessories required all in accordance with the drawings and specifications

Size: Base: 600mm / Wall: 350mm
Height: Base + wall cabinets (full kitchen set)
Location: GF Kitchen Cabinet
Material/Specification: MDF carcass in melamine finish, internal shelving and standard cabinet hardware
Note: Countertop material to be confirmed and quoted separately', 6.0, 'LM', 4420.0, 3400.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', 'General Cabinetry & Joinery', 'Supply, Manufacture, Delivery & Installation of Doors, Frames, Hardwares, Architraves. — To be Confirmed and quoted separately', 1.0, 'LS', null, null, 30.0, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'General Cabinetry & Joinery', 'Supply, Delivery, Installation of Skirting Boards throughout the Property — To be Confirmed and quoted separately', 1.0, 'LS', null, null, 30.0, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', 'General Cabinetry & Joinery', 'Make due allowance to Supply, Deliver, Manufacture & Install all additional Joinery as set out and detailed upon the drawings — To be Confirmed and quoted separately', 1.0, 'LS', null, null, 30.0, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, null, 'General Cabinetry & Joinery', 'Other Joinery Items not mentioned to be confirmed and quoted separately', null, null, null, null, null, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 6, 'VII', 'Thermal and Moisture Protection') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Superstructure Waterproofing', 'Roof Waterproofing:

Supply and application of Combo Roofing system waterproofing as per the minimum authority requirement.

Location: To Roof Area', 15.0, 'sqm', 143.0, 110.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Superstructure Waterproofing', 'Flashing:

Aluminum flashing with necessary sealants, all in accordance with drawings and specification

Aluminum flashing to terminate water proofing', 24.0, 'LM', 195.0, 150.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C', 'Superstructure Waterproofing', 'Wet Area Waterproofing:

Liquid applied Cementous waterproofing on concrete slab of wet areas prior to receive finishes all in accordance with the drawings and specifications.

Location: To Horizontal area', 36.0, 'sqm', 136.5, 105.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', 'Superstructure Waterproofing', 'Wet Area Waterproofing:

Liquid applied Cementous waterproofing on concrete slab of wet areas prior to receive finishes all in accordance with the drawings and specifications.

Location: To Vertical area', 36.0, 'LM', 136.5, 105.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'Superstructure Waterproofing', 'Make due allowance herein for specialist Water Features, including all necessary accessories, Pumps, fixtures, fitting, waterproofing', 1.0, 'LS', 19435.0, 14950.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 7, 'VIII', 'Doors and Windows') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Wooden Doors', 'Supply and Installation of wooden doors including with all the necessary fitting accessories required as per the drawings.

Item: WD-01 
Size: 1000mm L x 2100m ht
Location: Gym & Master Bedroom', 2.0, 'Nos', 4550.0, 3500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Wooden Doors', 'Supply and Installation of wooden doors including with all the necessary fitting accessories required as per the drawings.

Item: WD-02
Size: 600mm L x 2100m ht
Location: Family area at first floor level', 1.0, 'Nos', 4030.0, 3100.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', 'Ironmongaries', 'Supply and Installation of ironmongrey including all necessary related works all in accordance with the drawings

Location: Ironmongrey to wooden doors
PC Supply Rate: 300 Dhs/ Door', 3.0, 'Nos', 585.0, 450.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', 'Sub-Frames', 'Supply and Installation of sub frames for 3 doors including all necessary related works all in accordance with the drawings', 1.0, 'item', 2730.0, 2100.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'Aluminum and Glazing Doors', 'Supply and Installation of Single Leaf Pivot Door (Glass Door)

Ref. MD-01 
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 1800mm L x 2700mm ht
Location : Elevation A - GF Main Entrance Door', 1.0, 'Nos', 39961.35, 30739.5, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', 'Aluminum and Glazing Doors', 'Supply and Installation of Aluminum glazed door set - Suchuco 54 PD ME Sliding Door (S+S+F)

Ref. Sliding Door 
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 3000 mm L x 2600mm ht 
Location: Elevation B, Dining Area', 1.0, 'Nos', 34577.4, 26598.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, 'G.', 'Aluminum and Glazing Doors', 'Supply and Installation of Bi Folding Door - Schuco AS FD 90 HI Bi-folding Door

Ref. Bi-Folding Door
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 2700 mm L x 2700mm ht 
Location: Elevation B, Lounge at ground floor area', 1.0, 'Nos', 45347.445, 34882.65, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, 'H.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (3 Panels)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 3000 mm L x 2700mm ht 
Location: Elevation C, Master Bedroom Closet', 1.0, 'Nos', 20849.4, 16038.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, 'I.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Schuco AWS 65 Fixed Windows with Hinged Window

Ref. Glazed Window
Hinged Window: 750mmW x 1700mmH
Fixed Panel 1: 750mmW x 1000mmH
Fixed Panel 2: 1100mmW x 1700mmH
Fixed Panel 3: 1100mmW x 1000mmH
Location: Elevation B, Master Bedroom Closet', 1.0, 'Nos', 15409.68, 11853.6, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, 'J.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (2 Panels)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 2560 mm L x 2700mm ht 
Location: Elevation B, Staircase at ground floor area', 1.0, 'Nos', 17791.488, 13685.76, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, 'K.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (2 Panels)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Fixed Panel 1: 1000mmW x 1700mmH
Fixed Panel 2: 1000mmW x 1000mmH
Location: Elevation D, Master Bathroom', 1.0, 'Nos', 10488.66, 8068.2, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 11, 'L.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (1 Panel)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 2700 mm L x 1000mm ht 
Location: Elevation D, Kitchen Area', 1.0, 'Nos', 6949.8, 5346.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 12, 'M.', 'Aluminum and Glazing Skylight', 'Supply and Installation of Aluminum glazed skylight set - Flat Skylight (5.90m L x 1.145m W)

Location: Skylight at master bedroom roof area', 1.0, 'Nos', 27049.022, 20806.94, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 13, 'N.', 'Aluminum and Glazing Skylight', 'Supply and Installation of Aluminum glazed skylight set - flat circular skylight (4.50 sqm)

Location: Skylight at Staircase roof area', 1.0, 'Nos', 18018.0, 13860.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 8, 'IX', 'Finishes') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Internal Finishes', 'Screed:

Supply and laying of cement sand screed of required thickness including all necessary accessories to achieve smooth and durable surface finish all in accordance with drawings and specifications.', 67.0, 'sqm', 104.0, 80.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Floor Finishes', 'Supply and fix cut to size Marble tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications.

Location: Main Entrance
PC Supply Rate: AED 680 / m²', 3.0, 'sqm', 1384.5, 1065.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', 'Floor Finishes', 'Supply and fix 600x600mm Ceramic tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

Location: Lounge, Dinning, Kitchen, Gym, Hallway, Primary suite, Bed Rooms, & Family 
PC Supply Rate: AED 160 / m²', 205.0, 'sqm', 312.0, 240.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', 'Floor Finishes', 'Supply and fix Non Slip Ceramic tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

Location: Bathrooms and Balcony
PC Supply Rate: AED 160 / m²', 36.0, 'sqm', 312.0, 240.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'Floor Finishes', 'Supply and fix Marble Tread and riser  (Supply P.C. Rate AED 450/m), including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

PC Supply Rate: AED 450 / LM', 29.0, 'LM', 1235.0, 950.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', 'Floor Finishes', 'Supply and apply epoxy flooring all necessary fixing accessories all in accordance with the drawings and specifications

Location: Garage', 39.0, 'sqm', 227.5, 175.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, 'H.', 'Skirting and Threshold', 'Supply and fix skirting tile/threshold including setting material, grout and all necessary fixing accessories all in accordance with the drawings and specifications.

Ceramic Skirting (Supply P.C. Rate AED 80/Lm)', 102.0, 'LM', 169.0, 130.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, 'I.', 'Skirting and Threshold', 'Supply and fix skirting tile/threshold including setting material, grout and all necessary fixing accessories all in accordance with the drawings and specifications.

Marble skirting (Supply P.C. Rate AED 140/Lm)', 34.0, 'LM', 273.0, 210.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, 'J.', 'Plastering', 'Supply and application of cement-sand plaster (1:3 mix), in uniform thickness, smooth finish, including all accessories as per approved drawings and specifications.

Location: Internal wall plaster', 141.0, 'sqm', 110.5, 85.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, 'K.', 'Plastering', 'Supply and application of cement-sand plaster (1:3 mix), in uniform thickness, smooth finish, including all accessories as per approved drawings and specifications.

Location: External wall plaster', 44.0, 'sqm', 123.5, 95.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, 'L.', 'Wall Tiles', 'Supply and fix Ceramic wall tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

PC Supply Rate: AED 160 / m²', 49.0, 'sqm', 312.0, 240.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 11, 'M.', 'Wall Painting', 'Supply and application of painting works, including surface preparation  and necessary accessories as required, complete as per approved drawings and specifications.

Type: Fenomastic washable Emulsion Paint', 92.0, 'sqm', 58.5, 45.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 12, 'N.', 'False Ceiling Works', 'Supply and Installation of 12.5mm thick regular gypsum board ceiling ready to receive primer, including shadow gap (10x10mm)', 205.0, 'sqm', 143.0, 110.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 13, 'O.', 'False Ceiling Works', 'Supply and Installation of 12.5mm thick MR gypsum board ceiling ready to receive primer, including shadow gap (10x10mm)', 36.0, 'sqm', 156.0, 120.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 14, 'P.', 'False Ceiling Works', 'Supply and Application of Paint on the ceiling (one coat primer, two coat stucco,  two coat rich mat white)', 241.0, 'sqm', 52.0, 40.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 15, 'Q.', 'False Ceiling Works', 'Cutting of false ceiling for light fixtures, including marking, precise cutting of gypsum board, removal of cut sections, and preparation for fixture installation.', 1.0, 'Nos', 39.0, 30.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 16, 'R.', 'False Ceiling Works', 'Cutting of false ceiling for AC grill/diffuser openings, including marking, precise cutting of gypsum board, removal of cut sections, and preparation for AC grill installation.', 1.0, 'RM', 39.0, 30.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 17, null, 'False Ceiling Works', 'Cutting of ceiling for light fixtures and A/C Grill to be confirmed and quoted separately', null, null, null, null, null, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 18, 'S.', 'External Finishes', 'Supply and application of painting works , including surface preparation  and necessary accessories as required, complete as per approved drawings and specifications.

Type/Location: Exterior quality paint to the entire Villa', 1.0, 'item', 31850.0, 24500.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 9, 'X', 'Accessories') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Mirrors', 'Supply and Installation of vanity mirror with 6mm thk belgium grade mirror on MDF backing

LED: not included', 3.0, 'sqm', 1430.0, 1100.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 10, 'XI', 'MEP Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Complete MEP Works', 'Supply, Installation, Testing and Commissioning of plumbing works and all related accessories as per approved drawings and specifications.

Note: Affected/Damaged Area Only', 1.0, 'item', 23595.0, 18150.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Complete MEP Works', 'Supply, installation, testing and commissioning of HVAC system including all accessories as per approved drawings and authority requirements.

Note: Affected/Damaged Area Only', 1.0, 'item', 18089.5, 13915.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', 'Complete MEP Works', 'Repositioning of External Compressor Unit (Ref. CU5), including disconnection of existing electrical and refrigerant connections, relocation to new position, reinstallation, reconnection of piping, electrical wiring, supports/brackets, testing and commissioning.', 1.0, 'item', 3493.75, 2687.5, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', 'Complete MEP Works', 'Supply, installation, testing and commissioning of fire fighting system and accessories, complete as per civil defense requirements and approved drawings

Note: Affected/Damaged Area Only', 1.0, 'item', 13585.0, 10450.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'Complete MEP Works', 'Supply, installation, testing and commissioning of complete electrical system and all related accessories as per approved drawings, specifications, and authority standards.

Note: Affected/Damaged Area Only', 1.0, 'item', 24895.0, 19150.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', 'Complete MEP Works', 'Make due allowance herein for the Supply, Delivery of all required Sanitary-Ware — To be Confirmed and quoted separately', 1.0, 'item', null, null, 30.0, true);
update boqs set status = 'SUPERSEDED' where id = b;
end $x$;
