set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = 'c900245a-da52-4957-8b43-fcdac4e7b1f8' and source_file = 'BOQ - Villa 112, Al Reem, Arabian Ranches Landscaping & Other Works_rev04.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('c900245a-da52-4957-8b43-fcdac4e7b1f8', 'QUOTE', 4, v, 'Villa 112, Al Reem Landscaping & Other Works', 'BBC/122025/00040_rev04', 'DRAFT', '2026-10-08', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Villa 112, Al Reem, Arabian Ranches Landscaping & Other Works_rev04.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Design & Drawing: 

Full Set of Detailed Drawings for Production and Site Execution, including 3D renders, plans, elevations, sections and construction details, as per approved design.', 1.0, 'LS', 5890.0, 3100.0, 90.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Mobilization & Site Management: 

General contractor’s preliminaries for mobilization, site preparation, setting out transportations to/from site, material deliveries, small tools and equipment, protection of finished products in on-going site, lift and common corridor, site attendance & call out attendance, daily & final cleaning and snagging.', 1.0, 'LS', 13300.0, 7000.0, 90.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, null, null, 'All government approvals, authority permits, NOCs, and any other related approvals required for the execution of the works will be quoted separately.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'B', 'Flooring Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'B1.', null, 'Screed Work: 

Supply and Installation of High-Quality Cement Screed, including surface preparation, leveling, mixing, laying, compaction, finishing and curing to achieve a smooth and level surface, complete as per approved specifications.

Location: Pergola, Firepit area & Stepping Stone to pergola
Thickness: 100 mm', 1.0, 'LS', 12415.0, 9550.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'B2.', null, 'Tile Work: 

Installation of client supplied 600 × 1200 mm tiles, including surface preparation, leveling, adhesive application, precise tile laying with uniform joints, grouting, finishing, edge cutting, and final site cleaning. 

Location: Pergola, Firepit area & Stepping Stone to 
pergola
Area: 30 SQM
Note: tiles to be supplied by client.', null, null, null, null, 30.0, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'B3.', null, 'Earthfilling and Compacting to outdoor areas for the tiling works', 1.0, 'LS', 1300.0, 1000.0, 30.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'C', 'Metal Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'C1a.', null, 'Fixed Louvered Pergola:

Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (4.5 m x 4.3 m). RAL color options can be select from client side, Price will vary for wooden texture, grid finish & metallic finish. 

Specifications: 
Columns: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated 
Beams: 15 cm x 15 cm aluminium tube profile, RAL colour powder-coated 
Rafters: 10 cm x 5 cm aluminium tube profile, RAL colour powder-coated 

Notes: 
1. Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation.', 1.0, 'Nos.', 40430.0, 31100.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'C1b.', null, 'Fixed Louvered Pergola:

Supply and installation of A-grade powder-coated aluminium louvered pergola with an overall size of (4.5 m x 4.3 m).  Wooden texture options can be select from client side. 

Specifications: 
Columns: 15 cm x 15 cm aluminium tube profile, Wooden texture powder-coated
Beams: 15 cm x 15 cm aluminium tube profile, Wooden texture powder-coated
Rafters: 10 cm x 5 cm aluminium tube profile, Wooden texture powder-coated

Notes: 
1. Quotation is prepared strictly as per the provided drawings; any changes in design, size, or specifications may result in price variation. — Optional: Rate Only', 1.0, 'Nos.', 42770.0, 32900.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'C1c.', null, 'Motorized Pergola:

Supply and installation of a motorised retractable aluminium pergola with an openable and closable louver system. The pergola is fabricated from A-grade aluminium with a high-quality powder-coated finish. 
Pergola Size: 4.5m x 4.3m 
Colour: Any standard RAL code as per client’s choice (Note: Price is subject to variation for wooden texture grid finish or metallic finish)

Specifications: 
Posts: 150mm x 150mm x 3mm thick 
Beams: 150mm x 50mm x 3mm thick 
Rafters: 150mm x 50mm 
Channels: 50mm x 140mm 
Louvres & Control System: High-quality aluminium louvres with motorised control 
Motors: 12V motorised system 
Frame: Corrosion-resistant aluminium structure 
Finish: RAL powder-coated finish

Warranty: 
1-year warranty on motors 
2-year warranty on frame 
Notes: Pergola will be provided with 4 columns. — Optional: Rate Only', 1.0, 'Nos.', 65650.0, 50500.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'C1d.', null, 'Motorized Pergola:

Supply and installation of a motorised retractable aluminium pergola with an openable and closable louver system. The pergola is fabricated from A-grade aluminium with a high-quality wooden texture powder-coated finish. 
Pergola Size: 4.5m x 4.3m 
Colour: Wooden Texture

Specifications: 
Posts: 150mm x 150mm x 3mm thick 
Beams: 150mm x 50mm x 3mm thick 
Rafters: 150mm x 50mm 
Channels: 50mm x 140mm 
Louvres & Control System: High-quality aluminium louvres with motorised control 
Motors: 12V motorised system 
Frame: Corrosion-resistant aluminium structure 
Finish: Wooden texture

Warranty: 
1-year warranty on motors 
2-year warranty on frame 
Notes: Pergola will be provided with 4 columns. — Optional: Rate Only', 1.0, 'Nos.', 72150.0, 55500.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'C2.', null, 'BBQ Counter:

Supply and Construction of BBQ Counter, concrete structure with microcement finish, timber shutter and storage. including electrical provision. 
Exclusion: Sanitary Fixtures & Plumbing works.

Finish : Paint finish
Size : 2700mm L x 700mm D x 800 mm ht
Note: Subject to Design approval, any changes in design will be charge separately.', 1.0, 'Nos.', 24050.0, 18500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'C3.', null, 'Canopy:

Supply & installation of Canopy in MS square tube 
50x50 with 1.5mm thickness.

Finish : Paint finish
Size : 1800L x 700W mm', 1.0, 'Nos.', 6272.0, 4480.0, 40.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'C4.', null, 'Door:

Supply & installation of Metal door in MS tube 50x50 
with 4mm thickness.

Work includes the removal of existing wooden door

Finish : Paint finish
Size : 1200W x 1800H mm', 1.0, 'Nos.', 8385.0, 6450.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'C5.', null, 'Retractible Awning:

Supply and installation of a motorized monoblock 
retractable awning , including a Spanish fabric , Somfy (France) motor, and complete operating mechanism.  The awning will be supplied with motorized opening and closing operation.

Size: W (3.50 m × 3 m projection) 
Colour: Any standard RAL code as per clients choice.
Warranty:
Fabric: 5 years (Spanish)
Motor: 5 years (Somfy –France )
Mechanism: 2 years', 1.0, 'Nos.', 9230.0, 7100.0, 30.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 3, 'D', 'Landscaping Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'D1.', null, 'Artificial Grass:

Supply and Installation of Artificial Grass, including surface preparation, leveling, suitable base preparation, supply and laying of approved artificial turf, cutting and jointing, fixing with suitable adhesive/fasteners, edge finishing, infill application where required, and final cleaning, complete as per approved sample, drawings and specifications.', 1.0, 'LS', 4550.0, 3500.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'D2.', null, 'Plants:

Supply and Planting of 45 Nos of Plants, including 
delivery, soil/media preparation, planting, positioning, initial watering and necessary support/staking, with plant height above 2.0 m, complete as per approved landscape design and site conditions.

Washingtonia – 3 Pcs
Bamboo – 10 Pcs
Delonix – 5 Pcs
Areca Palm (Outdoor) – 9 Pcs
Ficus – 9 Pcs
Tewatia – 6 Pcs
Olive Tree – 3 Pcs

(Note: Additional plants can be provided at an additional cost, subject to the selected plant species, size, quantity and availability)', 1.0, 'LS', 63700.0, 49000.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'D3', null, 'Fire Pit:

Supply and Installation of Circular Fire Pit, as per approved design, including fabrication/construction, suitable fire-resistant materials, internal fire bowl/burner arrangement where applicable, finishing and all necessary accessories, complete as per approved drawings and specifications.

Diameter: 750 mm', 1.0, 'LS', 4160.0, 3200.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'D4', null, 'Pebbles (Normal):

Supply and Installation of Pebbles, including preparation and leveling of the designated area, supply and spreading of approved-grade white decorative pebbles to the required thickness, edge finishing and final cleaning, complete as per approved landscape design and specifications.', 50.0, 'bags', 110.5, 85.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'D5.', null, 'Boulders:

Supply and Placement of Natural Decorative Boulders, including selection, delivery and positioning as per approved landscape design and site conditions:

Small Boulders – 3 Pcs
Medium Boulders – 3 Pcs
Large Boulders – 3 Pcs — OPTIONAL: RATE ONLY', 9.0, 'pcs', 455.0, 350.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'D6.', null, 'Water Body (300mm Deep):

Supply and Construction of Water Body, including 
surface preparation, leveling, waterproofing treatment, tile/finish application, water circulation pump/motor, filtration where required, supply and placement of suitable aquatic fish and plants, necessary piping and accessories, testing, commissioning and final cleaning, complete as per approved design and specifications.', 1.0, 'LS', 10140.0, 7800.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'D7.', null, 'Supply and Installation of Automatic Irrigation System for the outdoor planter including the timer.', 1.0, 'LS', 6955.0, 5350.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'D8.', null, 'Relocation of tap including chipping and plastering.', 1.0, 'LS', 1885.0, 1450.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, 'D9.', null, 'Electrical Works for landscaping area & pergola

Note: Light Fixtures to be supplied by client.', 1.0, 'LS', 7540.0, 5800.0, 30.0, false, false);
update boqs set status = 'APPROVED' where id = b;
end $x$;
