set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and source_file = 'Additional Work No. 1 - Villa 1 Meadows 5 - 20.05.26 - Updated.xlsx';
insert into variations(project_id, vo_no, description, value) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 1, 'Additional Work No. 1 - Villa 1 Meadows 5 - 20.05.26 - Updated', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and vo_no = 1;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 'VARIATION', 0, v, 'Additional Work No. 1 - Villa 1 Meadows 5 - 20.05.26 - Updated', 'BBC/042026/00075_rev00', 'DRAFT', '2026-05-21', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in the BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'Additional Work No. 1 - Villa 1 Meadows 5 - 20.05.26 - Updated.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'ADDITIONAL WORK NO.1') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'A.', null, 'Arch Shape Open Shower Area (Near Barbecue Area) 

size: 1.30m × 1.50m 

1. Layout & Marking 
Marking the arch shape open shower area near the barbecue area as per approved design. Ensuring proper alignment and aesthetic appearance. 
2. Base Preparation 
Excavating and leveling the area. 
Preparing concrete base with proper 
drainage slope. 
3. Arch Structure Construction 
Constructing decorative arch-shaped structure using block work, concrete, or metal frame as per design. Ensuring strong support and smooth curved finishing. 
4. Plumbing Installation 
Installing water supply lines and drainage 
system. Fixing shower mixer and shower head properly. 
5. Finishing Work 
Applying plaster and smooth finishing on arch structure. Installing tiles, stone, or textured finish as per design.', 1.0, 'Nos.', 10660.0, 8200.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'B.', null, 'Supply & Installation of Real Stone Coping (Swimming Pool)

1. Material Supply 
Supplying natural real stone coping suitable for swimming pool use. Stone color, texture, and finish as per approved selection. 
2. Surface Preparation 
Cleaning and leveling the pool edge surface. Preparing base for proper stone installation. 
3. Layout & Marking 
Marking coping layout around swimming pool edges. Ensuring equal alignment and smooth corner finishing. 
4. Stone Coping Installation 
Installing real stone coping using high quality adhesive/mortar. Maintaining proper slope towards pool or drainage side. Cutting and shaping stones neatly for corners and curves. 
5. Joint Filling & Finishing 
Applying waterproof grout or joint filler between stones. Ensuring clean and smooth finishing. 
6. Cleaning & Protection 
Cleaning excess mortar and grout from stone surface. Protecting installed coping until full curing.', 1.0, 'Nos.', 15600.0, 12000.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'C.', null, 'Supply & Installation of Porcelain Travertine Tiles (1cm Thickness – Swimming Pool Wall Tiles) 

1. Material Supply 
Supplying 1cm thick porcelain tiles with travertine effect finish suitable for swimming pool walls. Ensuring high-quality, water-resistant, and durable material. Color and pattern as per approved selection. 
2. Surface Preparation 
Cleaning and leveling pool wall surfaces before installation. 
3. Layout & Marking 
Marking tile layout and pattern as per approved design. Ensuring proper alignment and balanced appearance.
4. Tile Installation
Installing porcelain travertine tiles using high-quality pool-grade adhesive. Maintaining proper spacing, alignment, and level. Neat cutting and finishing around corners and fittings. 
5. Grouting Work 
Applying waterproof grout between tile joints. Ensuring sealed and durable finishing.
6. Cleaning & Finishing
Cleaning excess adhesive and grout from tile surface. Checking overall finishing and tile alignment.', 1.0, 'Nos.', 10140.0, 7800.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'D.', null, 'Supply & Installation of 2cm Travertine Finish Floor Tiles & Planter Box Tiles

1. Material Supply 
Supplying 2cm thick travertine finish floor tiles and planter box tiles suitable for outdoor patio areas. Ensuring durable, weather-resistant, and outdoor-grade materials. Color, texture, and pattern as per approved selection. 
2. Surface Preparation 
Cleaning, leveling, and preparing the patio floor and planter box surfaces before installation. Ensuring proper substrate preparation for strong bonding and long-lasting performance. 
3. Layout & Marking 
Marking tile layout, pattern, and installation direction as per approved design. Ensuring proper alignment, symmetry, and balanced appearance for both floor and 
planter areas.
4. Tile Installation
Installing 2cm travertine finish floor tiles and planter box tiles using high-quality tile adhesive/mortar. Maintaining proper spacing, levels, and required slope for water drainage where applicable. Neat cutting, fitting, and finishing around edges, corners, and planter box details. 
5. Grouting & Finishing Work 
Applying suitable grout between tile joints. Ensuring clean, uniform, and durable finishing. Final cleaning and inspection upon completion.', 1.0, 'Nos.', 12220.0, 9400.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'E.', null, 'Planter Box Construction gravel finishing and lights  

1. Layout & Marking 
Marking the location of one planter box in patio area as per approved design. Ensuring proper alignment and spacing. 
 2. Planter Box Construction 
Constructing planter box using solid concrete blocks. Applying plaster and smooth finishing. Providing waterproofing inside planter box to prevent leakage. 
 3. Gravel Installation 
Installing decorative gravels inside planter box around the olive tree. Ensuring neat and premium appearance. 
 4. Focus Lights Installation 
Installing 2 focus lights directed towards the olive tree. Providing proper wiring and waterproof electrical connections. 
 5. Testing & Finishing 
Testing focus lights for proper operation and angle adjustment. Cleaning planter box and surrounding patio area.', 1.0, 'Nos.', 3835.0, 2950.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'F.', null, 'Supply & Installation of Bushy Olive Tree in Planter Box 
 
1. Plant Supply 
Supplying healthy bushy olive tree with proper shape and balanced growth. Ensuring premium quality suitable for planter box installation. 
 2. Planter Box Preparation 
Preparing planter box with proper waterproofing and drainage system. Filling with suitable soil mix and compost for healthy growth. 
 3. Olive Tree Installation 
Installing olive tree centrally in planter box with proper leveling and alignment. Ensuring stable and secure positioning. 
 4. Final Cleaning & Handover 
Cleaning planter box and surrounding area. Handover in complete and ready condition.', 1.0, 'Nos.', 3640.0, 2800.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'G.', null, 'Barbecue Topcounter (Marble)

1. Installation Work 
Marble cutting as per site measurements and BBQ unit design. Fixing of marble top using high-strength 
adhesive / marble glue. Proper alignment, leveling, and joint finishing. Sealing of joints using epoxy / color
matched sealant 
2. Finishing Works 
Grinding and polishing of installed marble surface on site (if required). Cleaning and removal of stains, cement marks, or adhesive residue. Final surface sealing for stain and heat resistance', 1.0, 'Nos.', 5850.0, 4500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'H.', null, 'Supply & Installation of Stone-Look Sheet Cladding front side 

1. Material Supply 
Supplying premium quality stone-look sheet cladding suitable for exterior decorative finishing. Material will be weather-resistant, durable, and suitable for outdoor conditions. Color, texture, and finish as per approved selection. 
2. Surface Preparation 
Cleaning and preparing wall surface before installation. Ensuring wall is level and ready for cladding application. 
 3. Cladding Installation 
Installing stone-look sheet cladding panels at front side Maintaining straight alignment and clean joint finishing. Neat cutting around corners, edges, and openings. 
4. Joint Sealing & Finishing 
Applying suitable sealant and finishing trims where required. Ensuring clean appearance and protection 
against moisture. 
5. Cleaning & Inspection 
Cleaning panel surfaces after installation. Inspecting alignment, joints, and overall finishing quality.', 1.0, 'Nos.', 45240.0, 34800.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'I.', null, 'WPC Works @ Swimming Pool Area:

Supply and installation of outdoor-grade WPC (Wood Plastic Composite) decking/cladding works at swimming pool area including WPC boards, support subframe system, fixing accessories, trims, edge finishing, alignment, leveling,', 1.0, 'Nos.', 11050.0, 8500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'I.', null, 'Electrical Works:

a. additional 2 sets single sockets
b. additional 3 sets double sockets
c. additional 4 wall lights with switch
d. relocation 2 sets of single sockets
e. relocation of 1 set of data outlet', 1.0, 'Nos.', 0.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'J.', null, 'WPC Skirting Works

Bedroom 01 = 19.40 LM
Bedroom 02 = 23.50 LM
Bedroom 03 = 19.80 LM
Master''s Bedroom = 36.90 LM', 115.5, 'LM', 0.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'K.', null, 'Marble Skirting Works for ground floor', 8.8, 'LM', 0.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'L.', null, 'Fabrication, Supply & Installation of Aluminum 3 Shutter Ultra Slim Luxury line Internal Slider by Aluminum Systems.

Glass Specification - 10mm Thick Bronze Tinted Tempered Glass (SMART FILM)

Profiles: - Single sliding set, Top track for sliding, Top track cover, vertical profile with clip, horizontal profile, sliding handle, Fix bracket set glass support, Gaskets, silicon sealant & all accessories 

RAL Color - Powder quoted as per Approved color. 
Window Code: GL-01 
Width x Height - 2700mm x 2695mm', 1.0, 'Nos.', 35100.0, 27000.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'N.', null, 'MAIN DOOR:

Removal of existing door then supply and installation of new door in wood finish

Size: 260cm W x 240cm H with additional blockworks for the required depth (40cm W x 240cm H) — To be confirmed and quoted separately at variation works no. 2', 1.0, 'Nos.', 0.0, null, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'O.', null, 'Blockwork of 10cm thickness including plastering and make good finished in Ground floor corridor', 1.0, 'Nos.', 3276.0, 2520.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, 'P.', null, 'Additional block works of the wall as per size requirements in Kitchen and Living window area', 1.0, 'Nos.', 1950.0, 1500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, 'Q.', null, 'Enlargement of the door and window opening and make a good finished in FF dressing room and Kitchen hallway area (patio)', 1.0, 'Nos.', 3757.0, 2890.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, 'R.', null, 'Window Shift including block removal, plastering to make good finished in kitchen area.', 1.0, 'Nos.', 3250.0, 2500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, 'S.', null, 'Supply and apply of paint on ceiling (286 sqm) at Ground Floor', 1.0, 'Nos.', 11154.0, 8580.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, 'T.', null, 'Supply and Installation of tiles in areas affected by demolition works.', 1.0, 'Nos.', 0.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, 'U.', null, 'Supply of 2 Washingtonia trees at 4m height (crane required for installation). 

Note: BOQ item H4 amended from 3m to 4m, price revised from AED 3,120 to approx. AED 8,385 per piece.', 2.0, 'Nos.', 8385.0, 6450.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, 'V.', null, 'Supply and apply of paint on wall (550 sqm) at Ground Floor', 1.0, 'Nos.', 21450.0, 16500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 22, 'W.', null, 'Existing ceiling light location change at Ground Floor', 1.0, 'Nos.', 1950.0, 1500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 23, 'X.', null, 'Supply and apply of paint on ceiling (286 sqm) at First Floor (238 sqm)', 1.0, 'Nos.', 9282.0, 7140.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 24, 'Y.', null, 'Supply and apply of paint on wall (498sqm) at First Floor', 1.0, 'Nos.', 19422.0, 14940.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 25, 'Z.', null, 'Existing ceiling light location change at First Floor', 1.0, 'Nos.', 1950.0, 1500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 26, 'A2.', null, 'Fabrication, Supply and Installation of 10mm Thick Clear Tempered Glass for Aluminium framed 2 Shutter Hinged Door by SEG Ultra Slim Internal System 

Glass Specification - 10mm Thick Bronze Tinted Tempered Glass (Metal Mesh Glass) 
RAL Color - As per Approved Powder Coated color. 

Window Code: GL-02 
Location: Ground Floor 
Width x Height - 1150mm x 2695mm 

Inclusions:
Supply of Swing Door Accessories (Hinges, Locks and Standard 1.0m Door Handle and other Accessories) 

Note:
- The Quoted RAL color is based on our standard color palette. Any changes to the color may incur additional cost
- The Quote is based on the standard 1m Door Handle. Custom Handle requirements may vary the price', 3.0, 'Nos.', 28167.1, 21667.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 27, 'B2.', null, 'Fabrication, Supply & Installation of Aluminum 2 Track 2 panel Sliding ( 2 SLIDING) window by (Thermal Break) System. 

Glass Specification: Vision Glass: - 32mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 20mm Air gap + 6mm Thick HD Grey Glass) 

Profiles: - Frame, Shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories. 

RAL Color - As per Approved Powder Coated color. 
Window Code: E04 
Location: G.F. Salon 
Width x Height - 2760mm x 2510mm', 1.0, 'Nos.', 19812.0, 15240.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 28, 'C2.', null, 'Glass Supply & Shift of Fixed window Glass: 

Specification: Vision Glass: - 28mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 16mm Air gap + 6mm Thick HD Grey Glass) (Shift & fixing the old window )

Window Code: W02 
Location: GROUND FLOOR KITCHEN ISLAND
Width x Height - 1200mm x 2060mm', 1.0, 'Nos.', 2570.88, 1977.6, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 29, 'D2.', null, 'PERGOLA POOL AREA:

1. Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (10.30 m x 2.9 m), as per approved drawings.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Rafters: 10 cm x 4 cm aluminium tube profile, RAL colour powder-coated

Notes:
- Quotation is prepared strictly as per the approved drawings; any changes in design, dimensions, or specifications may result in price variation.
- Price will vary for wooden texture grid finish & metallic finish.

2. Supply and installation of Steel provisions inside the longer beams', 1.0, 'Nos.', 37537.5, 28875.0, 30.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'B', 'DEDUCTION WORK NO. 1') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'B6.', null, 'Careful removal of existing fixed window, including frame, glazing,  and associated fixings, and making good surrounding finishes (plastering, leveling, and preparation) to receive new sliding door.

Location: FF Hallway Area', -1.0, 'Nos', 1300.0, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'B8.', null, 'Careful demolition and removal of non-structural wall to create a new door opening, glass window, and enlarged window opening, including cutting, chipping, plastering, leveling, and finishing of surrounding surfaces.

Location: Master Bedroom Area', -1.0, 'Nos', 4420.0, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'C7.', null, 'Supply and installation of LVT (Luxury Vinyl Tiles) flooring in chevron pattern, 3 mm thickness with self-leveling subfloor preparation, including surface cleaning, adhesive application, precise laying, pattern alignment, jointing, finishing, and protection of finished surfaces.

Brand/Type: Meter Squared
Location: Salle De Sport', -1.0, 'Nos', 11294.4, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'C13.', null, 'Supply and installation of gypsum board bulkhead, including metal framing, gypsum boards, fixing, jointing, alignment, and surface preparation, ready to receive wooden cladding.

Location: Salle de Sport
Note: Wooden cladding not included', -1.0, 'Nos', 1887.6, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'C14.', null, 'Cutting and preparation of openings for trimless A/C grille in gypsum board ceiling/wall, including accurate marking, cutting, edge finishing, making good, alignment, and protection of surrounding finishes.

Location: Salle de Sport', -1.0, 'Nos', 117.0, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'E7.', null, 'Supply, fabrication, and installation of a fixed aluminum framed glass window, complete with black matte aluminum frame, tempered glass, gaskets, alignment, leveling, and final cleaning. 

Size: 60cm L x 80cm H
Location: Chambre De Bonne', -1.0, 'Nos', 592.8, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'E10.', null, 'Supply, fabrication, and installation of a fixed aluminum framed glass window, complete with black matte aluminum frame, tempered glass, gaskets, alignment, leveling, and final cleaning.

Size: 131cm L x 70cm H
Location: Salle de Sport', -1.0, 'Nos', 3393.49, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'E11.', null, 'Supply, fabrication, and installation of fixed glass panel with hinged aluminum door, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, and final cleaning.

Size: 430cm L x 230cm H
Location: Salle de Sport', -1.0, 'Nos', 14142.7, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'E15.', null, 'Supply, fabrication, and installation of single hinged glass door with aluminum frame, including hinges, handle, lock, sealing, alignment, and finishing.

Size: 86cm L x 270cm H
Location: Cabine de Massage', -1.0, 'Nos', 3320.46, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'E16.', null, 'Supply, fabrication, and installation of a black matt aluminum patio door system (2.2 mm thick aluminum profile), complete with double-glazed glass comprising 6 mm clear glass + 6 mm Guardian reflective glass, including frame, sash, rollers/hinges, locking system, handles, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 135cm L x 220cm H
Location: Cabine de Massage', -1.0, 'Nos', 4054.05, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'E17.', null, 'Supply, fabrication, and installation of glass panel and hinged/frameless door, including cutting to size, tempered glass supply, hinges, handles, seals, alignment, leveling, fixing, and protection of 
adjacent finishes.

Location: Salle De Sport', -1.0, 'Nos', 8373.3, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'E18.', null, 'Supply, fabrication, and installation of hinged aluminum framed glass window, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, 
and final cleaning.

Size: 120cm L x 240cm Ht
Location: Master Bedroom & Suite Joud', -1.0, 'Nos', 20592.0, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'E19.', null, 'Supply, fabrication, and installation of hinged aluminumframed glass window, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, 
and final cleaning.

Size: 63cm L x 130cm Ht
Location: Master Bedroom Dressing Area', -1.0, 'Nos', 995.41, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'F2.', null, 'Enclosed of Garage area.

a. Backfilling of the flooring with sand and compaction to make same level in the internal flooring.
b. Concrete screeding of the flooring and ready to accept flooring finished.
c. Block wall works for the door opening including pastering and lintel support.
d. Closing of windows and make a dummy wall.
e. Block wall adding and shift the door opening.
f. Block wall adding including plastering for storage and massage room.
g. Supply and Installation of AC ducting unit 
and AC grill including ducting, plenum box, thermostat and outdoor unit.
h. Supply and Installation of electrical provision, sockets, lighting, switches, testing and commissioning.', -1.0, 'Nos', 56797.0, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'G7a.', null, 'Aluminium Pergola Work @ Villa Front Side:

- Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (5.22 m x 5.06 m), as per approved drawings.
- Supply and installation of Steel provisions inside the longer beams.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Rafters: 10 cm x 4 cm aluminium tube profile, RAL colour powder-coated

Notes:
Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.', -1.0, 'Nos', 26973.74, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, 'G8.', null, 'Aluminium Pergola Work @ Outside Salon:

- Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (4.75 m x 1.2 m), as per approved drawings.
- Supply and installation of Steel provisions inside the longer beams.

Specifications:
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated
Rafters: 10 cm x 4 cm aluminium tube profile, wooden texture powder-coated

Notes:
Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.', -1.0, 'Nos', 7234.5, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, 'H4.', null, 'Plants Work:

Supply of washingtonia plant 3 meter', -1.0, 'Nos', 6240.0, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, 'E4.', null, 'Supply, fabrication, and installation of a black matt aluminum patio door system (2.2 mm thick aluminum profile), complete with double-glazed glass comprising 6 mm clear glass + 6 mm Guardian reflective glass, including frame, sash, rollers/hinges, locking system, handles, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 280cm L x 240cm H
Location: Salon', -1.0, 'Nos', 9172.8, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, 'E12.', null, 'Supply, fabrication, and installation of double hinged glass door with wood leaf coated frame, including hinges, handles, lock, sealing, alignment, and finishing.

Size: 113cm L x 220cm H
Location: In between Sejour & Salle A Manger', -3.0, 'Nos', 7440.42, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, 'E14.', null, 'Supply, fabrication, and installation of a black matt aluminum patio door system (2.2 mm thick aluminum profile), complete with double-glazed glass comprising 6 mm clear glass + 6 mm Guardian reflective glass, including frame, sash, rollers/hinges, locking system, handles, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 112cm L x 220cm H
Location: Cuisine De Finition', -1.0, 'Nos', 3043.04, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, 'G6a.', null, 'Aluminium Pergola Work @ New Pool Area:

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
Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.', -1.0, 'Nos', 58017.18, null, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, 'C15.', null, 'Supply and installation of stone-look sheet cladding for exterior walls (thin stone veneer sheets), including surface preparation, adhesive fixing, jointing, leveling, cleaning, and protection of adjacent finishes.

Thickness: 10mm thk.
Location: Patio D''Entrée', -1.0, 'Nos', 23402.11, null, null, false, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
