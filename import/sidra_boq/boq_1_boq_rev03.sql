set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '39688550-ec6c-460e-b6e7-41b96859f44c' and source_file = 'boq_rev03.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('39688550-ec6c-460e-b6e7-41b96859f44c', 'QUOTE', 3, v, 'Villa 170, Sidra 2, Dubai Hills Renovation Works', 'BBC/032026/00063_rev02', 'DRAFT', '2026-04-02', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'boq_rev03.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, '1', 'General Requirements', 'Cost of all Risk Insurance', 1.0, 'LS', 4000.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, '2', 'General Requirements', 'Cost of Third Party Insurance', 1.0, 'LS', 1600.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, '3', 'General Requirements', 'Cost of Performance Bond', 1.0, 'LS', 2800.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, '4', 'General Requirements', 'Cost of Samples', 1.0, 'LS', 4400.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, '5', 'General Requirements', 'Any other obligations;', null, null, null, null, 30.0, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, '5a.', 'General Requirements', 'Mobilization & Demobilization including site setup, transport of resources and final site clearance.', 1.0, 'LS', 8560.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, '5b.', 'General Requirements', 'Temporary Site Facilities including storage containers, worker welfare (toilets, pantry), fencing.', 1.0, 'LS', 3600.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, '5c.', 'General Requirements', 'Health, Safety & Environmental (HSE) including PPE, safety signage, barriers, permits, compliance.', 1.0, 'LS', 5200.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, '5d.', 'General Requirements', 'Testing including material testing (concrete, steel).', 1.0, 'LS', 6960.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, '5e.', 'General Requirements', 'Cleaning & Final Handover including periodic cleaning, final deep cleaning before handover.', 1.0, 'LS', 4560.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, '5f.', 'General Requirements', 'Shop Drawings including preparation of production drawings.', 1.0, 'LS', 7440.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 11, '5g.', 'General Requirements', 'Authority Approvals & NOCs including municipality approvals, inspections, permits, completion certificates. — By Client', 1.0, 'LS', null, null, 30.0, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 12, '5h.', 'General Requirements', 'Protection, Temporary Works & Scaffolding including protection to finishes & hoarding.', 1.0, 'LS', 13600.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 13, '6', 'General Requirements', 'Site Management Fees', 1.0, 'LS', 29200.0, null, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 14, null, 'General Requirements', 'Coordination, submission, and follow-up for all required approvals and fees from relevant authorities & government by client.', null, null, null, null, null, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 15, null, 'General Requirements', 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'II', 'Site Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Demolition Work', 'Demolition of non-load bearing block walls (External and Internal) as per drawings.', 287.0, 'sqm', 130.0, 100.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Demolition Work', 'Demolition of RCC Column at staircase as per the drawings including partial removal of FF slab adjacent new entrance to master bedroom', 1.0, 'Nos', 6961.5, 5355.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', 'Demolition Work', 'Demolition of RCC slab at roof level above staircase for skylight opening, including cutting with concrete cutter, controlled breaking, removal of reinforcement bars, complete as per approved drawings.

Note: 2 Nos. of Skylight', 5.0, 'sqm', 546.0, 420.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', 'Demolition Work', 'Removal of Existing Bathroom Fixtures and Finishes (First Floor Bathroom), including removal of bathtub with concrete support, shower, WC, floor and wall tiles, detachment from plumbing connections, breaking of surrounding concrete (if required), lifting, and disposal of debris, complete in accordance with approved drawings and specifications.', 1.0, 'item', 3055.0, 2350.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'Demolition Work', 'Removal of existing vanity counter from first-floor bathroom, including detachment of countertop, sink, plumbing connections, drawers/cabinets, and associated hardware.', 2.0, 'item', 585.0, 450.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', 'Demolition Work', 'Removal of steel railing, steel base plate and other accessories from first floor balcony including slatted roof detail

Total Length: 6 LM', 1.0, 'LS', 3893.5, 2995.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, 'G.', 'Demolition Work', 'Removal of existing doors', 10.0, 'Nos', 455.0, 350.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, 'H.', 'Demolition Work', 'Removal of existing windows (8 Nos)', 1.0, 'LS', 6240.0, 4800.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, 'I.', 'Demolition Work', 'Removal of Existing flooring through out the villa', 237.0, 'sqm', 78.0, 60.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, 'J.', 'Demolition Work', 'Removal of Existing Finishes, Fixtures, and MEP Services, including removal of floor and wall tiles, sanitary ware, basic MEP services (electrical & plumbing), surface preparation, and disposal of debris, complete in accordance with approved drawings and specifications.

Location: Maids Room & Bathroom', 1.0, 'LS', 2405.0, 1850.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, 'K.', 'Demolition Work', 'Removal of Existing Finishes, Fixtures, and MEP Services, including removal of floor and wall tiles, sanitary ware, basic MEP services (electrical & plumbing), surface preparation, and disposal of debris, complete in accordance with approved drawings and specifications.

Location: Bedroom 04 Bathroom', 1.0, 'LS', 1495.0, 1150.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 11, 'L.', 'Demolition Work', 'Removal of Kitchen Cabinet at Ground Floor', 6.0, 'LM', 546.0, 420.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 12, 'M.', 'Demolition Work', 'Removal of existing concrete staircase and balustrading including preparation to receive new steel staircase and feature wall', 1.0, 'item', 14300.0, 11000.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 13, 'N.', 'Demolition Work', 'Removal of Existing Ceilings, including dismantling of gypsum board, plaster, false ceiling, or other ceiling finishes, removal of supporting framework, and light fixtures, complete in accordance with approved drawings and specifications.', 241.0, 'sqm', 71.5, 55.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 14, 'O.', 'Disposal Work', 'Cartway and Disposal of debris arised from the demolition to the approved location as per the relevant authorities.', 1.0, 'item', 19435.0, 14950.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'III', 'Concrete Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Reinforced Concrete', 'Reinforced in-situ concrete suspended slab (RCC), including supply and placing of concrete, reinforcement bars, formwork, shuttering, vibration, curing, and all necessary additives/admixtures, complete in accordance with drawings, specifications, and authority requirements.

Slab Thickness: 250 mm', 6.0, 'm³', 4621.5, 3555.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Reinforced Concrete', 'Supply and Installation of Raised Floor System (150 mm Build-Up), including sub-base preparation, lightweight blockwork or steel supports (as required), infill material, cement-sand screed, leveling, and all necessary accessories, complete in accordance with approved drawings and specifications.

Location: Kitchen, Dining Area, First Floor Master Closet, and Master Bathroom
Total Build-Up Thickness: 150 mm
Note: Waterproofing (for wet areas), floor finishes (tiles/marble), and insulation layers are not included unless specified separately.', 108.075, 'sqm', 227.5, 175.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 3, 'IV', 'Masonry / Partition Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Superstructure', 'Hollow block masonry wall (200 mm thick), including supply and laying of hollow blocks, cement-sand mortar, expanded metal, galvanized wall ties, and other necessary accessories, constructed in compliance with local authority orders, approved drawings, and specifications.', 50.0, 'sqm', 255.0, 255.0, null, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Superstructure', 'Thermal block masonry wall (250 mm thick), including supply and laying of thermal blocks, cement-sand mortar, expanded metal, galvanized wall ties, and all necessary accessories, constructed in compliance with local authority requirements, approved drawings, and specifications.', 44.0, 'sqm', 355.0, 355.0, null, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 4, 'V', 'Metal Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Structural Steel Work', 'Supply and Installation of Steel staircase including railing as per the drawing including all necessary fittings and accessories including steelwork to the rooflights

Staircase Size: 10m
Note: Any changes on size will be quoted and charged separately', 1.0, 'item', 127400.0, 98000.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 5, 'VI', 'Joinery Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', null, 'Supply and Installation of Master Closet Wardrobe and Integrated Column, including MDF carcass with melamine finish, full-height doors, internal shelving, drawers, standard hardware, curved detailing around structural column, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 2800mm ht x 600mm D x (2850mm + 6050mm + 2850mm) L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Special features such as LED lighting, soft-close premium hardware, or glass inserts are charged separately.', 1.0, 'Nos', 74750.0, 57500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', null, 'Supply and Installation of Master Bedroom Island Unit, including MDF carcass with melamine finish, internal shelving, drawers (if any), standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 900mm ht x 850mm D x 3450 mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Glass tops, mirrors, LED lighting, premium hardware (soft-close, branded systems) are charged separately.', 1.0, 'Nos', 18980.0, 14600.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', null, 'Supply and Installation of Full Height Wardrobe – Bedroom 2, including MDF carcass with melamine finish, full-height doors, internal shelving, hinges, handles, and standard hardware, fabricated and installed in accordance with approved drawings and specifications.

Size: 2800mm ht x 600mm D x 2350mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Soft-close hardware, mirrors, LED lighting, or premium accessories are charged separately.', 1.0, 'Nos', 15080.0, 11600.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', null, 'Supply and Installation of Full Height Wardrobe – Bedroom 3, including MDF carcass with melamine finish, full-height doors, internal shelving, hinges, handles, and standard hardware, fabricated and installed in accordance with approved drawings and specifications.

Size: 2800mm ht x 600mm D x 2285mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Soft-close hardware, mirrors, LED lighting, or premium accessories are charged separately.', 1.0, 'Nos', 14820.0, 11400.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', null, 'Supply and Installation of Ellipse Curved Vanity Counter - Master Bathroom, including MDF carcass with melamine finish, curved fabrication, internal shelving, drawers/doors (if any), hinges, handles, and all necessary fittings and accessories, complete in accordance with approved drawings and specifications.

Size: 900mm ht x 600mm D x 1800mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: 
1. Countertop, wash basin, faucet, and plumbing fixtures are not included and quoted separately', 1.0, 'Nos', 7475.0, 5750.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', null, 'Supply and installation of makeup unit in bathroom behind master bed head

Size: 900mm ht x 600mm D x 2280mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Countertop material, basin, mirror, and lighting are not included and to be quoted separately.', 1.0, 'Nos', 8970.0, 6900.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, 'G.', null, 'Supply and Installation of Jack & Jill Vanity Counter, including MDF carcass with melamine finish, internal shelving, drawers/doors, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 900mm ht x 600mm D x 1785mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: 
1. Countertop, wash basin, faucet, and plumbing fixtures are not included and quoted separately', 1.0, 'Nos', 7475.0, 5750.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, 'H.', null, 'Supply and Installation of Rectangular Vanity Mirror, including cut-to-size mirror, polished edges, mounting/fixing accessories, alignment, and installation, complete in accordance with approved drawings and specifications.

Size: 1000mm ht x 1800mm L
Location: Master Bathroom
Note: Backlit, LED, or decorative framed mirrors are not included and must be quoted separately.', 1.0, 'Nos', 2860.0, 2200.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, 'I.', null, 'Supply and Installation of Rectangular Vanity Mirror, including cut-to-size mirror, polished edges, mounting/fixing accessories, alignment, and installation, complete in accordance with approved drawings and specifications.

Size: 1000mm ht x 1200mm L
Note: Backlit, LED, or decorative framed mirrors are not included and must be quoted separately.', 1.0, 'Nos', 1950.0, 1500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, 'J.', null, 'Supply and Installation of Kitchen Cabinet with Island, including base cabinets, wall cabinets, island carcass, MDF carcass with melamine finish, internal shelving, drawers/doors, standard cabinet hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Kitchen Cabinet Size: 2500mm ht x 700mm D x 6210mm L
Kitchen Island Size: 3600mm L x 1300mm D x 900mm ht

Location: GF Kitchen Cabinet', 1.0, 'Nos', 77350.0, 59500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, 'K.', null, 'Supply and Installation of Built-in Sofa, Day Bed, Desk, and Overhead Cabinet - FF Family Area, including MDF carcass with melamine finish, internal shelving, drawers/doors, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Sizes:
- Overhead Cabinet: 350 mm D × 1700 mm H × 3,500 mm L
- Day Bed: 1,945 mm L × 600 mm D
- Sofa: 2,965 mm L × 700 mm D
- Desk: 2,345 mm L × 600 mm D
Note: 
1. Fabric for sofa/day bed is supplied by client; installation of fabric is included.
2. Lighting, premium soft-close hardware, or decorative panels are not included.', 1.0, 'Nos', 44850.0, 34500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 11, 'L.', null, 'Supply and Installation of Built-in Cabinet Behind Bath - Master Bathroom, including MDF/melamine carcass, mirror-front doors, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: Full Height × 1,000 mm L × 350mm D
Note: Countertop, lighting, or specialized hardware (soft-close, branded handles) are not included.', 1.0, 'Nos', 5070.0, 3900.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 12, 'M.', null, 'Supply and Installation of Veneered Headboard – Master Bedroom, including MDF carcass, veneer finish, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 1200mm ht x 2035mm L', 1.0, 'Nos', 4550.0, 3500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 13, 'N.', null, 'Supply and Installation of Shoe Cabinet – RHS of Entrance Door, including MDF carcass with melamine finish, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 345mm L x 250mm D x 900mm ht
Note: Countertop, premium hardware, or integrated lighting are not included.', 1.0, 'Nos', 3250.0, 2500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 14, 'O.', null, 'Supply and Installation of Steel Framework for Floating Bed – Master Bedroom, including fabrication of steel frame, supports, fixing to wall/floor, alignment, welding, grinding, and finishing, complete in accordance with approved drawings and specifications.

Size: 2,040 mm L × 2,095 mm W', 1.0, 'Nos', 8450.0, 6500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 15, 'P.', null, 'Supply and Installation of Low-Level Cabinet – Gym, including MDF carcass with melamine finish, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 450 mm H × 450 mm D × 2105 mm L
Note: Countertop, premium hardware, or integrated lighting are not included and quoted separately.', 1.0, 'Nos', 3250.0, 2500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 16, null, null, 'Other Joinery Items not mentioned to be confirmed and quoted separately', null, null, null, null, null, true);
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
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'Superstructure Waterproofing', 'Make due allowance to supply and application of new waterproof membrane to the roof area — To be Confirmed and quoted separately', 1.0, 'LS', null, null, 30.0, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 7, 'VIII', 'Doors and Windows') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Wooden Doors', 'Supply and Installation of wooden doors including with all the necessary fitting accessories required as per the drawings.

Location: Pivot Door at Entrance', 1.0, 'Nos', 17550.0, 13500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Wooden Doors', 'Supply and Installation of wooden doors including with all the necessary fitting accessories required as per the drawings.

Location: Curved Door & Frame to Guest Toilet', 1.0, 'Nos', 8450.0, 6500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', 'Wooden Doors', 'Supply and Installation of wooden doors including with all the necessary fitting accessories required as per the drawings.

Location: Single Concealed Door to Gym', 1.0, 'Nos', 5460.0, 4200.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', 'Wooden Doors', 'Supply and Installation of wooden doors including with all the necessary fitting accessories required as per the drawings.

Location: Single Bedroom Entrance Door', 3.0, 'Nos', 5460.0, 4200.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'Ironmongaries', 'Supply and Installation of ironmongary including all necessary related works all in accordance with the drawings

Location: Pivot Door at Entrance
PC Supply Rate: 1250 Dhs/ Door', 1.0, 'Nos', 1950.0, 1500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', 'Ironmongaries', 'Supply and Installation of ironmongary including all necessary related works all in accordance with the drawings

Location: Curved Door & Frame to Guest Toilet
PC Supply Rate: 500 Dhs/ Door', 1.0, 'Nos', 975.0, 750.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, 'G.', 'Ironmongaries', 'Supply and Installation of ironmongary including all necessary related works all in accordance with the drawings

Location: Single Concealed Door to Gym
PC Supply Rate: 500 Dhs/ Door', 1.0, 'Nos', 975.0, 750.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, 'H.', 'Ironmongaries', 'Supply and Installation of ironmongary including all necessary related works all in accordance with the drawings

Location: Single Bedroom Entrance Door
PC Supply Rate: 500 Dhs/ Door', 3.0, 'Nos', 975.0, 750.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, 'I.', 'Sub-Frames', 'Supply and Installation of sub frames for doors including all necessary related works all in accordance with the drawings', 6.0, 'item', 390.0, 300.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, 'J.', 'Aluminum and Glazing Doors', 'Supply and Installation of Aluminum Glazed Door Set comprising of glass and powder coated aluminum frame including ironmongery with all the necessary fitting accessories required as per the drawings - Single Leaf Pivot Door (Glass Door)

Ref. MD-01 
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 1800mm L x 2700mm ht
Location : Elevation A - GF Main Entrance Door', 1.0, 'Nos', 39961.35, 30739.5, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, 'K.', 'Aluminum and Glazing Doors', 'Supply and Installation of Aluminum glazed door set - Suchuco 54 PD ME Sliding Door (S+S+F)

Ref. Sliding Door 
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 3000 mm L x 2600mm ht 
Location: Elevation B, Dining Area', 1.0, 'Nos', 34577.4, 26598.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 11, 'L.', 'Aluminum and Glazing Doors', 'Supply and Installation of Bi Folding Door - Schuco AS FD 90 HI Bi-folding Door

Ref. Bi-Folding Door
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 2700 mm L x 2700mm ht 
Location: Elevation B, Lounge at ground floor area', 1.0, 'Nos', 45347.445, 34882.65, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 12, 'M.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (3 Panels)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 3000 mm L x 2700mm ht 
Location: Elevation C, Master Bedroom Closet
Note: Dummy Window will be blocked up internally to facilitate the closet', 1.0, 'Nos', 20849.4, 16038.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 13, 'N.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Schuco AWS 65 Fixed Windows with Hinged Window

Ref. Glazed Window
Hinged Window: 750mmW x 1700mmH
Fixed Panel 1: 750mmW x 1000mmH
Fixed Panel 2: 1100mmW x 1700mmH
Fixed Panel 3: 1100mmW x 1000mmH
Location: Elevation B, Master Bedroom Closet

Note: Dummy Window will be blocked up internally to facilitate the closet', 1.0, 'Nos', 15409.68, 11853.6, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 14, 'O.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (2 Panels)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 2560 mm L x 2700mm ht 
Location: Elevation B, Staircase at ground floor area', 1.0, 'Nos', 17791.488, 13685.76, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 15, 'P.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (2 Panels)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Fixed Panel 1: 1000mmW x 1700mmH
Fixed Panel 2: 1000mmW x 1000mmH
Location: Elevation D, Master Bathroom', 1.0, 'Nos', 10488.66, 8068.2, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 16, 'Q.', 'Aluminum and Glazing Windows', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (1 Panel)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 2700 mm L x 500mm ht 
Location: Elevation D, Kitchen Area', 1.0, 'Nos', 6949.8, 5346.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 8, 'IX', 'Skylights') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', null, 'Supply and Installation of Aluminum glazed skylight set - Flat Skylight (5.90m L x 1.145m W)

Location: Skylight at master bedroom roof area', 1.0, 'Nos', 27049.022, 20806.94, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', null, 'Supply and Installation of Aluminum glazed skylight set - flat circular skylight (4.50 sqm)

Location: Skylight at Staircase roof area', 1.0, 'Nos', 18018.0, 13860.0, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 9, 'X', 'Finishes') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Internal Finishes', 'Screed:

Supply and laying of cement sand screed of required thickness including all necessary accessories to achieve smooth and durable surface finish all in accordance with drawings and specifications.', 67.0, 'sqm', 80.0, 80.0, null, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Floor Finishes', 'Supply and fix cut to size Marble tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications.

Location: Main Entrance
PC Supply Rate: AED 480 / m²', 3.0, 'sqm', 1228.5, 945.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'C.', 'Floor Finishes', 'Supply and fix 600x600mm Ceramic tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

Location: Lounge, Dinning, Kitchen, Gym, Hallway, Primary suite, Bed Rooms, & Family 
PC Supply Rate: AED 360 / m²', 205.0, 'sqm', 450.0, 450.0, null, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'D.', 'Floor Finishes', 'Supply and fix Non Slip Ceramic tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

Location: Bathrooms and Balcony
PC Supply Rate: AED 360 / m²', 36.0, 'sqm', 450.0, 450.0, null, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'E.', 'Floor Finishes', 'Supply and fix Marble Tread and riser (Supply P.C. Rate AED 480/m), including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

PC Supply Rate: AED 480 / LM', 29.0, 'LM', 1079.0, 830.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'F.', 'Floor Finishes', 'Supply and apply epoxy flooring all necessary fixing accessories all in accordance with the drawings and specifications

Location: Garage', 39.0, 'sqm', 227.5, 175.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, 'H.', 'Skirting and Threshold', 'Supply and fix skirting tile/threshold including setting material, grout and all necessary fixing accessories all in accordance with the drawings and specifications.

Ceramic Skirting (Supply P.C. Rate AED 28/Lm)', 102.0, 'LM', 78.0, 78.0, null, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, 'I.', 'Skirting and Threshold', 'Supply and fix skirting tile/threshold including setting material, grout and all necessary fixing accessories all in accordance with the drawings and specifications.

Marble skirting (Supply P.C. Rate AED 60/Lm)', 4.0, 'LM', 169.0, 130.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, 'J.', 'Plastering', 'Supply and application of cement-sand plaster (1:3 mix), in uniform thickness, smooth finish, including all accessories as per approved drawings and specifications.

Location: Internal wall plaster', 141.0, 'sqm', 75.0, 75.0, null, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, 'K.', 'Plastering', 'Supply and application of cement-sand plaster (1:3 mix), in uniform thickness, smooth finish, including all accessories as per approved drawings and specifications.

Location: External wall plaster', 44.0, 'sqm', 85.0, 85.0, null, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, 'L.', 'Wall Tiles', 'Supply and fix Ceramic wall tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

PC Supply Rate: AED 360 / m²', 49.0, 'sqm', 450.0, 450.0, null, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 11, 'M.', 'Wall Painting', 'Supply and application of painting works, including surface preparation  and necessary accessories as required, complete as per approved drawings and specifications.

Type: Fenomastic washable Emulsion Paint', 92.0, 'sqm', 67.275, 51.75, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 12, 'N.', 'False Ceiling Works', 'Supply and Installation of 12.5mm thick regular gypsum board ceiling ready to receive primer, including shadow gap (10x10mm)', 205.0, 'sqm', 164.45, 126.5, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 13, 'O.', 'False Ceiling Works', 'Supply and Installation of 12.5mm thick MR gypsum board ceiling ready to receive primer, including shadow gap (10x10mm)', 36.0, 'sqm', 179.4, 138.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 14, 'P.', 'False Ceiling Works', 'Supply and Application of Paint on the ceiling (one coat primer, two coat stucco,  two coat rich mat white)', 241.0, 'sqm', 59.8, 46.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 15, 'Q.', 'False Ceiling Works', 'Cutting of false ceiling for light fixtures, including marking, precise cutting of gypsum board, removal of cut sections, and preparation for fixture installation.', 1.0, 'Nos', 50.7, 39.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 16, 'R.', 'False Ceiling Works', 'Cutting of false ceiling for AC grill/diffuser openings, including marking, precise cutting of gypsum board, removal of cut sections, and preparation for AC grill installation.', 1.0, 'RM', 50.7, 39.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 17, null, 'False Ceiling Works', 'Supports to facilitate TV projector and screen to be confirmed and quoted separately', null, null, null, null, null, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 18, null, 'False Ceiling Works', 'Cutting of ceiling for light fixtures and A/C Grill to be confirmed and quoted separately', null, null, null, null, null, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 19, 'S.', 'External Finishes', 'Supply and application of painting works, including surface preparation  and necessary accessories as required, complete as per approved drawings and specifications.

Type/Location: Exterior quality paint to the entire Villa', 64.0, 'sqm', 112.125, 86.25, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 10, 'XI', 'Accessories') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A.', 'Mirrors', 'Supply and Installation of vanity mirror with 6mm thk belgium grade mirror on MDF backing

LED: not included', 3.0, 'sqm', 1560.0, 1200.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B.', 'Mirrors', 'Supply and Installation of Smart Film – Master Bedroom Windows, including cut-to-size smart film, adhesive, electrical connections (if switchable/PDLC type), installation, and finishing, complete in accordance with approved drawings and specifications.

Window Size: 4595mm L x 2705mm Ht', 1.0, 'Nos', 12926.654, 9943.58, 30.0, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 11, 'XII', 'MEP Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, '1', 'A. Plumbing Works', 'Supply, Installation, Testing and Commissioning of plumbing works and all related accessories as per approved drawings and specifications.

Note: Affected/Damaged Area Only', 1.0, 'item', 21515.0, 16550.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, '1', 'B. HVAC System', 'Supply, installation, testing and commissioning of HVAC system including all accessories as per approved drawings and authority requirements.

Note: Affected/Damaged Area Only', 1.0, 'item', 16510.0, 12700.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, '2', 'B. HVAC System', 'Repositioning of External Compressor Unit (Ref. CU5), including disconnection of existing electrical and refrigerant connections, relocation to new position, reinstallation, reconnection of piping, electrical wiring, supports/brackets, testing and commissioning.', 1.0, 'item', 3493.75, 2687.5, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, '1', 'Fire Fighting System', 'Supply, installation, testing and commissioning of fire fighting system and accessories, complete as per civil defense requirements and approved drawings

Note: Affected/Damaged Area Only', 1.0, 'item', 12415.0, 9550.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, '2', 'Electrical System', 'Supply, installation, testing and commissioning of electrical system and all related accessories as per approved drawings, specifications, and authority standards.

Note: Affected/Damaged Area Only', 1.0, 'item', 21580.0, 16600.0, 30.0, false);
update boqs set status = 'APPROVED' where id = b;
end $x$;
