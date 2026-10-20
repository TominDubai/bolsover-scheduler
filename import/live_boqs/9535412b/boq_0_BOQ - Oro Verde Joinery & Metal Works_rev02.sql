set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '9535412b-2133-4ec3-8616-7915c64c787b' and source_file = 'BOQ - Oro Verde Joinery & Metal Works_rev02.xlsx';
v := null;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('9535412b-2133-4ec3-8616-7915c64c787b', 'QUOTE', 2, v, 'Oro Verde Metal, Joinery & Decoration Works', 'BBC/072026/00089_rev02', 'DRAFT', '2026-07-22', null, array['Payment Schedule:','Client supplied goods are subject to a 10% handling fee','Any other items not mentioned in this BOQ will be considered as a variation and will be charged separately.','Any variation in the specification and quantity from our above mentioned quote will induce price variation.','Project will commence only after obtaining all required permits, approvals, and site access.','This proposal is confidential and intended for the clients attention only. Acceptance of this proposal is acceptance of this confidentiality agreement and damages may be applicable if this','agreement is broken without prior agreement from Bolsover Building Contracting LLC','Validity: 15 days from the date of submission']::text[], 'BOQ - Oro Verde Joinery & Metal Works_rev02.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'I', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'All construction drawings, specifications, and other necessary details required for the execution of the works by client', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, null, null, 'Coordination, submission, and follow-up for all required approvals and fees from relevant authorities & government by client.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, null, null, 'Temporary Water and Electricity during fit-out by client.', null, null, null, null, null, true, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, '7.01', '7. Metal, Joinery & Decoration Works', 'BF-400 Production and installation of TREE BENCH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 400
Area: Courtyard A', 1.0, 'pc', 30000.0, 24000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, '7.02', '7. Metal, Joinery & Decoration Works', 'BF-401A Production and installation of OUTDOOR LONG-HIGH BENCH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 401A
Area: Courtyard A', 1.0, 'pc', 23750.0, 19000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, '7.03', '7. Metal, Joinery & Decoration Works', 'BF-401B Production and installation of OUTDOOR SHORT-HIGH BENCH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 401B
Area: Courtyard A', 1.0, 'pc', 15625.0, 12500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, '7.04', '7. Metal, Joinery & Decoration Works', 'BF-402 Production and installation of RECEPTION BENCH as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.

Ref: 402
Area: Indoor Entrance', 1.0, 'pc', 9750.0, 7800.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, '7.05', '7. Metal, Joinery & Decoration Works', 'BF-403 Production and installation of PLANTER BOX as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 403
Area: Courtyard A', 1.0, 'pc', 8125.0, 6500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, '7.06', '7. Metal, Joinery & Decoration Works', 'BF-404 Production and installation of RECEPTION COUNTER (one indoor, one outdoor) as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. Outdoor unit: all materials and finishes to be outdoor-rated and UV-resistant.

Ref: 404
Area: Arrival', 1.0, 'pc', 31625.0, 25300.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, '7.07', '7. Metal, Joinery & Decoration Works', 'BF-405A Production and installation of OUTDOOR FEATURE A as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 405A
Area: Arrival — Descoped', 1.0, 'pc', 18125.0, 14500.0, 25.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, '7.08', '7. Metal, Joinery & Decoration Works', 'BF-405B Production and installation of OUTDOOR FEATURE B as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 405B
Area: Arrival — Descoped', 1.0, 'pc', 23125.0, 18500.0, 25.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, '7.09', '7. Metal, Joinery & Decoration Works', 'BF-405C Production and installation of OUTDOOR FEATURE C as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 405C
Area: Arrival — Descoped', 1.0, 'pc', 18125.0, 14500.0, 25.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, '7.1', '7. Metal, Joinery & Decoration Works', 'BF-405D Production and installation of OUTDOOR FEATURE D as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 405D
Area: Arrival — Descoped', 1.0, 'pc', 18750.0, 15000.0, 25.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, '7.11', '7. Metal, Joinery & Decoration Works', 'BF-406A Production and installation of OUTDOOR SERVICE STATION as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 406
Area: Outdoor Dining', 1.0, 'pc', 15625.0, 12500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 14, '7.12', '7. Metal, Joinery & Decoration Works', 'BF-406B Production and installation of OUTDOOR SERVICE STATION as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 406
Area: Outdoor & Indoor Dining', 2.0, 'pc', 18750.0, 15000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 15, '7.13', '7. Metal, Joinery & Decoration Works', 'BF-407 Production and installation of BANQUETTE SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 407
Area: Outdoor Dining', 1.0, 'pc', 27500.0, 22000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 16, '7.14', '7. Metal, Joinery & Decoration Works', 'BF-408A Production and installation of DISPLAY CABINET as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.  

Ref: 408A
Area: Indoor Entrance', 1.0, 'pc', 18125.0, 14500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 17, '7.15', '7. Metal, Joinery & Decoration Works', 'BF-408B Production and installation of DISPLAY CABINET WITH INTEGRATED SERVICE STATION as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.  

Ref: 408B
Area: Indoor Entrance', 1.0, 'pc', 27500.0, 22000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 18, '7.16', '7. Metal, Joinery & Decoration Works', 'BF-409A Production and installation of DINING BOOTH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.  

Ref: 409A
Area: Indoor Dining', 1.0, 'pc', 23125.0, 18500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 19, '7.17', '7. Metal, Joinery & Decoration Works', 'BF-409B Production and installation of METAL FRAME DIVIDER as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.  

Ref: 409B
Area: Indoor Dining', 1.0, 'pc', 15000.0, 12000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 20, '7.18', '7. Metal, Joinery & Decoration Works', 'BF-410 Production and installation of ROUND BOOTH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.  

Ref: 410
Area: Indoor Dining', 2.0, 'pc', 31250.0, 25000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 21, '7.19', '7. Metal, Joinery & Decoration Works', 'BF-411 Production and installation of BENCH SEATING WITH DECORATIVE GOLD PALM TREE as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.

Ref: 411
Area: Indoor Dining', 1.0, 'pc', 30000.0, 24000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 22, '7.2', '7. Metal, Joinery & Decoration Works', 'BF-412A Production and installation of FRONT BAR COUNTER WITH INTEGRATED DJ BOOTH as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.  

Ref: 412A
Area: Bar Area', 1.0, 'pc', 57250.0, 45800.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 23, '7.21', '7. Metal, Joinery & Decoration Works', 'BF-412B Production and installation of BACK BAR COUNTER as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.  

Ref: 412B
Area: Bar Area', 1.0, 'pc', 40000.0, 32000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 24, '7.22', '7. Metal, Joinery & Decoration Works', 'BF-413 Production and installation of BAR BULKHEAD as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. 

Ref: 413
Area: Bar Area', 1.0, 'pc', 30000.0, 24000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 25, '7.23', '7. Metal, Joinery & Decoration Works', 'BF-414 Production and installation of OUTDOOR COMPACT DJ BOOTH as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. (DESIGN TBD)

Ref: 414
Area: Indoor Dining — Descoped', 1.0, 'pc', 21875.0, 17500.0, 25.0, false, true);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 26, '7.24', '7. Metal, Joinery & Decoration Works', 'BF-415 Production and installation of BAR BOOTH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.  

Ref: 415
Area: Bar Area', 1.0, 'pc', 24375.0, 19500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 27, '7.25', '7. Metal, Joinery & Decoration Works', 'BF-416 Production and installation of COURTYARD B BOOTH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 416
Area: Courtyard B', 1.0, 'pc', 18750.0, 15000.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 28, '7.26', '7. Metal, Joinery & Decoration Works', 'BF-417A Production and installation of OUTDOOR PERGOLA FRAME (METAL STRUCTURE) as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 417A
Area: Courtyard B', 1.0, 'pc', 49375.0, 39500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 29, '7.27', '7. Metal, Joinery & Decoration Works', 'BF-417B Production and installation of OUTDOOR METAL FRAME WITH DECORATIVE BEADS as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 417B
Area: Courtyard A&B', 6.0, 'pc', 8125.0, 6500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 30, '7.28', '7. Metal, Joinery & Decoration Works', 'BF-417C Production and installation of OUTDOOR METAL FRAME WITH DECORATIVE BEADS as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.s to be outdoor-rated and UV-resistant.

Ref: 417C
Area: Courtyard A', 3.0, 'pc', 5625.0, 4500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 31, '7.29', '7. Metal, Joinery & Decoration Works', 'BF-417D Production and installation of OUTDOOR METAL FRAME WITH DECORATIVE BEADS as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 417D
Area: Courtyard A', 3.0, 'pc', 6875.0, 5500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 32, '6.07', '7. Metal, Joinery & Decoration Works', 'D-06 Existing Single-Panel Door (Kitchen Service Door) to be refurbished and repainted in accordance with the design specifications. Contractor to adhere to municipality and landlord quality standards | Contractor to submit sample for approval.

Ref: 201
Area: Back Kitchen', 1.0, 'LS', 5625.0, 4500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 33, '6.08', '7. Metal, Joinery & Decoration Works', 'D-07 Existing Single-Panel Door (Rear Service Entry) to be refurbished and repainted in accordance with the design specifications. Contractor to adhere to municipality and landlord quality standards | Contractor to submit sample for approval.

Ref: 201
Area: Back Entrance', 1.0, 'LS', 8125.0, 6500.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 34, '3.11', '7. Metal, Joinery & Decoration Works', 'SK-01 Supply and installation of profiled skirting board in green PU-painted MDF, 250mm height, with concealed fixings and a smooth, uniform finish. Contractor to adhere to municipality and landlord quality standards. Contractor to submit sample for approval.

Ref: 203
Area: Indoor Dining', 14.0, 'LM', 512.5, 410.0, 25.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 35, null, '7. Metal, Joinery & Decoration Works', 'Excluded Fabric for All - Less', -1.0, 'Nos', 45000.0, 45000.0, null, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 36, null, '7. Metal, Joinery & Decoration Works', 'Note: Any changes to the quoted specifications or materials, and any additional scope of work, shall be treated as a variation and priced separately.', null, null, null, null, null, true, false);
update boqs set status = 'APPROVED' where id = b;
end $x$;
