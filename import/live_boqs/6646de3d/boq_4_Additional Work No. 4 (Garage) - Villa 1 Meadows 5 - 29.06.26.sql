set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and source_file = 'Additional Work No. 4 (Garage) - Villa 1 Meadows 5 - 29.06.26.xlsx';
insert into variations(project_id, vo_no, description, value) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 4, 'Additional Work No. 4 (Garage) - Villa 1 Meadows 5 - 29.06.26', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '6646de3d-ff69-47dc-951a-44e3eb6c3e68' and vo_no = 4;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('6646de3d-ff69-47dc-951a-44e3eb6c3e68', 'VARIATION', 0, v, 'Additional Work No. 4 (Garage) - Villa 1 Meadows 5 - 29.06.26', null, 'DRAFT', '2026-06-23', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in the BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'Additional Work No. 4 (Garage) - Villa 1 Meadows 5 - 29.06.26.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'VARIATION WORK NO. 4') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', 'Garage Works', 'Removal of the existing manhole cover and frame (if required), including lifting, temporary protection of the opening, handling, loading, disposal to approved DM site.', 2.0, 'Nos.', 455.0, 350.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', 'Garage Works', 'Supply and installation of recessed tile insert manhole cover, complete with galvanized steel or stainless steel frame, recessed tray for tile infill, lifting keys, fixing, grouting, and alignment.', 2.0, 'Nos.', 1430.0, 1100.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', 'Garage Works', 'Removal of existing interlock pavers, including lifting, loading, carting away, and disposal of all debris to an approved Dubai Municipality (DM) dumping site.', 63.8825, 'sqm', 52.0, 40.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', 'Garage Works', 'Supply and application of cement-sand floor screed, to prepare the floor surface ready to receive new outdoor tiles, including surface preparation, bonding agent (where required), leveling, compaction, finishing, and curing.', 63.8825, 'sqm', 110.5, 85.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', 'Garage Works', 'Supply and construction of block wall, including cement-sand mortar, reinforcement where required, wall ties, cutting, fitting, and all necessary labor, materials, tools, and accessories. Includes 12–15mm cement-sand plaster to both sides, finished smooth and ready for painting.', 5.6925, 'sqm', 585.0, 450.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', 'Garage Works', 'Installation of client-supplied 20mm thick outdoor porcelain tiles (wood-look finish), laid to match the existing finished floor level, including surface preparation, tile adhesive or mortar bed, cutting, grouting, leveling, alignment, edge finishing, and cleaning.

thickness: 2cm', 63.8825, 'sqm', 156.0, 120.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', 'Garage Works', 'Supply and installation of gypsum board bulkhead, comprising galvanized steel framing, 12.5mm gypsum boards, and joint treatment', 14.0, 'LM', 260.0, 200.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', 'Garage Works', 'Supply and installation of flat gypsum board ceiling comprising galvanized steel suspension system, main and furring channels, perimeter angles, 12.5mm gypsum boards, and joint treatment.', 35.8825, 'sqm', 195.0, 150.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', 'Garage Works', 'Supply and application of interior ceiling paint, including surface preparation, minor filling, sanding, primer (where required), and two coats of emulsion paint, complete with masking, protection, and cleanup', 63.8825, 'sqm', 65.0, 50.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, '10', 'Garage Works', 'Supply of materials and application of cement-sand plaster to existing interior walls, including surface preparation, hacking/raking out where required, bonding agent, 12–15mm thick plaster, leveling, trowel finish, curing.', 117.271, 'sqm', 71.5, 55.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, '11', 'Garage Works', 'Supply and application of interior wall paint, including surface preparation, minor filling, sanding, primer (where required), and two coats of emulsion paint, complete with masking, protection, and cleanup.', 117.271, 'sqm', 78.0, 60.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, '12', 'Garage Works', 'Fabrication, Supply & Installation of Aluminum fixed window by (Thermal break) System.

Glass Specification:
Vision Glass: 28mm thk. DGU Glass (6mm thk. Clear tempered glass + 16mm air gap + 6mm thk. HD Grey Glass)
Profiles: Transom/Mullion, Pressure plate, cover cap, support, gaskets, silicon sealant & all accessories.
RAL Color: As per approved powder coated color


Size: 131cm L x 70cm H
Location: Front Side', 4.0, 'Nos.', 1638.0, 1260.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, '13', 'Garage Works', 'Fabrication, Supply & Installation of Aluminum Fixed window by (Thermal Break) System.

Glass Specification: 
Vision Glass: 28mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 16mm Air gap + 6mm Thick HD Grey Glass)
Profiles:  Transom/ Mullion, Pressure, Plate, Cover Cap, Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved Powder Coated color.

Size: 110cm L x 220cm H
Location: Rear Side', 1.0, 'Nos.', 6921.2, 5324.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, '14', 'Garage Works', 'Fabrication, Supply & Installation of Aluminum Single Shutter Hinge Door by (Thermal Break) System.

Glass Specification: 
Vision Glass: 24mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 12mm Air gap + 6mm Thick HD Grey Glass)
Profiles: Shutter Frame ,outer Frame Transom/ Mullion, Pressure, Plate, Cover Cap, Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color - As per Approved Powder Coated color.

Size: 135cm L x 220cm H
Location: Rear Side', 1.0, 'Nos.', 8494.2, 6534.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, '15', 'Garage Works', 'Supply and Installation of mirror cladding with 6mm thk. Belgium grade mirror with on MDF backing.

Size: 480cm L x 240cm H 
Location: Front Side', 1.0, 'Nos.', 16510.0, 12700.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, '16', 'Garage Works', 'Supply and Installation of Panoramic Residential Sectional Overhead Garage Door - Acrylic/Glass 4mm see through with total size: 4300mm x 2300mm (WxH)

Sectional Overhead  Garage Door
Standard Head Room (SLF) track system.  
Electrically operated by garage door opener (GDO), inside push button and remote control.
Garage Door Opener: BFT SIDE MOTOR
Door Design: 
Colour: Exterior in RAL 
Power Supply: Single Phase, 240 Volts, 50 Hz.
Safety Features: 
> Photocells installed across width of door opening.  
> Spring break safety device
> Finger pinch protection panels — Optional: Rate Only', 1.0, 'Nos.', 37700.0, 29000.0, 30.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, '17', 'Garage Works', 'Supply, fabricate, and install a custom vertical slat designer garage door with vertical-ribbed wood-look finish, comprising powder-coated aluminum frame with aluminum slats, complete with heavy-duty garage door mechanism, tracks, rollers, springs, weather seals, electric motor with remote controls, safety sensors, fixing accessories, testing, and commissioning.

Size: 4300mm L x 2300mm ht', 1.0, 'Nos.', 68900.0, 53000.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, '18', 'Garage Works', 'Supply and installation of complete HVAC air conditioning system, including one concealed ceiling-mounted FCU, galvanized steel GI ductwork, thermal insulation, volume control dampers, flexible duct connections, linear side throw diffusers integrated within a 2.0m high bulkhead, return air grilles, thermostat, supports, hangers, condensate drain connection, control wiring, sealing, testing, air balancing, and commissioning.', 1.0, 'Nos.', 36400.0, 28000.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, '19', 'Garage Works', 'Supply and installation of complete electrical and lighting system, including power and lighting wiring, PVC conduits and accessories, junction boxes, cables, distribution from the existing DB, circuit protection, testing, commissioning, and provision of dedicated electrical power supply for the sauna unit. Includes installation of client-supplied lighting fixtures, switches, sockets, and electrical accessories.

Note: Lighting & Electrical Fixtures to be supplied by client.', 1.0, 'Nos.', 23400.0, 18000.0, 30.0, false, false);
update boqs set status = 'SUBMITTED' where id = b;
end $x$;
