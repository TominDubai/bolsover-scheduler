set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '4291c212-071c-4dad-89ff-bea72c7bc7ed' and source_file = 'BOQ - Villa 21, Carmen St. Victory Heights Works_rev02.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('4291c212-071c-4dad-89ff-bea72c7bc7ed', 'QUOTE', 2, v, 'Villa 21, Victory Heights Works', 'BBC/072026/00087_rev02', 'DRAFT', '2026-07-04', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Villa 21, Carmen St. Victory Heights Works_rev02.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'II', 'Other Works') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, '1', null, 'Removal, cart away, and disposal of the existing office/study washroom door, frame (if required), architraves, hinges, lockset, and associated ironmongery.

Note: This item includes preparation of the opening to receive the new door installation.', 1.0, 'Nos.', 715.0, 715.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, '2', null, 'Supply and installation of new office/study washroom interior door complete with door leaf, frame, architraves, hinges, lockset, lever handle, door stopper, fixing accessories, alignment, finishing, and testing.

Item Code: WVG 05 (Supreme Walnut/TIN-IP2136K#, Single#, 60/54mm Thickness#, Standard, Standard)

Door Handle Premium: Door Handle Premium (Silver Key/Key Cylinder)

Hidden Hinges: Less than 250cm

Size: 110cm L x 240cm ht', 1.0, 'Nos.', 4165.3605, 4165.3605, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, '3', null, 'Removal, cart away, and disposal of the existing office/study door, frame (if required), architraves, hinges, lockset, and associated ironmongery.

Note: This item includes preparation of the opening to receive the new door installation.', 1.0, 'Nos.', 715.0, 715.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '4', null, 'Supply and installation of new office/study interior door complete with door leaf, frame, architraves, hinges, lockset, lever handle, door stopper, fixing accessories, alignment, finishing, and testing.

Item Code: WVG 05 (Supreme Walnut/TIN-IP2136K#, Single#, 60/54mm Thickness#, Standard, Standard)

Door Handle Premium: Door Handle Premium (Silver Key/Key Cylinder)

Hidden Hinges: Less than 250cm

Size: 110cm L x 240cm ht', 1.0, 'Nos.', 4165.3605, 4165.3605, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '5', null, 'Removal, cart away, and disposal of the existing powder room door, frame (if required), architraves, hinges, lockset, and associated ironmongery.

Note: This item includes preparation of the opening to receive the new door installation.', 1.0, 'Nos.', 715.0, 715.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '6', null, 'Supply and installation of new powder room door complete with door leaf, frame, architraves, hinges, lockset, lever handle, door stopper, fixing accessories, alignment, finishing, and testing. 

Item Code: WVG 05 (Supreme Walnut/TIN-IP2136K#, Single#, 60/54mm Thickness#, Standard, Standard)

Door Handle Premium: Door Handle Premium (Silver Key/Key Cylinder)

Hidden Hinges: Less than 250cm

Size: 110cm L x 240cm ht', 1.0, 'Nos.', 4165.3605, 4165.3605, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7', null, 'Removal, cart away, and disposal of the existing door beside stairs, frame (if required), architraves, hinges, lockset, and associated ironmongery.

Note: This item includes preparation of the opening to receive the new door installation.', 1.0, 'Nos.', 715.0, 715.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '8', null, 'Supply and installation of new beside stairs door complete with door leaf, frame, architraves, hinges, lockset, lever handle, door stopper, fixing accessories, alignment, finishing, and testing.

Item Code: WVG 05 (Supreme Walnut/TIN-IP2136K#, Single#, 60/54mm Thickness#, Standard, Standard)

Door Handle Premium: Door Handle Premium (Silver Key/Key Cylinder)

Hidden Hinges: Less than 250cm

Size: 110cm L x 240cm ht', 1.0, 'Nos.', 4165.3605, 4165.3605, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '9', null, 'Removal, cart away, and disposal of the existing kays door, frame (if required), architraves, hinges, lockset, and associated ironmongery.

Note: This item includes preparation of the opening to receive the new door installation.', 1.0, 'Nos.', 715.0, 715.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, '10', null, 'Supply and installation of new door complete with door leaf, frame, architraves, hinges, lockset, lever handle, door stopper, fixing accessories, alignment, finishing, and testing.

Item Code: WVG 05 (Supreme Walnut/TIN-IP2136K#, Single#, 60/54mm Thickness#, Standard, Standard)

Door Handle Premium: Door Handle Premium (Silver Key/Key Cylinder)

Hidden Hinges: Less than 250cm

Size: 110cm L x 240cm ht', 1.0, 'Nos.', 4165.3605, 4165.3605, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, '11', null, 'Careful removal of the existing kitchen door, door frame, architraves, hinges, lockset, and associated ironmongery, including making good the wall edges, floor, and ceiling finishes as required to leave the opening as a permanent open access.

Note: This item includes disposal of removed materials, patching, and preparation.', 1.0, 'Nos.', 1235.0, 1235.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, '12', null, 'Careful removal of the existing dining door, door frame, architraves, hinges, lockset, and associated ironmongery, including making good the wall edges, floor, and ceiling finishes as required to leave the opening as a permanent open access.

Note: This item includes disposal of removed materials, patching, and preparation.', 1.0, 'Nos.', 1235.0, 1235.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, '13', null, 'Refurbishment of 2 existing doors by removing and cancelling the existing decorative mouldings to achieve a smooth flat panel finish, followed by surface preparation, sanding, minor filling, primer, PU paint finish to match the approved colour, and reinstallation of the refurbished doors with existing hardware.

Note: This item includes supply and installation of new 100mm × 18mm MR MDF architraves with matching PU paint finish.

Location: Kids Playroom
Existing Doors: 2 Nos.
New Architrave: 100mm × 18mm – 12 RM', 1.0, 'LS', 3680.0, 3680.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, '14', null, 'Supply, fabrication, and installation of new 18mm thick MDF wardrobe doors with premium PU paint finish, colour as per approved sample. Includes concealed soft-close hinges, cutting, edge finishing, fixing, alignment, and adjustment. 

Also includes supply and installation of 18mm thick MDF architraves (80mm wide) and 18mm thick MDF wardrobe skirting (100mm high) with matching PU paint finish.

Note: This item includes removal and disposal of existing cupboard doors, including hinges, handles, and associated hardware as required, 

Location: Office / Study Room
Door Size: 2020mm (H) × 600mm (W) × 18mm (T) – 3 Nos.
Architrave: 80mm × 18mm – 8 RM
Wardrobe Skirting: 100mm × 18mm – 2 RM', 1.0, 'LS', 3240.0, 3240.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, '15', null, 'Supply of wardrobe handle, complete with fixing screws and accessories, finish and size as per approved sample.

Location: Office/Study Room (3 Nos) & Kid''s Playroom (2 Nos)', 5.0, 'Nos.', 118.0, 118.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, '16', null, 'Supply and fixing of new architrave made of 18mm MR MDF with PU paint finish, colour as per approved sample

Note: This item includes Removal and disposal of existing door architraves.

Location: Store
Length: 6.0 RM
Size: 100 x 18mm', 6.0, 'RM', 145.0, 145.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, '17', null, 'Supply and fixing of new architrave made of 18mm MR MDF with PU paint finish, colour as per approved sample

Note: This item includes removal and disposal of existing door architraves.

Location: Small store room under stairs
Length: 3.5 RM
Size: 100 x 18mm', 3.5, 'RM', 145.0, 145.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, '18', null, 'Supply and fixing of new architrave made of 18mm MR MDF with PU paint finish, colour as per approved sample

Note: This item includes removal and disposal of existing door architraves.

Location: Electrical room
Length: 7.0 RM
Size: 100 x 18mm', 7.0, 'RM', 145.0, 145.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, '19', null, 'Supply and fixing of new architrave made of 18mm MR MDF with PU paint finish, colour as per approved sample

Note: This item includes removal and disposal of existing door architraves.

Location: Laundry Room
Length: 7.0 RM
Size: 100 x 18mm', 7.0, 'RM', 145.0, 145.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, '20a.', null, 'Fabrication, Supply & Installation of Aluminum 2 TRC 2 Shutter Sliding window by Vitro Vizion (Thermal Break) Aluminum Systems.

Note: This item includes removal and disposal of the existing aluminum swing door, frame, and associated hardware.

Glass Specification: 

Vision Glass: 32mm Thick DGU Glass (6mm Thick HD Gray Tempered Glass +20mm M/F Spacer + 6mm Thick Clear Tempered Glass)
Profiles: Slider Frame, Track flush, Track divider, track cover, keeper, interlock,shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved Powder coated color.

Size: 1600mm W x 2800mm H — On Hold', 1.0, 'Nos.', 13500.0, 13500.0, 0.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, '20b.', null, 'Supply and installation of a new powder-coated aluminum sliding door complete with aluminum frame, sliding panels, clear tempered glass (if applicable), rollers, top and bottom tracks, handles, lockset, weather seals, silicone sealant, fixing accessories, alignment, and testing.

Note: This item includes removal and disposal of the existing aluminum swing door, frame, and associated hardware.

Type: Schuco 54 PD ME Sliding Door (F + S)
Colour: Beige Color (Sample to be approved)
Glass: Climaguard Neutral PN70 DGU (or similar)
Size: 1600mm W x 2800mm H — Optional: Rate Only', 1.0, 'Nos.', 15668.0, 15668.0, 0.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, '20c.', null, 'Supply and installation of a new powder-coated aluminum sliding door complete with aluminum frame, sliding panels, clear tempered glass (if applicable), rollers, top and bottom tracks, handles, lockset, weather seals, silicone sealant, fixing accessories, alignment, and testing.

Note: This item includes removal and disposal of the existing aluminum swing door, frame, and associated hardware.

Type: Schuco 70 PD ME Sliding Door (F + S)
Colour: Beige Color (Sample to be approved)
Glass: Climaguard Neutral PN70 DGU (or similar)
Size: 1600mm W x 2800mm H — Optional: Rate Only', 1.0, 'Nos.', 21077.6, 21077.6, 0.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 22, '21', null, 'Repolishing of the main door outer face only colour matching to inner face.', 1.0, 'Nos.', 2800.0, 2800.0, 0.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 23, '22', null, 'Prepare and repaint the existing cupboard door to match the color and finish of the adjacent cupboard doors, including surface cleaning, light sanding, minor filling of imperfections, primer (where required), and application of high-quality paint finish. Includes protection of surrounding areas, masking, cleanup

Location: Kitchen', 2.0, 'Nos.', 500.0, 500.0, 0.0, false, false);
update boqs set status = 'APPROVED' where id = b;
end $x$;
