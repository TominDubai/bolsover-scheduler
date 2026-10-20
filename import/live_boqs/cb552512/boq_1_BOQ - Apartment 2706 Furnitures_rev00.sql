set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = 'cb552512-cbbb-4d31-94ac-321046d5bd0d' and source_file = 'BOQ - Apartment 2706 Furnitures_rev00.xlsx';
insert into variations(project_id, vo_no, description, value) values ('cb552512-cbbb-4d31-94ac-321046d5bd0d', 1, 'Apartment 2706 Furnitures_rev00', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = 'cb552512-cbbb-4d31-94ac-321046d5bd0d' and vo_no = 1;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('cb552512-cbbb-4d31-94ac-321046d5bd0d', 'VARIATION', 0, v, 'Apartment 2706 Furnitures_rev00', 'BBC/092026/00107_rev00', 'DRAFT', '2026-09-30', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','Agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Apartment 2706 Furnitures_rev00.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'Coordination, submission, and follow-up for all required approvals and fees from relevant authorities & government by client.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'II', 'Furnitures') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'a1.', null, 'Ace Series Rectangular Executive Desk:

Features a slim edge profile with premium worktops, chamfered metal frame, and seamless cable management.

Dimensions: W160 x D74 cm
Ace Frame Color: Matt White
Storage Options: Without Drawers
Worksurface Finish: Starke® Pro White
Desklink Cable Grommet: Top-Center
Warranty: 10 Year Limited Warranty

Desk Features
- Steel Metal Frame
- Modesty Panel

Production Time: 3-5 Working Days', 5.0, 'Nos.', 1293.809, 1176.19, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'a2.', null, 'Alternative Option:
ARC Designer Series Rectangular Executive Desk:

ARC Designer is a sleek, functional workstation with a premium quality worktop supported by a soft curved pointed frame designed for contemporary work environments.

Dimensions: W160 x D74 cm
Storage Options: Without Drawers
Worksurface Finish: Starke® Pro White
ARC Frame Color: Matt White
Desklink Cable Grommet: Top-Center
Warranty: 10 Year Limited Warranty

Desk Features
- Die-Cast Aluminum Frame
- Modesty Panel

Production Time: 3-5 Working Days — Optional: Rate Only', 5.0, 'Nos.', 2776.191, 2523.81, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'a3.', null, 'Alternative Option:
Ace Pro Series with Side Cabinet L Shape Executive Desk:

Modern L-shaped desk with premium worktop, steel frame, EDGE storage, and adjustable return.

Worksurface Finish: Starke® Pro White
L-Shape Desk Dimension: W160 x D160 cm
Return Side: Left / Right Side
Ace Frame Color: Matt White
Desklink Cable Grommet: Top-Center
Warranty: 10 Year Limited Warranty

Desk Features
- Chamfered Edge Cabinet
- Steel Metal Frame
- Modesty Panel

Side Cabinet Dimension: W140 x D45 x H65 cm
Production Time: 3-5 Working Days — Optional: Rate Only', 5.0, 'Nos.', 1989.427, 1808.57, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'a4.', null, 'Alternative Option:
ARC Pro Designer Series L-Shape Executive Desk:

Sophisticated L-shape workstation with a premium
worktop, soft curved frame, and built-in storage suited for modern work environments.

Worksurface Finish: Starke® Pro White
L-Shape Desk Dimension: W160 x D160 cm
ARC Frame Color: Matt White
Desklink Cable Grommet: Top-Center
Return Side: Left / Right
Warranty: 10 Year Limited Warranty

Desk Features
- Die-Cast Aluminum Frame
- Chamfered Edge
- Modesty Panel

Side Cabinet Dimension: W140 x D45 x H65 cm
Production Time: 3-5 Working Days — Optional: Rate Only', 5.0, 'Nos.', 3499.045, 3180.95, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'a5.', null, 'Alternative Option:
Manhattan L-Shape Executive Desk:

Premium L-shaped executive desk built with a heavy duty powder-coated steel frame for durability and everyday functionality.

Ace Frame Color: Matt White
Worksurface Finish: Starke® Pro White
Manhattan Desk Sizes: W200 x D200 cm
Desklink Cable Grommet: Side-Middle
Return Side: Left / Right
Warranty: 3 Year Limited Warranty

Desk Features
- Anti-Scratch Adjustable Leveling Feet
- Built-in Power Module
- Fingerprint Locking System
- Push-To-Open Drawer
- Modesty Panel

Side Cabinet Dimension: W200 x D55 x H63 cm
Production Time: 3-5 Working Days — Optional: Rate Only', 5.0, 'Nos.', 4441.91, 4038.1, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'a6.', null, 'Alternative Option:
Zenon White L-Shape Executive Desk:

Modern executive desk with a sleek floating top and sculptural metal legs, paired with a spacious side cabinet.

Worksurface Finish: Starke® Pro White
L-Shape Desk Dimension: W200 x D100 cm
Desk Panel Option: Without Modesty Panel
Return Side: Left / Right Side
Desklink Cable Grommet: Side-Middle
Warranty: 5 Year Limited Warranty

Desk Features
- Push-To-Open Drawer
- Anti-Scratch Adjustable Leveling Feet
- Fingerprint Locking System
- Chamfered Edge
- Modesty Panel

Side Cabinet Dimension: W200 x D55 x H63 cm
Production Time: 4-8 Working Days — Optional: Rate Only', 5.0, 'Nos.', 5280.0, 4800.0, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'b.', null, 'DeskLink Rectangular Grommet:

A sleek and functional cable management solution for desks and workstations. The flip-top design allows easy access to power and data cables while keeping the surface clean and organized.

Frame Color: White
Delivery Time: 1-2 Working Days', 5.0, 'Nos.', 0.0, null, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'c1.', null, 'GEO Silver Grey Ergonomic Executive Chair:

GEO 2.0 ergonomic chair with a high-density foam fabric seat, breathable mesh backrest and detachable headrest for airflow and comfort. Features soft 3D PU adjustable armrests and a 3-lock synchro tilt mechanism for flexible, supportive posture.

Chair Type: High Back with Headrest
Warranty: 3 Year Limited Warranty

Chair Ergonomics
- Adjustable Seat
- Adjustable Headrest
- Synchro Tilt
- 3D Adjustable Armrest
- 3 Tilt Locking Position
- Adjustable Backrest
- Adjustable Lumbar Support

Delivery Time: 1-2 Working Days', 5.0, 'Nos.', 586.663, 533.33, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'c2.', null, 'Alternative Option:
Modena White Ergonomic Executive Chair:

Stylish ergonomic chair with light beige breathable fabric seat and backrest. Featuring wire-activated auto balance mechanism that adapts to your weight for smooth reclining, while the contoured backrest and wide cushioned seat provide everyday comfort. This chair is available with or without a headrest.

Chair Type: High Back with Headrest
Warranty: 5 Year Limited Warranty

Chair Ergonomics
- 3D Adjustable Armrest
- 4 Tilt Locking Position
- Adjustable Headrest
- Adjustable Seat
- Synchro Tilt

Delivery Time: 1-2 Working Days — Optional: Rate Only', 5.0, 'Nos.', 700.854, 637.14, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'c3.', null, 'Alternative Option:
VX1 White Performance Ergonomic Chair:

Ergonomic task chair with a white matte frame, mesh back, and fabric seat. Includes 4D armrests, lumbar support, sliding seat, 4-position tilt lock, and easy tension control.

Chair Ergonomics
- 4 Tilt Locking Position
- 4D Adjustable Armrest
- Adjustable Backrest
- Adjustable Headrest
- Adjustable Lumbar Support
- Adjustable Seat
- Synchro Tilt
- Tilt with Adjustable Tilt Tension

Warranty: 5 Year Limited Warranty
Delivery Time: 1-2 Working Days — Optional: Rate Only', 5.0, 'Nos.', 1023.528, 930.48, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'd1.', null, 'Era Arched Visitor Chair:

This chair features a contoured backrest that supports the spineʼs natural curve for better posture. The transparent polycarbonate backrest is durable, flexible, eco-friendly, and UV-resistant to prevent discoloration. Molded foam seat and chrome steel base with arm pads ensure comfort and stability.

ETA: 2nd-3rd week of October', 6.0, 'Nos.', 445.236, 404.76, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'd2.', null, 'Alternative Option:
HONOR VISITOR MESH CHAIR:

Honor Visitor Mesh Chair is modern and versatile designed with ergonomically contoured back with high quality mesh and chrome cantilever frame. The seat has grey fabric upholstered and it has armrests.

Warranty: 2 Year Limited Warranty
ETA: 2nd-3rd week of October — Optional: Rate Only', 6.0, 'Nos.', 492.382, 447.62, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'e1.', null, 'ACE Series Meeting Table:

A sleek, minimalist meeting table designed with a built-in rectangular brushed aluminum wire manager and a distinctive loop-shaped chamfered metal frame for a clean, contemporary look.

Meeting Table Size: W200 x D120 For 6-8 People
Worksurface Finish: Starke® Pro White
Ace Frame Color: Matt White
Warranty: 5 Year Limited Warranty

Desk Features
- Steel Metal Frame
- Flip Rectangular Wire Management

Production Time: 3-5 Working Days', 1.0, 'Nos.', 1584.0, 1440.0, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'e2.', null, 'Alternative Option:
ARC Designer Series Meeting Table:

The ARC combines a stylish minimalist look with functionality, characterized by solid die-cast aluminum legs connected by finely designed joints, the structure of the tables supports tops of different sizes whilst it is characterized by elements whose thickness is reduced to the very limit.

Worksurface Finish: Starke® Pro White
Meeting Table Size: W200 x D120 For 6-8 People
ARC Frame Color: Matt White
Warranty: 10 Year Limited Warranty

Desk Features
- Die-Cast Aluminum Frame
- Flip Rectangular Wire Management

Production Time: 3-5 Working Days — Optional: Rate Only', 1.0, 'Nos.', 3015.045, 2740.95, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'e3.', null, 'Alternative Option:
Diamond Modern Meeting Table:

Sleek architectural meeting table with a welded, powder coated steel frame in white or black. Durable worktop in various finishes, available in multiple sizes.

Worksurface Finish: Starke® Pro White
Frame Color: Powder Coated White
Meeting Table Size: W200 x D120 For 6-8 People
Meeting Worktop Shape: Rectangular Shape
Warranty: 5 Year Limited Warranty
Desk Features: Flip Rectangular Wire Management

Production Time: 7-10 Working Days — Optional: Rate Only', 1.0, 'Nos.', 5280.0, 4800.0, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, 'f.', null, 'Flip Cover for FLIP Power Data and HDMI Module:

Sleek and modern cable management cover designed to keep your workspace organized. Made from brushed aluminum, it features a flip-open lid and internal bristle lining to neatly route cables while keeping them out of sight. Ideal for desks, conference tables, and workstations for a clean, professional finish.

Frame Color - Socket: Brushed Silver
Delivery Time: 1-2 Working Days', 1.0, 'Nos.', 0.0, null, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, 'g1.', null, 'Matell White Task Chair:

Gently curved lines accentuated details are good to the back and pleasant to look at. This office chair has easy to-use mechanism under the seat to highlight the subtle design. This conference chair provide both guest comfort and professional look.

Warranty: 2 Year Limited Warranty
Delivery Time: 1-2 Working Days', 9.0, 'Nos.', 594.0, 540.0, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, 'g2.', null, 'Alternative Option:
Marics White Task Chair:

Award winning lightweight task chair with a fully integrated reclining mechanism. The chair has a 19°reclining mechanism, nylon arms and frame, wintex fabric back and seat, and height-adjustable mechanism.

Warranty: 3 Year Limited Warranty
ETA: 3rd week of October — Optional: Rate Only', 9.0, 'Nos.', 680.955, 619.05, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, 'g3.', null, 'Alternative Option:
Simon White Genuine Leather Designer Chair:

Designer chair made of Top Grade Aniline Italian Leather with a polished aluminum frame. Featuring height adjustable and integrated reclining Donati mechanism. The leather stitching style brings out the luxurious executive look and feel of the chair.

Warranty: 3 Year Limited Warranty
Color: 8810 (BEN-3) White Leather
Leather Type: Aniline Leather
Delivery Time: 1-2 Working Days — Optional: Rate Only', 9.0, 'Nos.', 995.236, 904.76, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, 'h1.', null, 'Mars Lounge Chair:

Minimalist rounded design, ideal office seating in lounge area. With soft materials and cushioned seat, this chair provides comfort. It has black powdered coated base that gives the chair a contemporary character, quite the opposite of its generous padding that invites you to sit back and relax.

Upholstery Color: Fabric Grey
Warranty: 2 Year Limited Warranty
Dimensions: W73 x D52 x H62 cm
Delivery Time: 1-2 Working Days', 6.0, 'Nos.', 995.236, 904.76, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, 'h2.', null, 'Alternative Option:
Prism Lounge Chair:

Armchair with solid beech wood, swivel base and upholstered seat and backrest. The structure of this chair is sharp and angular, and the lines are delicate and intuitive. This chair has thick foam surrounding armrest design for more comfortable seating experience.

Archi Colors: MZ-60188 Light Grey
Warranty: 2 Year Limited Warranty
Dimensions: W71 x H72 cm
Production & Delivery Time: 8-10 Weeks — Optional: Rate Only', 6.0, 'Nos.', 1346.191, 1223.81, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, 'h3.', null, 'Alternative Option:
Kansas Revolving Lounge Chair:

Soft arc shape design and delicate fabric texture combine to create a simple, smooth-lined design. This revolving lounge chair has a star-base and a wide seat providing comfortable seating experience.

Archi Colors: FC3501-Beige
Warranty: 2 Year Limited Warranty
Dimensions: W75.5 x D59.5 x H76 cm
Delivery Time: 1-2 Working Days — Optional: Rate Only', 6.0, 'Nos.', 1230.955, 1119.05, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 22, 'h4.', null, 'Alternative Option:
Lara Beige Genuine Leather Lounge Chair:

Making modern and industrial look, yet sleek and clean style at your space. This lounge chair is built on a powder-coated metal base in black finish, wide seat upholstered with genuine leather tufted cushions. The arm rest and seat support is made of black strap with copper clips.

Warranty: 2 Year Limited Warranty
Leather Type: Aniline Leather
Dimensions: W77 x D80 x H75 cm
Delivery Time: 1-2 Working Days — Optional: Rate Only', 6.0, 'Nos.', 2671.427, 2428.57, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 23, 'i1.', null, 'Brooklyn Minimalist Two Seater Modern
Office Sofa:

New York Style Minimalist Office Sofa, Comfortable and Light Weight, Legs and the Frame Made of Black Painted Solid Wood

Upholstery Color: Leather Brown
Upholstery Material: PU Leather
Warranty: 2 Year Limited Warranty
Leather Type: PU Leather
Dimensions: W180 x D67 x H68 cm
Delivery Time: 2-4 Working Days', 1.0, 'Nos.', 2011.427, 1828.57, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 24, 'i2.', null, 'Alternative Option:
Melo Three Seater Lounge Sofa by Kino:

Inspired from jelly sweets, the shape of Melo is round, organic and elegant. Touched round and smooth, the shapes of back and armrests serve an excellent seating experience as well.

Archi Colors: MIN-18 Mint Green
Archini Melo Sizes: 3-Seater MEL-SO-03
Warranty: 2 Year Limited Warranty
Dimensions: W196 x D84 x H72 cm
Delivery Time: 2-4 Working Days — Optional: Rate Only', 1.0, 'Nos.', 2889.337, 2626.67, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 25, 'i3.', null, 'Alternative Option:
Ayuni Genuine Leather Three Seater Sofa:

A three-seater minimalist sofa upholstered with genuine leather. This sofa offers comfortable leather kind and a spacious seat for a maximum comfort. The sleek design and powder-coated black steel legs provide a simple yet classy look.

Upholstery Color: ND9715 Ash Grey Leather
Warranty: 4 Year Limited Warranty
Leather Type: Aniline Leather
Dimensions: W209 x D92 x H82 cm
Production Time: 8-10 Weeks — Optional: Rate Only', 1.0, 'Nos.', 4557.146, 4142.86, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 26, 'i4.', null, 'Alternative Option:
Detroit Three Seater Genuine Leather Arm Chair:

Sleek, minimalist design with a black leather finish and distinct clean lines. This sofa is supported by a modern metal frame with a matte black finish. The cushions are plush and well-padded, providing a balance between comfort and sophistication.

Upholstery Color: 3A-8813 Warm Grey Leather
Warranty: 2 Year Limited Warranty
Leather Type: Genuine Leather
Dimensions: W175 x D81 x H78 cm
Delivery Time: 2-4 Working Days — Optional: Rate Only', 1.0, 'Nos.', 4714.281, 4285.71, 10.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 27, 'j.', null, 'Milan Round Meeting Table:

The Milan meeting table is remarkably designed with a chamfered edge and a stainless steel round flat disc base that makes it stable. Perfectly suits small meetings, universities, and office pantry. Different color options for the frame and worktops are available.

Worksurface Finish: Starke® Pro White
Frame Color: Powder Coated White
Round Table Dimension: Dia 100 x H74
Warranty: 3 Year Limited Warranty
Delivery Time: 1-2 Working Days', 1.0, 'Nos.', 990.0, 900.0, 10.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 28, 'C.', null, 'Delivery and Installation (Dubai)', 1.0, 'Nos.', 387.618, 352.38, 10.0, false, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
