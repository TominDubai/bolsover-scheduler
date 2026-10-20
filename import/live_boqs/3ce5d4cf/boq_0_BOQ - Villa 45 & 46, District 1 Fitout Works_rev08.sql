set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '3ce5d4cf-aa9c-440a-826c-d6fedb0779d6' and source_file = 'BOQ - Villa 45 & 46, District 1 Fitout Works_rev08.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('3ce5d4cf-aa9c-440a-826c-d6fedb0779d6', 'QUOTE', 8, v, 'Villa 45 & 46, District 1 Fitout Works', 'BBC/112025/00027_rev06', 'DRAFT', '2025-12-29', 350, null, 'BOQ - Villa 45 & 46, District 1 Fitout Works_rev08.xlsx', '30% advance, 70% on progress') returning id into b;
update boqs set discount = 160408.96 where id = b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Mobilization and demobilization, including transport of equipment, machinery, personnel to/from site, setup and removal of site facilities', 1.0, 'LS', 32775.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Site supervision, management, and coordination, including monitoring construction activities, ensuring quality control, safety compliance, schedule adherence, subcontractor coordination, and reporting to client/consultant as per project requirements.', 1.0, 'LS', 27312.5, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply, installation, and removal of temporary lighting system including wiring, fixtures, mounting, electrical connections, and safety measures.', 1.0, 'LS', 14750.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Provision of equipment, power hand tools, and scaffoldings, includes supply, setup, operation, and maintenance of all required construction equipment, hand tools, and temporary scaffolding structures for safe and efficient execution of works as per site requirements.', 1.0, 'LS', 19665.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Material handling and labor support, including unloading, storage, internal transport of construction materials, assistance to skilled trades, and on-site labor coordination to support ongoing construction activities.', 1.0, 'LS', 21850.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Provision of Third-Party Liability and Contractors All Risks (CAR) Insurance, covers project-related risks, damages, and liabilities to third parties, including material, equipment, and construction works during the contract period, as per UAE regulations and approved contract requirements.', 1.0, 'LS', 25127.5, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, null, null, 'All construction drawings, specifications, and other necessary details required for the execution of the works by client', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, null, null, 'Coordination, submission, and follow-up for all required approvals and fees from relevant authorities & government by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'D', 'Ground Floor') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'D1a.', 'D1. Flooring Works:', 'Installation of client-supplied Emperador White marble stone flooring, including surface preparation, leveling, alignment, fixing with approved adhesive/mortar, joint finishing, grouting with matching color, polishing if required, and final cleaning.

Drawing Code: FF-MS-01b
Type: Emperador White Marble
Size: 120cm x 120cm, 20mm thk.
Finish: Honed Finish
Location: Powder Room — Removed: To be done by Main Contractor', 10.625, 'sqm', 360.0, 300.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'D1ba.', 'D1. Flooring Works:', 'Supply of Fiandre Luna Limestone porcelain floor tiles, including supply of materials.

Drawing Code: FF-PO-01a
Type: Fiandre - Luna Limestone Porcelain Tile
Size: 1200mm x 1200mm
Finish: Slate Finish
Location: Guest Bathroom', 18.625, 'sqm', 540.0, 450.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'D1bb.', 'D1. Flooring Works:', 'Installation of Fiandre Luna Limestone porcelain floor tiles, including cutting, leveling, laying with approved adhesive, alignment of joints, grouting with matching color, cleaning, and protection of finished surface.

Drawing Code: FF-PO-01a
Type: Fiandre - Luna Limestone Porcelain Tile
Size: 1200mm x 1200mm
Finish: Slate Finish
Location: Guest Bathroom', 18.625, 'sqm', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'D1c.', 'D1. Flooring Works:', 'Installation of client-supplied Emperador White marble thresholds, including surface preparation, cutting/adjustment if required, alignment, fixing with approved adhesive/mortar, polishing, joint finishing, and final cleaning.

Drawing Code: TH-MS-01
Type: Emperador White Marble
Size: Cut-to Size
Finish: Polished Finish
Location: 
1. Powder Room = 0.85m L x 0.20m W - (2 Nos)
2. Guest Bathroom = 0.90m L x 0.17m W - (2 Nos) — Removed: To be done by Main Contractor', 4.0, 'Nos', 540.0, 450.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'D2a.', 'D2. Ceiling Works', 'Supply and installation of 12.5 mm thick regular gypsum board ceiling, ready for primer', 294.0, 'sqm', 114.0, 95.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'D2b.', 'D2. Ceiling Works', 'Supply and installation of 12.5 mm thick MR gypsum board ceiling ready to receive primer', 78.0, 'sqm', 126.0, 105.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'D2c.', 'D2. Ceiling Works', 'Supply and installation of 10 x 10 mm shadow gap', 320.0, 'LM', 30.0, 25.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'D2d.', 'D2. Ceiling Works', 'Supply and installation of precast gypsum light cove bulkhead', 152.0, 'LM', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'D2e.', 'D2. Ceiling Works', 'Supply and installation of precast gypsum double light cove bulkhead', 180.0, 'LM', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'D2f.', 'D2. Ceiling Works', 'Supply and installation of curtain pelmet with light cove including 18 mm plywood backing', 60.0, 'LM', 174.0, 145.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'D2g.', 'D2. Ceiling Works', 'Supply and installation of curved precast gypsum light cove bulkhead', 24.0, 'LM', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'D2h.', 'D2. Ceiling Works', 'Supply and installation of gypsum board bulkhead on staircase area & open area', 12.0, 'LM', 180.0, 150.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'D2i.', 'D2. Ceiling Works', 'Supply and installation of curtain pelmet with light cove including 18 mm plywood backing - (Detail A3 & B5)', 16.0, 'LM', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'D2j.', 'D2. Ceiling Works', 'Supply and installation of precast gypsum shadow gap (50 x 50mm)', 80.0, 'LM', 54.0, 45.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'D2k.', 'D2. Ceiling Works', 'Preparation of trimless A/C grill', 176.0, 'LM', 36.0, 30.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, 'D2l.', 'D2. Ceiling Works', 'Installation of trimless light frame', 110.0, 'Nos', 36.0, 30.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, 'D2m.', 'D2. Ceiling Works', 'Supply and installation of access panel upto 60 x 60cm', 24.0, 'Nos', 300.0, 250.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, 'D2n.', 'D2. Ceiling Works', 'Supply and apply of paint on the ceiling. (One coat primer, two coat stucco, two coat Rich mat white)', 640.0, 'sqm', 48.0, 40.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, 'D2o.', 'D2. Ceiling Works', 'Supply and installation of timber veneer panels for ceiling, including surface preparation, fixing of panels to ceiling framework, alignment, leveling, finishing with approved adhesive or mechanical fixing, and final cleaning.

Drawing Code: CF-VE-01a
Type: Timber Veneer Oak 13.024 Matt finish
Finish: Matt Finish
Location: Guest Bedroom', 5.5, 'sqm', 1260.0, 900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, 'D2p.', 'D2. Ceiling Works', 'Supply and installation of raked/fluted timber veneer panels for ceiling, including surface preparation, fixing to ceiling framework, precise alignment of fluted pattern, leveling, finishing, and final cleaning.

Drawing Code: WF-VE-01c
Type: Timber Veneer Oak 13.024 Raked / fluted, Open pores
Finish: Matt Finish
Location: Walk-in Wardrobe', 17.05, 'sqm', 2002.0, 1430.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, 'D3aa.', 'D3. Wall Finishes Works', 'Supply of Silver Travertine natural stone wall cladding, including supply of material.

Drawing Code: WF-ST-01a
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Main Entrance Area & Family Dining Area', 44.539, 'sqm', 396.0, 330.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, 'D3ab.', 'D3. Wall Finishes Works', 'Installation of Silver Travertine natural stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-01a
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Main Entrance Area & Family Dining Area', 44.539, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 22, 'D3ba.', 'D3. Wall Finishes Works', 'Supply of Silver Travertine natural stone wall cladding, including supply of material.

Drawing Code: WF-ST-01b
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Powder Room & Family Dining Area', 75.4323, 'sqm', 396.0, 330.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 23, 'D3bb.', 'D3. Wall Finishes Works', 'Installation of Silver Travertine natural stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-01b
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Powder Room & Family Dining Area', 75.4323, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 24, 'D3c.', 'D3. Wall Finishes Works', 'Supply and fixed installation of metal cladding for wall, including measuring, cutting, alignment, mechanical fixing or adhesive as per manufacturer’s instructions, finishing, cleaning, and protection of surfaces.

Drawing Code: WF-MT-01a
Type: 304 1mm with Electro Plating Bronze Finished
Location: Powder Room', 14.0, 'LM', 330.0, 275.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 25, 'D3d.', 'D3. Wall Finishes Works', 'Supply and application of ivory textured paint on wall surfaces, including surface preparation (cleaning, sanding, patching, and priming), application of two coats of approved textured paint, finishing to achieve uniform texture and color, touch-ups, and final cleaning.

Drawing Code: WF-PT-07
Type: Ivory Textured paint
Location: Walk-in Wardrobe', 194.1469, 'sqm', 336.0, 280.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 26, 'D3e.', 'D3. Wall Finishes Works', 'Supply and installation of Electroplating bronze finished metal transition strips, including cutting, fitting, alignment, and finishing.

Drawing Code: WF-MT-01a
Type: 304 1mm with Electro Plating Bronze Finished
Location: Guest Bedroom, Family Living (Glass Partition) & Main Entrance (Mirror Wall)', 551.0, 'LM', 210.0, 175.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 27, 'D3fa.', 'D3. Wall Finishes Works', 'Supply of natural travertine stone wall cladding, including supply of material.

Drawing Code: WF-ST-02a
Type: Natural Travertine Stone
Location: Guest Bathroom', 52.4454, 'sqm', 396.0, 330.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 28, 'D3fb.', 'D3. Wall Finishes Works', 'Installation of natural travertine stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-02a
Type: Natural Travertine Stone
Location: Guest Bathroom', 52.4454, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 29, 'D3ga.', 'D3. Wall Finishes Works', 'Supply of raked natural travertine stone wall cladding, including supply of material.

Drawing Code: WF-ST-02b
Type:  Raked Natural Travertine Stone
Location: Guest Bathroom', 19.151, 'sqm', 444.0, 370.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 30, 'D3gb.', 'D3. Wall Finishes Works', 'Installation of raked natural travertine stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-02b
Type:  Raked Natural Travertine Stone
Location: Guest Bathroom', 19.151, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 31, 'D3h.', 'D3. Wall Finishes Works', 'Supply and installation of 20 mm electro plating bronze finished metal skirting along wall perimeters, including cutting, edge treatment, fixing with adhesive and/or mechanical fasteners, alignment, joint finishing, and final cleaning.

Drawing Code: SK-MT-01b
Type: 304 1mm with Electro Plating Bronze Finished
Location: Family Dining Area', 66.99, 'LM', 210.0, 175.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 32, 'D3i.', 'D3. Wall Finishes Works', 'Supply and application of champagne metallic textured paint on wall surfaces, including surface preparation, two coats of approved paint, touch-ups, and final cleaning.

Drawing Code: WF-PT-05
Type: Champagne finish metallic textured paint
Location: Main Entrance Area & Family Living Area', 33.7975, 'sqm', 336.0, 280.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 33, 'D3j.', 'D3. Wall Finishes Works', 'Installation of client-supplied marble for countertop and vanity counter finishes, including surface preparation, cutting/trimming adjustments, fixing with adhesive, alignment, edge finishing, sealing, and final cleaning.

Drawing Code: CN-MS-03 & JN-MS-03
Type: White Calacatta marble
Finish: Polished Finish
Location: Powder Room — Removed: To be done by Main Contractor', 2.0, 'Nos', 2100.0, 1750.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 34, 'D3k.', 'D3. Wall Finishes Works', 'Supply and installation of MDF framing system to support 2mm thick mirror wall and travertine stone wall, including fabrication, fixing, alignment, leveling, and finishing.

Location: Entrance Area (Diamond Mirror)', 121.352, 'sqm', 264.0, 220.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 35, 'D4a.', 'D4. Glass Works', 'Supply and Installation of 10mm thk. Clear glass partition & door with electroplated frame

Size: 1700mm W x 2600mm H
Location: Guest Bathroom', 2.0, 'Nos', 7796.88, 6497.4, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 36, 'D4b.', 'D4. Glass Works', 'Supply and installation of Chelsea Fusion Diamond Mirror – Bronze Tint, including site measurement verification, cutting to size, polishing of edges, provision of backing support as required, adhesive fixing/system fixing, alignment, leveling, joint treatment, and final cleaning.

Drawing Code: MIR-01
Brand/Type: Chelsea Fusion Diamond Mirror - Bronze Tint 
Size: 2000mm W x 7000mm H
Location: Main Entrance', 2.0, 'Nos', 20100.0, 16750.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 37, 'D4c.', 'D4. Glass Works', 'Supply and installation of Laminated Metal Mesh Glass Partition, consisting of multiple panels at 485mm width each, including site measurement verification, fabrication of laminated metal-mesh glass panels, edge polishing, provision of all fixing accessories, brackets, channels, alignment, leveling, and secure installation.

Drawing Code: PR-GL-03
Brand/Type: Laminated metal mesh glass
Panel Configuration:
- Each panel approx. 485 mm (L)
- Panels spaced at equal distance
- Panels operable/opening at 40° angle
Location: Main Entrance', 2.0, 'Nos', 24600.0, 20500.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 38, 'D5a.', 'D5. Joinery Works', 'WALL CLADDING:

Supply and installation of wall cladding made of MDF with oak wood veneer finish, colour as per approved sample, details as per drawing    

Dimension: 4160mm L x 3000mm HT
Location: Staircase', 24.96, 'sqm', 1820.0, 1300.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 39, 'D5b.', 'D5. Joinery Works', 'TV WALL UNIT:

Supply and installation of wall cladding made of MDF with both side oak wood veneer finish, in center mirror finish, colour as per approved sample, details as per drawing

Dimension: 5200mm L x 3050mm HT
Location: Family Living
Note: Base Joinery Item to be checked and confirmed', 2.0, 'Nos', 40740.0, 29100.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 40, 'D5c.', 'D5. Joinery Works', 'WALL CLADDING COLUMN:

Supply and installation of wall cladding made of MDF with oak wood veneer finish, colour as per approved sample, details as per drawing      

Size: 3540mm L x 3050mm HT
Location: Family Living', 2.0, 'Nos', 12250.0, 8750.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 41, 'D5d.', 'D5. Joinery Works', 'OPEN SHELF AND WALL CLADDING: 

Supply and installation of open shelf made of SS metal shelf and back wall wood veneer finish, colour as per approved sample, details as per drawing

Size: 6970mmL x 3050mm HT
Location: Family Dining Area', 2.0, 'Nos', 34300.0, 24500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 42, 'D5e.', 'D5. Joinery Works', 'KITCHEN CABINET: 

Supply and installation of kitchen cabinet made of MDF with oak wood veneer finish, details as per drawing, colour as per approved sample, excluding sink & mixer (charges for installing marble for kitchen counter, marble supply by client (excluding back splash)

Size: 3213mmL x 650mmW x 3050mmHT     
Location: Family Dining Area — Removed: To be done by Main Contractor', 2.0, 'Nos', 30660.0, 21900.0, 40.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 43, 'D5f.', 'D5. Joinery Works', 'WALL CLADDING: 

Supply and installation of wall cladding made of flutted MDF with oak wood veneer finish, colour as per approved sample,details as per drawing 

Size: 1950mm L x 1900mm HT
Location: Powder Room', 2.0, 'Nos', 6440.0, 4600.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 44, 'D5g.', 'D5. Joinery Works', 'VANITY COUNTER: 

Supply and installation of vanity counter made of metal framing with marine plywood cladding for accomadate marble cladding, details as per drawing (excluding wash basin, mixer), charges for installing marble for vanity counter, marble supply by client (excluding backsplash)

Size: 1000mm L x 700mm W x 900mm HT
Location: Powder Room', 2.0, 'Nos', 8540.0, 6100.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 45, 'D5h.', 'D5. Joinery Works', 'MIRROR FRAME: 

Supply and installation of 6mm mirror frame 

Size: 1000mm L x 1000mm HT   
Location: Powder Room', 2.0, 'Nos', 2520.0, 1800.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 46, 'D5i.', 'D5. Joinery Works', 'MIRROR FRAME: 

Supply and installation of 6mm mirror frame 

Size: 2150mm L x 1000mm HT   
Location: Powder Room', 2.0, 'Nos', 3920.0, 2800.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 47, 'D5j.', 'D5. Joinery Works', 'HEADBOARD:

Supply and installation of head board made of MDF with center portion fabric finish and both side flutted and plain oak wood veneer finish, details as per drawing, colour as per approved sample

Size: 4460mm L x 3000mm HT   
Location: Guest Bedroom', 2.0, 'Nos', 24500.0, 17500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 48, 'D5k.', 'D5. Joinery Works', 'TV UNIT:

Supply and installation of TV unit wall cladding and floating table with drawer made of MDF with oak wood veneer finish, details as per drawing, colour as per approved sample

Wall cladding: 400mm L x 3000mm HT             
Floating table: 1500mm L x 3000mm HT
Location: Guest Bedroom', 2.0, 'Nos', 9450.0, 6750.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 49, 'D5l.', 'D5. Joinery Works', 'VANITY COUNTER:

Supply and installation of vanity counter made of metal frame and plywood for marble (Excluding wash basin and mixer), Charges for installing marble for vanity counter, marble supply by client. 

Size: 2400mm L x 500mm W x 400mm HT
Location: Guest Bathroom', 2.0, 'Nos', 6300.0, 4500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 50, 'D5m.', 'D5. Joinery Works', 'MIRROR FRAME:

Supply and installation of 6mm mirror with edge 
metal trim, electroplated finish

Size: 600mm Dia.
Location: Guest Bathroom', 2.0, 'Nos', 2520.0, 1800.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 51, null, 'D5. Joinery Works', 'Other Joinery Items not mentioned to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 52, 'D6a.', 'D6. Electrical Works', 'Fixing, termination, and final connection of a client-supplied single switched socket outlet, including installation and alignment of faceplate, secure fixing to back box, connection to pre-installed wiring provided by the Main Contractor, functional testing, and making good around the installation.

Note: Main Contractor to carry out first fix and provide wiring, containment, and back boxes. Bolsover to execute second/final fixing only. — Optional: Rate Only', 36.0, 'Nos', 96.0, 80.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 53, 'D6b.', 'D6. Electrical Works', 'Fixing of client-supplied twin switched socket outlet, including faceplate and alignment, connected to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 2.0, 'Nos', 144.0, 120.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 54, 'D6c.', 'D6. Electrical Works', 'Fixing of client-supplied floor-mounted electrical floor box, including alignment, faceplate installation, and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 6.0, 'Nos', 360.0, 300.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 55, 'D6d.', 'D6. Electrical Works', 'Fixing of client-supplied wall-mounted multi-purpose outlet, including faceplate installation and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 2.0, 'Nos', 336.0, 280.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 56, 'D6e.', 'D6. Electrical Works', 'Fixing of client-supplied wall-mounted twin switched sockets with double data outlets, including faceplate installation and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 2.0, 'Nos', 360.0, 300.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 57, 'D6f.', 'D6. Electrical Works', 'Fixing of client-supplied wall-mounted multi-purpose outlet, including alignment, faceplate installation, and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 2.0, 'Nos', 480.0, 400.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 58, 'D6g.', 'D6. Electrical Works', 'Fixing of client-supplied wall-mounted single switched socket with twin USB outlets, including alignment, faceplate installation, and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 4.0, 'Nos', 420.0, 350.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 59, 'D6h.', 'D6. Electrical Works', 'Fixing of client-supplied lighting switch, including connection to pre-installed wiring and faceplate installation.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 20.0, 'Nos', 150.0, 125.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 60, 'D7a.', 'D7. Sanitary Wares', 'Fixing of client-supplied wash basin, including alignment, securing to countertop, connection to pre-installed plumbing (water supply and drainage), testing for leaks, and final finishing. 

Location: Guest Bathroom & Powder Room
Note: First fix plumbing (supply and drainage lines) to be provided by main contractor.', 4.0, 'Nos', 420.0, 350.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 61, 'D7b.', 'D7. Sanitary Wares', 'Fixing of client-supplied mixer, including alignment, connection to pre-installed plumbing lines, securing to sink, countertop, or wall, testing for leaks, and final finishing. 

Location: Guest Bathroom & Powder Room
Note: First fix plumbing (supply lines, concealed pipes) to be provided by main contractor.', 4.0, 'Nos', 840.0, 700.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 62, 'D7c.', 'D7. Sanitary Wares', 'Fixing of client-supplied flush plate, including alignment, securing to pre-installed concealed cistern, ensuring proper operation of dual-flush mechanism, and final finishing. 

Location: Guest Bathroom & Powder Room
Note: First fix (cistern installation and concealed plumbing) to be provided by main contractor.', 4.0, 'Nos', 180.0, 150.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 63, 'D7d.', 'D7. Sanitary Wares', 'Fixing of client-supplied toilet paper holder, including alignment, securing to wall, checking stability, and final finishing. 

Location: Guest Bathroom & Powder Room
Note: First fix (wall preparation, backing/support as required) to be provided by main contractor.', 4.0, 'Nos', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 64, 'D7e.', 'D7. Sanitary Wares', 'Fixing of client-supplied hand spray, including alignment, connection to pre-installed plumbing lines, securing wall brackets, testing for leaks, and final finishing. 

Location: Guest Bathroom & Powder Room
Note: First fix plumbing (concealed pipes and valves) to be provided by main contractor', 4.0, 'Nos', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 65, 'D7f.', 'D7. Sanitary Wares', 'Fixing of client-supplied WC, including alignment, securing to pre-installed wall bracket/concealed frame, connection to pre-installed plumbing lines, sealing, checking for proper flushing operation, and final finishing. 

Location: Guest Bathroom & Powder Room
Note: First fix (frame, concealed cistern, and plumbing rough-in) to be provided by main contractor.', 4.0, 'Nos', 540.0, 450.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 66, 'D7g.', 'D7. Sanitary Wares', 'Fixing of client-supplied soft-closing toilet seat cover, including alignment and secure attachment to WC.

Location: Guest Bathroom & Powder Room', 4.0, 'Nos', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 67, 'D7h.', 'D7. Sanitary Wares', 'Fixing of client-supplied shower set, including showerhead, hand shower, mixer/valve, wall brackets, connection to pre-installed plumbing lines, alignment, testing for leaks and proper flow, and final finishing.

Location: Guest Bathroom
Note: First fix (concealed plumbing and rough-in) to be provided by main contractor.', 2.0, 'Nos', 720.0, 600.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 68, 'D7i.', 'D7. Sanitary Wares', 'Fixing of client-supplied Plumbing round brass angle valve, including alignment, connection to pre-installed piping, securing, and leak testing.

Location: Guest Bathroom & Powder Room', 4.0, 'Nos', 300.0, 250.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 69, 'D7j.', 'D7. Sanitary Wares', 'Fixing of client-supplied plumbing round washbasin siphon / bottle trap, including connection to pre-installed drain and trap piping, alignment, sealing, and leak testing.

Location: Guest Bathroom & Powder Room', 4.0, 'Nos', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 70, null, 'D7. Sanitary Wares', 'Other Sanitary Items not mentioned to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 71, 'D8a.', 'D8. Lighting Works', 'Installation of client-supplied trimless recessed LED spotlight, including marking, fixing of fixture, connection to pre-run wiring, alignment, testing, and making good to surrounding finishes — complete in all respects.', 56.0, 'Nos', 90.0, 75.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 72, 'D8b.', 'D8. Lighting Works', 'Installation and Fixing of client-supplied LED strip light, including alignment, securing into pre-prepared cove, connection to pre-installed electrical circuit, testing for proper operation and brightness, and final cleaning. 

Location: As per RCP layout
Note: First fix electrical wiring to be provided by main contractor.', 313.0, 'LM', 120.0, 100.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 73, 'D8c.', 'D8. Lighting Works', 'Installation of a client-supplied chandelier, including fabrication and installation of suitable support structure if required, fixing of chandelier to ceiling, electrical connection to existing point, alignment, leveling, testing, and final cleaning — complete in all respects as per manufacturer’s instructions and site conditions.

Location: Family Living, Dining Area & Powder Room', 8.0, 'Nos', 540.0, 450.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 74, 'D8d.', 'D8. Lighting Works', 'Fixing and Alignment of 2.75 m aluminium track, installation of three (3) client-supplied track-mounted LED spotlights, connection to pre-installed wiring, testing, adjustment of beam direction, and final cleaning.

Location: Guest Bedroom
Note: First-fix wiring by main contractor.', 4.0, 'Nos', 360.0, 300.0, 20.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'E', 'First Floor') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'E1. Flooring Works: Wooden & Bathroom 01 & 02 Floorings Only', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'E1a.', null, 'Supply of Amalgama Herringbone semi-engineered timber flooring, including supply of material

Drawing Code: FF-EW-01
Type: Amalgama Herringbone/Prime
Material Code: HW3021 
Finish: UV Oiled
Location: Bedroom 01 & Bedroom 02', 161.095, 'sqm', 648.0, 540.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'E1b.', null, 'Installation of Amalgama Herringbone semi-engineered timber flooring, including acclimatization, surface preparation, underlay placement, fixing in herringbone pattern, sanding and UV oil finishing (if required), edge trimming, and final cleaning.

Drawing Code: FF-EW-01
Type: Amalgama Herringbone/Prime
Material Code: HW3021 
Finish: UV Oiled
Location: Bedroom 01 & Bedroom 02', 161.095, 'sqm', 156.0, 130.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'E1b.', null, 'Installation of client-supplied Emperador White marble stone flooring, including surface preparation, leveling, alignment, fixing with approved adhesive/mortar, joint finishing, grouting with matching color, polishing if required, and final cleaning — complete in all respects as per manufacturer’s recommendations and approved drawings.

Drawing Code: FF-MS-01b
Type: Emperador White Marble
Size: 120cm x 120cm 
Finish: Honed Finish
Location: Master Bathroom — Removed: To be done by Main Contractor', 60.625, 'sqm', 360.0, 300.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'E1ca.', null, 'Supply of natural travertine stone flooring, including supply of materials

Drawing Code: FF-ST-02a
Type: Natural Travertine Stone
Location: Bathroom 01 & 02', 41.375, 'sqm', 396.0, 330.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'E1cb.', null, 'Installation of natural travertine stone flooring, including cutting, surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups as required, and final cleaning.

Drawing Code: FF-ST-02a
Type: Natural Travertine Stone
Location: Bathroom 01 & 02', 41.375, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'E1d.', null, 'Supply and installation of metal finish threshold, including cutting to size, fixing, leveling with floor finishes, alignment, and final cleaning.

Location: Bathroom 01 & 02', 4.0, 'Nos', 300.0, 250.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'E2a.', 'E2. Ceiling Works', 'Supply and installation of 12.5 mm thick regular gypsum board ceiling, ready for primer', 350.0, 'sqm', 114.0, 95.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'E2b.', 'E2. Ceiling Works', 'Supply and installation of 12.5 mm thick MR gypsum board ceiling ready to receive primer', 80.0, 'sqm', 126.0, 105.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'E2c.', 'E2. Ceiling Works', 'Supply and installation of 10 x 10 mm shadow gap', 470.0, 'LM', 30.0, 25.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'E2d.', 'E2. Ceiling Works', 'Supply and installation of precast gypsum light cove bulkhead', 200.0, 'LM', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'E2e.', 'E2. Ceiling Works', 'Supply and installation of curtain pelmet with light cove including 18mm plywood backing', 40.0, 'LM', 174.0, 145.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'E2f.', 'E2. Ceiling Works', 'Supply and installation of precast gypsum light cove bulkhead (600mm)', 12.0, 'LM', 216.0, 180.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'E2g.', 'E2. Ceiling Works', 'Supply and installation of precast gypsum shadow gap (50 x 50mm)', 140.0, 'LM', 54.0, 45.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'E2h.', 'E2. Ceiling Works', 'Supply and installation of gypsum board bulkhead - (150-200mm)', 150.0, 'LM', 48.0, 40.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, 'E2i.', 'E2. Ceiling Works', 'Supply and installation of curved precast gypsum light cove bulkhead', 30.0, 'LM', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, 'E2j.', 'E2. Ceiling Works', 'Supply and installation of curtain pelmet with lightcove including 18mm plywood backing - (Detail A3 & B5)', 24.0, 'LM', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, 'E2k.', 'E2. Ceiling Works', 'Supply and installation of 18mm plywood backing for chandlier', 8.0, 'Nos', 420.0, 350.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, 'E2l.', 'E2. Ceiling Works', 'Installation of trimless light frame', 104.0, 'Nos', 36.0, 30.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, 'E2m.', 'E2. Ceiling Works', 'Preparation of trimless A/C grill', 150.0, 'LM', 36.0, 30.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, 'E2n.', 'E2. Ceiling Works', 'Supply and installation of access panel upto 60 x 60cm', 24.0, 'Nos', 300.0, 250.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, 'E2o.', 'E2. Ceiling Works', 'Supply and apply of paint on the ceiling. (One coat primer, two coat stucco, two coat Rich mat white)', 690.0, 'sqm', 48.0, 40.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 22, 'E2p.', 'E2. Ceiling Works', 'Supply and installation of metal ceiling panels, including cutting, fixing to ceiling framework, alignment, leveling, finishing, and protection.

Drawing Code: CF-MT-02
Type: Dark Bronze Metal 
Finish: Satin
Location: Master Bedroom', 18.26, 'sqm', 1020.0, 850.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 23, 'E2q.', 'E2. Ceiling Works', 'Supply and installation of Electroplating Bronze metal finished ceiling panels, including cutting, fixing to ceiling framework, alignment, leveling, finishing, polishing, and final cleaning.

Location: Master Bedroom', 97.13, 'LM', 330.0, 275.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 24, 'E3aa.', 'E3. Wall Finishes Works', 'Supply of Silver Travertine natural stone wall cladding, including supply of material.

Drawing Code: WF-ST-01a
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Corridor, Master Bedroom & Master Dressing Area', 124.19, 'sqm', 396.0, 330.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 25, 'E3ab.', 'E3. Wall Finishes Works', 'Installation of Silver Travertine natural stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-01a
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Corridor, Master Bedroom & Master Dressing Area', 124.19, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 26, 'E3b.', 'E3. Wall Finishes Works', 'Supply and installation of Timber Veneer Oak 13.024 wall cladding with matt finish, including cutting, edge treatment, fixing on suitable sub-frame or adhesive backing, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-VE-01a
Type: Timber Veneer Oak 13.024
Finish: Matt Finish
Location: Corridor', 33.0, 'sqm', 1260.0, 900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 27, 'E3ca.', 'E3. Wall Finishes Works', 'Supply of natural travertine stone wall cladding, including supply of material.

Drawing Code: WF-ST-02a
Type: Natural Travertine Stone
Location: Bathroom 02 & Bathroom 01', 109.4038, 'sqm', 396.0, 330.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 28, 'E3cb.', 'E3. Wall Finishes Works', 'Installation of natural travertine stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-02a
Type: Natural Travertine Stone
Location: Bathroom 02 & Bathroom 01', 109.4038, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 29, 'E3da.', 'E3. Wall Finishes Works', 'Supply of raked natural travertine stone wall cladding, including supply of materials

Drawing Code: WF-ST-02b
Type: Raked Natural Travertine Stone
Location: Bathroom 02', 29.425, 'sqm', 444.0, 370.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 30, 'E3db.', 'E3. Wall Finishes Works', 'Installation of raked natural travertine stone wall cladding, including cutting, surface preparation, fixing on suitable adhesive/sub-frame, alignment, joint finishing, and final cleaning.

Drawing Code: WF-ST-02b
Type: Raked Natural Travertine Stone
Location: Bathroom 02', 29.425, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 31, 'E3e.', 'E3. Wall Finishes Works', 'Supply and application of Greige paint (NCS-S-1002-Y50R, Semi-glossy finish) on wall surfaces, including surface preparation (cleaning, sanding, patching, priming), two coats of approved paint, touch-ups, and final cleaning.

Drawing Code: WF-PT-03
Type: NCS-S-1002-Y50R (Greige Paint Finish)
Finish: Semi-glossy finish
Location: Bedroom 02 & Bedroom 01', 219.6546, 'sqm', 336.0, 280.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 32, 'E3f.', 'E3. Wall Finishes Works', 'Supply and installation of electroplating bronze finished metal strips on wall, including cutting to length, alignment, fixing with adhesive and/or mechanical fasteners, edge finishing, and final cleaning.

Drawing Code: WF-MT-01a
Type: SS 304 1mm Electroplating Bronze Finished
Location: Bedroom 02', 26.0, 'LM', 210.0, 175.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 33, 'E3ha.', 'E3. Wall Finishes Works', 'Supply of Silver Travertine natural stone wall cladding, including supply of material.

Drawing Code: WF-ST-01b
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Master Bathroom', 71.9785, 'sqm', 396.0, 330.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 34, 'E3hb.', 'E3. Wall Finishes Works', 'Installation of Silver Travertine natural stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-01b
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Master Bathroom', 71.9785, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 35, 'E3i.', 'E3. Wall Finishes Works', 'Supply and installation of niche, including cutting, alignment, fixing, leveling, joint finishing, and protection.

Drawing Code: NI-ST-01b
Dimension: 250mm HT x 950mm L x 200mm D
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Master Bathroom', 2.0, 'Nos', 660.0, 550.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 36, 'E3j.', 'E3. Wall Finishes Works', 'Supply and installation of niche with 5 open shelves, including cutting, alignment, fixing, leveling, joint finishing, and protection.

Drawing Code: NI-ST-01b
Dimension: 2370mm HT x 300mm L x 450mm D
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Master Bathroom', 2.0, 'Nos', 3210.0, 2675.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 37, 'E3k.', 'E3. Wall Finishes Works', 'Supply and installation of niche, including cutting, alignment, fixing, leveling, joint finishing, and protection.

Dimension: 580mm radius × 520mm depth
Backwall Finish: Light beige fabric
Sidewall Finish: Greige paint (NCS-S-1002-Y50R, semi-gloss)
Location: Bedroom 01', 2.0, 'Nos', 960.0, 800.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 38, 'E3l.', 'E3. Wall Finishes Works', 'Supply and installation of niche with 3 open shelves, including cutting, alignment, fixing, leveling, joint finishing, and protection.

Dimension: 2150mm HT × 370mm L x 170mm depth
Shelves Finish: PVD Brushed Bronze
Sidewall Finish: Greige paint (NCS-S-1002-Y50R, semi-gloss)
Location: Bedroom 01', 2.0, 'Nos', 2760.0, 2300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 39, 'E3m.', 'E3. Wall Finishes Works', 'Supply and installation of niche with 5 open shelves, including cutting, alignment, fixing, leveling, joint finishing, and protection.

Dimension: 2300mm HT × 350mm L x 170mm depth
Shelves Finish: PVD Brushed Bronze
Sidewall Finish: Greige paint (NCS-S-1002-Y50R, semi-gloss)
Location: Bedroom 02', 2.0, 'Nos', 2580.0, 2150.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 40, 'E3n.', 'E3. Wall Finishes Works', 'Supply and installation of niche with 5 open shelves, including cutting, alignment, fixing, leveling, joint finishing, and protection.

Dimension: 2920mm HT × 300mm L x 250mm depth
Drawing Code: NI-VE-01b
Type/Finish: Timber Veneer Oak 13.024 Matt & moisture-resistant finish
Location: Bathroom 01 & Bathroom 02', 4.0, 'Nos', 3960.0, 3300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 41, 'E3oa.', 'E3. Wall Finishes Works', 'Supply of Travertine natural stone countertop, including supply of materials and template

Drawing Code: CN-ST-02a
Type: Natural Travertine Stone
Location: Bathroom 01', 3.795, 'sqm', 480.0, 400.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 42, 'E3ob.', 'E3. Wall Finishes Works', 'Installation of Travertine natural stone countertop, including surface preparation, cutting/trimming adjustments, fixing with adhesive, alignment, edge finishing, sealing, and final cleaning.

Drawing Code: CN-ST-02a
Type: Natural Travertine Stone
Location: Bathroom 01', 3.795, 'sqm', 420.0, 350.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 43, 'E3pa.', 'E3. Wall Finishes Works', 'Supply of Silver Travertine natural stone countertop, including supply of material and template

Drawing Code: CN-ST-01b
Type: Silver Natural Travertine Stone
Location: Bathroom 02', 3.003, 'sqm', 480.0, 400.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 44, 'E3pb.', 'E3. Wall Finishes Works', 'Installation of Silver Travertine natural stone countertop, including surface preparation, cutting/trimming adjustments, fixing with adhesive, alignment, edge finishing, sealing, and final cleaning.

Drawing Code: CN-ST-01b
Type: Silver Natural Travertine Stone
Location: Bathroom 02', 3.003, 'sqm', 420.0, 350.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 45, 'E4a.', 'E4. Glass Works', 'Supply and Installation of 12mm thk. Clear glass partition & doors with electroplated frame

Size: 4180mm W x 2800mm H
Location: Master Bathroom', 2.0, 'Nos', 20645.856, 17204.88, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 46, 'E4b.', 'E4. Glass Works', 'Supply and Installation of 6mm thk. Clear mirror with backlight (refer to design)

Size: 1460mm W x 2800mm H
Location: Master Dresser', 2.0, 'Nos', 7358.4, 6132.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 47, 'E4c.', 'E4. Glass Works', 'Supply and Installation of 6mm thk. Clear mirror (refer to design)

Size: 2160mm W x 2800mm W
Location: Master Dresser', 2.0, 'Nos', 10886.4, 9072.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 48, 'E4d.', 'E4. Glass Works', 'Supply and Installation of 6mm thk. Clear mirror with backlight (refer to design)

Size: 1100mm W x 2900mm H
Location: Bedroom 01', 2.0, 'Nos', 5742.0, 4785.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 49, 'E4e.', 'E4. Glass Works', 'Supply and Installation of 12mm. Thk. Clear glass partition & door with electroplated frame

Size: 2200mm W x 2720mm H
Location: Bedroom 01 Bathroom', 2.0, 'Nos', 10555.776, 8796.48, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 50, 'E4f.', 'E4. Glass Works', 'Supply and Installation of 6mm thk. Clear mirror with backlight (refer to design)

Size: 1040mm W x 2750mm H
Location: Bedroom 02', 2.0, 'Nos', 5148.0, 4290.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 51, 'E4g.', 'E4. Glass Works', 'Supply and Installation of 12mm. Thk. Clear glass partition & door with electroplated frame

Size: 2200mm W x 2720mm H
Location: Bedroom 02 Bathroom', 2.0, 'Nos', 10555.776, 8796.48, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 52, 'E5a.', 'E5. Joinery Works', 'WALL CLADDING:

Supply and installation of wall cladding made of MDF with oak wood veneer finish, colour as per approved sample, details as per drawing

Size: 4160mm L x 3000mm HT
Location: Stair Area', 24.96, 'sqm', 1820.0, 1300.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 53, 'E5b.', 'E5. Joinery Works', 'HEADBOARD (OPTION 01):

Supply and installation of head board made of MDF with oak wood veneer finish, details as per drawing, colour as per approved sample

Size: 3650mm L x 2800mm HT
Location: Master Bedroom', 2.0, 'Nos', 25900.0, 18500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 54, 'E5c.', 'E5. Joinery Works', 'HEADBOARD (OPTION 02):

Supply and installation of head board made of MDF with fabric finish and both side oak wood veneer finish, details as per drawing,colour as per approved sample

Size: 3650mm L x 2800mm HT
Location: Master Bedroom — Optional: Rate Only', 2.0, 'Nos', 30100.0, 21500.0, 40.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 55, 'E5d.', 'E5. Joinery Works', 'HEADBOARD (OPTION 03):

Supply and installation of head board made of MDF center portion marble finish and both side oak wood veneer finish,details as per drawing, colour as per approved sample (Excluding marble work)

Size: 3650mm L x 2800mm HT
Location: Master Bedroom — Optional: Rate Only', 2.0, 'Nos', 20300.0, 14500.0, 40.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 56, 'E5e.', 'E5. Joinery Works', 'TV + FIREPLACE UNIT:

Supply and Installation of TV Unit with cladding in fluted Grigio Perlatto Marble to hang from ceiling with proper MDF and metal support inside. Provision for 50" TV to be in pivot mechanism for rotation. Metal trim around TV. Bottom console cladded with Grigio Perlatto wo have proper MDF boxing inside. Provision for fire cassette. 

Hanging Size: 1845 x 2050ht x 200mm
Console Size: 2500 x 300ht x 415mm
Location: Master Bedroom', 2.0, 'Nos', 63840.0, 45600.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 57, 'E5f.', 'E5. Joinery Works', 'CABINET:

Supply and installation of cabinet made of MDF with inside melamine and outside wood veneer finish, details as per drawing, colour as per appoved sample

Size: 2200mm L x 600mm W x 2800mm HT
Location: Master Bedroom', 2.0, 'Nos', 14700.0, 10500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 58, 'E5g.', 'E5. Joinery Works', 'SHELF:

Fabrication and supply of shelf made of MDF with pu paint finish, back wall made of MDF with wood veneer

Size: 3650mm L x 2800mm HT 
Location: Master Bedroom', 2.0, 'Nos', 28700.0, 20500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 59, 'E5h.', 'E5. Joinery Works', 'PASSAGE CABINET:

Supply and installation of cabinet made of MDF with inside melamine and outside wood veneer finish, details as per drawing, colour as per appoved sample

Size: 2100mm L X 600mm W x 2800mm HT
Location: Master Bedroom', 2.0, 'Nos', 14700.0, 10500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 60, 'E5i.', 'E5. Joinery Works', 'WALL CLADDING:

Supply and installation of wall cladding made of MDF with oak wood veneer finish

Location: Master Bedroom & Master Dressing', 153.585, 'sqm', 1260.0, 900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 61, 'E5j.', 'E5. Joinery Works', 'FLUTED WALL CLADDING:

Supply and installation of wall cladding made of fluted MDF with oak wood veneer finish

Location: Master Bedroom', 4.312, 'sqm', 1820.0, 1300.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 62, 'E5k.', 'E5. Joinery Works', 'VANITY COUNTER WITH SIDE OPEN SHELF:

Supply and installation of vanity counter made of Metal framing and marine plywood to accomadate marble cladding and side shelf made of MDF with oak wood veneer finish, details as per drawing, colour as per approved sample, marble supply by client

Size: 2570mm L x 580mm W x 900mm HT    
open shelf : 580mm L x 415mm W x 1900mm HT
Location: Master Bathroom', 2.0, 'Nos', 12320.0, 8800.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 63, 'E5l.', 'E5. Joinery Works', 'MIRROR FRAME:

Supply and installation of 6mm mirror with edge metal trim, electroplated finish

Size: 1740mm L x 1900mm HT   
Location: Master Bathroom', 2.0, 'Nos', 5250.0, 3750.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 64, 'E5m.', 'E5. Joinery Works', 'HEADBOARD:

Supply and installation of head board made of MDF with fabric finish, details as per drawing, as per approved sample

Size: 5330mm L x 2900mm HT
Location: Bedroom 01', 2.0, 'Nos', 23100.0, 16500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 65, 'E5n.', 'E5. Joinery Works', 'TV UNIT AND DRESSING AREA WALL:

Supply and installation of TV unit wall cladding made of MDF with PU paint finish and floating table with drawer made of MDF with oak wood veneer finish, in dressing area, table made of MDF with oak wood veneer finish including mirror and open shelf details as per drawing, colour as per approved sample                                                 

Floating table with drawer: 2070mm L x500mm W x 250mm H 
Dressing table: 1450mm L x 600mm W x 150mm H     
Mirror: 1000mm L x 2900mm H      
Wall cladding: 3770mm L x 2900mm HT
Location: Bedroom 01', 2.0, 'Nos', 30100.0, 21500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 66, 'E5o.', 'E5. Joinery Works', 'WALL CLADDING:

Supply and installation of wall cladding made of MDF with PU paint finish, including plain and ribbed design and open shelf                                               

Location: Bedroom 01', 44.0, 'sqm', 1260.0, 900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 67, 'E5p.', 'E5. Joinery Works', 'VANITY COUNTER:

Supply and installation of vanity counter made of MDF with inside melamine and outside  wood veneer finish (Excluding wash basin and mixer), marble supply by client     

Size: 2300mm L x 500mm W x 250mm HT
Location: Bathroom 01', 2.0, 'Nos', 7980.0, 5700.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 68, 'E5q.', 'E5. Joinery Works', 'MIRROR FRAME:

Supply and installation of 6mm mirror with frame

Size: 1740mm L x 1900mm HT
Location: Bathroom 01', 2.0, 'Nos', 5320.0, 3800.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 69, 'E5r.', 'E5. Joinery Works', 'HEADBOARD:

Supply and installation of head board made of MDF with flutted design and both pu paint and oak wood veneer finish, details as per drawing, as per approved sample

Size: 4680mm L x 2750mm HT
Location: Bedroom 02', 2.0, 'Nos', 21700.0, 15500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 70, 'E5s.', 'E5. Joinery Works', 'TV WALL:

Supply and installation of TV wall made of MDF with pu paint finish, including floating table wood veneer finish and side open shelf made of MDF with wood veneer finish

Size: 3620mm L x 2750mm HT
Location: Bedroom 02', 2.0, 'Nos', 24920.0, 17800.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 71, 'E5t.', 'E5. Joinery Works', 'WALL CLADDING:

Supply and installation of wall cladding made of MDF with PU paint finish, including plain and ribbed design

Location: Bedroom 02', 24.0, 'sqm', 1260.0, 900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 72, 'E5u.', 'E5. Joinery Works', 'VANITY COUNTER:

Supply and installation of vanity counter made of MDF with inside melamine and outside wood veneer finish (Excluding wash basin and mixer), marble supply by client.      

Size: 2400mm L x 500mm W x 250mm HT
Location: Bathroom 02', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 73, 'E5v.', 'E5. Joinery Works', 'MIRROR FRAME:

Supply and installation of 6mm mirror with frame

Size: 1740mm L x 1900mm HT
Location: Bathroom 02', 2.0, 'Nos', 5320.0, 3800.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 74, null, 'E5. Joinery Works', 'Other Joinery Items not mentioned to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 75, 'E6a.', 'E6. Electrical Works', 'Fixing of client-supplied single switched socket outlet, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing. 

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 14.0, 'Nos', 96.0, 80.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 76, 'E6b.', 'E6. Electrical Works', 'Fixing of client-supplied twin switched socket outlet, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 4.0, 'Nos', 144.0, 120.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 77, 'E6c.', 'E6. Electrical Works', 'Fixing of client-supplied 13 AMP double wall-mounted socket with integrated USB-C ports, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 16.0, 'Nos', 420.0, 350.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 78, 'E6d.', 'E6. Electrical Works', 'Fixing of client-supplied wall-mounted multi-purpose outlet, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing. Outlet may include combinations of twin switched sockets, HDMI ports, and data outlets as per approved layout.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 4.0, 'Nos', 660.0, 550.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 79, 'E6e.', 'E6. Electrical Works', 'Installation of client-supplied wall-mounted multi-purpose outlet, including alignment, fixing, connection to existing wiring, and second/final fix only.

Specification:
Drawing Code: 5P
Type: Wall-mounted outlet at 30 cm above finished floor level (AFFL) and above as per site condition
Outlets:
- 2 × Twin Switched Sockets (13A)
- 2 × HDMI Outlets (twin)
- 2 × Data Outlets (double Cat6/Cat6a)

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 4.0, 'Nos', 660.0, 550.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 80, 'E6f.', 'E6. Electrical Works', 'Fixing of client-supplied wall-mounted shaver socket, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 6.0, 'Nos', 144.0, 120.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 81, 'E6g.', 'E6. Electrical Works', 'Fixing of client-supplied wall-mounted 5 AMP socket, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 4.0, 'Nos', 132.0, 110.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 82, 'E6h.', 'E6. Electrical Works', 'Fixing of client-supplied floor-mounted electrical floor box, including 2 × 13 A sockets, 1 × 5 A socket, 1 × data outlet, alignment and securing of floor box to finished flooring, connection to pre-installed wiring by main contractor, testing for proper operation of all outlets, final finishing and cover installation

Location: Master Bedroom
Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 2.0, 'Nos', 600.0, 500.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 83, 'E6i.', 'E6. Electrical Works', 'Fixing of client-supplied lighting switch, including connection to pre-installed wiring and faceplate installation.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 28.0, 'Nos', 150.0, 125.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 84, 'E7a.', 'E7. Sanitary Wares', 'Fixing of client-supplied WC, including alignment, securing to pre-installed wall bracket/concealed frame, connection to pre-installed plumbing lines, sealing, checking for proper flushing operation, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix (frame, concealed cistern, and plumbing rough-in) to be provided by main contractor.', 6.0, 'Nos', 540.0, 450.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 85, 'E7b.', 'E7. Sanitary Wares', 'Fixing of client-supplied soft-closing toilet seat cover, including alignment and secure attachment to WC.

Location: Master Bathroom, Bathroom 1 & 2', 6.0, 'Nos', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 86, 'E7c.', 'E7. Sanitary Wares', 'Fixing of client-supplied flush plate, including alignment, securing to pre-installed concealed cistern, ensuring proper operation of dual-flush mechanism, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix (cistern installation and concealed plumbing) to be provided by main contractor.', 6.0, 'Nos', 180.0, 150.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 87, 'E7d.', 'E7. Sanitary Wares', 'Fixing of client-supplied hand spray, including alignment, connection to pre-installed plumbing lines, securing wall brackets, testing for leaks, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix plumbing (concealed pipes and valves) to be provided by main contractor', 6.0, 'Nos', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 88, 'E7e.', 'E7. Sanitary Wares', 'Fixing of client-supplied shower set, including showerhead, hand shower, mixer/valve, wall brackets, connection to pre-installed plumbing lines, alignment, testing for leaks and proper flow, and final finishing.

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix (concealed plumbing and rough-in) to be provided by main contractor.', 6.0, 'Nos', 660.0, 550.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 89, 'E7f.', 'E7. Sanitary Wares', 'Fixing of client-supplied freestanding bathtub, including leveling, alignment, securing to floor, connection to plumbing (drain & overflow), and final inspection.

Location: Master Bathroom', 2.0, 'Nos', 1440.0, 1200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 90, 'E7g.', 'E7. Sanitary Wares', 'Fixing of client-supplied toilet paper holder, including alignment, securing to wall, checking stability, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix (wall preparation, backing/support as required) to be provided by main contractor.', 6.0, 'Nos', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 91, 'E7h.', 'E7. Sanitary Wares', 'Fixing of client-supplied wall-mounted concealed bath mixer, including alignment, securing, connection to pre-installed concealed plumbing, and final testing.

Location: Master Bathroom, Bathroom 1 & 2', 6.0, 'Nos', 840.0, 700.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 92, 'E7i.', 'E7. Sanitary Wares', 'Fixing of client-supplied wall-mounted bath mixer with handshower, handshower holder, water outlet, diverter, and rectangular cover plate, including alignment, securing, connection to pre-installed plumbing, and testing.

Location: Master Bathroom, Bathroom 1 & 2', 6.0, 'Nos', 720.0, 600.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 93, 'E7j.', 'E7. Sanitary Wares', 'Fixing of client-supplied wash basin, including alignment, securing to countertop, connection to pre-installed plumbing (water supply and drainage), testing for leaks, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix plumbing (supply and drainage lines) to be provided by main contractor.', 6.0, 'Nos', 420.0, 350.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 94, 'E7k.', 'E7. Sanitary Wares', 'Fixing of client-supplied Plumbing round brass angle valve, including alignment, connection to pre-installed piping, securing, and leak testing.

Location: Master Bathroom, Bathroom 1 & 2', 6.0, 'Nos', 300.0, 250.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 95, 'E7l.', 'E7. Sanitary Wares', 'Fixing of client-supplied plumbing round washbasin siphon / bottle trap, including connection to pre-installed drain and trap piping, alignment, sealing, and leak testing.

Location: Master Bathroom, Bathroom 1 & 2', 6.0, 'Nos', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 96, null, 'E7. Sanitary Wares', 'Other Sanitary Items not mentioned to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 97, 'E8a.', 'E8. Lighting Works', 'Installation of client-supplied trimless recessed LED spotlight, including marking, fixing of fixture, connection to pre-run wiring, alignment, testing, and making good to surrounding finishes — complete in all respects.', 104.0, 'Nos', 90.0, 75.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 98, 'E8b.', 'E8. Lighting Works', 'Installation only of client-supplied pendant light, including fixing of mounting base, electrical connection to existing ceiling point, height adjustment, alignment, testing, and final cleaning — complete in all respects as per manufacturer’s instructions and site requirements.

Location: Master Bedroom, Bedroom 01 & Master Dresser', 14.0, 'Nos', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 99, 'E8c.', 'E8. Lighting Works', 'Installation and Fixing of client-supplied LED strip light, including alignment, securing into pre-prepared cove, connection to pre-installed electrical circuit, testing for proper operation and brightness, and final cleaning. 

Location: As per RCP layout
Note: First fix electrical wiring to be provided by main contractor.', 414.0, 'LM', 120.0, 100.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 100, 'E8d.', 'E8. Lighting Works', 'Installation of a client-supplied chandelier, including fabrication and installation of suitable support structure if required, fixing of chandelier to ceiling, electrical connection to existing point, alignment, leveling, testing, and final cleaning — complete in all respects as per manufacturer’s instructions and site conditions.

Location: Bedroom 01, Bedroom 02, & Staircase Area', 6.0, 'Nos', 540.0, 450.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 101, 'E8f.', 'E8. Lighting Works', 'Installation of client-supplied track lighting system with 6 LED spotlights on a 6.0 m aluminum track, including alignment, mounting, connection to existing wiring, and testing — second/final fix only.

Location: Bedroom 01
Note: First-fix wiring by main contractor.', 2.0, 'LS', 2160.0, 1800.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 102, 'E8g.', 'E8. Lighting Works', 'Installation of client-supplied track lighting system with 6 LED spotlights on a 6.3 m aluminum track, including alignment, mounting, connection to existing wiring, and testing — second/final fix only.

Location: Bedroom 02
Note: First-fix wiring by main contractor.', 2.0, 'LS', 2220.0, 1850.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 103, 'E8h.', 'E8. Lighting Works', 'Installation of client-supplied track lighting system with 2 LED spotlights on a 5.92 m aluminum track, including alignment, mounting, connection to existing wiring, and testing — second/final fix only.

Location: Master Bedroom
Note: First-fix wiring by main contractor.', 2.0, 'Nos', 1440.0, 1200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 104, 'E8i.', 'E8. Lighting Works', 'Installation of client-supplied wall light, including fixing, alignment, connection to existing wiring, testing, and cleaning', 8.0, 'Nos', 216.0, 180.0, 20.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 3, 'F', 'Roof Floor') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'F1. Flooring Works: Removed (To be done by Main Contractor)', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'F1a.', null, 'Installation of client-supplied Emperador White marble stone flooring, including surface preparation, leveling, alignment, fixing with approved adhesive/mortar, joint finishing, grouting with matching color, polishing if required, and final cleaning.

Drawing Code: RF-MS-01a
Type: Emperador White Marble
Size: 120cm x 120cm
Finish: Polished Finish
Location: Master Bathroom — Removed: To be done by Main Contractor', 22.875, 'sqm', 360.0, 300.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'F2a.', 'F2. Ceiling Works', 'Supply and installation of 12.5 mm thick regular gypsum board ceiling, ready for primer', 120.0, 'sqm', 114.0, 95.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'F2b.', 'F2. Ceiling Works', 'Supply and installation of 12.5 mm thick MR gypsum board ceiling, ready to receive primer', 20.0, 'sqm', 126.0, 105.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'F2c.', 'F2. Ceiling Works', 'Supply and installation of 10 x 10 mm shadow gap', 144.0, 'LM', 30.0, 25.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'F2d.', 'F2. Ceiling Works', 'Supply and installation of precast gypsum lightcove bulkhead', 170.0, 'LM', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'F2e.', 'F2. Ceiling Works', 'Supply and installation of curtain pelmet with lightcove including 18mm plywood backing', 36.0, 'LM', 174.0, 145.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'F2f.', 'F2. Ceiling Works', 'Supply and installation of precast gypsum double light cove bulkhead', 30.0, 'LM', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'F2g.', 'F2. Ceiling Works', 'Preparation of trimless A/C grill', 90.0, 'LM', 36.0, 30.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'F2h.', 'F2. Ceiling Works', 'Installation of trimless light frame', 30.0, 'Nos', 36.0, 30.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'F2i.', 'F2. Ceiling Works', 'Supply and installation of access panel upto 60 x 60cm', 10.0, 'Nos', 300.0, 250.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'F2j.', 'F2. Ceiling Works', 'Supply and apply of paint on the ceiling. (One coat primer, two coat stucco, two coat Rich mat white)', 310.0, 'sqm', 48.0, 40.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'F3a.', 'F3. Wall Finishes Works', 'Supply and installation of Electroplating Bronze Finished Metal for wall, including cutting to size, alignment, fixing with adhesive and/or mechanical fasteners, edge finishing, and final cleaning.

Drawing Code: WF-MT-01a
Type: SS 304 1mm Electroplating Bronze Finished
Location: Master Bedroom', 27.0, 'LM', 210.0, 175.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'F3b.', 'F3. Wall Finishes Works', 'Supply and application of ivory textured paint on wall surfaces, including surface preparation (cleaning, sanding, patching, and priming), application of two coats of approved textured paint, finishing to achieve uniform texture and color, touch-ups, and final cleaning.

Drawing Code: WF-PT-07
Type:  Ivory textured paint
Location: Corridor Area', 84.15, 'sqm', 336.0, 280.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'F3ca.', 'F3. Wall Finishes Works', 'Supply of Silver Travertine natural stone wall cladding, including supply of material.

Drawing Code: WF-ST-01
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & Unfilled
Location: Master Bathroom', 86.79, 'sqm', 396.0, 330.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, 'F3cb.', 'F3. Wall Finishes Works', 'Installation of Silver Travertine natural stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-01
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & Unfilled
Location: Master Bathroom', 86.79, 'sqm', 360.0, 300.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, 'F4a.', 'F4. Glass Works', 'Supply and Installation of 12mm. Thk. Clear glass partition & door with electroplated frame

Size: 1410mm W x 2700mm H
Location: RF Master Bathroom', 2.0, 'Nos', 6715.548, 5596.29, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, 'F5a.', 'F5. Joinery Works', 'WALL CLADDING:

Supply and installation of wall cladding made of MDF with oak wood veneer finish, colour as per approved sample, details as per drawing

Size: 4160mm L x 3000mm HT
Location: Stair Area', 24.96, 'sqm', 1820.0, 1300.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, 'F5b.', 'F5. Joinery Works', 'HEADBOARD:

Supply and installation of head board made of MDF with wood veneer finish, center portion marble finish including mirror cladding. details as per drawing,colour as per approved sample (Marble work excluded) 

Size: 4400mm L x 2700mm HT
Location: Master Bedroom', 2.0, 'Nos', 20300.0, 14500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, 'F5c.', 'F5. Joinery Works', 'TV UNIT:

Supply and installation of TV unit wall cladding and floating table with drawer made of MDF with oak wood veneer finish and center portion marble finish, details as per drawing,colour as per approved sample

Size: 1780mm L x 2700mm H (marble work excluded)
Location: Master Bedroom', 2.0, 'Nos', 10080.0, 7200.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, 'F5d.', 'F5. Joinery Works', 'WALL CLADDING:

Supply and installation of wall cladding made of MDF with oak wood veneer finish -flutted type, including plain and ribbed design 

Location: Master Bedroom', 38.2, 'sqm', 1680.0, 1200.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, 'F5e.', 'F5. Joinery Works', 'VANITY COUNTER:

Supply and installation of vanity counter made of MDF with inside melamine and outside wood veneer finish (Excluding wash basin and mixer), charges for installation of marble for vanity counter, marble supply by client.

Size: 2560mm L x 500mm W x 250mm HT
Location: Master Bathroom', 2.0, 'Nos', 8820.0, 6300.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 22, 'F5f.', 'F5. Joinery Works', 'MIRROR FRAME:

Supply and installation of 6mm mirror with edge 
metal trim, electroplated finish

Size: 1500mm L x 2700mm HT
Location: Master Bathroom', 2.0, 'Nos', 5600.0, 4000.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 23, null, 'F5. Joinery Works', 'Other Joinery Items not mentioned to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 24, 'F6a.', 'F6. Electrical Works', 'Installation of client-supplied wall-mounted double switched socket with integrated USB charging ports, including alignment, fixing, connection to existing wiring, and second/final fix only.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 10.0, 'Nos', 540.0, 450.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 25, 'F6b.', 'F6. Electrical Works', 'Installation of client-supplied wall-mounted double data outlet, including alignment, fixing, connection to existing wiring, and second/final fix only.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 2.0, 'Nos', 480.0, 400.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 26, 'F6c.', 'F6. Electrical Works', 'Installation of client-supplied wall-mounted TV point, including alignment, fixing, connection to existing wiring, and second/final fix only.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 2.0, 'Nos', 540.0, 450.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 27, 'F6d.', 'F6. Electrical Works', 'Installation of client-supplied 5 AMP wall-mounted electrical socket, including alignment, fixing, connection to existing wiring, and second/final fix only.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 6.0, 'Nos', 420.0, 350.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 28, 'F6e.', 'F6. Electrical Works', 'Installation of client-supplied HDMI outlet with wall faceplate, including alignment, fixing, and second/final connection to existing wiring.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 2.0, 'Nos', 420.0, 350.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 29, 'F6f.', 'F6. Electrical Works', 'Fixing of client-supplied lighting switch, including connection to pre-installed wiring and faceplate installation.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing. — Optional: Rate Only', 4.0, 'Nos', 150.0, 125.0, 20.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 30, 'F7a.', 'F7. Sanitary Wares', 'Fixing of client-supplied shower set, including showerhead, hand shower, mixer/valve, wall brackets, connection to pre-installed plumbing lines, alignment, testing for leaks and proper flow, and final finishing.

Location: Master Bathroom
Note: First fix (concealed plumbing and rough-in) to be provided by main contractor.', 2.0, 'Nos', 720.0, 600.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 31, 'F7b.', 'F7. Sanitary Wares', 'Fixing of client-supplied flush plate, including alignment, securing to pre-installed concealed cistern, ensuring proper operation of dual-flush mechanism, and final finishing. 

Location: Master Bathroom
Note: First fix (cistern installation and concealed plumbing) to be provided by main contractor.', 2.0, 'Nos', 180.0, 150.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 32, 'F7c.', 'F7. Sanitary Wares', 'Fixing of client-supplied hand spray, including alignment, connection to pre-installed plumbing lines, securing wall brackets, testing for leaks, and final finishing. 

Location: Master Bathroom
Note: First fix plumbing (concealed pipes and valves) to be provided by main contractor', 2.0, 'Nos', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 33, 'F7d.', 'F7. Sanitary Wares', 'Fixing of client-supplied WC, including alignment, securing to pre-installed wall bracket/concealed frame, connection to pre-installed plumbing lines, sealing, checking for proper flushing operation, and final finishing. 

Location: Master Bathroom
Note: First fix (frame, concealed cistern, and plumbing rough-in) to be provided by main contractor.', 2.0, 'Nos', 540.0, 450.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 34, 'F7e.', 'F7. Sanitary Wares', 'Fixing of client-supplied soft-closing toilet seat cover, including alignment and secure attachment to WC.

Location: Master Bathroom', 2.0, 'Nos', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 35, 'F7f.', 'F7. Sanitary Wares', 'Fixing of client-supplied toilet paper holder, including alignment, securing to wall, checking stability, and final finishing. 

Location: Master Bathroom
Note: First fix (wall preparation, backing/support as required) to be provided by main contractor.', 2.0, 'Nos', 144.0, 120.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 36, 'F7g.', 'F7. Sanitary Wares', 'Fixing of client-supplied mixer, including alignment, connection to pre-installed plumbing lines, securing to sink, countertop, or wall, testing for leaks, and final finishing. 

Location: Master Bathroom
Note: First fix plumbing (supply lines, concealed pipes) to be provided by main contractor.', 2.0, 'Nos', 840.0, 700.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 37, 'F7h.', 'F7. Sanitary Wares', 'Fixing of client-supplied wash basin, including alignment, securing to countertop, connection to pre-installed plumbing (water supply and drainage), testing for leaks, and final finishing. 

Location: Master Bathroom
Note: First fix plumbing (supply and drainage lines) to be provided by main contractor.', 2.0, 'Nos', 420.0, 350.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 38, 'E7i.', 'F7. Sanitary Wares', 'Fixing of client-supplied Plumbing round brass angle valve, including alignment, connection to pre-installed piping, securing, and leak testing.

Location: Master Bathroom', 2.0, 'Nos', 300.0, 250.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 39, 'E7j.', 'F7. Sanitary Wares', 'Fixing of client-supplied plumbing round washbasin siphon / bottle trap, including connection to pre-installed drain and trap piping, alignment, sealing, and leak testing.

Location: Master Bathroom', 2.0, 'Nos', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 40, null, 'F7. Sanitary Wares', 'Other Sanitary Items not mentioned to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 41, 'F8a.', 'F8. Lighting Works', 'Installation of client-supplied trimless recessed LED spotlight, including marking, fixing of fixture, connection to pre-run wiring, alignment, testing, and making good to surrounding finishes.', 30.0, 'Nos', 90.0, 75.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 42, 'F8b.', 'F8. Lighting Works', 'Installation only of client-supplied pendant light, including fixing of mounting base, electrical connection to existing ceiling point, height adjustment, alignment, testing, and final cleaning.', 2.0, 'Nos', 240.0, 200.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 43, 'F8c.', 'F8. Lighting Works', 'Installation and Fixing of client-supplied LED strip light, including alignment, securing into pre-prepared cove, connection to pre-installed electrical circuit, testing for proper operation and brightness, and final cleaning. 

Location: As per RCP layout
Note: First fix electrical wiring to be provided by main contractor.', 187.0, 'LM', 120.0, 100.0, 20.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 4, 'G', 'Staircase Wall Finishes Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'G1a.', null, 'Supply and application of champagne metallic textured paint on wall surfaces, including surface preparation, two coats of approved paint, touch-ups, and final cleaning.

Drawing Code: WF-PT-05
Type: Champagne finish metallic textured paint
Location: Staircase Side Walls
Note: Sample to develop. HID Sample Texture to be  matched with MT-01a Color', 2.0, 'LS', 5130.0, 4275.0, 20.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 5, 'H', 'AC Grill Installation Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'H1a.', null, 'Installation powder coated linear flowbar diffusers, Square diffusers, Sandtrap louvers & Exhaust louvers as per the tendering drawing.

1) Flow Bar Diffuser - 240 m 
2) Square diffuser - 6 Nos 
3) Sandtrap Louvers - 3 Nos 
4) Exhaust louvers - 3 Nos', 2.0, 'LS', 11520.0, 9600.0, 20.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 6, 'I', 'Wooden Doors') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'I1. Basement Floor Doors - After Handover: To be quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'I1a.', null, 'Pump Room Door:

Size: 900mm L x 2800mm HT', 1.0, 'Nos', 0.0, null, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'I1b.', null, 'Sump Pit Room Door:

Size: 900mm L x 2800mm HT', 1.0, 'Nos', 0.0, null, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'I1c.', null, 'Maids Room Door:

Size: 900mm L x 2800mm HT', 1.0, 'Nos', 0.0, null, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'I1d.', null, 'Maids Room Bathroom Door:

Size: 800mm L x 2800mm HT', 1.0, 'Nos', 0.0, null, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'I1c.', null, 'Maids Room Laundry Corridor Door:

Size: 900mm L x 2800mm HT', 1.0, 'Nos', 0.0, null, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'I1d.', null, 'Laundry Room Door:

Size: 900mm L x 2800mm HT', 1.0, 'Nos', 0.0, null, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'I1e.', null, 'Gym Powder Room Door:

Size: 900mm L x 2800mm HT', 1.0, 'Nos', 0.0, null, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'I1f.', null, 'Gym Sliding Door:

Size: 1300mm L x 28000mm HT', 1.0, 'Nos', 0.0, null, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'I1g.', null, 'Car Lift Door:

Size: 1100mm L x 2800mm HT', 1.0, 'Nos', 0.0, null, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'I2a.', 'I2. Ground Floor Doors', 'Entrance Main Door:

Size: 1500mm L x 3000mm HT', 2.0, 'Nos', 31780.0, 22700.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'I2b.', 'I2. Ground Floor Doors', 'Kitchen Door:

Size: 1000mm L x 3000mm HT', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'I2c.', 'I2. Ground Floor Doors', 'Guest Bedroom Door:

Size: 1000mm L x 3000mm HT', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'I2d.', 'I2. Ground Floor Doors', 'Guest Bathroom Door:

Size: 1000mm L x 3000mm HT', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, 'I2e.', 'I2. Ground Floor Doors', 'Powder Room Door:

Size: 1000mm L x 3000mm HT', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, 'I3a.', 'I3. First Floor Doors', 'Master Bedroom Double Door:

Size: 1300mm L x 3000mm HT', 2.0, 'Nos', 11200.0, 8000.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, 'I3b.', 'I3. First Floor Doors', 'Bedroom 1 Door:

Size: 1100mm L x 3000mm HT', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, 'I3c.', 'I3. First Floor Doors', 'Bathroom 1 Door:

Size: 800mm L x 3000mm HT', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, 'I3d.', 'I3. First Floor Doors', 'Bedroom 2 Door:

Size: 1100mm L x 3000mm HT', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, 'I3e.', 'I3. First Floor Doors', 'Bathroom 2 Door:

Size: 800mm L x 3000mm HT', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, 'I4a.', 'I4. Roof Floor Doors', 'Master Bedroom Door:

Size: 1100mm L x 3000mm HT', 2.0, 'Nos', 8260.0, 5900.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, 'I4b.', 'I4. Roof Floor Doors', 'Master Bathroom Sliding Door:

Size: 750mm L x 3000mm HT', 2.0, 'Nos', 9240.0, 6600.0, 40.0, false, false);
update boqs set status = 'APPROVED' where id = b;
end $x$;
