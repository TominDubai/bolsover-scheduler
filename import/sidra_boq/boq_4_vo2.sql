set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '39688550-ec6c-460e-b6e7-41b96859f44c' and source_file = 'vo2.xlsx';
insert into variations(project_id, vo_no, description, value) values ('39688550-ec6c-460e-b6e7-41b96859f44c', 2, 'Villa 170, Sidra 2, Dubai Hills Additional Work no. 2', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '39688550-ec6c-460e-b6e7-41b96859f44c' and vo_no = 2;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('39688550-ec6c-460e-b6e7-41b96859f44c', 'VARIATION', 0, v, 'Villa 170, Sidra 2, Dubai Hills Additional Work no. 2', null, 'DRAFT', '2026-06-12', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'vo2.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, null, null, 'Preparation, coordination, and procurement of all necessary approvals (authority submissions, revisions, and NOC) for Additional Work 
no. 6 at Villa 170, Sidra 2, Dubai Hills Renovation Work — by Client.', null, null, null, null, null, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'II', 'Additional Work no. 6') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 0, 'A1.', 'Joinery Works', 'Supply and Installation of Master Closet Wardrobe and Integrated Column, including MDF carcass with melamine finish, full-height doors, internal shelving, drawers, standard hardware, curved detailing around structural column, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications. including platform (excluding ceiling and pillar)

Size: 2800mm ht x 600mm D x (2850mm + 6050mm + 2850mm) L 

Material/Specification:  MDF carcass in melamine finish, internal shelving and standard hardware', 1.0, 'Nos.', 85150.0, 65500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 1, 'B1.', 'Joinery Works', 'OMIT: Supply and Installation of Master Closet Wardrobe and Integrated Column, including MDF carcass with melamine finish, full-height doors, internal shelving, drawers, standard hardware, curved detailing around structural column, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications. including platform (excluding ceiling and pillar)

Size: 2800mm ht x 600mm D x (2850mm + 6050mm + 2850mm) L 

Material/Specification:  MDF carcass in melamine finish, internal shelving and standard hardware
Note: Special features such as LED lighting, soft-close premium hardware, or glass inserts are charged separately.', -1.0, 'Nos.', 74750.0, 57500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 2, 'A2.', 'Joinery Works', 'Supply and Installation of Master Bedroom Island Unit, including MDF carcass with melamine finish, internal shelving, drawers (if any), standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications. (Marble supply by client ) 

Size: 900mm ht x 850mm D x 3450 mm L

Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware', 1.0, 'Nos.', 25350.0, 19500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 3, 'B2.', 'Joinery Works', 'OMIT: Supply and Installation of Master Bedroom Island Unit, including MDF carcass with melamine finish, internal shelving, drawers (if any), standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 900mm ht x 850mm D x 3450 mm L

Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Glass tops, mirrors, LED lighting, premium hardware (soft-close, branded systems) are charged separately.', -1.0, 'Nos.', 18980.0, 14600.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 4, 'A5.', 'Joinery Works', 'Supply and Installation of Ellipse Curved Vanity Counter- Master Bathroom, including MDF carcass with melamine finish, curved fabrication, internal shelving, drawers/doors (if any), hinges, handles, and all necessary fittings and accessories, complete in accordance with approved drawings and specifications. including partition with top.

Size: 900mm ht x 600mm D x 1800mm L 

Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Countertop, wash basin, faucet, and plumbing fixtures are not included', 1.0, 'Nos.', 12350.0, 9500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 5, 'B5.', 'Joinery Works', 'OMIT: Supply and Installation of Ellipse Curved Vanity Counter- Master Bathroom, including MDF carcass with melamine finish, curved fabrication, internal shelving, drawers/doors (if any), hinges, handles, and all necessary fittings and accessories, complete in accordance with approved drawings and specifications. including partition with top.

Size: 900mm ht x 600mm D x 1800mm L 

Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Countertop, wash basin, faucet, and plumbing fixtures are not included', -1.0, 'Nos.', 7475.0, 5750.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 6, 'A8.', 'Joinery Works', 'Supply and Installation of Rectangular Vanity Mirror, including cut-to-size mirror, polished edges, mounting/fixing accessories, alignment, and 
installation, complete in accordance with approved drawings and specifications. including metal powder coated framing

Size: 3000 mm H x 1500 mm L
Location: Master Bathroom', 1.0, 'Nos', 11960.0, 9200.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 7, 'B8.', 'Joinery Works', 'OMIT: Supply and Installation of Rectangular Vanity Mirror, including cut-to-size mirror, polished edges, mounting/fixing accessories, alignment, and installation, complete in accordance with approved drawings and specifications.

Size: 1000mm ht x 1800mm L
Location: Master Bathroom
Note: Backlit, LED, or decorative framed mirrors are not included and must be quoted separately.', -1.0, 'Nos.', 2860.0, 2200.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 8, 'A12.', 'Joinery Works', 'Supply and Installation of Built-in Cabinet Behind Bath - Master Bathroom, including MDF/melamine carcass, mirror front doors, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Base cabinet : 2000 x 600 x 900 mmHT         
Top cabinet : 2000 X 350 X 1000 mmHT

Note: 
1. Countertop, or specialized hardware (soft-close, branded handles) are not included.
2. Marble supply and installation not included.', 1.0, 'Nos', 8970.0, 6900.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 9, 'B12.', 'Joinery Works', 'OMIT: Supply and Installation of Built-in Cabinet Behind Bath - Master Bathroom, including MDF/melamine carcass, mirror front doors, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: Full Height × 1,000 mm L × 350mm D

Note: Countertop, lighting, or specialized hardware (soft-close, branded handles) are not included.', -1.0, 'Nos', 5070.0, 3900.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 10, 'A13.', 'Joinery Works', 'Supply and Installation of Veneered Headboard 
Master Bedroom, including MDF carcass, veneer finish, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size:  1200mm ht x 2035mm L', 1.0, 'Nos', 7540.0, 5800.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 11, 'B13.', 'Joinery Works', 'OMIT: Supply and Installation of Veneered Headboard – Master Bedroom, including MDF carcass, veneer finish, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size:  1200mm ht x 2035mm L', -1.0, 'Nos', 4550.0, 3500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 12, 'A16.', 'Joinery Works', 'Supply and Installation of Low-Level Cabinet – Gym, including MDF carcass with melamine finish, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 700 mm H × 450 mm D × 2105 mm L
Note: Countertop, premium hardware,  are not included (Marble supply and installation not included)', 1.0, 'Nos', 4940.0, 3800.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 13, 'B16.', 'Joinery Works', 'OMIT: Supply and Installation of Low-Level Cabinet – Gym, including MDF carcass with melamine finish, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 700 mm H × 450 mm D × 2105 mm L
Note: Countertop, premium hardware,  are not included', -1.0, 'Nos', 3250.0, 2500.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 14, '1', 'Sanitary Wares', 'Supply and install deck mounted 3-hole basin mixer without waste, complete with all necessary fittings, connectors, adaptors, valves, flexible hoses, sealing materials, fixing accessories, testing, and commissioning.

Brand: BagnoDesign/Sanipex Group - Vitesse
Finish: PVC Soft Burgundy', 1.0, 'Nos.', 2710.5, 2085.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 15, '2', 'Sanitary Wares', 'Supply and install floor mounted bath mixer complete with hand shower set, including all necessary concealed pipe connections, fittings, supports, brackets, sealing, testing, and commissioning.

Brand: BagnoDesign/Sanipex Group - Vitesse
Finish: PVC Soft Burgundy', 1.0, 'Nos.', 7390.5, 5685.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 16, '3', 'Sanitary Wares', 'Supply and install freestanding bathtub complete with positioning, leveling, fixing, connection to waste outlet, sealing, testing, and commissioning.

Brand: BagnoDesign/Sanipex Group - Selma
Finish: Matt Sand', 1.0, 'Nos.', 36790.0, 28300.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 17, '4', 'Sanitary Wares', 'Supply and install round wall/ceiling mounted shower head with 300mm diameter, complete with all necessary concealed connections, arm or ceiling dropper (as applicable), fittings, supports, sealing, testing, and commissioning.

Brand: BagnoDesign/Sanipex Group - Universal
Finish: Armour Cocoa', 1.0, 'Nos.', 2652.0, 2040.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 18, '5', 'Sanitary Wares', 'Supply and install wall mounted rimless WC complete with concealed cistern connection, seat cover, mounting frame coordination (if applicable), fittings, seals, accessories, testing, and commissioning.

Brand: BagnoDesign/Sanipex Group - Core
Finish: White', 1.0, 'Nos.', 2678.0, 2060.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 19, '1', 'Lighting Works', 'Supply and installation of recessed LED spotlight, Brand: Lumibright or approved equivalent, with aluminum housing, mounting accessories, wiring connection, testing and commissioning.

Code: L1.0
Specification:
- Input: 300mA / 30–42VDC
- Power: 12W
- Lumen Output: 80–85 lm/W (Approx. 960–1,020 lumens)
- Color Temperature: 3000K
- Dimensions: Ø108 × 95mm
- Material: Aluminum
- Finish: White + Matt White
- IP Rating: IP65
- Mounting: Ceiling Recessed
- Warranty: 5 Years', 47.0, 'Nos.', 331.5, 255.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 20, '2', 'Lighting Works', 'Supply and installation of DALI dimmable LED driver, Brand: Tridonic or approved equivalent, complete with mounting, wiring connections, DALI integration, testing, commissioning.

Code: L1.0 (Dali Dimmable Power Supply)
Specification:
- Input Voltage: 220–240VAC
- Power: 17W
- Dimensions: 130 × 43 × 30 mm
- IP Rating: IP20
- Function: DALI Dimmable
- Warranty: 5 Years', 47.0, 'Nos.', 188.5, 145.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 21, '3', 'Lighting Works', 'Supply and installation of DALI electrical accessory/control component, Brand: Tridonic or approved equivalent, complete with mounting, wiring connections, addressing, testing, commissioning.

Code: L1.0 (Dali Dimmable Power Supply''s | Select)
Specification:
- Input: 300mA
- Power: 0.25W
- Dimensions: 5.5 × 4.5 × 21mm
- Finish: Blue
- IP Rating: IP20
- Warranty: 5 Years', 47.0, 'Nos.', 26.0, 20.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 22, '4', 'Lighting Works', 'Supply and installation of recessed LED spotlight, Brand: Lumibright or approved equivalent, with aluminum housing, mounting accessories, wiring connection, testing and commissioning.

Code: L1.1

Specification:
- Input Voltage: 220–240VAC (with Driver)
- Power: 9W
- Lumen Output: 590lm
- Color Temperature: Switchable (3000K / 4000K / 6000K)
- Dimensions: Ø105 × 65mm
- Material: Aluminum
- Finish: White
- IP Rating: IP20
- Mounting: Ceiling Recessed
- Warranty: 5 Years', 24.0, 'Nos.', 195.0, 150.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 23, '5', 'Lighting Works', 'Supply and installation of DALI dimmable LED driver/power supply, Brand: Tridonic or approved equivalent, complete with mounting, wiring termination, DALI integration, testing, and commissioning.

Code: L1.1 (Dali Dimmable Power Supply)
Specification:
- Power: 10W
- Dimensions: 130 × 43 × 30 mm
- IP Rating: IP20
- Function: DALI Dimmable
- Warranty: 5 Years', 24.0, 'Nos.', 175.5, 135.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 24, '6', 'Lighting Works', 'Supply and installation of DALI electrical accessory/control module, Brand: Tridonic or approved equivalent, complete with mounting, wiring connection, addressing, testing, commissioning.

Code: L1.1 (Dali Dimmable Power Supply''s | Select)
Specification:
- Input: 300mA
- Power: 0.25W
- Dimensions: 5.5 × 4.5 × 21mm
- Finish: Blue
- IP Rating: IP20
- Warranty: 5 Years', 24.0, 'Nos.', 26.0, 20.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 25, '7', 'Lighting Works', 'Supply and installation of decorative suspended pendant lamp, Brand: Lumideco or approved equivalent, complete with integrated LED light source, aluminum body, suspension cables/rods, ceiling canopy, internal wiring, fixing accessories, testing and commissioning.

Code: L2.2
Specification:
- Input Voltage: 220–240VAC
- Power: 74W
- Lumen Output: 4,000 lm
- Color Temperature: 3000K
- Dimensions: Ø1200 × 600mm
- Material: Aluminum
- Finish: Black with Sand + White
- IP Rating: IP20
- Mounting: Pendant / Suspended
- Warranty: 3 Years', 1.0, 'Nos.', 9230.0, 7100.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 26, '8', 'Lighting Works', 'Supply and installation of decorative suspended pendant lamp, Brand: Lumideco or approved equivalent, complete with integrated LED light source, stainless steel body, suspension cables/rods, ceiling canopy, internal wiring, fixing accessories, testing and commissioning

Code: L2.3
Specification:
- Type: Suspended / Pendant Lamp
- Brand: Lumideco
- Power: 36W
- Color Temperature: 3000K
- Dimensions: Ø800 × H300mm
- Material: Stainless Steel
- Finish: Copper
- IP Rating: IP20
- Mounting: Pendant / Suspended', 1.0, 'Nos.', 2925.0, 2250.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 27, '9', 'Lighting Works', 'Supply and installation of LED strip light, Brand: Lumiflex or approved equivalent, complete with LED strip roll, connectors, fixing accessories, wiring connections, testing and commissioning.

Code: LED 1, L3.0, LED3, LED1
Specification:
- Input Voltage: 24VDC
- Power: 50W per Roll
- Color Temperature: 2700K
- Dimensions: 10 × 5000mm
- Roll Length: 5m
- Material: PCB
- Finish: White
- IP Rating: IP20
- Warranty: 5 Years', 47.0, 'rolls', 195.0, 150.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 28, '10', 'Lighting Works', 'Supply and installation of complete Lumipro aluminum profile kit for LED strip and linear lighting applications, including aluminum extrusion profile, diffuser cover, end caps, mounting clips, fixing accessories, cutting to size, fabrication, installation, alignment.

Code: LED 3.0, LED3 (Profile Kit)
Specification:
- Brand: Lumipro
- Profile Kit Includes:
LP.1714.S1.X.M.2M
LP.1714.S1.A.2M
MC_LP.1714.S1
CAP_LP.1714.S1
- Application: LED Strip / Linear Lighting
- Length: 2.0m Profile Kit', 68.0, 'Nos.', 169.403, 130.31, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 29, '11', 'Lighting Works', 'Supply and installation of complete aluminum profile kit for LED strip lighting applications, including aluminum extrusion profile, diffuser cover, end caps, mounting clips, fixing accessories, cutting to size, fabrication, installation, alignment.

Code: LED1 (Profile Kit)
Specification:
- Profile Kit Includes:
CAP_LP.1515.S3
LP.1515.S3.2M
MC_LP.1515.S3
LP.1515.S3.X.M.2M
- Application: LED Strip / Linear Lighting
- Supplied Length: 2.0m Kit', 50.0, 'Nos.', 126.1, 97.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 30, '12', 'Lighting Works', 'Supply and installation of DALI dimmable LED driver, Brand: Tridonic or approved equivalent, complete with mounting, wiring terminations, DALI control integration, testing, commissioning.

Code: LED 1, L3.0, LED3, LED1 (Dali Dimmable Driver)
Specification:
- Input Voltage: 220–240VAC
- Power: 150W
- Dimensions: 325 × 43 × 29.8 mm
- IP Rating: IP20
- Function: DALI Dimmable
- Warranty: 5 Years', 21.0, 'Nos.', 434.2, 334.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 31, '13', 'Lighting Works', 'Supply and installation of LED strip light, Brand: Lumiflex or approved equivalent, complete with LED strip, connectors, fixing accessories, wiring connections, testing and commissioning.

Code: LED3.1, LED4
Specification:
- Input Voltage: 24VDC
- Power: 50W per 5m Roll (10W/m)
- Color Temperature: 2700K
- Dimensions: 10 × 5000mm
- Material: PCB
- Finish: White
- IP Rating: IP67
- Warranty: 5 Years', 5.0, 'rolls', 234.0, 180.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 32, '14', 'Lighting Works', 'Supply and installation of complete aluminum profile kit, Brand: Lumipro or approved equivalent, including aluminum extrusion profile, diffuser cover, mounting clips, end caps, fixing accessories, cutting to size, fabrication, installation, alignment.

Code: LED3.1, LED4 (profile kit)
Specification:
- Profile Kit Components:
LP.1714.S1.X.M.2M
LP.1714.S1.A.2M
MC_LP.1714.S1
CAP_LP.1714.S1
- Brand: Lumipro
- Application: LED Strip / Linear Lighting
- Supplied Length: 2.0m Kit', 13.0, 'set', 91.0, 70.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 33, '15', 'Lighting Works', 'Supply and installation of DALI dimmable LED driver, Brand: Mean Well or approved equivalent, complete with metal enclosure, mounting accessories, wiring terminations, DALI control integration, testing, commissioning.

Code: LED3.1, LED4 (Dali Dimmable Driver)
Specification:
- Input Voltage: 24VDC
- Power: 150W
- Dimensions: 219 × 63 × 35.5mm
- Material: Metal Housing
- IP Rating: IP67
- Function: DALI Dimmable
- Warranty: 5 Years', 2.0, 'Nos', 364.0, 280.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 34, '16', 'Lighting Works', 'Supply and installation of recessed LED wall light, Brand: Lumibright or approved equivalent, complete with integrated LED light source, aluminum housing, recessed mounting box, fixing accessories, wiring connection, testing, commissioning.

Code: L4.0
Specification:
- Input Voltage: 200–240VAC
- Power: 1 × 3W
- Lumen Output: 23lm
- Color Temperature: 3000K
- Dimensions: 95 × 81mm
- Material: Aluminum
- IP Rating: IP65
- Mounting: Wall Recessed', 5.0, 'Nos', 260.0, 200.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 35, '17', 'Lighting Works', 'Supply and installation of recessed LED spotlight, Brand: Lumibright or approved equivalent, complete with LED module, driver, extruded aluminum housing, mounting accessories, wiring connection, testing, commissioning.

Code: L4.1
Specification:
- Input: 700mA / 3VDC
- Power: 2.2W
- Lumen Output: 170lm
- Color Temperature: 2700K
- Dimensions: Ø52 × 32mm
- Material: Extruded Aluminum
- Finish: Painted Black
- IP Rating: IP40
- Mounting: Ceiling Recessed
- Warranty: 5 Years', 16.0, 'Nos', 182.0, 140.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 36, '18', 'Lighting Works', 'Supply and installation of DALI dimmable LED driver, Brand: Tridonic or approved equivalent, complete with mounting, wiring connections, DALI control integration, testing, commissioning.

Code: L4.1 (Dali Dimmable Driver)
Specification:
- Input Voltage: 220–240VAC
- Power: 17W
- Dimensions: 130 × 43 × 30mm
- IP Rating: IP20
- Function: DALI Dimmable
- Warranty: 5 Years', 16.0, 'Nos', 182.0, 140.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 37, '19', 'Lighting Works', 'Supply and installation of DALI lighting control accessory, Brand: Tridonic or approved equivalent, complete with mounting, wiring terminations, DALI network connection, addressing, testing, commissioning.

Code: L4.1 (Dali | Select)
Specification:
- Input: 700mA
- Power: 0.25W
- Dimensions: 5.5 × 4.5 × 21mm
- Finish: Blue
- IP Rating: IP20
- Warranty: 5 Years', 16.0, 'Nos', 26.0, 20.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 38, '20', 'Lighting Works', 'Supply and installation of decorative table lamp, Brand: Lumideco or approved equivalent, complete with integrated LED light source, aluminum body, internal wiring, lamp holder/driver, fixing accessories, testing and commissioning.

Code: L5.0, L5.6, L5.3, L5.5
Specification:
- Input Voltage: 90–260VAC
- Power: 15W
- Color Temperature: 3000K
- Dimensions: 300 × 445mm
- Material: Aluminum
- Finish: Black
- IP Rating: IP20
- Mounting: Table Mounted', 5.0, 'Nos', 591.5, 455.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 39, '21', 'Lighting Works', 'Supply and installation of decorative table lamp, Custom Made, complete with integrated LED light source, metal and glass body, internal wiring, lamp holder/driver, mirror copper finish, testing and commissioning.

Code: L5.1, L5.2
Specification:
- Input Voltage: 220–240VAC
- Power: 3W
- Color Temperature: 3000K
- Dimensions: Ø220 × H200mm
- Material: Metal + Glass
- Finish: Mirror Copper
- IP Rating: IP20
- Mounting: Table Mounted
- Warranty: 3 Years', 3.0, 'Nos', 721.5, 555.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 40, '22', 'Lighting Works', 'Supply and installation of decorative LED wall lamp, complete with aluminum body, integrated LED light source, mounting bracket, fixing accessories, wiring connection, testing and commissioning.

Code: L5.4
Specification:
- Beam Angle: 34°
- Light Source: Integrated LED
- Lamp Type: LED
- Power: 13W
- Input Voltage: 220–240V
- CRI: ≥80
- Lifetime: 50,000 Hours
- Dimensions: L100 × W450 × H25 mm
- Material: Aluminum
- Finish: Black
- IP Rating: IP20
- Warranty: 3 Years', 3.0, 'Nos', 851.5, 655.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 41, '23', 'Lighting Works', 'Supply and installation of decorative floor lamp, Brand: Lumiluce or approved equivalent, complete with iron body, lamp holder, internal wiring, fixing accessories, lamp source (where specified), testing and commissioning.

Code: L5.4
Specification:
- Input Voltage: 220–240VAC
- Dimensions: H1900 × 1700mm
- Material: Iron
- Finish: Black
- IP Rating: IP20
- Mounting: Floor Surface Mounted
- Warranty: 2 Years', 1.0, 'Nos', 1495.0, 1150.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 42, '24', 'Lighting Works', 'Supply and installation of LED lamp, Brand: OSRAM or approved equivalent, complete with lamp fitting, installation, testing, and commissioning.

Code: L6.0 (Lamps)
Specification:
- Input Voltage: 220–240V
- Power: 7W
- Lumen Output: 85 lm/W (approximately 595 lumens)
- Color Temperature: 2700K
- Lamp Type: A60
- Material: Glass
- IP Rating: IP20
- Warranty: 1 Year', 1.0, 'Nos', 58.5, 45.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 43, '25', 'Lighting Works', 'Supply and installation of LED Neon Flex lighting, Brand: Flamilano or approved equivalent, complete with flexible LED strip, silicone/PVC diffuser housing, mounting clips, fixing accessories, connectors, end caps, wiring connections, testing and commissioning.

Code: LED 2
Specifications: 
- Input Voltage: 24VDC
- Power: 12W/m
- Lumen Output: 750 lm/m
- Color Temperature: 3000K
- Dimensions: 10,000 × 11 × 19 mm
- Material: PCB with Neon Flex Housing
- Finish: White
- IP Rating: IP67
- Warranty: 3 Years', 150.0, 'LM', 130.0, 100.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 44, '26', 'Lighting Works', 'Supply and installation of aluminum mounting profile/channel for LED lighting applications, including extruded aluminum profile, end caps, mounting clips/brackets, fixing accessories, cutting to size, alignment, and installation.

Code: LED 2 (Mounting Channel)
Specifications:
- Material: Extruded Aluminum
- Brand: Other Approved Brand
- Application: LED Strip / Linear Lighting
- Complete with End Caps and Mounting Clips', 150.0, 'Nos.', 149.5, 115.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 45, '27', 'Lighting Works', 'Supply and installation of DALI dimmable LED driver, Brand: Mean Well or approved equivalent, complete with mounting, wiring connections, DALI control integration, testing and commissioning,

Code: LED 2 (Dali Dimmable Driver)
Specifications:
- Input Voltage: 24VDC
- Power: 75W
- Dimensions: 180 × 63 × 35.5mm
- Material: Metal Housing
- IP Rating: IP67
- Function: DALI Dimmable
- Warranty: 3 Years', 15.0, 'Nos.', 338.0, 260.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 46, '28', 'Lighting Works', 'Supply and installation of recessed LED inground light, Brand: Lumibright or approved equivalent, complete with stainless steel trim, aluminum housing, recessed sleeve/canister, fixing accessories, wiring connections, testing and commissioning.

Code: LED 7.0
Specifications:
- Input Voltage: 24VDC
- Power: 2W
- Lumen Output: 90 lm
- Color Temperature: 3000K
- Dimensions: Ø38 × 60mm
- Material: Stainless Steel + Aluminum
- Finish: Stainless Steel
- IP Rating: IP68
- Mounting: Floor Recessed
- Warranty: 3 Years', 8.0, 'Nos.', 429.0, 330.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 47, '29', 'Lighting Works', 'Supply and installation of DALI dimmable LED driver, Brand: Mean Well or approved equivalent, complete with mounting, wiring connections, DALI control integration, testing and commissioning.

Code: LED 7.0 (Dali Dimmable Drivers)
Specifications:
- Input Voltage: 24VDC
- Power: 75W
- Dimensions: 180 × 63 × 35.5mm
- Material: Metal Housing
- IP Rating: IP67
- Function: DALI Dimmable
- Warranty: 3 Years', 1.0, 'Nos.', 266.5, 205.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 48, '30', 'Lighting Works', 'Supply and installation of custom LED linear light fitting, complete with extruded aluminum profile, diffuser, integrated LED strips, DALI dimmable driver, suspension/fixing accessories, wiring connections, testing and commissioning.

Code: L2.0, L2.1, L2.4. L2.4a
Specifications:
- Type: Custom Linear Light
- Length: 1000 mm
- Profile Size: W50 × H70 mm
- Body Finish: Black / White
- Power: 28.8W (3 Lines × 9.6W/m)
- Lumen Output: 2,400 lm
- Color Temperature: 3000K
- CRI: 80
- Function: DALI Dimmable
- IP Rating: IP20
- Warranty: 5 Years', 4.0, 'Nos.', 572.0, 440.0, 30.0, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note) values (b, s, 49, '1', 'External Protection Works', 'External Protection Works', 1.0, 'Nos.', 0.0, null, 30.0, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
