set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '6fc7aa20-00cc-44b3-9857-f3c6368c397a' and source_file = 'BOQ - House MZ Fitout Works_rev05.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('6fc7aa20-00cc-44b3-9857-f3c6368c397a', 'QUOTE', 5, v, 'House MZ Fitout Works', 'BBC/062026/00082_rev05', 'DRAFT', '2026-09-17', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - House MZ Fitout Works_rev05.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Mobilization and demobilization including transportation of equipment, machinery, materials, tools, and personnel to and from site, setup and removal of temporary site facilities, temporary storage areas, and provision of protection works to existing indoor and outdoor areas during execution of works.

Note: Including the removal of existing rubbish/waste for disposal at DM site', 1.0, 'LS', 25875.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Site supervision, management, and coordination, including monitoring construction activities, ensuring quality control, safety compliance, schedule adherence, subcontractor coordination, and reporting to client/consultant as per project requirements.', 1.0, 'LS', 13375.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Provide, install, maintain, and remove temporary site lighting facilities required for the execution of the works, including temporary light fittings, cabling, supports, connections, relocation as required, maintenance during the construction period, and removal upon completion of the works.', 1.0, 'LS', 5050.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Provision of equipment, power hand tools, and scaffoldings, includes supply, setup, operation, and maintenance of all required construction equipment, hand tools, and temporary scaffolding structures for safe and efficient execution of works as per site requirements.', 1.0, 'LS', 10350.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Material handling and labor support, including unloading, storage, internal transport of construction materials, assistance to skilled trades, and on-site labor coordination to support ongoing construction activities.', 1.0, 'LS', 10500.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Provision of Third-Party Liability and Contractors All Risks (CAR) Insurance, covers project-related risks, damages, and liabilities to third parties, including material, equipment, and construction works during the contract period, as per UAE regulations and approved contract requirements.', 1.0, 'LS', 9775.0, null, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, null, null, 'All documents will be provided by consultant for architecture, structural and MEP,', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, null, null, 'Coordination, submission, and follow-up for all required approvals and fees from relevant authorities & government by client.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'A', 'Flooring Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and application of a complete waterproofing system to all wet areas, including initial waterproofing prior to screeding and final waterproofing after screeding, applied to floor surfaces and vertical wall upturns to a height of 300mm above finished floor level, complete with surface preparation, primers, waterproofing membrane/coating, treatment of corners, joints, pipe penetrations, protection of completed works, and pond testing.

Location: Wet Areas only (refer to layout) — Descoped', 171.003, 'sqm', 156.0, 120.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply and installation of cement-sand floor screeding with varying thickness from 50mm to 150mm, including surface preparation, cleaning, level setting, supply of cement, sand and additives, mixing, placing, compaction, leveling, finishing and curing.

Location: Entire Ground Floor
Note: Excluding service area & areas identified as Not Part of Scope', 393.855, 'sqm', 110.5, 85.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and construction of a reinforced concrete platform for the staircase structure, including formwork, reinforcement steel (as required by the approved structural drawings), Grade C30/37 ready-mix concrete, concrete placing, vibration, levelling, finishing, curing, edge formation, stripping of formwork, and all labour, materials, plant, equipment, and accessories necessary to complete the works. 

The item shall also include the supply, cutting, delivery, and installation of Dekton floor finish, including premium tile adhesive, cutting, edge finishing, jointing, levelling, grouting, cleaning, and protection, in accordance with the manufacturer''s recommendations and approved shop drawings.

Platform Height: 175mm
Floor Finish: Dekton – Cosentino
Supply PC Rate (Dekton): AED 600.00/m²
Location: Staircase Area', 19.55, 'sqm', 2102.1, 1501.5, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply, fabricate, cut, deliver, and install floor tiles, including setting out, cutting, edge finishing, adhesive bedding, jointing, levelling, spacers, movement joints where required, cleaning, and protection.

Code: FL01
Brand: Cosentino
Material: Dekton - AerisKC - Matt - CTS - 8mm
Size: 1420mm x 790mm
Supply PC Rate: 380.00 AED/sqm
Location: Refer to GF flooring finishes layout', 297.0, 'sqm', 600.0, 500.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Installation of client-supplied floor tiles, including setting out, cutting, edge finishing, application of premium cementitious tile adhesive, levelling, alignment, spacers, movement joints where required, grouting, cleaning, and protection.

Code: FL02B
Brand: Kutahya (Client-Supplied)
Size: 60cm x 60cm
Location: Refer to Ground Floor Flooring Finishes Layout, excluding service lobby, Maids Room, Bathroom, Ironing Room, and Laundry.
Note: Tile supply is excluded and shall be provided by the Client. Price includes installation, adhesive, grout, consumables, and tile protection. — Descoped', 67.515, 'sqm', 119.6, 92.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply and installation of 15–30mm nominal size limestone gravel, including supply of gravel material, surface preparation, leveling, spreading to the specified thickness, raking, compaction where required, and trimming to edges.

Code: FL05
Location: Refer to GF flooring finishes layout
Note: Plants/Trees to be confirmed and quoted separately', 1.0, 'LS', 1007.5, 775.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Supply and installation of door threshold strip at floor finish transitions, comprising aluminum as specified in the finishes schedule. Works shall include measuring, cutting to size, fixing with approved adhesive, alignment, leveling, edge finishing, sealing.

Code: FT01
Type: Aluminum
Location: Refer to flooring finishes layout', 1.0, 'LS', 877.5, 675.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Supply and installation of floor edge/corner profile, including aluminium finish edge trim, cutting to size, drilling, fixing with suitable adhesive, alignment, corner detailing, sealing, finishing.

Code: FT03
Type: Aluminum
Location: Refer to flooring finishes layout', 1.0, 'LS', 6825.0, 5250.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', null, 'Supply and installation of service door threshold, including aluminium threshold profile, cutting to size, fixing with adhesive, leveling, sealing, edge finishing, coordination with flooring finishes.

Code: FT05
Type: Aluminum
Location: Refer to flooring finishes layout', 1.0, 'LS', 422.5, 325.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, null, null, 'Note: Other Flooring works not mentioned on this quote are excluded and quoted separately.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'C', 'Ceiling Finishes') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and apply of paint on the ceiling. (One coat primer & two coat Rich mat white)

Code: C01A
Location: Refer to GF reflected ceiling plan', 435.0, 'sqm', 45.5, 35.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply and application of two-component epoxy paint system to moisture-resistant (MR) gypsum board ceiling surfaces, including surface preparation, joint treatment, filling, sanding, primer application, and application of two coats of epoxy paint finish.

Code: C01B
Location: Refer to GF reflected ceiling plan', 91.35, 'sqm', 97.5, 75.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply, fabricate, deliver, and install wood laminate ceiling cladding, comprising laminate finish bonded to moisture-resistant MDF substrate, complete with concealed fixing system, aluminum support framework, edge trims, joint treatment, cutting, fabrication, alignment, and all necessary accessories and consumables. 

Code: C04
Location: Refer to GF reflected ceiling plan — Descoped
Note: Included in WF07', 9.45, 'sqm', 1300.0, 1000.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply and application of white paint finish on plastered ceiling surfaces, including surface preparation, cleaning, primer coat, paint application, finishing coats, and touch-ups.

Code: C05A
Location: Refer to GF reflected ceiling plan', 1.0, 'LS', 123.5, 95.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, null, null, 'Note: Other Ceiling Finishes not mentioned on this quote are excluded and quoted separately.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 3, 'D', 'Wall Finishes') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Carefully demolish and remove the existing block wall, including hacking, dismantling, loading, cart-away, legal disposal of debris to an approved dumping site, protection of adjacent finishes, making good to adjoining surfaces, and final cleaning.

Location: Family Living & Dining Area', 1.0, 'Nos.', 4517.5, 3475.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply all materials, labour, plant, and equipment for the construction of a concrete block wall, including cement-sand mortar, galvanized wall ties, reinforcement where required, cutting, chasing, 15mm cement-sand plaster to both sides, curing, scaffolding, and all necessary accessories.

Location: Family Living & Dining Area', 1.0, 'Nos.', 12610.0, 9700.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and application of cement-sand plaster to block wall surfaces, including surface preparation, cleaning, installation of corner beads, screeding, leveling, finishing, and curing. — Descoped', 928.2, 'sqm', 71.5, 55.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply and application of white paint finish to internal plastered wall surfaces, including surface preparation, filling of minor imperfections, sanding, primer application, and application of finishing coats.

Code: WF01A', 112.3185, 'sqm', 45.5, 35.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Supply and application of white epoxy paint finish to internal plastered wall surfaces in wet areas, including surface preparation, cleaning, filling of minor imperfections, sanding, application of approved epoxy primer/sealer where required, and two (2) coats of white epoxy paint, including protection of adjacent finishes, touch-up, cleaning, and all necessary labour, materials, tools, and accessories to achieve a smooth, uniform, washable and water-resistant finish.

Code: WF01B
Finish: White Epoxy Paint
Application: Epoxy Primer/Sealer + 2 Coats White Epoxy Finish
Location: As per wall finishes schedule and approved drawings.', 165.8475, 'sqm', 123.5, 95.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply and application of decorative special paint finish, including surface preparation, crack and imperfection filling, sanding, primer, base coat, and application of decorative finish, protection of adjacent finishes, and accessories

Code: WF01C
Brand: San Marco or approved equivalent
Finish: Marmorino Decorative Finish or approved equivalent
Application: one coat primer then two coats of finishing paint
Location: As per wall finishes schedule and approved drawings. 

Note: Data sheet to be provided.', 125.1096, 'sqm', 143.0, 110.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Supply and installation of wood cladding to wall surfaces, comprising MDF with veneer finish, including backing support system, cutting, edge finishing, fixing accessories, trims, sealants, and alignment.

Item Code: WF02D', 26.5734, 'sqm', 1207.0, 850.0, 42.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Supply, fabricate, cut, deliver, and install natural stone wall cladding, including setting out, cutting, edge finishing, premium stone adhesive, stainless steel mechanical fixings where required, jointing, levelling, alignment, sealing, cleaning, and protection.

Item Code: WF03A
Material: Brerra Limestone', 81.4473, 'sqm', 990.0, 750.0, 32.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', null, 'Supply, fabricate, deliver, and install mirror wall cladding, comprising 6mm thick mirror with polished edges, complete with moisture-resistant backing board where required, approved mirror adhesive, concealed mechanical fixings where necessary, edge protection, setting out, cutting to size, alignment, joint treatment, silicone sealing, cleaning, and protection. 

Item Code: WF04', 24.738, 'sqm', 1320.0, 1100.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, '10', null, 'Installation of client-supplied wall tiles, including setting out, cutting, edge finishing, application of premium tile adhesive, levelling, alignment, spacers, jointing, grouting, cleaning, and protection.

Item Code: WF06C
Brand: Kutahya (Client-Supplied)
Size: 60cm x 120cm
Location: Refer to Ground Floor Flooring Finishes Layout, excluding service lobby, Maids Room, Bathroom, Ironing Room, and Laundry. — Descoped', 263.34, 'sqm', 119.6, 92.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, '11', null, 'Supply, cutting, delivery, and installation of large-format wall cladding, including setting out, cutting, edge finishing, drilling where required, premium adhesive, stainless steel mechanical fixings where required, jointing, levelling, alignment, movement joints, cleaning, and protection.

Item Code: WF06D
Brand: Consentino
Size: 1420mm L x 3200mm ht
Material: Dekton - AerisKC - Matt - 8mm Slab
Supply PC Rate: AED 317.00/m²
Location: Formal Powder & Family Powder Room', 91.333, 'sqm', 716.4, 597.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, '12', null, 'Supply and installation of aluminum cladding in brass finish, including aluminum panels, subframe/support system, fabrication, cutting to size, fixing accessories, trims, joint treatment, and alignment.

Item Code: WF07
Material: Fabricated Aluminum Cladding Panel
Finish: Brass Finish (powder coated)
Note: Excluding elevator area', 1.8753, 'sqm', 1235.0, 950.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, '13', null, 'Supply and installation of wall-mounted metal finish wall trim/door stopper, including aluminium finish profile, cutting to size, drilling, concealed or surface fixing with suitable anchors and screws, alignment, AND sealing.

Item Code: WT01A
Location: In between Dining & Family Living Area', 8.4, 'LM', 156.0, 120.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, null, null, 'Note: Other wall Finishes not mentioned on this quote are excluded and quoted separately.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 4, 'E', 'Wall Skirting') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply, cutting, delivery, and installation of tile skirting with recessed shadow gap detail, including tile supply, cutting to size, edge finishing, formation of a continuous 10mm high recessed shadow gap, backing supports where required, adhesive fixing, alignment, joint treatment, and cleaning.

Code: SK02D
Final Skirting Height: TBC', 1.0, 'LS', 6480.5, 4985.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply, cutting to size, fabrication, and installation of MDF/MR MDF shadow gap skirting, including MDF/MR MDF board, formation of a continuous 10mm high recessed shadow gap, black paint finish to the shadow gap recess, edge finishing, backing supports where required, fixing accessories, alignment, joint treatment, and sanding.

Code: SK02A
Final Skirting Ht: TBC — Descoped
Note: Part of joinery', 12.3375, 'LM', 182.0, 140.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply, cutting to size, fabrication, and installation of architectural aluminum shadow gap profile, comprising 10mm x 10mm black powder-coated aluminum profile, installed at the junction of floor finishes and aluminum cladding wall systems to create a continuous recessed shadow line. Works shall include profile fabrication, cutting, fixing brackets, alignment, joint treatment, and touch-up.

Code: SK02B
Type: Aluminum
Final Skirting Ht: TBC — Descoped
Note: Part of cladding', 2.0, 'LM', 195.0, 150.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply, cutting to size, fabrication, and installation of architectural aluminum shadow gap profile at painted wall finishes, comprising 10mm x 10mm black powder-coated extruded aluminum profile, including setting out, cutting, fabrication, fixing accessories, alignment, joint treatment, and touch-up works.

Code: SK02D
Type: Aluminum
Final Skirting Ht: TBC', 1.0, 'LS', 13325.0, 10250.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Supply, cutting to size, fabrication, and installation of aluminum shadow gap in mirror-clad walls, comprising 10mm x 10mm black powder-coated aluminum profile, including fixing accessories, alignment, cutting, joint treatment.

Code: SK02E
Type: Aluminum
Final Skirting Ht: TBC — Descoped
Note: Part of cladding', 1.0, 'LS', 1202.5, 925.0, 30.0, false, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 5, 'G', 'Glass Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and installation of sliding door made of metal framing with ribbed or frosten glass finish with mesh type finish, details as per drawing,colour as per approved sample (Including handles, soft closing system, ceiling mounted track )                  

Size: 3.8m ht x 1.45m W
Location: Display Shelves Area (Living/Dining) — Descoped', 2.0, 'Nos.', 29250.0, 22500.0, 30.0, false, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 6, 'A', 'Flooring Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and application of a complete waterproofing system to all wet areas, including initial waterproofing prior to screeding and final waterproofing after screeding, applied to floor surfaces and vertical wall upturns to a height of 300mm above finished floor level, complete with surface preparation, primers, waterproofing membrane/coating, treatment of corners, joints, pipe penetrations, protection of completed works, and pond testing.

Location: Wet Areas only (refer to layout) — Descoped', 72.996, 'sqm', 156.0, 120.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply and installation of cement-sand floor screeding with varying thickness from 50mm to 150mm, including surface preparation, cleaning, level setting, bonding agent where required, supply of cement, sand and additives, mixing, placing, compaction, leveling, finishing and curing.

Location: Entire First Floor excluding bedrooms', 146.79, 'sqm', 110.5, 85.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply, fabricate, cut, deliver, and install floor tiles, including setting out, cutting, edge finishing, adhesive bedding, jointing, levelling, spacers, movement joints where required, cleaning, and protection.

Code: FL01
Brand: Cosentino
Material: Dekton - AerisKC - Matt - CTS - 8mm
Size: 1420mm x 790mm
Supply PC Rate: 380.00 AED/sqm
Location: Refer to FF flooring finishes layout', 117.7, 'sqm', 600.0, 500.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Installation of client-supplied porcelain floor tiles, including setting out, surface preparation, application of premium cementitious tile adhesive, edge finishing, levelling, alignment, spacers, movement joints where required, grouting, cleaning, and protection of completed tile works until handover.

Code: FL02A
Material: Porcelain Floor Tiles – Client Supplied
Location: Refer to flooring finishes layout', 31.9, 'sqm', 119.6, 92.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Installation of client-supplied porcelain floor tiles, including setting out, surface preparation, application of premium cementitious tile adhesive, edge finishing, levelling, alignment, spacers, movement joints where required, grouting, cleaning, and protection of completed tile works until handover.

Code: FL02B
Material: Porcelain Floor Tiles – Client Supplied
Location: Refer to flooring finishes layout', 10.89, 'sqm', 119.6, 92.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply and installation of door threshold strip at floor finish transitions, comprising aluminum as specified in the finishes schedule. Works shall include measuring, cutting to size, fixing with approved adhesive or mechanical fixing system, alignment, leveling, edge finishing, sealing.

Code: FT01
Type: Aluminum (price is provisional, subject to change depending on material/finish)
Location: Refer to flooring finishes layout — Descoped
Note: Under wood flooring supplier', 40.0, 'LM', 117.0, 90.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Supply and installation of floor drop transition profile at locations where there is a change in floor level between adjacent finishes, including fabrication and installation of metal trim approved transition profile, complete with cutting, leveling, fixing, edge finishing, and sealing.

Code: FT02
Type: Aluminum
Location: Refer to flooring finishes layout', 1.0, 'LS', 1625.0, 1250.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Supply and installation of floor edge/corner profile, including aluminium finish edge trim, cutting to size, drilling, fixing with suitable adhesive and/or mechanical anchors, alignment, corner detailing, sealing, finishing.

Code: FT03
Type: Aluminum
Location: Refer to flooring finishes layout — Descoped:
Under wood flooring supplier', 1.0, 'LS', 4225.0, 3250.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', null, 'Supply and installation of floor transition profile between stone and wood flooring, including aluminium profile, cutting to size, drilling, fixing with suitable anchors/adhesive, alignment, joint sealing, and finishing.

Code: FT04
Type: Aluminum
Location: Refer to flooring finishes layout', 1.0, 'LS', 682.5, 525.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, '10', null, 'Installation and second fixing of client-supplied square tile-in floor drain, including alignment, level adjustment to finished floor level, installation of tile insert cover, connection to pre-installed drain outlet, sealing, testing, commissioning.

Item Code: FD01
Location: Master Bathroom, Bathroom 04, Bathroom 03, Bathroom 02, Bathroom 01
Note: 1st fixing to be done by other contractor, 2nd fixing to be done by Bolsover', 7.0, 'Nos.', 390.0, 300.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, '11', null, 'Installation and second fixing of client-supplied linear tile-in shower drain, including alignment, level adjustment, fitting of tile insert cover, connection to pre-installed drainage outlet, sealing, testing, and commissioning.

Item Code: FD02
Location: Master Bathroom, Bathroom 04, Bathroom 03, Bathroom 02, Bathroom 01
Note: 1st fixing to be done by other contractor, 2nd fixing to be done by Bolsover', 5.0, 'Nos.', 585.0, 450.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, null, null, 'Note: Other Flooring works not mentioned on this quote are excluded and quoted separately.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 7, 'C', 'Ceiling Finishes') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and apply of paint on the ceiling. (One coat primer & two coat Rich mat white)

Code: C01A
Location: Refer to FF reflected ceiling plan', 560.0, 'sqm', 45.5, 35.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply and application of two-component epoxy paint system to moisture-resistant (MR) gypsum board ceiling surfaces, including surface preparation, joint treatment, filling, sanding, primer application, and application of two coats of epoxy paint finish.

Code: C01B
Location: Refer to FF reflected ceiling plan', 79.8, 'sqm', 97.5, 75.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and application of decorative special paint finish, including surface preparation, crack and imperfection filling, sanding, primer, base coat, and application of decorative finish, protection of adjacent finishes, and accessories.

Code: C01C
Brand: San Marco or approved equivalent
Finish: Marmorino Decorative Finish or approved equivalent
Application: one coat primer then two coats of finishing paint
Location: Refer to FF reflected ceiling plan

Note: Data sheet to be provided', 22.05, 'sqm', 143.0, 110.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply and Installation of Wood Veneer Finish, including approved wood veneer, veneer-faced finishing panels where applicable, edge banding, matching trims, clear protective coating/sealer, cutting to size, fabrication, joint alignment, and fixing to the prepared MDF substrate/framework.

Code: C03
Location: Refer to FF reflected ceiling plan', 55.65, 'sqm', 990.0, 750.0, 32.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Supply and application of decorative special paint finish, including surface preparation, crack and imperfection filling, sanding, primer, base coat, and application of decorative finish, protection of adjacent finishes, and accessories.

Code: C05B
Brand: San Marco or approved equivalent
Finish: Marmorino Decorative Finish or approved equivalent
Application: one coat primer then two coats of finishing paint
Location: Refer to FF reflected ceiling plan', 1.0, 'LS', 565.5, 435.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Installation of Client-Supplied Porcelain Ceiling Tiles, including setting out, surface preparation, and fitting, premium suitable tile adhesive, mechanical/approved fixing system where required, levelling and alignment, spacers, joint treatment and grouting, edge finishing, sealant, access equipment, cleaning, and protection upon completion. 

Code: C06
Material: Client-supplied porcelain tiles
Location: Refer to FF reflected ceiling plan', 1.0, 'LS', 292.5, 225.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Supply, cutting, delivery, and installation of natural travertine stone ceiling, including approved stone tiles, setting out, cutting to size, high-bond adhesive, mechanical restraints where required by the approved specification, joint spacers, grouting, edge trims, sealant, cleaning, and protection.

Code: C07
Material: Dekton 
Size: cut-to-size
Supply PC Rate: 485.00 AED/sqm 
Location: Refer to FF reflected ceiling plan', 1.0, 'LS', 1657.5, 1275.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, null, null, 'Note: Other Ceiling finishes not mentioned on this quote are excluded and quoted separately.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 8, 'D', 'Wall Finishes') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and construction of non-structural concrete blockwork walls, including setting out, laying of hollow concrete blocks, mortar, alignment, levelling, reinforcement where required, tying to structure, curing.

Location: Master Bedroom Main Door & Store HVAC ducting wall. — Descoped', 15.75, 'sqm', 422.5, 325.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply and application of cement-sand plaster to block wall surfaces, including surface preparation, cleaning, installation of corner beads, screeding, leveling, finishing, and curing. — Descoped', 279.09, 'sqm', 71.5, 55.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and application of white paint finish to internal plastered wall surfaces, including surface preparation, filling of minor imperfections, sanding, one (1) coat approved primer, and two (2) coats rich matt white emulsion paint, including protection of adjacent finishes, touch-up, cleaning, and all necessary labour, materials, tools, and accessories to achieve a uniform and approved finish.

Code: WF01A
Finish: Rich Matt White
Application: 1 Coat Primer + 2 Coats Finish
Location: Internal Plastered Wall Surfaces
Code: WF01A', 689.3922, 'sqm', 45.5, 35.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply and application of white epoxy paint finish to internal plastered wall surfaces in wet areas, including surface preparation, cleaning, filling of minor imperfections, sanding, application of approved epoxy primer/sealer where required, and two (2) coats of white epoxy paint, including protection of adjacent finishes, touch-up, cleaning, and all necessary labour, materials, tools, and accessories to achieve a smooth, uniform, washable and water-resistant finish.

Code: WF01B
Finish: White Epoxy Paint
Application: Epoxy Primer/Sealer + 2 Coats White Epoxy Finish
Location: As per wall finishes schedule and approved drawings.', 59.85, 'sqm', 123.5, 95.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Supply and application of decorative special paint finish, including surface preparation, crack and imperfection filling, sanding, primer, base coat, and application of decorative finish, protection of adjacent finishes, and accessories.

Code: WF01C
Brand: San Marco or approved equivalent
Finish: Marmorino Decorative Finish or approved equivalent
Application: one coat primer then two coats of finishing paint
Location: As per wall finishes schedule and approved drawings.', 262.3824, 'sqm', 143.0, 110.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply and installation of wood cladding to wall surfaces, comprising MR MDF with veneer finish, including backing support system, cutting, edge finishing, fixing accessories, trims, sealants, and alignment.

Code: WF02B', 7.4004, 'sqm', 1207.0, 850.0, 42.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Supply, fabricate, cut, deliver, and install natural stone wall cladding, including setting out, cutting, edge finishing, premium stone adhesive, stainless steel mechanical fixings where required, jointing, levelling, alignment, sealing, cleaning, and protection.

Item Code: WF03A
Material: Brerra Limestone', 112.746, 'sqm', 990.0, 750.0, 32.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Installation of Client-Supplied Porcelain Wall Tiles, including setting out and marking, surface preparation, application of suitable premium tile adhesive, cutting and fitting, edge finishing, spacers and levelling, alignment, joint treatment and grouting, sanitary-grade sealant where required, cleaning, and protection upon completion.

Item Code: WF06A
Material: Client-supplied porcelain wall tiles', 211.0845, 'sqm', 119.6, 92.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', null, 'Supply, cutting, delivery, and installation of large-format wall cladding, including setting out, cutting, edge finishing, drilling where required, premium adhesive, stainless steel mechanical fixings where required, jointing, levelling, alignment, movement joints, cleaning, and protection.

Item Code: WF06D
Brand: Consentino
Size: 1420mm L x 3200mm ht
Material: Dekton - AerisKC - Matt - 8mm Slab
Supply PC Rate: AED 317.00/m²
Location: Master Bathroom', 86.2488, 'sqm', 716.4, 597.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, '10', null, 'Supply and installation of wall-mounted metal finish wall trim/door stopper, including aluminium finish profile, cutting to size, drilling, concealed or surface fixing with suitable anchors and screws, alignment, AND sealing.

Item Code: WT01A
Type: Aluminum
Location: In Master Bathroom', 1.0, 'LS', 747.5, 575.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, '11', null, 'Supply and installation of U-channel groove wall profile (wall trim), including aluminium finish U-channel section, cutting to size, groove formation coordination with wall finish, concealed fixing system, adhesive and mechanical anchors, alignment, jointing, sealing, and edge finishing.

Item Code: WT01B
Type: Aluminum', 1.0, 'LS', 3315.0, 2550.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, null, null, 'Note: Other Wall finishes not mentioned on this quote are excluded and quoted separately.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 9, 'E', 'Wall Skirting') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply, cutting, delivery, and installation of tile skirting with recessed shadow gap detail, including tile supply, cutting to size, edge finishing, formation of a continuous 10mm high recessed shadow gap, backing supports where required, adhesive fixing, alignment, joint treatment, and cleaning.

Code: SK01
Final Skirting Ht: TBC — Descoped
Note: Part of wall stone cladding', 9.0, 'LM', 182.0, 140.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply, cutting to size, fabrication, and installation of MDF/MR MDF shadow gap skirting, including formation of a continuous 10mm high recessed shadow gap, black paint finish to the shadow gap recess, edge finishing, fixing accessories, alignment, joint treatment,

Code: SK02A
Final Skirting Ht: TBC — Descoped
Note: Part of wall stone cladding', 12.0, 'LM', 182.0, 140.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply, cutting to size, fabrication, and installation of architectural aluminum shadow gap profile, comprising 10mm x 10mm black powder-coated aluminum profile, installed at the junction of floor finishes and aluminum cladding wall systems to create a continuous recessed shadow line. Works shall include profile fabrication, cutting, fixing brackets, alignment, joint treatment, and touch-up.

Code: SK02B
Final Skirting Ht: TBC
Type: Aluminum — Descoped', 3.0, 'LM', 182.0, 140.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply, cutting to size, fabrication, and installation of architectural aluminum shadow gap profile at painted wall finishes, comprising 10mm x 10mm black powder-coated extruded aluminum profile, including setting out, cutting, fabrication, fixing accessories, alignment, joint treatment, and touch-up works.

Code: SK02D
Final Skirting Ht: TBC
Type: Aluminum', 81.0, 'LM', 169.0, 130.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Supply, cutting to size, fabrication, and installation of recessed flush baseboard skirting system comprising 50mm MDF baseboard finished to match adjacent joinery works, installed flush with the finished wall surface and incorporating a continuous 10mm x 10mm recessed U-channel groove profile finished in a color matching the wall paint. Works shall include backing supports, framing adjustments, groove profile installation, finishing, fixing accessories, alignment.

Code: SK03
Final Skirting Ht: TBC
Type: Aluminum', 105.0, 'LM', 234.0, 180.0, 30.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 10, 'G', 'Glass Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1a.', '(Option 1 - Fluted Glass)', 'Supply, fabrication, and installation of shower glass door, comprising 10mm thk clear flutted glass single leaf hinged door with frame & accessories in electroplated finish

Size: 3.0m ht x 0.90m W
frame: 20mmH x 16mmD x 20mmH stainless steel frame in electroplated finish

Location: Bathroom 01, Bathroom 03, & Bathroom 04', 3.0, 'Nos.', 10098.27, 7371.0, 37.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2a.', '(Option 1 - Fluted Glass)', 'Supply, fabrication, and installation of shower glass door, comprising 10mm thk clear flutted glass single leaf pivot door with frame & accessories in electroplated finish

Size: 3.0m ht x 0.90m W
frame: 20mmH x 16mmD x 20mmH stainless steel frame in electroplated finish

Location: Master Bathroom WC & Shower Area', 2.0, 'Nos.', 10486.665, 7654.5, 37.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3a.', '(Option 1 - Fluted Glass)', 'Supply, fabrication, and installation of shower glass enclosure comprising glass door and fixed shower glass partition, fabricated from 10mm thk clear flutted glass single leaf hinged door & equal fixed panels on both sides with frame & accessories in electroplated finish

Size: 3.0m ht x 1.60m W 
Hinged Door: 900mm W x 3000mm ht
Fixed Panel: 350mm W x 3000mm ht (2 Nos.)
frame: 20mmH x 16mmD x 20mmH stainless steel frame in electroplated finish

Location: Bathroom 02', 1.0, 'Nos.', 17297.28, 13104.0, 32.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '1b.', '(Option 2 - Tinted Glass)', 'Supply, fabrication, and installation of shower glass door, comprising 10mm thk brown tinted glass single leaf hinged door with frame & accessories in electroplated finish

Size: 3.0m ht x 0.90m W

Location: Bathroom 01, Bathroom 03, & Bathroom 04 — Optional: Rate Only', 3.0, 'Nos.', 7371.0, 5670.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '2b.', '(Option 2 - Tinted Glass)', 'Supply, fabrication, and installation of shower glass door, comprising 10mm thk brown tinted glass single leaf pivot door with frame & accessories in electroplated finish

Size: 3.0m ht x 0.90m W

Location: Master Bathroom WC & Shower Area — Optional: Rate Only', 2.0, 'Nos.', 7739.55, 5953.5, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '3b.', '(Option 2 - Tinted Glass)', 'Supply, fabrication, and installation of shower glass enclosure comprising glass door and fixed shower glass partition, fabricated from 10mm thk brown tinted glass single leaf hinged door & equal fixed panels on both sides with frame & accessories in electroplated finish

Size: 3.0m ht x 1.60m W 
Hinged Door: 900mm W x 3000mm ht
Fixed Panel: 350mm W x 3000mm ht (2 Nos.)

Location: Bathroom 02 — Optional: Rate Only', 1.0, 'Nos.', 13104.0, 10080.0, 30.0, false, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 11, 'IV', 'Joinery Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'KITCHEN CABINET:

Supply and installation of kitchen cabinet made of MDF with outside lacquer paint finish, internal egger laminate (lava color), external white oak veneer/recon and lacquer paint finish,champagne finish on metal handle, dektion porcelain tile on counter top and walls including doors, slate wood veneer laminate with tinted glass, cabinets, drawers, shelves, cabinet shelves, hinged door, roller latch without lock, including soft closing, pull out trash bin, LED strip light below. Details and colour as per approved drawing.

Note: 
1.  Included cabinet internal accessories 

Marble Rate Considered: 700.00 AED/sqm
Full height cabinet: 6530+3945mmL x 600mmW x 3800mmHT (Elevation- E+F)
Note: 
1. Excluding sink, mixer and appliances', 1.0, 'Nos.', 145722.0, 97800.0, 49.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'KITCHEN ISLAND COUNTER UNIT:

Supply and installation of kitchen island counter made of MDF with inside laminate finish, outside wood veneer lamiated finish, champagne finish on metal frame,dektion porcelain tile on countertop. including cabinets, drawers, shelves, LED strip light inside the cabinet. details and colour as per approved drawing.

Note: 
1.  Included cabinet internal accessories

Size: 4100mmL x 1200mmW x 900mmHT
Marble Rate considered: 700.00 AED/sqm
Note: Excluding all appliances', 1.0, 'Nos.', 29502.0, 19800.0, 49.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'DISPLAY SHELVES (GROUND FLOOR):

Supply and installation of display shelves made of MDF with fabric finish cladding, 5mm thick bronze or champagne aluminium profile strip, egger laminate lava colour finish and external white oak veneer/recon, including white oak veneer  hanging shelves with concealed LED strip lights and wall framing support on drawers,shelf, 2 internal drawer with cutlery divider details as per approved drawing. 

Note:
1. Stone is included as per the design

Size: 3730mmL x 600mmW x 4050mmHT', 1.0, 'Nos.', 42480.0, 29500.0, 44.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'TV UNIT (GROUND FLOOR):

Supply and installation of MDF with inside egger laminate (lava colour) finish and outside white oak veneer finish/recon, 5x5mm groove including white oak veneer  finish drawer console with concealed wall framing support and metal leg 10mmHT Black painted wood shadow gap,including LED strip light for console. details as per approved sample.           

Note:
1. console is stone with drawer
2. internal socket included                          

Marble Rate Considered: 850.00 AED/sqm
Size: 3100mmL x 450mmW x 4050mmHT', 1.0, 'Nos.', 36897.0, 25100.0, 47.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'FAMILY AREA TV UNIT & PANTRY UNIT (FIRST FLOOR):

Supply and installation of family area tv unit made of MDF with internal egger laminate finish (lava color) and external white oak veneer/recon and metalic paint finish, stone finish on back wall- dekton, lacquer paint finish on open shelf area and side panel. including pantry counter with top marble finish, cabinet, shelf, doors, marble finish hanging shelves wall framing support & LED strip lights, including pocket door for pantry counter. details as per approved drawing.   

Note:
1. in the pantry backsplash stone.
2. internal socket considered
3. ventelation for built in fridge

TV unit size: 1300/TBC  
Size: 6770mmL x 640mmW x 3300mmHT 
Marble Rate considered: 850.00 AED/sqm', 1.0, 'Nos.', 70266.0, 47800.0, 47.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'HANGING VANITY COUNTER (ELEVATION B):

Supply and installation of MDF with wood veneer drawer with concealed LED strip lights and wall framing support.including open shelf made MDF with pu paint or veneer finish with concealed framing support. details as per approved drawing. (excluding mirror) (Including drawer )      

Size: 5600mmL x 350mmW x 750mmHT
Location: Master Bedroom', 1.0, 'Nos.', 11907.0, 8100.0, 47.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'BACK WALL (ELEVATION C):

Supply and installation of wall made of MDF with fabric finish.including wood veneer laminate hanging counter with concealed LED strip lights and wall framing support, including metal strips, details as per approved drawing.   

Size: 4160mmL x 200mmW x 3300mmHT
Location: Master Bedroom', 1.0, 'Nos.', 21280.0, 15200.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'CABINET (ELEVATION D):

Supply and installation of cabinet made of MDF with inside egger laminate finish and outside white oak veneer/recon and metalic paint finish. including pantry counter, marble finish hanging shelves with concealed wall framing support, marble finish back wall, shelves, pocket doors, including socket provision, drawers, LED strip light below shelf. details as per approved drawing.     

Size: 3900mmL x 600mmW x 3300mmHT
Location: Master Bedroom          

Note: 
1. Wardrobe divisions to be considered (under pantry we will have mini fridge and three drawers - including divier) along with all required accessories
2. the rod to be in black/bronze
3. the internal of wardrobe should match with poliform
4. capping on facia of shelves and skirting to be included', 1.0, 'Nos.', 42465.0, 28500.0, 49.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', null, 'HANGING VANITY COUNTER AND HANGING SHELF (ELEVATION A):

Supply and installation of hanging counter and shelf made of MDF with inside laminate and outside paint finish open shelf and wall cladding laminate fabric finish, top shelf white oak veneer finish with dekton marble finish top concealed LED strip lights and wall framing support, provision for sockets and division for hair dryer, details as per approved drawing.  

Note: 
1. Side drawer as per ID package to be considered along with internal sockets and division for hair dryer
2. Top material of drawer is dekton/marble
3. External Materials: laminate fabric, white oak wood veneer and metallic paint finish.
4. Internal materials: laminate

Size: 1600mmL x 650mmW x 3300mmHT
Location: Master Bedroom', 1.0, 'Nos.', 13708.0, 9200.0, 49.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, '11', null, 'FULL WARDROBE:

Supply and installation of shoes and bags shelf made of MDF with inside laminate  and outside fabric texture laminate finish, LED strip light, bronze capping for shelves and skirting, details as per approved drawing. including full wardrobe

Note: 
1. wardrobe shuters to be laminate fabric or linen texture 
2. internal material to be laminate (will have different color and texture combination) to match with poliform design 
3. all the shelves to have bronze capping including the skirting 
4. metal capping around the shutters to be included as well as the handel 
5. glass doors to be changed to solid shutter 
6. for internal division, please refer to the attached document 
7. safe door to be includuded with all required accessories 
8. doors to be mentioned with mesh     

Size: (3060+3730+3260+2360+1300)mmL x 650mmW x 3300mmHT
Location: Master Dresser', 1.0, 'Nos.', 113240.0, 76000.0, 49.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, '12', null, 'WALL PANEL:

Supply and installation of wall panel made of MDF with fabric finish, as per approved sample.    

Size: (1100+700+1150+680+680)mmL x 3300mmHT
Location: Master Dresser', 1.0, 'Nos.', 19536.0, 14800.0, 32.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, '13', null, 'FORMAL POWDER ROOM VANITY COUNTER: 

Supply and installation of vanity counter made of marine plywood with fluted marble finish - green verde marble leather finish, including LED strip light, including inbuilt wash basin, as per approved sample, details as per drawing 

Size: 1600mmL x 720mmW x 900mmHT
Marble rate considered: 700.00 AED/sqm
Note: Excluding Mixer', 1.0, 'Nos.', 14994.0, 10200.0, 47.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, '14', null, 'FORMAL POWDER ROOM VANITY COUNTER: 

Supply and installation of vanity counter made of marine plywood with fluted marble finish - green verde marble leather finish, including LED strip light, including inbuilt wash basin, as per approved sample, details as per drawing 

Size: 1100mmL x 600mmW x 900mmHT
Marble rate considered: 700.00 AED/sqm
Note: Excluding Mixer', 1.0, 'Nos.', 11025.0, 7500.0, 47.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, '15', null, 'FORMAL POWDER ROOM CABINETS (ELECTRICAL CABINET):

Supply and installation of cabinets made of MDF with inside laminate finish and outside white oak wood veneer finish. including doors, shelves, LED strip light. details as per drawing 

Size: 990mmL x 435mmW x 3800mmHT', 1.0, 'Nos.', 9372.0, 6600.0, 42.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, '16', null, 'FORMAL POWDER ROOM CABINETS (TELEPHONE CABINET):

Supply and installation of cabinets made of MDF with inside laminate finish and outside white oak wood veneer finish. including doors, shelves, LED strip light. details as per drawing 

Size: 1210mmL x 470mmW x 3800mmHT', 1.0, 'Nos.', 11431.0, 8050.0, 42.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, '17', null, 'FORMAL POWDER ROOM WALL CLADDING:

Supply and installation of cabinets made of MDF with white oak wood veneer finish. details as per 
drawing.                

Size: 6045mmL x 3800mmHT', 1.0, 'Nos.', 35112.0, 26600.0, 32.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, '18', null, 'FAMILY POWDER ROOM VANITY COUNTER: 

Supply and installation of vanity counter with integrated sink made of MDF with white oak veneer outside and inside laminate finish, fluted design, counter top green marble finish - LED strip light as per approved sample, details as per drawing

Size: 2450mmL x 720mmW x 1050mmHT
Marble rate considered: 700.00 AED/sqm
Note: Excluding mixer to be supplied by client', 1.0, 'Nos.', 16758.0, 11400.0, 47.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, '19', null, 'FAMILY POWDER ROOM VANITY COUNTER: 

Supply and installation of vanity counter with intergrated sink made of MDF with white oak veneer outside and inside laminate finish, fluted design, counter top green marble finish - LED strip light as per approved sample, details as per drawing

Size: 1820mmL x 600mmW x 1050mmHT
Marble rate considered: 700.00 AED/sqm

Note: Excluding mixer to be supplied by client', 1.0, 'Nos.', 11172.0, 7600.0, 47.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, '20', null, 'FIRST FLOOR BATHROOM 1: 

Supply and installation of vanity counter made of MDF with wood laminate finish and external white oak wood veneer finish, fluted design, counter top marble finish, including LED strip light as per approved sample, details as per drawing.

Size: 1150mmL x 600mmW x 500mmHT
Marble rate considered: 610.00 AED/sqm (dekton marmorio marble)
Note: Excluding mixer', 1.0, 'Nos.', 8151.0, 6270.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, '21', null, 'FIRST FLOOR BATHROOM 2: 

Supply and installation of vanity counter made of MDF with inside laminate finish and outside white oak wood veneer finish, fluted design, counter top marble finish including LED strip light, as per approved sample, details as per drawing    

Size: 2040mmL x 600mmW x 500mmHT
Marble rate considered: 610.00 AED/sqm (dekton marmorio marble)
Note: Excluding mixer', 1.0, 'Nos.', 11570.0, 8900.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, '22', null, 'FIRST FLOOR BATHROOM 3: 

Supply and installation of vanity counter made of MDF with inside laminate finish and outside white oak wood veneer finish, fluted design, counter top marble finish including LED strip light, as per approved sample, details as per drawing   
    
Size: 1340mmL x 600mmW x 500mmHT
Marble rate considered: 610.00 AED/sqm (dekton marmorio marble)
Note: Excluding mixer', 1.0, 'Nos.', 8320.0, 6400.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, '23', null, 'FIRST FLOOR BATHROOM 4: 

Supply and installation of vanity counter made of MDF with inside laminate finish and outside white oak wood veneer finish, fluted design, counter top marble finish including LED strip light, as per approved sample, details as per drawing       

Size: 1340mmL x 600mmW x 500mmHT
Marble rate considered: 610.00 AED/sqm (dekton marmorio marble)
Note: Excluding mixer', 1.0, 'Nos.', 8320.0, 6400.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 22, '24', null, 'MASTER BATHROOM:

Supply and installation of vanity counter made of 
MDF with outside marble finish facia, counter top marble finish, including shelf & drawer with white oak wood finish inside, LED strip light  as per approved sample, details as per drawing          

Size: 4100mmL x 400mmW x 4500mmHT
Note: Excluding wash basin & mixer to be supplied by client', 1.0, 'Nos.', 26166.0, 17800.0, 47.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 23, '25', null, 'MASTER POWDER ROOM WALL CLADDING:

Supply and installation of wall cladding made of MDF with laminate finish   

Size: 1140mmL x 4500mmHT

Location: Master Bedroom — Descoped', 2.0, 'Nos.', 6615.0, 4900.0, 35.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 24, '26', null, 'Supply and installation of wardrobe made of  MDF with inside laminate and outside oak veneer finish, including shelf, drawer, LED strip light. All the handles, rods, accessories included, details as per approved drawing.

Note: Divisions as per approved drawing.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 25, '26a.', null, 'BEDROOM 1:

Size: 2300+2420+930mmLx650mmWx3300mmHT', 1.0, 'Nos.', 43875.0, 32500.0, 35.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 26, '26b.', null, 'BEDROOM 2:

Size: 3200+1170mmLx650mmWx3300mmHT', 1.0, 'Nos.', 33817.5, 25050.0, 35.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 27, '26c.', null, 'BEDROOM 2:

Size: 3960mmLx650mmWx3300mmHT', 1.0, 'Nos.', 30645.0, 22700.0, 35.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 28, '26d.', null, 'BEDROOM 3:

Size: 4800mmLx650mmWx3300mmHT', 1.0, 'Nos.', 37125.0, 27500.0, 35.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 29, '26e.', null, 'BEDROOM 3:

Size: 1785mmLx650mmWx3300mmHT', 2.0, 'Nos.', 13770.0, 10200.0, 35.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 30, '26f.', null, 'BEDROOM 4:

Size: 1785mmLx650mmWx3300mmHT', 2.0, 'Nos.', 13770.0, 10200.0, 35.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 31, '27', null, 'Doors:

Supply and fixing of frame and architrave made of solid  wood with wood veneer finish, door made of hardwood framing, solid core, both side 6 mm layers of MDF with solid wood lipping and wood veneer, concealed hinges including door stopper, details as per drawing.     

Budgetary Cost for Ironmongaries: 700 AED per Door', null, null, null, null, 30.0, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 32, '27a.', null, 'Master Bedroom Door: 1200mmL x 3550mmHT', 1.0, 'Nos.', 7700.0, 5500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 33, '27b.', null, 'Formal Powder Door: 1100mmL x 3800mmHT — Descoped', 1.0, 'Nos.', 7560.0, 5400.0, 40.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 34, '27c.', null, 'Formal Powder WC Door: 1000mmL x 3800mmHT', 1.0, 'Nos.', 7560.0, 5400.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 35, '27d.', null, 'Formal Powder Room Abaya Door: 1000mmL x 3800mmHT', 1.0, 'Nos.', 7560.0, 5400.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 36, '27e.', null, 'Formal Powder Room Abaya Door: 850mmL x 3800mmHT', 1.0, 'Nos.', 7280.0, 5200.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 37, '27f.', null, 'Family Powder Room Door: 1000mmL x 3800mmHT — Descoped', 1.0, 'Nos.', 7420.0, 5300.0, 40.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 38, '27g.', null, 'Family Powder Room WC Door: 1000mmL x 3800mmHT', 1.0, 'Nos.', 7560.0, 5400.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 39, '27h.', null, 'First Floor Bathroom 01 Door: 1000mmL x 3300mmHT', 1.0, 'Nos.', 7560.0, 5400.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 40, '27i.', null, 'First Floor Bathroom 02 Door: 1000mmL x 3300mmHT', 1.0, 'Nos.', 7560.0, 5400.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 41, '27j.', null, 'First Floor Bathroom 03 Door: 900mmL x 3300mmHT', 1.0, 'Nos.', 7420.0, 5300.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 42, '27k.', null, 'First Floor Bathroom 04 Door: 1000mmL x 3300mmHT', 1.0, 'Nos.', 7560.0, 5400.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 43, '27l.', null, 'First Floor Master Bath Door: 1200mmL x 3300mmHT

External finish to be oak wood with inside mirror, soft closing, and slim track', 1.0, 'Nos.', 7840.0, 5600.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 44, '27m.', null, 'Store Room Double Door: 1050mm L x 3300mmHT', 1.0, 'Nos.', 9380.0, 6700.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 45, '27n.', null, 'Electrical Room Double Door: 1000mm L x 3300mm HT', 1.0, 'Nos.', 9380.0, 6700.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 46, '27o.', null, 'Master Dresser Room Sliding Door: 1200mm L x 3300mmHt', 1.0, 'Nos.', 21060.0, 16200.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 47, '27p.', null, 'Office Door (Inside wood veneer finish and outside mirror finish) : 1100mm L x 3800mmHt', 1.0, 'Nos.', 11760.0, 8400.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 48, '27q.', null, 'Bedroom 01: 1200mm L x 3550mmHt', 1.0, 'Nos.', 7700.0, 5500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 49, '27r.', null, 'Bedroom 02: 1200mm L x 3550mmHt', 1.0, 'Nos.', 7700.0, 5500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 50, '27s.', null, 'Bedroom 03: 1200mm L x 3550mmHt', 1.0, 'Nos.', 7700.0, 5500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 51, '27t.', null, 'Bedroom 04: 1200mm L x 3550mmHt', 1.0, 'Nos.', 7700.0, 5500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 52, '27u.', null, 'Service Stair Door: 1200mm L x 3550mmHt', 1.0, 'Nos.', 7700.0, 5500.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 53, null, 'Note: Main Door is excluded', 'Note: Other Joinery Items not mentioned on this quote are excluded', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 12, 'V', 'Niches & Shower Benches Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply, fabricate, cut, deliver, and install natural stone shower niche complete with 20mm thick semi-polished stone lining, including backing support, cutting to size, edge polishing, fabrication of four (4) open stone shelves, concealed LED channel with diffuser, LED strip light, driver, wiring connection to the nearest power point, premium adhesive, silicone sealing, alignment, cleaning, and all necessary accessories required to complete the installation.

Location: Master Bathroom (WC)
Material: Costa Esmeralda Natural Stone
Brand: Glaze
Finish: semi-Polished
Stone Thickness: 20mm
Overall Size: 3000mm (H) × 410mm (W) × 150mm (D)
Shelves: 4 Nos. Open Stone Shelves with Concealed LED
Supply PC Rate: AED 535.00/m²', 1.0, 'LS', 7670.0, 5900.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply, fabricate, cut, deliver, and install natural stone shower niche complete with 20mm thick semi-polished stone lining, including backing support, cutting to size, edge polishing, fabrication of four (4) open stone shelves, concealed LED channel with diffuser, LED strip light, driver, wiring connection to the nearest power point, premium adhesive, silicone sealing, alignment, cleaning, and all necessary accessories required to complete the installation.

Location: Master Bathroom (shower)
Material: Costa Esmeralda Natural Stone
Brand: Glaze
Finish: semi-Polished
Stone Thickness: 20mm
Overall Size: 3020mm (H) × 410mm (W) × 150mm (D)
Shelves: 4 Nos. Open Stone Shelves with Concealed LED
Supply PC Rate: AED 535.00/m²', 1.0, 'LS', 8138.0, 6260.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply, fabricate, cut, deliver, and install custom-built shower bench with concealed LED lighting, comprising a moisture-resistant internal support frame clad with 20mm thick semi-polished Costa Esmeralda natural stone, including cut-to-size fabrication, edge polishing, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, and cleaning.

Location: Master Bathroom
Brand: Glaze
Material: Costa Esmeralda Natural Stone
Finish: semi-Polished
Stone Thickness: 20mm
Overall Size: 1,510mm (L) × 350mm (D) × 150mm (H)
Supply PC Rate: AED 535.00/m²', 1.0, 'LS', 5798.0, 4460.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply, fabricate, cut, deliver, and install custom-built shower niche, including moisture-resistant backing support, cut-to-size fabrication, edge finishing, three (3) open shelves, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, and cleaning.

Location: Bathroom 01
Brand: Cosentino
Material: Dekton – Marmorio KC
Finish: Matt
Slab Thickness: 12mm
Overall Size: 2,420mm (H) × 350mm (W) × 150mm (D)
Shelves: 3 Nos. Open Shelves with Concealed LED
Supply PC Rate: AED 607.00/m²', 1.0, 'LS', 7358.0, 5660.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Supply, fabricate, cut, deliver, and install custom-built shower bench with concealed LED lighting, comprising a moisture-resistant internal support frame clad with 12mm thick Dekton Marmorio KC ultra-compact surface, including cut-to-size fabrication, mitred edge finishing, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, cleaning, and all necessary accessories

Location: Bathroom 01
Brand: Cosentino
Material: Dekton – Marmorio KC
Finish: Matt
Slab Thickness: 12mm
Overall Size: 1,690mm (L) × 350mm (D) × 150mm (H)
Supply PC Rate: AED 607.00/m²', 1.0, 'LS', 5330.0, 4100.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply, fabricate, cut, deliver, and install custom-built niche above WC with concealed LED lighting, comprising 12mm thick Dekton Marmorio KC ultra-compact surface lining, moisture-resistant backing support, cut-to-size fabrication, edge finishing, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, cleaning, and all necessary accessories.

Location: Bathroom 02
Brand: Cosentino
Material: Dekton – Marmorio KC
Finish: Matt
Slab Thickness: 12mm
Overall Size: 2,100mm (L) × 350mm (H) × 150mm (D)
Supply PC Rate: AED 607.00/m²', 1.0, 'LS', 4238.0, 3260.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Supply, fabricate, cut, deliver, and install custom-built shower niche, including moisture-resistant backing support, cut-to-size fabrication, edge finishing, three (3) open shelves, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, and cleaning.

Location: Bathroom 02
Brand: Cosentino
Material: Dekton – Marmorio KC
Finish: Matt
Slab Thickness: 12mm
Overall Size: 2,420mm (H) × 380mm (W) × 150mm (D)
Shelves: 3 Nos. Open Shelves with Concealed LED
Supply PC Rate: AED 607.00/m²', 1.0, 'LS', 7670.0, 5900.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Supply, fabricate, cut, deliver, and install custom-built shower bench with concealed LED lighting, comprising a moisture-resistant internal support frame clad with 12mm thick Dekton Marmorio KC ultra-compact surface, including cut-to-size fabrication, mitred edge finishing, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, cleaning, and all necessary accessories

Location: Bathroom 02
Brand: Cosentino
Material: Dekton – Marmorio KC
Finish: Matt
Slab Thickness: 12mm
Overall Size: 1,745mm (L) × 350mm (D) × 150mm (H)
Supply PC Rate: AED 607.00/m²', 1.0, 'LS', 5642.0, 4340.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', null, 'Supply, fabricate, cut, deliver, and install custom-built shower niche, including moisture-resistant backing support, cut-to-size fabrication, edge finishing, three (3) open shelves, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, and cleaning.

Location: Bathroom 03
Brand: Cosentino
Material: Dekton – Marmorio KC
Finish: Matt
Slab Thickness: 12mm
Overall Size: 1,950mm (H) × 350mm (W) × 150mm (D)
Shelves: 3 Nos. Open Shelves with Concealed LED
Supply PC Rate: AED 607.00/m²', 1.0, 'LS', 6578.0, 5060.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, '10', null, 'Supply, fabricate, cut, deliver, and install custom-built shower bench with concealed LED lighting, comprising a moisture-resistant internal support frame clad with 12mm thick Dekton Marmorio KC ultra-compact surface, including cut-to-size fabrication, mitred edge finishing, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, cleaning, and all necessary accessories

Location: Bathroom 03
Brand: Cosentino
Material: Dekton – Marmorio KC
Finish: Matt
Slab Thickness: 12mm
Overall Size: 1,140mm (L) × 350mm (D) × 150mm (H)
Supply PC Rate: AED 607.00/m²', 1.0, 'LS', 4706.0, 3620.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, '11', null, 'Supply, fabricate, cut, deliver, and install custom-built shower niche, including moisture-resistant backing support, cut-to-size fabrication, edge finishing, three (3) open shelves, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, and cleaning.

Location: Bathroom 04
Brand: Cosentino
Material: Dekton – Marmorio KC
Finish: Matt
Slab Thickness: 12mm
Overall Size: 1,950mm (H) × 410mm (W) × 150mm (D)
Shelves: 3 Nos. Open Shelves with Concealed LED
Supply PC Rate: AED 607.00/m²', 1.0, 'LS', 6890.0, 5300.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, '10', null, 'Supply, fabricate, cut, deliver, and install custom-built shower bench with concealed LED lighting, comprising a moisture-resistant internal support frame clad with 12mm thick Dekton Marmorio KC ultra-compact surface, including cut-to-size fabrication, mitred edge finishing, concealed LED aluminum channel with diffuser, LED strip light, LED driver, wiring connection to the nearest power point, premium adhesive, sanitary-grade silicone sealant, concealed fixing, alignment, cleaning, and all necessary accessories

Location: Bathroom 04
Brand: Cosentino
Material: Dekton – Marmorio KC
Finish: Matt
Slab Thickness: 12mm
Overall Size: 1,140mm (L) × 350mm (D) × 150mm (H)
Supply PC Rate: AED 607.00/m²', 1.0, 'LS', 4706.0, 3620.0, 30.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 13, 'VI', 'Mirrors') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Mirror Frame:

Supply and installation of 6mm mirror with led strip light 

Location: Bathroom 01 (Mirror Cabinet)
Overall Size: 1,150mm (L) × 150mm (D) × 1,200mm (H) - without frame', 1.0, 'Nos.', 2535.0, 1950.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Mirror Frame:

Supply and installation of 6mm mirror with led strip light 

Location: Bathroom 02 (Mirror Cabinet)
Overall Size: 2,040mm (L) × 150mm (D) × 1,200mm (H) - without frame', 1.0, 'Nos.', 4615.0, 3550.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Mirror Frame:

Supply and installation of 6mm mirror with led strip light 

Location: Bathroom 03 (Mirror Cabinet)
Overall Size: 1,340mm (L) × 150mm (D) × 1,200mm (H) - without frame', 1.0, 'Nos.', 2925.0, 2250.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Mirror Frame:

Supply and installation of 6mm mirror with led strip light 

Location: Bathroom 04 (Mirror Cabinet)
Overall Size: 1,340mm (L) × 150mm (D) × 1,200mm (H) - without frame', 1.0, 'Nos.', 2925.0, 2250.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Mirror Frame:

Supply and installation of 6mm mirror with led strip light including marble frame matching to counter

Location: Family Powder Room
Mirror Size: 1,800mm (H) × 600mm (W)', 3.0, 'Nos.', 1885.0, 1450.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Mirror Frame:

Supply and installation of 6mm mirror with led strip light 

Location: Formal Powder Room
Mirror Size: 2,800mm (H) × 1,100mm (W) - without frame', 1.0, 'Nos.', 7020.0, 5400.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Mirror Frame:

Supply and installation of 6mm mirror with required profile and frame 8cm by 0.5cm including electroplating.

Location: Master Bedroom (Mirror Cabinet)
Size: 3400mm L x 150mm x 1200mm ht', 1.0, 'Nos.', 7345.0, 5650.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Mirror Frame:

Supply and installation of 6mm mirror with led strip light 
Frame size: 8cm x 0.5cm 
Finish: Electroplated (TBC finish)

Location: Master Bedroom hanging vanity mirror with frame — Descoped', 1.0, 'Nos.', 3315.0, 2550.0, 30.0, false, true);
insert into boq_sections(boq_id, sort, code, title) values (b, 14, 'VII', 'Staircase Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Technical Design:

-Site preparation for scanning (cleaning, flags set out, templates set out, pre model)
-Detailed 3d scan or templates engineering survey
-Detailed 3D model preparation for customer''s/architect''s approval with up to two non principal design revisions
- Full fabrication drawings  
- Load report in Solidworks
- Structural engineering calculations by others

* Site to be prepared for clear view of scanning equipment by customer, wasted visits will be charged for (!)', 1.0, 'LS', 328204.6, 231130.0, 42.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Steel Structural:

- Dual stringer S275 metal structure (thickness subject to technical design)
- CNC cut stringers
- CNC cut steps
- Primering included
- Exposed areas finished to RAL
- 25 steps
- 1 Half Landing platfrom', null, null, null, null, 30.0, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Hardwood Steps (Timber):

- White oak bespoke steps
- 1200mmX1200mm step X 22
- 2600mmX1500mm half landing platfrom
- Mitre joints
- Stained to RAL', null, null, null, null, 30.0, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Glass Balustrade

-17.5mm, tempered, polished all around, laminated , crystal clear ( LOW IRON) glass
- 1200mm above FFL
- 16 linear meters
- Staicase glassed installed into pre-manufactured slots inside the staircase
- Landing glass installed into top mounted aluminium  base shoe ( U channel) - Nexus system or similar
- including 2 landing areas', null, null, null, null, 30.0, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, '1st floor Landing Steel Structure:

- Detailed 3D model preparation for customer''s/architect''s approval with up to two nonprincipal design revisions
- Full fabrication drawings set
- Load report in Solidworks
- 1st floor landing steel structure
- 2800mmX4900mm
- Primary beams S275 203×102×23 UB
- Secondary joists S275 127×76×13 UB
- All metal primed', 1.0, 'LS', 64621.2, 41160.0, 57.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply and application of protective paint system to structural steel members, including surface preparation, cleaning, touch-up of damaged shop primer, one (1) coat zinc-rich epoxy primer, and two (2) coats polyurethane finish paint, complete with masking, application, touch-up after installation, and all necessary materials', 1.0, 'LS', 9393.6, 6180.0, 52.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Cement Board / Tile Backer Board Floor Substrate:

Supply and installation of heavy-duty cement board/tile backer board over the structural steel framing, including galvanized self-drilling screws, joint treatment, reinforcement tape, levelling, preparation to receive Dekton floor finish, and all necessary accessories.

Thickness: 18–20mm Heavy Duty Cement Board
Size: 2800mm x 4900mm', 1.0, 'LS', 11932.0, 7850.0, 52.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 15, 'VIII', 'Roof Floor') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Supply and apply of paint on the ceiling. (One coat primer & two coat Rich mat white)

Location: Roof Floor', 162.5, 'sqm', 45.5, 35.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply and application of white paint finish to internal plastered wall surfaces, including surface preparation, filling of minor imperfections, sanding, one (1) coat approved primer, and two (2) coats rich matt white emulsion paint, including protection of adjacent finishes, touch-up, cleaning, and all necessary labour, materials, tools, and accessories to achieve a uniform and approved finish.

Location: Roof Floor', 218.5, 'sqm', 45.5, 35.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Supply and installation of cement-sand floor screeding with varying thickness from 50mm to 150mm, including surface preparation, cleaning, level setting, supply of cement, sand and additives, mixing, placing, compaction, leveling, finishing and curing.

Location: Roof Floor', 162.5, 'sqm', 110.5, 85.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'ROOF FLOOR BATHROOM:

Supply and installation of vanity counter made of MDF with inside laminate finish and outside white oak wood veneer finish, fluted design, counter top marble finish including LED strip light, as per approved sample, details as per drawing       

Size: 1340mmL x 600mmW x 500mmHT
Marble rate considered: 610.00 AED/sqm (dekton marmorio marble)
Note: Excluding mixer', 1.0, 'Nos.', 8320.0, 6400.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Installation of client-supplied porcelain floor tiles, including setting out, surface preparation, application of premium cementitious tile adhesive, edge finishing, levelling, alignment, spacers, movement joints where required, grouting, cleaning, and protection of completed tile works until handover.

Code: FL02A
Material: Porcelain Floor Tiles – Client Supplied
Location: Roof Floor', 11.25, 'sqm', 119.6, 92.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Installation of Client-Supplied Porcelain Wall Tiles, including setting out and marking, surface preparation, application of suitable premium tile adhesive, cutting and fitting, edge finishing, spacers and levelling, alignment, joint treatment and grouting, sanitary-grade sealant where required, cleaning, and protection upon completion.

Item Code: WF06A
Material: Client-supplied porcelain wall tiles', 49.1865, 'sqm', 119.6, 92.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, null, null, 'Note: Floor Finishes to be confirmed and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, null, null, 'Note: Any Civil & Structural Works not mentioned on this quote are excluded and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, null, null, 'Note: Outdoor Roof Floor, Service Staircase (floor & wall finishes included) & Outdoor Works are excluded and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, null, null, 'Note: Outdoor Façade Works  are excluded and quoted separately', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, null, null, 'Note: Others not mentioned on this quote are excluded and quoted separately', null, null, null, null, null, true, false);
update boqs set discount = 60435.65 where id = b;  -- register signed value 2,857,142.85 = AED 3.0M inc VAT; confirm
update boqs set status = 'APPROVED' where id = b;
end $x$;
