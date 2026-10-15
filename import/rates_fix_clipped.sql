-- rates_fix_clipped.sql — full quote text for the 1,346 sweep-clipped rates (15 Oct 2026). Collision-safe, idempotent, schema-qualified.
create table if not exists scheduler.rate_fix_stage (id uuid primary key, description text not null);
truncate scheduler.rate_fix_stage;
insert into scheduler.rate_fix_stage (id, description) values
('8ecedf8b-2560-4b1d-9796-2dddaa1b1908', 'Access Panels

Supply and installation of 600 x 600 mm access panel with 12.5 mm gypsum plaster board (Non Fire rated)'),
('a8e16446-780e-42b8-a70f-82b8977776fa', 'Acoustic Decorative Baffles

Supply and installation of acoustic ceiling baffles consisting of the following:
- Heradesign Superfine or equivalent. 1200x600x25mm panels
- 200mm spacing
- Wood finish as per the visuals 

Location: Events hall'),
('a3a9a7e1-58d9-4d33-abc1-f2731a80e334', 'Careful cutting/opening of existing ceiling (gypsum or similar) for installation of client-supplied pendant lights, including provision of structural support above ceiling, electrical connection, alignment, reinstatement of ceiling finishes, and testing.

Location: Master Bedroom'),
('ac922621-5808-413d-87b7-3912e1f89eb8', 'Construction of New Room with Bathroom and Uncovered Balcony Above Garage, including scope of works:

Scope of Work:
- Structural Support: Supply and installation of structural elements (beams, columns, slab reinforcement) to support room and bathroom above garage.
- Block Works: Construction of walls using approved block type, including new parapet around the terrace area.
- Plastering: Internal and external cement plaster to walls, skim finishing where required including leveling.
- Roofing & Ceiling: Flat roof + frame for clay tile roof to match existing including gypsum board ceiling installation.
- Flooring & Tiling installation of client supplied tiles: flooring works at the interior & and in new terrace area including screeding & waterproofing floor and walls for new bathroom
- Interior & Exterior Finishing: Interior & Exterior Painting, wall finishes, skirting, trims including exterior client supplied stone cladding on bottom half of garage (if approved).
- MEP Works: Connection of plumbing, electrical points, drainage, and sanitary & lighting fixtures by client in bathroom and room area
- HVAC System and Ducting: as per the design and exhaust duct for new bathroom.
- Joinery Works: To be confirmed and quoted separtely.
- Doors & Windows: Supply and Installation of new windows/doors (wood & aluminum/glass)

Location: Above Garage Area
Note: 
1. Tiles, flooring material, sanitary, accessories, light switches and plugs to be provided by Client.'),
('c5f1b7d3-cfe3-4b80-8c85-13acb8c1db56', 'Cutting of false ceiling for AC grill/diffuser openings, including marking, precise cutting of gypsum board, removal of cut sections, and preparation for AC grill installation.'),
('f954bb60-f018-4927-acb1-334a12e659fe', 'Gypsum Baffle Wall

Supply and installation of gypsum baffle wall made of single layer regular gypsum board to support glass partition and doors rising up to the slab height. 

Brand: Gypsemna or equivalent
Location: Above glass partitions'),
('135aa170-e899-4215-8117-bd7b9f3ea3a9', 'Installation of light frame, including alignment, fixing with appropriate fasteners, securing connections, and protection of surrounding finishes.'),
('d876d68e-979e-47b0-812b-99de46ce2de8', 'Modification of existing ceiling system including gypsum works, bulkhead adjustments, patching, alignment with new combined layout, and preparation for final paint finish.'),
('f64e0fc4-e196-4626-ade3-12b4ecd11505', 'Moisture Resistant Gypsum Ceiling

Supply and installation of MR gypsum board using single layer of 12.5mm thk moisture resistant gypsum boards, suspended with standard GI furring, channel, hangers, and support.

Brand: Gypsemna or equivalent
Location: Toilets, Kitchen, Pantry, Janitor room'),
('a8736f13-c5c5-4c99-b410-ec47f5f9b647', 'Moisture Resistant Gypsum Partition - Option 1

Supply and installation of 265mm thk straight Moisture resistant gypsum drywall partition, made of 72mm GI tracks, 70mm GI studs covered with single 12.5mm thick moisture resistant gypsum boards on both faces with 50mm (24kg) mineral rockwool insulation inside, jointed taped ready to receive final finish.

Height considered - 4000mm H
Brand: Gypsemna or equivalent
Location: Sales Area - Toilets, Pantry, Janitor room
Note: Partitions in between toilet cubicles are excluded, as these are considered pre-fabricated cubicles and will be provided by SCL.'),
('af51c89b-59c4-451d-a61f-52ec26e9e4a8', 'Moisture Resistant Gypsum Partition

Supply and installation of 150mm thk straight Moisture resistant gypsum drywall partition, made of 72mm GI tracks, 70mm GI studs covered with single 12.5mm thick moisture resistant gypsum boards on both faces with 50mm (24kg) mineral rockwool insulation inside, jointed taped ready to receive final finish.

Height considered - 4000mm H
Brand: Gypsemna or equivalent
Location: Pre-Function Area - Toilets, Kitchen
Note: Partitions in between toilet cubicles are excluded, as these are considered pre-fabricated cubicles and will be provided by SCL.'),
('13a84988-8ac9-4165-bc27-4c4784063263', 'Regular Gypsum Ceiling

Supply and installation of Regular gypsum board using single layer of 12.5mm thk regular gypsum boards, suspended with standard GI furring, channel, hangers, and support.

Brand: Gypsemna or equivalent
Location: Meeting rooms, VIP Lounges, 9 pax Meeting room, Training room, Kids room, AV room, Cash collection area, Walkway to event hall, Control room, Backstage area'),
('4d6b4bcf-8f0a-43bf-bd34-2e58df6e9d67', 'Regular Gypsum Partition

Supply and installation of 150mm thk straight Regular gypsum drywall partition, made of 72mm GI tracks, 70mm GI studs covered with single 12.5mm thick regular gypsum boards on both faces with 50mm (24kg) mineral rockwool insulation inside, jointed taped ready to receive final finish.

Height considered - 4000mm H
Brand: Gypsemna or equivalent 
Location: Control room'),
('f53e746a-7252-4f3f-a39a-0e4576365e5d', 'Regular Gypsum Partition

Supply and installation of 265mm thk straight Regular gypsum drywall partition, made of 72mm GI tracks, 70mm GI studs covered with single 12.5mm thick regular gypsum boards on both faces with 50mm (24kg) mineral rockwool insulation inside, jointed taped ready to receive final finish.

Height considered - 4000mm H
Brand: Gypsemna or equivalent
Location: Meeting rooms, VIP lounge, Training room, AV room, Kids play room, Cash collecting room'),
('1dfec367-b5cb-4771-87ec-a82357307ade', 'Regular Gypsum Partition

Supply and installation of 435mm thk straight Regular gypsum drywall partition, made of 72mm GI tracks, 70mm GI studs covered with single 12.5mm thick regular gypsum boards on both faces with 50mm (24kg) mineral rockwool insulation inside, jointed taped ready to receive final finish.

Height considered - 4000mm H 
Brand: Gypsemna or equivalent 
Location: Between meeting rooms'),
('3dbb293b-1d8e-4754-ab77-d9c34e11b42d', 'Supply & installation of encapsulated polybag Knauf Insulation — 0.6 m × 1.2 m × 25 mm (encapsulated).

Material: Knauf Insulation
Location: Ground Floor (VIP & Shisha Area Only)
Legend: Cyan Highlight'),
('e24757fa-4ed8-4cc8-ab42-ddf5b2ce0960', 'Supply & installation of three-layer sound-bloc gypsum ceiling (Gyproc), 50 mm overall thickness, with Fujairah Rockwool 100 kg/m³ infill, suspended on T-grid with resilient isolation hangers, inclusive of joint taping, perimeter sealing, cut-outs for MEP and final cleaning.

Location: First Floor (After Party + Sisha Only)
Legend: Cyan Highlight'),
('125802ed-b374-4666-b163-7e58891c7ff5', 'Supply and Installation MR regular gypsum board ceiling, ready to receive primer

Location: FF Kid''s Bathroom & Master Bathroom'),
('eb7da9a6-4b61-442a-a6fe-28a185f3586e', 'Supply and Installation of 12.5mm thick MR gypsum board ceiling ready to receive primer, including shadow gap (10x10mm)'),
('5e80221e-6f55-419e-8b03-f9e2d880575a', 'Supply and Installation of MR gypsum board ceiling, ready to receive primer 

Location: GF Powder Room, Kitchen, Maids Bathroom & Laundry Ceiling'),
('237539b7-395f-40d7-bddc-25e28697cd09', 'Supply and Installation of regular gypsum board ceiling, ready to receive primer

Location: Entire GF Ceiling and extension area excluding wet areas'),
('6c60a29c-f98e-40fb-a3a2-88dce04637fc', 'Supply and application of ceiling paint (one coat primer, two coat stucco, two coat rich mat white)'),
('e3c47535-3b82-441d-b403-7e4c45029586', 'Supply and application of paint on the ceiling (one coat primer, two coat stucco, tow coat rich mat white)

Location: Entire SF Ceiling excluding Sauna'),
('6ce5aa19-217a-4857-847e-6d0ffa2f7e93', 'Supply and application of two-component epoxy paint system to moisture-resistant (MR) gypsum board ceiling surfaces, including surface preparation, joint treatment, filling, sanding, primer application, and application of two coats of epoxy paint finish.

Code: C01B
Location: Refer to GF reflected ceiling plan'),
('d4439186-5430-4cb1-a137-bdafa387366e', 'Supply and application of waterproofing system over concrete roof slab including surface preparation, cleaning, primer application, waterproofing membrane, treatment of joints and penetrations, protection layer where required, pond testing.'),
('3cf85f35-4d0d-4c10-a8b1-1c70b186de18', 'Supply and application of white paint finish to gypsum board ceiling surfaces, including surface preparation, joint treatment, filling of screw heads and imperfections, sanding, primer coat, and application of paint coats.

Code: C01A
Location: Refer to GF reflected ceiling plan'),
('2fa1f6a4-0175-48d6-8990-c711e923db9d', 'Supply and apply of paint on the ceiling. (One coat primer, two coat stucco, two coat Fenomastic mat white)'),
('5be37679-c42b-4e1e-8ad8-d10c6381379e', 'Supply and installation of 10 × 10 mm curved precast gypsum shadow gap, including cutting, fixing, alignment, jointing, sanding, surface protection, and final cleaning — complete in all respects.'),
('cec299dd-3f23-451d-9eba-0031ca8a1969', 'Supply and installation of 10 × 10 mm precast gypsum shadow gap, including cutting, fixing, alignment, jointing, sanding, surface protection, and final cleaning — complete in all respects.'),
('5a42f7a2-5382-45a7-863b-4798f1818ae9', 'Supply and installation of 100 mm thick wall partition, including fabrication using gypsum board with metal stud, fixing, leveling, jointing, and finishing, application of primer and two coats of paint, protection of adjacent surfaces, minor adjustments, and site cleaning'),
('8673d3d0-84a3-499c-9a22-51efbcb1d1c9', 'Supply and installation of 12.5 mm thick regular gypsum board ceiling ready to receive primer - High Level area'),
('0f2c5789-b264-4704-a0ce-c653d1a5f121', 'Supply and installation of 12.5mm thick regular gypsum board ceiling, ready to receive primer'),
('5c13a890-a80c-4cba-9d70-55acbec1a68d', 'Supply and installation of 12.5mm thk. moisture-resistant (MR) gypsum board ceiling, including framing, fixing, jointing, sanding, and finishing. Works to include all necessary labor, tools, materials, accessories, and protection of adjacent surfaces — complete in all respects.

Location: Master Bathroom Entire Ceiling'),
('4f5ee8fc-8414-45ad-b19a-ce46bdd690ec', 'Supply and installation of 12.5 mm thk. regular gypsum board ceiling, including framing, fixing, jointing, sanding, and finishing. Works to include all necessary labor, tools, materials, accessories, and protection of adjacent surfaces — complete in all respects.

Location: Old Bedroom 01'),
('3a0f95ca-33f3-41b5-a345-769c3424a45b', 'Supply and installation of 12.5mm thick regular gypsum board ceiling to fill the removed shadow gap and connect seamlessly to the existing gypsum ceiling, including GI framing, fixing, jointing, full surface finishing (Level 4/5 smooth finish), sanding, edge blending, and making good to all adjacent finishes so that no connection line is visible — complete in all respects.

Location: Old Living & Dining Area'),
('802902b0-e379-4584-9e8b-8075a4749f38', 'Supply and installation of 150mm thick MR gypsum board partition with mineral wool insulation

Location & Size: Treatroom - 1.32 x 2.70m'),
('79aead89-f160-404e-8ce2-4e7aa46ad18d', 'Supply and installation of LED recessed downlights, including ceiling cutting, wiring, fixing, testing, and commissioning.

Fixture Specs:
Type: Recessed ceiling downlight, round
Power & Light Output: 8 W LED or 800 lumens per fixture
Color Temperature: 3000 K (Warm White)

Location: New proposed study room'),
('07c2c75c-ae2f-46fa-88af-91ee4727cadc', 'Supply and installation of Translucent Stretch 
Ceiling

Material: High-quality translucent PVC membrane 
made in Germany with certified European 
standards. UV-resistant, durable, and fire-rated. 
The material ensures even light diffusion without 
shadows or glare. Physical samples are available 
upon request. 
 
Color: Translucent White 
 
Installation system: PVC or SMART aluminium profile system 
Silicon also available 
 
Lighting system: 
•⁠Integrated LED backlight system 
•⁠Uniform light distribution across the full ceiling 
surface 
•⁠Lighting options: 6w 24v Warm White (3000K), 
Neutral White (4000K), Cool White (6500K) 
•⁠Drivers – DALI 24v 240w'),
('f28f3615-88d7-4616-abd9-1efe7c8d027c', 'Supply and installation of access panel, including cutting of opening (if required), framing, fixing, alignment, and finishing to match adjacent surfaces.

Size: 300mm x 300mm'),
('9e170e24-499c-4eb5-841e-c600b0f3742a', 'Supply and installation of curtain pelmet with integrated light cove, including 18 mm plywood backing, cutting, fixing, alignment, jointing, sanding, surface finishing, protection during works, and final handover — complete in all respects.'),
('9e1dd22a-72b4-4ccb-bc1b-2754ac6b0474', 'Supply and installation of curved precast gypsum board bulkhead, 150 mm thick, including metal framework, cutting, fixing, jointing, sanding, alignment, surface protection, and handover — complete in all respects.'),
('4ac1015d-434e-4bd2-a8d0-d3e04a89c127', 'Supply and installation of curved precast gypsum board bulkhead, 250 mm thick, including metal framework, cutting, fixing, jointing, sanding, alignment, surface protection, and handover — complete in all respects.'),
('a3e6d496-8f8a-4713-a99e-e02885f88186', 'Supply and installation of double-layer 12.5 mm thick MR (Moisture-Resistant) gypsum board ceiling, including metal framing, fixing, jointing, sanding, surface protection, and ready to receive primer — complete in all respects.

Location: Washroom'),
('8d01720c-7a18-41fb-ae85-8bb8840d85e9', 'Supply and installation of double-layer 12.5 mm thick regular gypsum board ceiling, including metal framing, fixing, jointing, sanding, surface protection, and ready to receive primer — complete in all respects.

Location: Entire Area except Washroom'),
('6f14fe69-93c2-4f66-a3b7-e50c6764a84d', 'Supply and installation of false ceiling comprising:
CL005A – Bronze Metal: Custom square-grid structure at 200 mm O.C. spacing
CL005B – Gypsum Board: Plaster bronze finish, 100 mm depth
Works include all framing, supports, alignment, fixing, finishing, and necessary accessories as per Detail A.

Exclusions: Lighting fixtures (downlights, LED strips), MEP service cutouts, and special integrations.
Area: 43.51 sqm'),
('6570f3aa-ae59-4e2f-85fa-44bb43563f74', 'Supply and installation of gypsum board bulkhead on staircase area, entrance area & skylight area'),
('6f4916e5-be7c-42ea-92b6-6b0619cbf7e8', 'Supply and installation of moisture resistant (MR) gypsum flat suspended ceiling system including GI metal framework, suspension system, MR gypsum boards, jointing, taping, finishing, sealing, and painting.

Location: Master Bathroom & Bathroom 02'),
('c15b70a8-c916-43aa-81d6-1b0c14ddc414', 'Supply and installation of moisture-resistant (MR) gypsum board false ceiling, including GI framing system (main channels, furring channels, perimeter angles, suspension hangers and accessories), fixing of MR gypsum boards, jointing with approved compound and tape, leveling, sanding, making good, and leaving the surface ready to receive paint.

Location: GF Female & Male Washroom, GM''s Washroom'),
('213feacd-f7c6-4af5-9493-d591c27a9b2e', 'Supply and installation of new MR gypsum board ceiling, including metal framing, suspension system, board fixing, jointing, finishing, cutting for fixtures, and protection.

Location: Maids Bathroom (3a - 017)'),
('03fe3e25-2155-4b3c-9e33-fe4554f6784d', 'Supply and installation of new regular flat suspended ceiling system including GI metal framework, suspension system, ceiling boards, joint treatment, finishing works, and painting.'),
('34d631dc-ab49-4dec-b80b-2e55300b298d', 'Supply and installation of new regular flat suspended gypsum ceiling system including GI metal framework, suspension system, gypsum boards, jointing, taping, finishing, surface preparation, and painting.

Location: Bedroom 01 Balcony'),
('f53691ab-b3ff-41ea-9dd6-8c1b00af047b', 'Supply and installation of regular gypsum board ceiling, including framing, boards, jointing, primer and paint.

Location: New Proposed Study Room'),
('5bb6da42-07cd-414b-b171-82c4d40df30c', 'Supply and installation of regular gypsum board false ceiling using 12.5mm thick gypsum boards fixed on GI suspended framework, including hangers, perimeter/channel framing, jointing with approved compound and tape, sanding, application of primer, finishing ready for paint, and protection.

Location: Reception Area, Employees Workstation, Employees Workstation, Workstation Office, GF Meeting Room, Pantry/Break Room, GM''s Room, Secretary Room, Operations Room, Logistics Room, Finance Room, FF Meeting Room, GF & FF Hallway, GF & FF Staircase'),
('5f8d93d7-b386-49cf-afb0-5a66396f8575', 'Supply and installation of wood veneer plain ceiling, including MDF board, veneer-faced panels, edge banding, trims, clear protective coating, cutting to size, fabrication, fixing to prepared substrate/framework.

Code: C03
Location: Refer to GF reflected ceiling plan'),
('799e6142-1707-4c45-9770-4bb1cc24f42a', 'Supply of all materials, labor, equipment, formwork, reinforcement steel, ready-mix concrete, casting, curing, and construction of 200mm thick reinforced concrete roof slab, including shuttering, propping, reinforcement fixing, concrete placement, vibration, curing, de-shuttering, plastering to exposed surfaces, finishing works.'),
('3afeffef-138f-4def-873d-73e11d9271b7', 'Supply, fabricate, deliver, and install architectural ceiling trim/profile comprising a 10mm × 10mm extruded aluminum profile with black powder-coated finish, installed as a ceiling edge trim or recessed shadow gap detail. Works shall include cutting to size, mitred corners, concealed fixing, fixing clips/brackets, alignment, joint treatment, touch-up to cut edges, sealant where required, cleaning, and all necessary materials, accessories.

Item Code: CT01
Note: Price subject for change depending on final material selection.'),
('2204b335-42d6-40de-a62e-e7f9d90b0bc5', 'Supply, fabricate, deliver, and install wood laminate ceiling cladding onto a ready-installed ceiling framework, comprising laminate finish bonded to 18mm plywood backing support, complete with concealed fixing system, edge trims, joint treatment, cutting, fabrication, alignment, access panel integration where required, and all necessary accessories and consumables.

Item Code: CF02A
Material: Laminate
Brand: EGGER or approved equivalent
Finish: Wood Grain Laminate (Colour and Texture to be approved)'),
('6acae295-daa1-4af1-863f-b866da6dc2e5', 'Supply, fabricate, deliver, and install wood laminate ceiling cladding, comprising laminate finish bonded to moisture-resistant MDF substrate, complete with concealed fixing system, aluminum support framework, edge trims, joint treatment, cutting, fabrication, alignment, and all necessary accessories and consumables. 

Code: C04
Location: Refer to GF reflected ceiling plan'),
('b5af4cd3-684f-4c55-bdb3-ddfcc94e6ed5', 'Supply, fabrication, and installation of suspended metal grating system, including grating panels, support framework/hangers, cutting to size, fixing, alignment, corrosion protection, and final cleaning.

Location: GF - Garage'),
('94f8b2ca-296b-4a23-a44e-4dacbabe0dc4', 'Closure of existing opening measuring 0.80m × 2.40m using non-structural concrete blockwork, including bonding to existing wall, cement-sand mortar, plastering to both sides, surface preparation, painting to match adjacent finishes, making good works.

Location: Bathroom 01'),
('c261e25a-400f-40c0-a95a-86a97c20be17', 'Closure of existing opening using non-structural concrete blockwork construction, including supply and installation of concrete blocks, bonding to existing structure, cement-sand mortar, plastering to both sides, surface preparation, painting finish to match adjacent surfaces, making good works.

Size: 85cm L x 240cm Ht
Location: Master Bathroom'),
('23a93d6f-f8ed-4d24-92bf-f1967dd6f864', 'Hollow block masonry wall (200 mm thick), including supply and laying of hollow blocks, cement-sand mortar, expanded metal, galvanized wall ties, and other necessary accessories, constructed in compliance with local authority orders, approved drawings, and specifications.'),
('4a9ff18f-6091-4e08-bdba-1ed4e5b141b2', 'PLASTERING:

Supply and application of cement–sand plaster to walls, including surface preparation, leveling, corner beads, curing, and all necessary materials and labor to achieve a smooth, uniform finish as per site requirements.'),
('e5b0a55f-8259-42c6-b51d-8ae819f3ebe3', 'Reinforced in-situ concrete suspended slab (RCC), including supply and placing of concrete, reinforcement bars, formwork, shuttering, vibration, curing, and all necessary additives/admixtures, complete in accordance with drawings, specifications, and authority requirements.

Slab Thickness: 250 mm'),
('787f1e1c-e9df-46ed-baf9-ef8b524abaa2', 'Screed:

Supply and laying of cement sand screed of required thickness including all necessary accessories to achieve smooth and durable surface finish all in accordance with drawings and specifications.'),
('9ac0e38d-db33-49d0-9b04-ffef12f668a1', 'Supply and Application of Internal Cement-Sand Plaster on New Blockwork Walls, includes surface preparation, cement-sand mix application, leveling, smooth finishing, curing, scaffolding (if required), and all tools/labor — complete in all respects as per specifications.

Location: In between of Bedroom 01 & New Living Room
Note: To be verified on-site once existing cupboard is removed.'),
('4828623a-3967-43a1-98b1-42f97cea562e', 'Supply and Installation of 100mm Thick Concrete Blockwork, including mortar mix, jointing, alignment, curing, cutting around services, and scaffolding where required. Complete in all respects as per approved drawings and site conditions.

Location: In between of Bedroom 01 & New Living Room
Note: To be verified on-site once existing cupboard is removed.'),
('d429f1a2-d41e-4cc6-9df6-2d8c8e53f8f0', 'Supply and Installation of Floor Screeding, including surface cleaning, bonding agent application (if required), mixing, pouring, leveling, and finishing of screed layer — complete as per site requirements and approved specifications.

Location: Master Bathroom Floor Area
Note: Including the Shower Area Sloping works (2% to drain)'),
('18e0c8cd-c29f-45d2-8f5c-1613b8aa1ec3', 'Supply and Installation of Raised Floor System (150 mm Build-Up), including sub-base preparation, lightweight blockwork or steel supports (as required), infill material, cement-sand screed, leveling, and all necessary accessories, complete in accordance with approved drawings and specifications.

Location: Kitchen, Dining Area, First Floor Master Closet, and Master Bathroom
Total Build-Up Thickness: 150 mm
Note: Waterproofing (for wet areas), floor finishes (tiles/marble), and insulation layers are not included unless specified separately.'),
('753fba81-ba6e-4bb1-9a1d-b18939e76beb', 'Supply and application of cement-sand plaster (1:3 mix), in uniform thickness, smooth finish, including all accessories as per approved drawings and specifications.

Location: Internal wall plaster'),
('b3e3333b-2ccb-456d-8a54-e98d6700b656', 'Supply and application of cement-sand plaster on the underside of roof slab, including surface preparation, leveling, curing, and protection of finished surfaces'),
('fb6c5cff-75c5-488d-b0af-6da6750ed545', 'Supply and application of cement-sand plaster to external block wall surfaces, including surface preparation, cleaning, bonding treatment where required, installation of corner beads, screeding, leveling, finishing, curing, and all necessary materials, labor, tools, equipment, and accessories required to provide a durable, true, and plumb surface ready to stone cladding, or other specified external finishes.

Location: Staircase interior & exterior walls'),
('c4edf5a4-70a7-4ebc-aaeb-803246547f67', 'Supply and application of cement-sand plaster to internal block wall surfaces, including surface preparation, cleaning, installation of corner beads, screeding, leveling, finishing, and curing.

Location: Entire Ground Floor as per new approved layout.'),
('dd5650dd-daee-43e1-9bc2-6019af615a14', 'Supply and application of cement-sand screed for flooring and plastering of walls, including surface preparation, leveling, slope to drains, curing, finishing, and making good surfaces.

Location: Maids Bathroom (3a - 017)'),
('2cbc4f85-87db-4c65-8ebf-5c20c4ba2214', 'Supply and application of cement-sand screed on balcony slab, including surface preparation, leveling to required slope/fall, compaction, curing, and protection of finished surface'),
('6757408b-eca7-450d-a72b-ee8553b26cc2', 'Supply and application of internal plaster/skimming on new partition walls, including surface preparation, base coat (if required), skim coat finishing, protection of adjacent surfaces, minor adjustments, and site cleanup.

Location: Extended Area, Office Area, & Master Bathroom.'),
('5793a373-af90-4038-bf80-4466b6482fce', 'Supply and application of waterproofing membrane/coating for balcony slab prior to construction of new walls, including surface cleaning, priming, application of approved waterproofing material, curing, and protection of finished surfaces'),
('061f1b39-64ce-4c20-9b48-eeb77eb5cd94', 'Supply and construction of exterior walls using lightweight blockwork (100 mm thickness) or AAC blocks, including openings for windows with provision of lintels or reinforced concrete beams as per approved structural design, mortar application, alignment, leveling, curing, and protection of finished surfaces.'),
('ed133f68-1a76-4641-a046-f5a20b9c521f', 'Supply and construction of new external thermal concrete block walls, complete with approved insulated concrete blocks, cement-sand mortar, galvanized wall ties, reinforcement where required, movement joints, concrete lintels (where not measured separately), cutting, chasing, making good, scaffolding, and all labour, materials, plant, and equipment necessary to complete the work.

Wall Thickness: 250mm
Location: Entire First Floor'),
('27749aff-1c28-4dd2-96b2-1ce75d1fca82', 'Supply and construction of new large arch made of blockwork in a wooden support frame with veneer finish, including supply of blocks, mortar, wooden frame, reinforcement (if required), plastering, painting, finishing, and protection of surfaces — complete in all respects.

Size: 3000mm Height x 2250mm Length
Location: Living/Dining Area'),
('a4bad728-5b84-4f9c-8be1-bc6ed724afd3', 'Supply and construction of new non-structural block wall including concrete blockwork, mortar, wall ties/reinforcement where required, plastering and painting (internal & external) to both sides, making good works. 
 
Wall Dimensions:
Lengths: 1.38m + 2.51m + 1.11m
Height: 3.00m

Location: Bedroom 01 Balcony'),
('3f4314d2-e785-4732-8753-2560c55f5da8', 'Supply and construction of new non-structural internal concrete block walls, complete with concrete blocks, cement-sand mortar, galvanized wall ties, bed joint reinforcement where required, bonding to existing walls and reinforced concrete structure, cutting, fitting, chasing, making good, scaffolding, curing, and all labour, materials, plant, equipment, and accessories necessary to complete the work.

Wall Thickness: 250mm
Location: Entire First Floor'),
('f078654a-ea24-45f0-aa0e-74ec84d6bd29', 'Supply and construction of new partition wall, including framework, infill, plaster/skimming, surface finishing, and making the partition ready for painting or wall finishes.

Location: Guest Room'),
('7ca2bdfa-a723-4cea-a7c9-042fc541d4d1', 'Supply and construction of new reinforced concrete ground slab for the new covered portico, including excavation to required depth, subgrade preparation, compaction, hardcore filling, sand blinding, polyethylene sheet (DPM), reinforced concrete slab, formwork, reinforcement steel, concrete placement, finishing, and curing.

Location: New Covered Portico'),
('917251ca-a368-42a6-8e63-6060c740b518', 'Supply and construction of new reinforced concrete ground slab for the proposed pantry area, including excavation to required depth, subgrade preparation, compaction, hardcore filling, sand blinding, polyethylene sheet (DPM), reinforced concrete slab, formwork, reinforcement steel, concrete placement, finishing, and curing.

Location: New Pantry'),
('c167b375-9fef-46a0-808a-29c93368aee3', 'Supply and construction of new reinforced concrete roof slab including formwork, propping, reinforcement steel, ready-mix concrete, casting, vibration, curing, de-shuttering, plaster finish to soffit and edges, and application of waterproofing system to the exposed top surface.

Location: Bedroom 01 Balcony'),
('e423e596-a786-46c2-b88e-630ebdfc4b3e', 'Supply and construction of structural lintel support above new fixed and sliding full-height window opening including steel/reinforced concrete lintel, temporary support works, installation, anchoring, grouting, plaster making good.

Location: Master Bedroom'),
('aadd67c1-1c75-49ce-b549-73d221a003ac', 'Supply and construction of terrace/parapet wall, including formwork or framework, masonry/infills, plastering/skimming, surface finishing, and making the wall ready for painting or waterproofing.

Height: 1000mm
Location: Terrace Area'),
('1a70ff63-4da0-43dd-8d6f-8746146d9829', 'Supply and fixed installation of GRC (Glass Fiber Reinforced Concrete) panels, including fabrication, finishing, fixing, alignment, jointing, protection during works, and final cleaning — complete in all respects.

Location: Bathroom'),
('f9c380a5-7165-4a10-ac19-73e31fed0b51', 'Supply and fixed installation of Gravel, including surface preparation, leveling, screeding or bedding (if required), spreading, compaction, alignment, perimeter edging, surface cleaning, protection, and handover — complete in all respects.

Drawing Code: FL002
Color: White'),
('78e4341c-23a3-474a-b336-04545c6f48f3', 'Supply and fixed installation of Plaster 01 Beige on ceiling, including substrate preparation, primer application, base coat, decorative plaster application to approved thickness, smooth finish as per manufacturer’s specifications, curing, surface protection during works, and final handover — complete in all respects.

Drawing Code: CL001
Type: Natural lime-based decorative plaster (ceiling application)
Color: Matching M001'),
('d66523fc-fe9e-4e9d-b291-aeecec348bf3', 'Supply and fixed installation of Terracotta Plaster, including substrate preparation, primer, application of lime-based plaster with integral waterproofing (if required), finishing to approved thickness and texture, curing, surface protection during works, and handover — complete in all respects.

Drawing Code: M003'),
('c236f9c0-d2b5-4e3f-9e09-1d501034bbda', 'Supply and fixed installation of decorative plaster finish in beige tone. Works include substrate preparation, base coat application, plaster application in approved thickness, smooth/texture finish as per supplier’s specifications, curing, protection during works, and final cleaning — complete in all respects. 

Drawing Code: M001
Material Type: Natural lime-based decorative plaster'),
('a9dc3cef-8084-415b-a469-048843ed15e5', 'Supply and fixed installation of waterproof decorative plaster finish, beige tone matching M001. Works include substrate preparation, waterproof primer, application of lime-based plaster with integral waterproofing additive/system, finishing in approved texture, curing, surface protection during works, and handover — complete in all respects.

Drawing Code: M008
Type: Waterproof natural lime-based plaster system
Color: Matching M001'),
('a11fea7e-001b-4283-b73e-42b5286212ac', 'Supply and installation of 160mm diameter rainwater pipe from roof slab to ground floor, including connections, excavation, backfilling, and surface restoration.'),
('70515b35-d12d-4164-a9e5-fd4f15f87147', 'Supply and installation of decorative vertical louvers in MR MDF with waterproof plaster finish. Works include cutting, alignment, fixing, plastering, surface finishing, protection during works, and final cleaning — complete in all respects.

Material: MR MDF 20mm × 50mm, waterproof plaster finish (M008)
Dimensions: 1200 + 2025 + 1200 mm L × 3000 mm HT × 50 mm D'),
('e7d70396-cca5-4072-9875-5e373abbc2ea', 'Supply and installation of new roof rainwater downspout system from the proposed roof slab level down to the ground-floor drainage connection, including uPVC/HDPE rainwater pipes, fittings, bends, offsets, brackets, supports, connection to existing drainage system, testing, commissioning

Location: Bedroom 01 Balcony'),
('d444eccc-0e17-4353-b12b-7c7f438c50e8', 'Supply of all materials and construction of a reinforced concrete base platform consisting of a square concrete base, complete with formwork, reinforcement, concrete casting, curing, rendering, surface preparation, and finishing. Includes edge finishing, leveling, cleaning, and all labor, materials, tools, and accessories necessary for a complete installation.

Bottom Square Base: 600mm × 600mm × 250mm H'),
('398bd979-87f3-49c2-b55c-6a29814d4e78', 'Supply, fabrication, and construction of reinforced concrete roof slab, including formwork, reinforcement (steel bars), pouring of concrete (M25 grade or as per structural design), leveling, compaction, curing, and finishing'),
('1beb6ca7-adc1-48bc-a86a-cbbec4c307bc', 'Supply, formwork, reinforcement, and casting of reinforced concrete terrace slab, including curing, leveling, surface finishing, and making ready for subsequent flooring or waterproofing works.

Location: Terrace Area'),
('fb0fd2fb-31c0-4b0a-afa5-1eee625e4cd0', 'Supply, mixing, and application of cement–sand floor screed up to 100 mm maximum thickness to GF & FF floor areas (excluding garage), including leveling, compacting, finishing, curing, and making surfaces ready for floor finishes

Location: GF & FF Floorings (excluding garage flooring)'),
('a7377067-e2b1-47fd-8718-df63bdd51ad1', 'Careful demolition and removal of existing non-structural block wall section measuring 0.30m length, including cart away and disposal of debris. 

Carefully dismantle the existing sliding door, track, guides, and associated hardware, including alignment, adjustment, making good to affected surfaces.'),
('be11cf7c-b5e7-4f67-9255-dd1b48431287', 'Careful demolition and removal of existing wooden doors and frames, including all accessories, disposal of debris, and making good minor wall damages.

Location: First Floor'),
('1206877a-c41c-459a-98b1-894830955bf5', 'Careful demolition and removal of non-structural block wall to form a new door opening measuring 0.87m × 2.40m, including cutting, trimming, edge preparation, cart away and disposal of debris to an approved dumping site, making good to exposed edges.

Location: Bathroom 01'),
('8fda6048-afc9-40d9-92c3-b2971ed38899', 'Careful dismantling and removal of existing fixed window system and preparation of opening for installation of new glass window measuring 1.0m (L) × 3.0m (H), including disposal of existing materials, modification of opening, minor civil works, edge preparation, and making good.'),
('e200874c-ad09-4e3b-9a43-47814f7286ab', 'Careful dismantling and removal of existing flush wardrobe including carcass, shutters, internal shelving, hardware, mirrors (if any), and all associated fixings. Includes disconnection from walls, floor, and ceiling, protection of surrounding finishes, making good of adjacent wall surfaces (plaster patching and leveling), and preparation for new joinery layout, including disposal of debris to approved site

Length: 3.60m 
Depth: 0.60m
Location: Bedroom 01'),
('c59ee026-0e31-4155-97b7-72adba1147c1', 'Careful dismantling and removal of existing window assemblies including glass panels, frames, sealants, and accessories, with protection of adjacent finishes, cart away, disposal to approved dumping site, and preparation of openings for new installation.

Window Sizes:

Window 01: 1.46m L × 2.40m ht
Window 02: 1.915m L × 2.40m ht
Window 03: 0.80m L × 2.40m ht

Note: As per Dismantling Plan'),
('6821e624-afe0-4872-8b2a-52427d692d11', 'Careful dismantling and removal of existing window assembly prior to installation of new window, including protection of adjacent finishes, removal of frame and glass panels, debris disposal, and preparation of opening for new window installation.

Window Size: 1.495m (L) × 3.00m (H)

Note: As per Dismantling Plan'),
('16b96abd-732f-49a8-b79c-56a5f0c0a11c', 'Careful dismantling and removal of existing wood parquet flooring, including lifting of planks, removal of adhesives/underlay, cleaning of substrate.

Location: Dining, Patio, Living, Kitchen, Entry, Lobby, Maids Room & Toilet, Common Toilet, GF Room, Washing & Drying Area'),
('b51c0871-8c54-433f-97b9-387d4e98f2f7', 'Careful removal of existing door including door leaf, frame, architraves, hinges, lockset, hardware, and all associated accessories, including protection of adjacent finishes, cart away and disposal of removed materials to an approved dumping site, minor making good to affected surfaces

Opening Size: 95cm L × 240cm ht
Location: Master Bedroom W/C'),
('ea1e8cca-7806-482e-9ff5-48f34729f130', 'Careful removal of existing door including door leaf, frame, hinges, lockset, hardware, and associated accessories, including cart away and disposal of removed materials to an approved dumping site, making good to affected surfaces.

Total Size: 87cm L x 240cm ht
Location: Master Bedroom hallway'),
('03d6e49f-f735-47e8-8117-f9bd4eb919f9', 'Careful removal of existing non-structural wall, including dismantling, cutting, breaking, removal of finishes, and disposal of debris. Protection of adjacent surfaces included.

Location: Proposed Study Room'),
('81fa3240-5e8a-465b-89f0-eb1f9f63a00f', 'Careful removal of existing vanity mirror including disconnection of any existing lighting connections, followed by supply and installation of new vanity mirror with integrated backlighting system, including electrical connections, fixing, alignment, testing, and commissioning.

Location: Powder Room'),
('0c9266f4-f617-4a5d-8b54-313e0906e503', 'Careful removal of existing wooden door including frame, accessories, and hardware, followed by preparation of opening for installation of new concealed (hidden) wooden door system, including surface adjustment, frame alignment preparation, minor civil works, and making good.'),
('81729db1-73ad-46fe-9ddf-e1d985623034', 'Careful removal of existing wooden doors and architraves, including handling, protection of finishes, debris disposal, transportation to approved dump site and making good affected surfaces — complete in all respects.

Locations & Door Types:
1. Old Bedroom 01 – Single Swing
2. Old Bathroom 01 – Single Swing
3. Master Bathroom – Single Swing
4. Master Bedroom – Single Swing
5. Laundry Bathroom – Single Swing
6. Store Room – Single Swing
7. Powder Room – Single Swing
8. Corridor Area – Double Swing'),
('c1524835-291b-4034-af00-8cba038d4e3d', 'Careful removal of existing wooden sliding door including track, guides, and accessories for reuse. 

Close the existing door opening measuring 0.80m × 2.40m using non-structural blockwork including bonding to existing wall, plastering, surface preparation, and paint finish to match adjacent surfaces. 

Form a new door opening measuring 0.80m × 2.40m by demolition of non-structural block wall, including cutting, trimming, disposal of debris, and preparation of opening. 

Relocate and reinstall the existing sliding wooden door complete with existing hardware, track adjustments, alignment, testing, commissioning.

Location: Bedroom 01'),
('bdcef1c7-d6de-4ade-83af-a3f3af2d8495', 'Careful removal of the existing dining door, door frame, architraves, hinges, lockset, and associated ironmongery, including making good the wall edges, floor, and ceiling finishes as required to leave the opening as a permanent open access.

Note: This item includes disposal of removed materials, patching, and preparation.'),
('03a2d884-f273-4326-97c2-7bd30aed61d7', 'Careful removal of the existing kitchen door, door frame, architraves, hinges, lockset, and associated ironmongery, including making good the wall edges, floor, and ceiling finishes as required to leave the opening as a permanent open access.

Note: This item includes disposal of removed materials, patching, and preparation.'),
('c9f694c7-c3dc-41c3-93f4-dfa0684f8b7d', 'Carefully remove and dismantle existing natural stone wall cladding to facilitate the extension of the first floor structural slab, including cutting around affected areas, removal of stone panels, adhesives and/or mechanical fixing systems, protection of adjacent finishes and structural elements, loading, transportation, disposal of debris to an approved dumping site, and cleaning of exposed surfaces.

Location: GF & FF outdoor wall cladding of existing villa'),
('47898ff6-65cd-4adf-89b2-86be06c4c921', 'Demolition and removal of all existing decorative GRC arches from window openings as required by the new design, including transportation and disposal of debris to the approved Municipality dumping site'),
('32835d89-bd76-44cc-bc72-36d25d824daa', 'Demolition and removal of existing ceiling system including gypsum board/false ceiling, suspension framework, accessories, debris removal, cart away, disposal to approved dumping site, and minor making good works

Note: As per Dismantling Plan'),
('004219a1-1c43-4498-9c0a-06ad415d124f', 'Demolition and removal of existing non-structural blockwork walls including breaking, cart away, disposal to approved dumping site, and minor making good works.

Blockwork Quantities:

Wall Lengths: 17.82m L
Height: 3.50m H

Note: As per Dismantling Plan'),
('e761b0a0-3fb5-4fdf-bb96-b16f89f5c22c', 'Demolition of RCC slab at roof level above staircase for skylight opening, including cutting with concrete cutter, controlled breaking, removal of reinforcement bars, complete as per approved drawings.

Note: 2 Nos. of Skylight'),
('01a30078-ed4c-47de-8cdb-8f7e8dfebef8', 'Demolition of existing window and modification of opening to full-height door (1.20m width), including cutting of wall, edge finishing, making good, and disposal of debris.

Location: Female Staff Room

Note: Rate assumes non-structural wall. Structural opening or lintel modification to be priced separately if required.'),
('56428236-db12-472a-8bfb-e7cfbd68a9f9', 'Relocation of existing door from Old PWD to new proposed Study Room, including careful dismantling, frame adjustment, refixing, alignment, and making good surrounding finishes.'),
('19b099fe-ad66-4b2b-8a21-e00c2c3c860d', 'Removal of Existing Bathroom Fixtures and Finishes (First Floor Bathroom), including removal of bathtub with concrete support, shower, WC, floor and wall tiles, detachment from plumbing connections, breaking of surrounding concrete (if required), lifting, and disposal of debris, complete in accordance with approved drawings and specifications.'),
('9806b016-4516-4688-bc57-ffbe2ba47f00', 'Removal of Existing Ceilings, including dismantling of gypsum board, plaster, false ceiling, or other ceiling finishes, removal of supporting framework, and light fixtures, complete in accordance with approved drawings and specifications.'),
('9b9981ca-e271-4eb4-8b9e-2e2685385fc3', 'Removal of all existing landscape floor tiles, including dismantling, surface cleaning, and disposal of debris to the approved Municipality dumping site.'),
('24c239fb-4c21-4667-b03b-6d3de8e96872', 'Removal of existing concrete staircase and balustrading including preparation to receive new steel staircase and feature wall'),
('56dc428e-357f-443a-b932-397e6250d440', 'Removal of existing decorative GRC elements located beneath the windows to accommodate the installation of the new design as per approved drawings'),
('bc181158-294e-441e-80b8-83e679acf56b', 'Removal of existing door, wash basin, water closet, and all associated plumbing/drainage connections in preparation for the proposed Study Room, including careful dismantling, disconnection, and disposal. Protection of adjacent finishes included.

Location: Old PWD'),
('e73d5329-44de-4ba4-83ad-72f7e48e1697', 'Removal of existing floor finish including tiles/paver stones and bedding layer where required, including surface preparation, debris removal, cart away, disposal to approved dumping site, and preparation of substrate ready for installation of new floor finish.

Note: As per Dismantling Plan'),
('2e43027e-29ce-4311-b711-5706bf307624', 'Removal of existing floor tiles and existing screed, including lifting, breaking, cleaning of substrate, and carting away debris, followed by supply and installation of new cement screed to prepare floor for marble flooring.

Location: Entire Area excluding Bathrooms'),
('485c4504-f450-47d9-a19a-457ef601deda', 'Removal of existing glass door including frame, dismantling of existing non-structural block wall, and demolition of additional non-structural block wall to create new window opening, including cart away and disposal of debris, edge trimming, making good works.

Demolition Quantities:
A) Existing Glass Door Removal
- Size: 1.77m L × 2.40m H
B) Existing Non-Structural Block Wall Removal
- Size: 0.43m L × 3.00m H
C) New Window Opening Formation
- Non-structural block wall demolition for opening
- Size: 0.80m L × 2.40m H

Location: Bedroom 01'),
('f43358e9-9720-4796-b98f-a9e54c4a4ce6', 'Removal of existing interlock/paver stones and gravel including bedding material where required, cart away and disposal to approved dumping site, and preparation of surface/sub-base ready for installation of new paver stones.

Note: As per Dismantling Plan'),
('31512bff-6dbf-4d53-ad00-1ed55262e9ae', 'Removal of existing kitchen mixer and supply & installation of new Kitchen Mixer, including all necessary plumbing connections, testing, alignment, sealing, and protection of surrounding surfaces — complete in all respects.

Brand: BagnoDesign - Bystro
Type: EX316 3 Hole Deck Mounted Kitchen Mixer With Push Button Hand Shower
Finish: Brushed Stainless Steel
Location: Kitchen Island Unit'),
('402436be-9848-4049-a14e-0f922221d053', 'Removal of existing vanity counter from first-floor bathroom, including detachment of countertop, sink, plumbing connections, drawers/cabinets, and associated hardware.'),
('c2377d5c-19ad-4fbf-8ba7-bc8c77413c1b', 'Removal of existing wardrobe, including dismantling, removal of panels and hardware, disposal of debris, and making good surrounding surfaces.

Size: 2531 mm L x 600mm D
Location: Bedroom 3a - 013'),
('0ae149c1-91c2-4e0c-b253-bccae184858c', 'Removal of non-structural block wall to create new door opening including cutting, demolition, cart away and disposal of debris, making good works

Total Size: 87cm L x 240cm ht
Location: Master Bathroom'),
('72602cf4-e7be-4a72-b42e-3f729b1abaa2', 'Removal of the existing glass railing followed by fabrication, supply, and installation of 10mm clear tempered glass fixed in 4×10 cm black U-channel. 


Location: Interior Glass Balustrade at Staircase Area
Note: Excluding the installation of any wooden handrail.'),
('f25745c8-cf87-4ac1-a2f6-0530af11d272', 'Removal, cart away, and disposal of the existing kays door, frame (if required), architraves, hinges, lockset, and associated ironmongery.

Note: This item includes preparation of the opening to receive the new door installation.'),
('21577916-ba2d-4cbc-8813-2c65657cd305', 'Removal, cart away, and disposal of the existing office/study door, frame (if required), architraves, hinges, lockset, and associated ironmongery.

Note: This item includes preparation of the opening to receive the new door installation.'),
('915f1cab-7c4d-4f99-a7ea-162767667944', 'Removal, cart away, and disposal of the existing office/study washroom door, frame (if required), architraves, hinges, lockset, and associated ironmongery.

Note: This item includes preparation of the opening to receive the new door installation.'),
('7f09d2c0-61c8-4400-b995-c2f2abf05a5a', 'Removal, cart away, and disposal of the existing powder room door, frame (if required), architraves, hinges, lockset, and associated ironmongery.

Note: This item includes preparation of the opening to receive the new door installation.'),
('66a7e8e3-f86e-4906-be6e-6bb42c46d55e', 'Remove and demolish existing blockwork walls, including cutting, breaking out, dismantling, protection of adjacent finishes and structural elements, temporary supports where required, collection of debris, loading, transportation, and disposal to an approved dumping site. Include making good to adjoining surfaces after demolition.

Location: as per actual site condition vs new drawing'),
('1ad74f24-d2b4-4f23-a3cf-6a820b76567a', 'Carefully remove and relocate the existing bathroom window to a new designated location, including closure of the existing window opening with matching blockwork, cement-sand plastering, patching, and making good works. Form a new window opening to accommodate the relocated window, including all necessary cutting, fixing, sealing, alignment, finishing, and disposal of debris.

New Window Opening Size: 57cm (W) × 100cm (H)'),
('1b53a465-54c2-406b-a3ae-6df77d8e5708', 'Carefully remove the existing wooden swing door including frame, hinges, lockset, and accessories for reuse. 

Close the existing door opening measuring 0.80m × 2.40m using non-structural concrete blockwork, including bonding to existing walls, plastering to both sides, surface preparation, painting, and making good works. 

Form a new door opening measuring 0.80m × 2.40m by demolition of non-structural block wall at the new location, including cutting, trimming, disposal of debris, and preparation of opening. 

Relocate and reinstall the existing wooden swing door complete with frame, ironmongery, alignment, adjustment, testing.

Location: Bedroom 02'),
('7873fbe7-5784-4d82-8161-2f3fbfdf4c64', 'Door trimming prior to installation of LVT flooring, including careful cutting of door bottoms to allow for proper LVT floor clearance, alignment, sanding, and minor finishing. Works include protection of adjacent finishes and site cleaning — complete in all respects.

Location: Main Entrance Door, Master Bedroom Door, & Bedroom 01 Door'),
('edba37c6-7e3f-4131-9cf7-5ce2ad29a097', 'Double Leaf Wooden Door

Supply and installation of Non-fire rated double leaf wooden door in veneer finish, including standard ironmongeries.

Size: 2000mm L x 2400mm H
Location: Events hall
Budgetary Cost for Ironmongaries: 2,000 AED per set (double door hardware set)'),
('d176c84e-5bd1-4930-9c10-08ddd2601931', 'F-G.S.D.02: Supply and install sliding (glass) door for MASSAGE RM., size 3350 x 3300 mm (±).'),
('c523c36e-91eb-4762-aa61-653d47ddbe12', 'FF BATHROOM 1 : Supply and installation of door made of 45mm solid 
beech wood frame with white oak wood veneer finish,56mm semi solid 
swing shutter flushed with the inside frame,,20mm solid wood 
lipping,Soft wood infill+38mm chipboard+9mm MRMDF,Wood veneer 
finishes both sides,Finish as per approved sample,including concealed 
hinges and iron mongeries 
Size : 900x2800mm'),
('360d1e05-7b77-474c-b79c-61bc765b2e15', 'FF BATHROOM 2 : Supply and installation of door made of 45mm solid 
beech wood frame with white oak wood veneer finish,56mm semi solid 
swing shutter flushed with the inside frame,,20mm solid wood 
lipping,Soft wood infill+38mm chipboard+9mm MRMDF,Wood veneer 
finishes both sides,Finish as per approved sample,including concealed 
hinges and iron mongeries 
Size : 900x2800mm'),
('cbfc1df3-0436-4b77-9ea0-9cabc7c33484', 'FF BATHROOM 3 : Supply and installation of door made of 45mm solid 
beech wood frame with white oak wood veneer finish,56mm semi solid 
swing shutter flushed with the inside frame,,20mm solid wood 
lipping,Soft wood infill+38mm chipboard+9mm MRMDF,Wood veneer 
finishes both sides,Finish as per approved sample,including concealed 
hinges and iron mongeries 
Size : 900x2800mm'),
('bcdb7d70-a9f5-4514-8368-eb4dd153b4f5', 'FF BEDROOM 3: Supply and installation of door made of 45mm solid oak 
wood frame with oak wood veneer finish,56mm semi solid swing shutter 
flushed with the inside frame,20mm solid wood lipping,Soft wood 
infill+38mm chipboard+9mm MRMDF,Wood veneer finishes outside and 
PU paint finish inside,Finish as per approved sample,including concealed 
hinges and iron mongeries 
Size : 1000x2800mm 
Subframe: 1000x2800mm'),
('4c569769-3fb1-4ec3-bd19-fd86eac8c5ee', 'FF Bathroom Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 800mm W x 2400mm H x 200mm J
Location: FF Bathroom Door'),
('88d9de2d-67de-4440-88e1-4e892a6a472d', 'FF Bathroom Entrance Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 800mm W x 2400mm H x 200mm J
Location: FF Bathroom Entrance Door'),
('20b4d52e-f48d-4dca-97b4-8ddde9d581de', 'FF MASTER BATH DOOR : Supply and installation of door made of 56mm 
semi solid swing shutter flushed with the inside frame,20mm solid wood 
lipping,Soft wood infill+38mm chipboard+9mm MR MDF,Wood veneer 
finishes,Finish as per approved sample 
Outside oak veneer finish,inside mirror finish,black metal liping to cover 
the mirror edge,including sliding door fittings 
Size : 1600x2800mmht 
Mirror size : 1460x2800mmht'),
('b9bfa753-c056-4e8c-aeb0-354bdd9bc7d3', 'FF MASTER BEDROOM : Supply and installation of door made of 45mm 
solid beech wood frame with white oak wood veneer finish,10mm U 
channnel on both side,56mm semi solid swing shutter flushed with the 
inside frame,,20mm solid wood lipping,Soft wood infill+38mm 
chipboard+9mm MRMDF,Wood veneer finishes both sides,Finish as per 
approved sample 
Size : 1000x2800mm'),
('deeb7b22-2c62-48f8-b7a4-b983f3ca16fe', 'FF STORE : Supply and installation of door made of 45mm solid oak wood 
frame with oak wood veneer finish,56mm semi solid swing shutter 
flushed with the inside frame,20mm solid wood lipping,Soft wood 
infill+38mm chipboard+9mm MRMDF,Wood veneer finishes outside and 
PU paint finish inside,Finish as per approved sample,including concealed 
hinges and iron mongeries 
Size : 1000x2850mm'),
('8f98412e-8a82-49c2-8687-40eb6098fe9b', 'FF TOILET : Supply and installation of door made of 45mm solid oak wood 
frame with oak wood veneer finish,56mm semi solid swing shutter 
flushed with the inside frame,,20mm solid wood lipping,Soft wood 
infill+38mm chipboard+9mm MRMDF,out side Wood veneer 
finishes,inside finishes by others ,Finish as per approved sample ,6mm 
mirror edge polished all around including concealed hinges and iron 
mongeries 
Size : 1000x2850mm 
Sub frame : 1000mmx2850mmH 
mirror : 1000mmx2850mmH'),
('c1e1a9d3-f083-4f70-943d-208612c7dc55', 'FORMAL LIVING WALL PANELING W/ HIDDEN DOOR:

Supply and installation of wall paneling with mix of flat and shaker design (shallow pigeon hole design) all in veneer finish. Single swing wooden internal door in semisolid wood door frame and solid wood concealed door frame. including door closer

Cladding: MDF in flat veneer finish
Cladding: MDF in veneer finish, with shaker design as per reference
Budgetary cost for ironmongery: AED 2000
Size: 5150mm W X 70mm thk. X 3300mm HT
 Hidden Door: 1000mm W X 2700mm HT'),
('fe58a5c1-9fcf-477b-a665-b3bbd7cc854b', 'Fabrication, Supply & Installation of Aluminum 2 TRC 2 Shutter Sliding window by Vitro Vizion (Thermal Break) Aluminum Systems.

Note: This item includes removal and disposal of the existing aluminum swing door, frame, and associated hardware.

Glass Specification: 

Vision Glass: 32mm Thick DGU Glass (6mm Thick HD Gray Tempered Glass +20mm M/F Spacer + 6mm Thick Clear Tempered Glass)
Profiles: Slider Frame, Track flush, Track divider, track cover, keeper, interlock,shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved Powder coated color.

Size: 1600mm W x 2800mm H'),
('6671f88c-5c65-45d5-9b83-fcdf993a0ad4', 'Fabrication, Supply and Installation of Wooden Door, including complete ironmongery set for wooden doors, including hinges, lever handle with lockset, cylinder, stoppers, screws, fixing accessories.

Ironmongaries Budgetary Cost per each door: 1,500 AED
Size: 950mm L x 2150mm HT
Location: Bedroom 01, Bedroom 02, Den Study, & Master Bedroom'),
('58211748-9398-4140-ad34-f22497a68d42', 'Fabrication, Supply and Installation of Wooden Double Swing Door, including complete ironmongery set for wooden doors, including hinges, lever handle with lockset, cylinder, stoppers, screws, fixing accessories.

Ironmongaries Budgetary Cost per each door: 1,500 AED
Size: 1600mm L x 2150mm HT
Location: Entrance Lobby'),
('5368e614-d73c-4375-89a0-ceaf5baac482', 'G-D.01: Supply and install openable + fixed glass door for Entrance Foyar, size 3000 x 7680 mm (±).'),
('c3681879-ff67-4eee-9f42-dc998c6dae88', 'G-G.D.01: Supply and install openable glass door for Entertainment Lounge, size 1250 x 4980 mm (±).'),
('85053ff2-71a9-4e59-af72-6e9dd47f8c9f', 'G-G.D.02: Supply and install openable glass door for Entertainment Lounge, size 1250 x 4980 mm (±).'),
('6ece83c2-8629-477f-a4d8-aeac22b32e29', 'G-G.D.04: Supply and install openable glass door for Grease Kitchen, size 1120 x 2800 mm (±).'),
('7fd1a236-e3cd-485e-8bb3-c250fb65039f', 'G-G.S.D.02: Supply and install sliding glass door for Entertainment Lounge, size 5050 x 3820 mm (±).'),
('fb5824e0-7cb2-4f87-95bf-8caaa6870c0d', 'G-G.S.D.03: Supply and install sliding glass door for Entertainment Lounge, size 3700 x 4980 mm (±).');
insert into scheduler.rate_fix_stage (id, description) values
('d06eb7b7-7b2a-4730-88ba-6a6653bbee58', 'G-G.S.D.04: Supply and install sliding glass door for Dining-Buffet, size 5450 x 3820 mm (±).'),
('55607987-2a4a-40e3-a8ce-7a84a682fcf6', 'GF BEDROOM 01 : Supply and installation of door made of 45mm solid 
beech wood frame with white oak wood veneer finish,10mm U channnel 
on both side,56mm semi solid swing shutter flushed with the inside 
frame,,20mm solid wood lipping,Soft wood infill+38mm chipboard+9mm 
MRMDF,Wood veneer finishes both sides,Finish as per approved sample 
Size : 1000x2800mm'),
('02b7665b-6afa-48d8-9658-c1aa8bd54c6f', 'GF Bathroom Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 800mm W x 2400 mm HT x 200mm J
Location: GF Bathroom Door'),
('73178b75-8d73-415b-9be1-905e84dd53b4', 'GF Bathroom Entrance Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 800mm W x 2400mm HT x 200mm J
Location: GF Bathroom Entrance Door'),
('f3179e35-0a1a-4675-b0f5-43ea493776ce', 'GF GARRAGE DRIVER BATH : Supply and installation of door made of 
45mm solid beech wood frame with PU paint finish, 45 mm solid beech 
wood swing shutter ,archtrave 80x12mm Solid beech wood,20mm solid 
wood lipping,Soft wood infill+33mm chipboard+9mm MRMDF,PU paint 
finishboth sides,Finish as per approved sample,including concealed hinges 
and iron mongeries 
Size : 900x2200mm'),
('e97f9e08-3b61-4c99-bca0-42cfa913fb78', 'GF OFFICE SLIDING POCKET DOOR : Supply and installation of door made 
of 56mm semi solid swing shutter flushed with the inside frame, 20mm 
solid wood lipping,Soft wood infill+38mm chipboard+9mm MRMDF,Wood 
veneer finishes both sides,Finish as per approved sample,including sliding 
door fittings 
Size : 1900x3050mm'),
('7b90c9f7-1c99-4ae9-9523-8e2429bca225', 'GF PANTRY - PIVOT DOOR : Supply and installation of door made of 
45mm solid beech wood frame with white oak wood veneer finish,56mm 
semi solid shutter flushed with the inside frame,,20mm solid wood 
lipping,Soft wood infill+38mm chipboard+9mm MRMDF,Wood veneer 
finishes both sides,Finish as per approved sample,including concealed 
hinges and iron mongeries 
Size : 1000x3000mm'),
('5cf91b84-9531-4436-abef-e3b7c2dc6d21', 'GF PLAY ROOM BATH: 

Supply and installation of door made of 45mm solid beech wood frame with white oak wood veneer finish, 56mm semi solid swing shutter flushed with the inside frame,20mm solid wood lipping, Soft wood infill+38mm chipboard+9mm MR MDF, Wood veneer finishes both sides, Finish as per approved sample, including concealed hinges and ironmongeries 

Size : 900x3000mm'),
('f482d538-de3b-44c0-acbf-d96a9e71cb81', 'GF PLAYROOM : Supply and installation of door made of 45mm solid 
beech wood frame with white oak wood veneer finish,56mm semi solid 
swing shutter flushed with the inside frame,,20mm solid wood 
lipping,Soft wood infill+38mm chipboard+9mm MRMDF,Wood veneer 
finishes both sides,Finish as per approved sample,including concealed 
hinges and iron mongeries 
Size : 1000x3000mm'),
('33e14365-4cb3-4464-abb8-55d95f8786b6', 'GF STORE UNDER STAIR CASE,PIVOT DOOR : : Supply and installation of 
door made of 56mm semi solid swing shutter flushed with the inside 
frame,20mm solid wood lipping,Soft wood infill+38mm chipboard+9mm 
MR MDF,pu paint finishes,10mm U channnel on both side,Finish as per 
approved sample 
cover the mirror edge 
Size : 1000x3050mmht'),
('dd09f38f-837f-4af4-82f3-4f0cbb4e71e4', 'GF TOILET : Supply and installation of door made of 45mm solid oak wood 
frame with oak wood veneer finish,56mm semi solid swing shutter 
flushed with the inside frame,,20mm solid wood lipping,Soft wood 
infill+38mm chipboard+9mm MRMDF,out side Wood veneer 
finishes,inside finishes by others ,Finish as per approved sample ,6mm 
mirror edge polished all around including concealed hinges and iron 
mongeries 
Size : 1000x3050mm 
Sub frame : 1000mmx3050mmH 
mirror : 1000mmx3050mmH'),
('ade66a0c-02fc-44cb-84c9-f88337a1befb', 'GM''s Bathroom Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 800mm W x 2400mm H x 200mm J
Location: GM''s Bathroom Door'),
('f101205e-869b-4c9c-b9d8-b1be27ba4247', 'GM''s Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 900mm W x 2400mm HT x 200mm J
Location: GM''s Door'),
('ee25980e-11ce-4daf-97d7-2d644e4f32a8', 'Gypsum Light Cove

Supply and installation of light cove with necessary frame work & suspension system.

Brand: Gypsemna or equivalent
Location: Meeting rooms'),
('3ce1ccaf-049d-4166-8a86-bbe113a2e3f3', 'Installation of light frame, including proper alignment, leveling, fixing to ceiling substrate, coordination with lighting layout, joint treatment, finishing. All necessary labor, tools, and consumables included — complete in all respects as per manufacturer’s specifications and approved sample.

Location: Powder Room'),
('103f53d3-8b2a-40d2-816f-fa81f17f562e', 'Installation of trimless light frame, including alignment, fixing, jointing, surface finishing, protection during works, and handover — complete in all respects.

Location: HK & Bathroom'),
('08dab279-7906-45fa-b6fa-0a961a3c9c66', 'Manufacture and installation of custom made non-fire rated folding doors both sides cladded with 2mm thick stainless steel sheet. Includes heavy duty folding mechanism.

Code: DR-1.01.2
Overall size: 2175mm W x 2965mm H
NOTE: Subject to final approved design and specifications from Client.'),
('8cc89ed8-609d-4e46-a1f0-8d8906e30e80', 'Manufacture and installation of custom made non-fire rated single leaf hinged door, flushed on one side, consisting of semi-solid core and timber lipping. One side of door to be in paint finish sprayed 20% gloss, other side to be cladded with 2mm thick stainless steel sheet. 

Code: DR-1.01.1
Overall size: 1070mm W x 2665mm H
NOTE: Ironmongeries priced separately. Subject to final approved design and specifications from Client. Invisible frame not considered to reduce cost.'),
('07be9e5d-5bd3-4812-bd80-234670180ee7', 'Meeting Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 900mm W x 2400mm HT x 200mm J
Location: FF Meeting Door'),
('748986d6-2cfe-4fea-9355-cfacace2a3cc', 'Operations Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 900mm W x 2400mm HT x 200mm J
Location: Operations Door'),
('2d34c08b-9e7f-4316-bef4-a36fd7205f6b', 'Option 1 (With LED):

Supply and Installation of logo in metal box frame 20cm thickness with flex print side aluminum angle with LED light.'),
('686c2edb-d6e1-42d2-9d65-654b318c0109', 'Option 2 (Without LED):

Supply and Installation of logo in metal box frame 20cm thickness with flex print side aluminum angle without LED light.'),
('62b48b83-0b09-4dca-a68e-e80992397032', 'Pantry/Break Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 900mm W x 2400mm HT x 200mm J
Location: Pantry/Break Door'),
('43100cff-b54d-4eb8-b58d-637ff8c03c0a', 'Prepare and repaint the existing cupboard door to match the color and finish of the adjacent cupboard doors, including surface cleaning, light sanding, minor filling of imperfections, primer (where required), and application of high-quality paint finish. Includes protection of surrounding areas, masking, cleanup

Location: Kitchen'),
('c4022076-9626-4e84-873a-0fd108400eb9', 'Relocation of existing bathroom door to new location, including careful dismantling, refixing of door frame and shutter, alignment, minor wall making good, and testing.

Location: Master Bathroom'),
('a40019ee-0bb6-4928-95f4-f173c808dac7', 'Repainting and relocation of existing entrance main door to new location, including dismantling, refixing, alignment, surface preparation, and application of PU paint finish as per approved colour sample.

Location: Entrance Main Door'),
('945bd9ff-b0a9-4377-a5af-86a91b69c2ea', 'Single Leaf Glass Swing Door

Supply and installation of single leaf swing door, framed, using 10mm thk clear tempered glass (non-acoustic) with bronze coated profile finish, including door accessories, H handle and other ironmongeries required. 

Approx size: 900mm L x 3300mm H
Location: Meeting rooms, VIP lounges, Kids room'),
('a93a18f6-4bf2-403a-88d7-d19b4b42b102', 'Single Leaf Wooden Door - Type 1

Supply and installation of Non-fire rated single leaf wooden door cladded with travertine clay panels, including standard ironmongeries.

Size: 1100mm L x 2348mm H
Location: Pantry, Janitor room, AV room, Training room, Cash collection room, POD main entrance, Male & Female toilet main entrance
Budgetary Cost for Ironmongaries: 1,000 AED per set'),
('aee81156-f151-4079-a73e-97d6a6b4258f', 'Single Leaf Wooden Door - Type 2

Supply and installation of Non-fire rated single leaf wooden door in veneer finish, including standard ironmongeries.

Size: 1100mm L x 2348mm H
Location: Kitchen
Budgetary Cost for Ironmongaries: 1,000 AED per set'),
('4c708db4-4727-45b6-9a0b-1abf0afc6ba5', 'Single Leaf Wooden Door - Type 3

Supply and installation of Non-fire rated single leaf wooden door in metallic paint finish, including standard ironmongeries.

Size: 816mm L x 2365mm H
Location: Sales gallery and Pre-function area Male & Female toilet cubicles
Budgetary Cost for Ironmongaries: 1,000 AED per set'),
('48806b0a-98ac-4bf8-b26e-01cedcdd6468', 'Single Leaf Wooden Door - Type 4

Supply and installation of Non-fire rated single leaf wooden door in metallic paint finish, including standard ironmongeries.

Size: 1100mm L x 2348mm H
Location: Store room, Equipment room, Control room
Budgetary Cost for Ironmongaries: 1,000 AED per set'),
('2f608556-5c9c-423e-b4e7-cbaa681ddcac', 'Supply and Installation of Aluminum glazed door set - Suchuco 54 PD ME Sliding Door (S+S+F)

Ref. Sliding Door 
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 3000 mm L x 2600mm ht 
Location: Elevation B, Dining Area'),
('0eb4c2c5-a1f4-4be2-b305-70dc5f74adbd', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (1 Panel)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 2700 mm L x 500mm ht 
Location: Elevation D, Kitchen Area'),
('993c4430-c3c7-4bbb-818d-e2785da810dc', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (2 Panels)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 2560 mm L x 2700mm ht 
Location: Elevation B, Staircase at ground floor area'),
('a4a47100-5002-4491-9642-17d11c764292', 'Supply and Installation of Aluminum glazed window set - Fixed Curtain Wall Window (3 Panels)

Ref. Glazed Window
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 3000 mm L x 2700mm ht 
Location: Elevation C, Master Bedroom Closet
Note: Dummy Window will be blocked up internally to facilitate the closet'),
('57b0c2a9-a638-4394-aa71-4c23f937d1ef', 'Supply and Installation of Aluminum glazed window set - Schuco AWS 65 Fixed Windows with Hinged Window

Ref. Glazed Window
Hinged Window: 750mmW x 1700mmH
Fixed Panel 1: 750mmW x 1000mmH
Fixed Panel 2: 1100mmW x 1700mmH
Fixed Panel 3: 1100mmW x 1000mmH
Location: Elevation B, Master Bedroom Closet

Note: Dummy Window will be blocked up internally to facilitate the closet'),
('8cea0cda-fdcb-4862-923a-078e3969ed7b', 'Supply and Installation of Bi Folding Door - Schuco AS FD 90 HI Bi-folding Door

Ref. Bi-Folding Door
Glass: Climaguard Neutral PN70 DGU (or similar)
Colour: TBC (Sample to be approved)
Size: 2700 mm L x 2700mm ht 
Location: Elevation B, Lounge at ground floor area'),
('6d7f5912-a57a-4ba1-8d2f-b4843ec99fe7', 'Supply and Installation of Sliding Louver Panel System, including:
- Custom-fabricated laser-cut aluminum louver panels in bronze metallic powder-coated finish (approx. 3.5m H x 1.2m W each)
- Heavy-duty aluminum top track system with concealed brackets
- Bottom guide rail
- Stainless steel rollers/wheels with nylon coating for smooth operation
- Integrated end stops, handles, and stoppers
- All necessary anchoring hardware, supports, and sealant
- Automatic sliding operation
- Complete installation, alignment, and adjustment works as per project requirements

Material: Powder Coated Aluminum'),
('3b2d425b-359e-4a5d-b73f-8ba719db2faa', 'Supply and Installation of Smart Film – Master Bedroom Windows, including cut-to-size smart film, adhesive, electrical connections (if switchable/PDLC type), installation, and finishing, complete in accordance with approved drawings and specifications.

Window Size: 4595mm L x 2705mm Ht'),
('3ccaa022-8870-47b9-9693-b2cf70e78013', 'Supply and Installation of bi-folding door (Rabel 3700 Folding Doors) with PU-painted solid wooden frame.

Size: 5100mm L x 2400mm HT
Location: Rear Side of Living Area Extension'),
('b0c49bd8-8e2b-4bc5-869f-54cd5bcc619b', 'Supply and Installation of ironmongary including all necessary related works all in accordance with the drawings

Location: Pivot Door at Entrance
PC Supply Rate: 1250 Dhs/ Door'),
('4080d127-9afe-4ae7-8758-ba2b0589e0b4', 'Supply and Installation of new exterior Sliding door (10mm), including fixed and sliding panels, frame, glazing, rollers/tracks, handles, alignment, sealing, testing, and protection of finished surfaces.

Size: 2100mm L x 2150mm HT'),
('96982024-b47b-4b80-8d3e-9dd381711c40', 'Supply and Installation of wooden doors including with all the necessary fitting accessories required as per the drawings.

Location: Pivot Door at Entrance'),
('d38b3cf2-c943-44c8-97c3-e3962c5e4328', 'Supply and application of paint over existing internal doors and frames, including light surface preparation (cleaning, sanding, minor patching if required), application of primer if required, two coats of approved emulsion paint, protection of adjacent finishes, masking, touch-ups, and site cleaning — complete in all respects.

Material/Finish: White/Off White as per approved sample
Location: Existing Internal Doors and Frames'),
('a2f45985-9505-4cd4-9a1f-7b0ef0da4d9d', 'Supply and install false ceiling using Metallic Material 01 – Bronze, including framework, fixing, cutting, alignment, finishing, surface protection during works, and handover — complete in all respects.

Drawing Code: CL005A
Type: Metallic Material 01 - Bronze'),
('94721004-a534-4853-8a58-06e879044010', 'Supply and installation of (powder coated) M26 series profile heavy duty aluminium for hinged door with MAQS stainless steel and aluminium accessories.

Location: Ground Floor
Size: 940mm X 2090mm
Material: Aluminium 
Surface Finished: Powder Coated 
 
Clear Glass 6mm + 20mm Air Space + 6mm Clear Glass (Guardian) (32mm Double Glazed) 
All Glass tempered as per ASTM (American Society for Testing and Materials)'),
('6ed8e9be-16a8-40ae-9798-e9c7f0991736', 'Supply and installation of (powder coated) MAQ105 Slim series profile heavy duty aluminium for sliding door with MAQS stainless steel and aluminium accessories. 

Location: First Floor
Size: 1578mm X 1100mm (Slim Sliding window two tracks)
Material: Aluminium 
Surface Finished: Powder Coated 
 
Clear Glass 6mm + 12mm Air Space + 6mm Clear Glass (Guardian) (24mm Double Glazed) 
All Glass tempered as per ASTM (American Society for Testing and Materials)'),
('562e4aa1-4768-42b3-9137-2b2a28b6013c', 'Supply and installation of 10mm. Thk. frosted glass partition & door with mirror finish stainless steel frame.

Size: 1500mm L x 2100mm HT'),
('5c44a3d1-e4e6-4b2f-b8d6-d9d137094dd9', 'Supply and installation of a new powder-coated aluminum sliding door complete with aluminum frame, sliding panels, clear tempered glass (if applicable), rollers, top and bottom tracks, handles, lockset, weather seals, silicone sealant, fixing accessories, alignment, and testing.

Note: This item includes removal and disposal of the existing aluminum swing door, frame, and associated hardware.

Type: Schuco 54 PD ME Sliding Door (F + S)
Colour: Beige Color (Sample to be approved)
Glass: Climaguard Neutral PN70 DGU (or similar)
Size: 1600mm W x 2800mm H'),
('ce38bada-77b3-49dd-9885-98b9a0d1ad74', 'Supply and installation of access panel, including concealed metal frame, gypsum-faced door with touch-latch opening, proper alignment, fixing to substrate, finishing of joints to match adjacent surfaces, and protection of surrounding finishes. All materials, labor, and consumables included — complete in all respects as per manufacturer’s specifications and approved sample.

Location: Powder Room'),
('ef588a36-db83-4ca8-8f53-c72719653f48', 'Supply and installation of aluminum/wooden door frame for frosted glass main entrance door (1500 mm L × 2200 mm HT), including alignment, leveling, anchoring to wall, sealants, and protection of adjacent finishes

Location: Main Entrance Area'),
('58bec3d4-a70b-46c2-a426-dc1ac61b4882', 'Supply and installation of circular mirror framed with bronze finish metal (M005), including MDF backing, cutting, alignment, fixing, polishing, surface protection during works, and final cleaning — complete in all respects.

Frame Material: Bronze finish metal (M005)
Backing: MDF backing for stability and fixing
Size: 1000 mm dia. × 20 mm D'),
('a23f97d5-0936-4994-ad89-0502a4afa0a8', 'Supply and installation of double-leaf glass shutters with aluminum framing, including hinges, handles, locking hardware, alignment, sealing, and finishing.

Location: Reception Entrance
Size: 2000mm W x 3000mm HT'),
('6a6e0b63-087a-4d4b-b883-af05dc4c06d8', 'Supply and installation of glass door comprising 12mm thick clear toughened glass, complete with 400mm long handle, patch fittings, locking hardware, fixing accessories, silicone sealant, alignment, testing, commissioning.

Mark: D13
Location: 1 Staff Office
Note: As per Doorway Filling Plan'),
('f3b470d9-cf07-4ac0-8450-36888f8cca35', 'Supply and installation of glass window complete with aluminum frame, clear tempered glass, fixing brackets, sealant, accessories, alignment, waterproof sealing, testing.

Location: 1.1 Office
Size: 2.0m L x 2.365m Ht'),
('9b14289c-e120-4917-ae88-f61196500f95', 'Supply and installation of gypsum board cladding to fully cover existing window, including GI framing system, moisture-resistant gypsum boards, fixing, jointing, finishing, and preparation for paint. Includes alignment, edge treatment, and making good of surrounding surfaces

Location: BF - Gym into Music Room'),
('be3e14af-3084-4f44-88a2-0d32ff979196', 'Supply and installation of mirror framed with bronze finish metal (M005), including cutting, alignment, fixing to ceiling as per design, polishing, surface protection during works, and final cleaning — complete in all respects.

Frame Material: Bronze finish metal (M005)
Size: 650mm L x 1710mm HT x 20mm D'),
('e8ac0633-c14b-46ae-b021-9383648e19f3', 'Supply and installation of new beside stairs door complete with door leaf, frame, architraves, hinges, lockset, lever handle, door stopper, fixing accessories, alignment, finishing, and testing.

Item Code: WVG 05 (Supreme Walnut/TIN-IP2136K#, Single#, 60/54mm Thickness#, Standard, Standard)

Door Handle Premium: Door Handle Premium (Silver Key/Key Cylinder)

Hidden Hinges: Less than 250cm

Size: 110cm L x 240cm ht'),
('5d2d28d3-a60b-438b-8ca5-6e3dfc73e2aa', 'Supply and installation of new door complete with door leaf, frame, architraves, hinges, lockset, lever handle, door stopper, fixing accessories, alignment, finishing, and testing.

Item Code: WVG 05 (Supreme Walnut/TIN-IP2136K#, Single#, 60/54mm Thickness#, Standard, Standard)

Door Handle Premium: Door Handle Premium (Silver Key/Key Cylinder)

Hidden Hinges: Less than 250cm

Size: 110cm L x 240cm ht'),
('2738ab06-38b4-467e-867e-7e97580f3c37', 'Supply and installation of new exterior fixed window (10mm), including aluminum/powder-coated frame, glazing, sealing, alignment, testing, and protection of finished surfaces.

Size: 600mm L x 1800mm HT'),
('390b8156-4f7d-4654-b4d9-dc7a7a5703cb', 'Supply and installation of new fixed glass window, including aluminium frame, tempered glass panel, hardware fittings, fixing accessories, sealants, alignment, testing, and commissioning.

Size: 1.00m L x 3.00m ht'),
('11d9317b-da8b-4b3b-a2e9-981277107a16', 'Supply and installation of new fixed window (10mm) including aluminum frame, glazing, fixing accessories, sealant, alignment, waterproof sealing, testing.

Size: 80cm L x 240cm Ht
Location: Bedroom 01
Note: Sizes to be confirmed and price is provisional; final cost depends on actual site measurement.'),
('478895e1-be5f-4ae0-a403-3d09b3352522', 'Supply and installation of new glass swing door (10mm) complete with aluminum frame, tempered safety glass, hinges, handle, lockset, fixing accessories, sealant, alignment, testing, commissioning

Door Size: 88 cm L x 240cm ht

Location: Bedroom 01 balcony
Note: Sizes to be confirmed and Price is provisional; final cost depends on actual site measurement.'),
('da17c2b8-eed3-4389-8033-9fd0840ff1a2', 'Supply and installation of new office/study washroom interior door complete with door leaf, frame, architraves, hinges, lockset, lever handle, door stopper, fixing accessories, alignment, finishing, and testing.

Item Code: WVG 05 (Supreme Walnut/TIN-IP2136K#, Single#, 60/54mm Thickness#, Standard, Standard)

Door Handle Premium: Door Handle Premium (Silver Key/Key Cylinder)

Hidden Hinges: Less than 250cm

Size: 110cm L x 240cm ht'),
('cb948a8a-5b05-4366-981a-8388508b0fb6', 'Supply and installation of new powder room door complete with door leaf, frame, architraves, hinges, lockset, lever handle, door stopper, fixing accessories, alignment, finishing, and testing. 

Item Code: WVG 05 (Supreme Walnut/TIN-IP2136K#, Single#, 60/54mm Thickness#, Standard, Standard)

Door Handle Premium: Door Handle Premium (Silver Key/Key Cylinder)

Hidden Hinges: Less than 250cm

Size: 110cm L x 240cm ht'),
('4dcfb443-c64d-445a-bcad-154124685617', 'Supply and installation of new swing door complete with door leaf, frame, ironmongery, hinges, lockset, fixing accessories, alignment, testing.

Door Size: 95cm L × 240cm H
Location: Master Bedroom W/C
Budgetary Cost for Ironmongaries: 1,000 AED/Nos.'),
('60ba8c03-9910-4b82-8edc-d132b901500d', 'Supply and installation of new swing door complete with door leaf, timber frame, architraves, hinges, lockset, handles, fixing accessories, alignment, adjustment, testing, commissioning

Door Size: 87cm L x 240cm ht
Location: Master Bedroom hallway
Budgetary Cost for Ironmongaries: 1,000 AED/Nos.'),
('724f9403-5ad3-454b-b2b1-ed8a06f942e2', 'Supply and installation of new wooden door, including door leaf, frame, architrave, hinges, lockset, fixing, alignment, finishing, and making good surrounding surfaces

Location: Female Staff Room

Note: Rate based on standard semi-solid wooden door with PU paint finish. Fire-rated or special doors to be priced separately.'),
('105cbfca-4159-4ab5-9ae1-eab3e6f7a471', 'Supply and installation of one new door (800 mm L × 2000 mm H), including frame, hinges, lockset/handle, alignment, leveling, finishing, sealing, and protection of adjacent surfaces.'),
('8700ac48-7e94-4cbe-823d-817f0f8e73a2', 'Supply and installation of residential sectional overhead garage door, including fixing, alignment, and testing.

- Panels: Polyurethane-steel sandwich, 40 mm thickness, middle rib design, white RAL 9016 (outside) and white (inside)
- Standard lift type, short stem rollers
- Motor: Somfy, including push button, 4 remotes, and photocell

Size: 5500mm L x 2500mm Ht
Location: Garage Door
Note: Free maintenance services 1 year warranty'),
('c80939ae-9c7b-4b1e-a5cb-7f7ee313c01d', 'Supply and installation of single-leaf glass shutter with aluminum framing, including hinges, handle, locking hardware, alignment, sealing, and finishing.

Size: 900mm W x 2400mm HT
Location: GF Meeting Room'),
('0477e55a-c28c-4b4d-b359-5aa84ceb025e', 'Supply and installation of sliding wooden door complete with door leaf, frame, architraves, hinges, lockset, handle, fixing accessories, alignment, testing, commissioning.

Door Size: 87cm L x 240cm ht
Location: Bathroom 01
Budgetary Cost for Ironmongaries: 1,000 AED/Nos.'),
('aeff6626-fe06-48ed-a5d5-7fe0116ad9c4', 'Supply and installation of sliding wooden door complete with door leaf, sliding track system, hardware, fixing accessories, alignment, testing.

Door Size: 87cm L x 240cm ht
Location: Master Bathroom
Budgetary Cost for Ironmongaries: 1,000 AED/Nos.'),
('9a48149a-1cef-4a34-a829-dc53cb3697fb', 'Supply and installation of swing wooden door complete with door leaf, timber frame, architraves, hinges, lockset, handles, fixing accessories, alignment, testing, commissioning.

Door Size: 87cm L x 240cm ht
Location: Bathroom 02
Budgetary Cost for Ironmongaries: 1,000 AED/Nos.'),
('4c6bb7d7-daf5-4484-95a4-f4abcf77a987', 'Supply of ironmongeries: 
Concealed hinges: 4 nos (AED 1000) 
Mortice Lock and Cylinder (thumbturn for bathrooms) - AED 100/set 
Door Stopper - AED 25/no. 
Lever Handle - AED 250/pair 
Door Closer - AED 645/set 

NOTE: Subject to final approved specifications from Client.'),
('1c110f4e-6b8a-41d7-a99d-56c6f3cdba3d', 'Supply, fabricate, and install a fixed curtain wall glazing window (10mm) comprising powder-coated aluminum framing system, mullions, transoms (if required), pressure plates, cover caps, tempered safety glass, EPDM gaskets, weather seals, silicone sealants, fixing brackets, and anchors.

Window Size: 0.6m Wide x 2.0m ht'),
('743de722-8401-4dfe-b00f-e0d19d4512d6', 'Supply, fabricate, and install aluminum bi-folding door system comprising powder-coated aluminum frames, top and bottom tracks, rollers, hinges, locking hardware, handles, weather seals, gaskets, and safety glazing panels.

Size: 3.10m L x 2.40m ht
Location: New Storage Room'),
('42668706-d243-4bb4-9839-b1e7a5aace7a', 'Supply, fabricate, and install swing glass door (10mm) complete with tempered safety glass, floor spring, patch fittings, hinges, pull handles, locking system, sealants, fixing accessories, alignment, and testing,

Door Size: 1.02m Wide x 3.0m ht'),
('7a0c383a-72fc-4655-b775-7a36f75eada6', 'Supply, fabrication, and installation of a black matt aluminum patio door system (2.2 mm thick aluminum profile), complete with double-glazed glass comprising 6 mm clear glass + 6 mm Guardian reflective glass, including frame, sash, rollers/hinges, locking system, handles, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 80mm L x 220cm H
Location: Master Bedroom (Patio Door)'),
('8eec26b1-6d64-435f-8120-b11aff95e3aa', 'Supply, fabrication, and installation of a fixed aluminum-framed glass window, complete with black matte aluminum frame, tempered glass, gaskets, silicone sealing, fixing accessories, alignment, leveling, and final cleaning.

Size: 280cm L x 240cm H
Location: Salon'),
('c2f8ff0b-6657-4b93-81ec-3c84f9fadca9', 'Supply, fabrication, and installation of a sliding aluminum window, complete with aluminum frame and sash, glazing, rollers, locking handle, gaskets, sealants, fixing accessories, alignment, leveling, silicone sealing, protection, and final cleaning.

Size: 260cm L x 170cm H
Location: Sejour Enfant'),
('0ba0562d-cd50-4714-bf04-7e4061c8f982', 'Supply, fabrication, and installation of double hinged glass door with wood leaf coated frame, including hinges, handles, lock, sealing, alignment, and finishing.

Size: 113cm L x 220cm H
Location: In between Sejour & Salle A Manger'),
('b3b41dd7-a468-4647-a8b3-25522935457f', 'Supply, fabrication, and installation of double swing wooden door, including door panel, frame, hinges, alignment, testing, and protection of finished surfaces.

Budgetary Cost of Ironmongaries: 1,000 AED each door
Size: 1090mm L x 2200mm HT
Location: Bathroom Area'),
('1744ff24-8917-4e0a-ab1b-c5b039372e84', 'Supply, fabrication, and installation of fixed glass panel with hinged aluminum door, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, and final cleaning.

Size: 430cm L x 230cm H
Location: Salle de Sport'),
('c0517dfd-2bf5-43f7-9d15-11b057e9c3e9', 'Supply, fabrication, and installation of hinged aluminum-framed glass window, including powder-coated aluminum frame, tempered glass, hinges, locking mechanism, gaskets, alignment, sealing, and final cleaning.

Size: 280cm L x 240cm H
Location: Suite Invitee'),
('8c96f8ca-1597-4dc0-881e-22ddcdfcabf9', 'Supply, fabrication, and installation of single swing wooden door, including door panel, frame, hinges, alignment, testing, and protection of finished surfaces.

Budgetary Cost of Ironmongaries: 1,000 AED each door
Size: 1000mm L x 2200mm HT
Location: Extended Room'),
('f242cedb-575a-4ab2-87cc-c4dd9be75876', 'Supply, fabrication, and installation of sliding wooden door, including door panel, tracks, rollers, alignment, testing, and protection of finished surfaces.

Budgetary Cost of Ironmongaries: 1000 AED each door
Size: 1000mm L x 2200mm HT
Location: Bathroom Area'),
('c592e14c-2f0c-4cfb-987a-f8e49b1b614b', 'To Staircase Door: GF Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 1000mm W x 24000mm HT x 200mm J
Location: To Staircase Door'),
('371fb3b0-9445-4ba8-acb5-d278b99e59b1', 'WINDOW WRAPPING:

Supply and installation of window wrapping using high-quality vinyl film, including surface preparation, precise application, and finishing as per approved design.'),
('4b9e693e-7e2a-4e87-9072-c172732c720e', 'Workstation Office Door: Veneered Door - Single Leaf:

Frame: 42mm thick solid red oak wood stained to approved color PU matt finish 30% glossy.
Architrave: 65x18mm solid red oak wood in same finishing with frames.
Door Shutter: 45mm thick Flush Door consisting of 44mm solid core with oak veneer stained to approved color PU matt finish 30% glossy on both faces and solid beech wood lipping. Silicon rubber seal, Stain + Lacquer finished as per approved sample.

Size: 800mm W x 2400mm HT x 210mm J
Location: Workstation Office'),
('b210f0b0-e2c7-4560-aae4-26ca025ae024', 'ELECTRICAL PROVISION:

Supply and installation of electrical provisions required for the logo, including wiring, conduits, junction boxes, switches, and necessary accessories. Works include proper alignment, cutting, fixing, testing, and all labor and materials needed to ensure the logo can be safely and fully powered, as per site requirements and relevant standards.'),
('8e50894c-13d9-4f68-abcf-5358f7bd2f67', 'Installation of client-supplied LED strip lights including fixing/accessories, aluminum profile/channel where required, wiring connection, driver connection, testing, commissioning.'),
('7259d1ac-6416-42d0-bb65-c888889d4434', 'Installation of client-supplied chandelier at double-height entrance area, including all required labor, lifting, scaffolding, safety measures, fabrication and installation of necessary support/bracing to safely carry the chandelier load, electrical connection to existing point, alignment, leveling, and protection of surrounding finishes — complete in all respects.

Location: Entrance Area (Double Height)'),
('dce1f376-c6a5-4f24-91dc-a4793ffb15be', 'Installation of client-supplied chandelier, including all required labor, lifting, electrical connection to existing points, alignment, leveling, testing, and protection of surrounding finishes — complete in all respects.

Location: Other Areas'),
('119971b6-2356-4685-8af3-80a706abc26a', 'Installation of client-supplied pendant light fixtures including wiring connection, ceiling mounting accessories, testing, commissioning.

Type: Standard Pendant Light'),
('c7dbf965-3c18-4781-b05b-d2e16e75d804', 'Installation of client-supplied procedure light including fixing supports/brackets, wiring connection, mounting accessories, alignment, testing, commissioning.'),
('1790b9eb-02c0-43c8-b630-a392ce4f1beb', 'Installation of client-supplied wall-mounted sconce light including fixing accessories, mounting support, wiring connection, alignment, testing, commissioning.'),
('36931980-fff6-4d1c-ad5a-b627cd490aba', 'Installation of electrical plug points (power outlets), including wiring connection, mounting, and testing.'),
('ca918d9d-4e02-438d-8093-dde4389f0d54', 'Installation of recessed downlights / spotlights in the ceiling, including cutting, wiring, fixing, and testing.

Location: Kitchen'),
('268524c8-52ab-49e9-8104-51125e33ac34', 'Installation of recessed downlights, including cutting, wiring, fixing, and testing.

Location: Master Bathroom, Bathroom 02 & Powder Room'),
('2f2a5a6d-c0db-4cab-8b7d-0fd8249f710c', 'Installation of wall-mounted lights supplied by client, including proper fixing, connection to existing electrical wiring, testing and making good sorrounding surfaces.

Location: GF Guest Bathroom & Powder Room'),
('1b4c01ff-05d4-4af0-a66f-4248a3fe6e93', 'SIDE LOGO:

Supply and installation of logo with backlit LED illumination, complete with necessary fixings, wiring, and finishing as per approved design.'),
('1eff7515-c95c-40dd-9aec-49ca44fe767e', 'Supply and installation of 220V socket outlet connected to new electrical circuit including socket unit, wiring, conduits, back box, circuit extension from distribution board (DB), fixing accessories, testing, commissioning.'),
('d5dd9e38-352f-4b36-9439-857ed5bc996f', 'Supply and installation of IP44-rated waterproof socket outlet connected to new electrical circuit including weatherproof socket unit, waterproof enclosure, wiring, conduits, back box, circuit extension from distribution board (DB), fixing accessories, testing, commissioning.'),
('836f6864-567d-4d0c-823c-fcec71f51111', 'Supply and installation of LED Linear Light (Hanging Type) with black body, including suspension mounting with accessories, alignment and leveling, electrical connection to existing point, testing, commissioning, and protection of surrounding finishes.

Colour Temperature: Warm White
Dimensions: 1200mm x 50mm x 60mm'),
('1ea790df-8357-4b52-ae60-7cf9d490eaed', 'Supply and installation of LED recessed downlights, including supply of fittings, drivers, wiring connection to existing point, fixing, testing, and commissioning.

Specification:
- 8W LED recessed downlight
- 3000K (warm white)
- Minimum 800–1000 lumens

Location: Kitchen'),
('0af449c4-4e06-461a-81ae-bc0338b8a724', 'Supply and installation of Merida Ball Modern Chandelier, including supply of all accessories, ceiling mounting with suspension kit, secure fixing of glass shades, alignment and leveling, electrical connection to existing power point, testing, commissioning, and full protection of surrounding finishes.

Emitting Light Shade: Warm White
Shade Type: Clear Glass
Wattage: 140W
Size: 7 Heads – 30 × 250 cm'),
('1dc9ea75-7a2d-4e52-9280-f2679e5ea234', 'Supply and installation of Modern Minimalist Light Luxury Oval Aluminum LED Chandelier, including supply of all accessories, ceiling mounting with suspension kit, alignment and leveling, electrical connection to existing point, testing, commissioning, and protection of finished surfaces.

Material Code: U01173-07-6
Size: 47.24"
Light Color: White Light (6000K)
Color: Black'),
('f34da9da-2ba9-4dd4-a072-1f3591517617', 'Supply and installation of Modern Minimalist Long Frame LED Chandelier, including supply of all accessories, ceiling mounting with suspension kit, alignment and leveling, electrical connection to existing point, testing, commissioning, and protection of surrounding finishes.

Product Code: Z02311-04-2
Size: 47.24"
Color: Black
Voltage: 220–240 V
Light Color: White (5000 K)'),
('d6e4eb07-9d4f-4ff5-932a-b44408b687c8', 'Supply and installation of Nordic Minimalist Column Iron Mini 1-Light Pendant Light, including ceiling mounting with required hardware, alignment and leveling, electrical connection to existing point, testing, commissioning, and protection of finished surfaces.

Color: Black
Voltage: 220-240V
Light Color: Warm Light (3000K)'),
('366b56d0-82f9-46d3-8984-b60f9a946458', 'Supply and installation of OakAura LED Linear Light Pendant Lamp, including ceiling suspension mounting, alignment and leveling, electrical connection to existing power point, testing, and protection of surrounding surfaces.

Color/Finish: Dark Walnut Wood (as per photos)
Material: American Dark Walnut Wood, Aluminum Profile, LED Strips, Acrylic Diffuser
Size: W 8 × H 4.5 × L 160 cm
Bulb/Driver: LED 24 W, 1 W/120 LM, CRI >80, Eagle Rise driver 3000K, non-dimmable'),
('c1d4031c-ad05-4f3c-941a-e3750f31fa72', 'Supply and installation of Vilano Large Arch Floor Lamp, including placement, leveling, electrical connection to existing power point, testing, and protection of surrounding surfaces.

Size: Large (ring diameter 60cm) x 210 x 180 cm'),
('1595382c-26c2-4667-8328-fcbd48458199', 'Supply and installation of Wabi Sabi Style Pendant Lamp, including ceiling mounting with required accessories, alignment and leveling, installation of E27 bulb (if supplied), electrical connection to existing power point, testing, commissioning, and protection of surrounding finishes.

Light Source: E27 Bulb
Material: High-Density Polyethylene & Metal
Weight: 3kg each
Size: 50cm H x 18cm Dia.'),
('e677954b-496e-4a7c-813b-4759884fec12', 'Supply and installation of Wave Glow LED Chandelier, including ceiling suspension mounting, provision of necessary fixing hardware, alignment and leveling, electrical connection to existing point, testing, commissioning, and protection of surrounding finishes.

Color: Black
Size: Medium (1.2m x 1.2m)'),
('289331cd-eca5-4738-9389-8e4e93263f28', 'Supply and installation of a chandelier in the staircase area, including all necessary electrical connections, mounting hardware, and safety checks, complete as per approved design and specifications.

Location: Staircase Area

Note: Rates provided herein are provisional and may vary based on the finalized layout, detailed design, and site conditions.'),
('c0c3edc5-ba68-4e3e-937b-16b0efe24f8c', 'Supply and installation of low-current cable output point for LED lighting system including low-voltage cabling, conduits, connection accessories, transformer/driver provision preparation where required, termination, testing, commissioning.'),
('ca289fab-86bb-4509-ad55-b7137aed6758', 'Supply and installation of pendant lights in Bedroom 02, including all necessary electrical connections, mounting hardware, and safety checks, complete as per approved design and specifications.

Location: Bedroom 02

Note: Rates provided herein are provisional and may vary based on the finalized layout, detailed design, and site conditions.'),
('6b50077a-4337-4655-a6bc-bc21d7ccf734', 'Supply and installation of pre-wired low voltage fire-rated downlight, straight MR16, 5 W, 230–240 V, IP20, including ceiling cut-out, connection to low voltage driver/power supply, fixing, testing, and protection of surrounding surfaces.

Brand/Type: Robus
Product Code: LED/RF101MP-13
Finish: Brushed Chrome'),
('e65e7622-bdd0-487d-b78f-c31a5be6504a', 'Supply and installation of pre-wired low voltage fire-rated downlight, straight MR16, 50 W, 230–240 V, IP20, including ceiling cut-out, connection to low voltage driver/power supply, fixing, testing, and protection of surrounding surfaces.

Brand/Type: Robus
Product Code: LED/RF101MP-13
Finish: Brushed Chrome'),
('2bacedb8-972a-44ba-a276-ef7de9acd72c', 'Supply and installation of rectangular LED light, including ceiling or suspension mounting, alignment and leveling, electrical connection to existing power point, testing, commissioning, and protection of surrounding surfaces.

Size: 48 inch x 93.7 inch x 2.4 inch
LED Width: 2.75 inch
Supply Rate: 1800 AED'),
('ddbe5e28-8d8b-4cda-8602-c926e2e30680', 'Supply and installation of remote-controlled roller blinds with Sonesse motor, including alignment, fixing brackets, tension adjustment, testing of motor operation, and protection of surrounding finishes — complete in all respects as per manufacturer’s specifications and approved sample.

Size: 1500mm L x 1620mm HT
Type: Remote-controlled motorized blinds (Sonesse)
Location: Kitchen Opening

Specifications:
Roman Blind - Woven (ID-25-02-00-000-000)
 • Amazona Woven - 15BWR-BW9262-A, SQM - 2.43, Alpine
 • Somfy Motor - 40MTR-SN3/30RTS, Sonesse 40 Range
 • Sedar Roman Woven Rail System Cassette Motorized - Sonesse 40 - 25-30-00-000-000, Woven Motorized Rail System
 • Somfy Remote - 40MAC-ST405W1, Situo Remote - 1 Channel

Then Programming Charge (ID-28-01-09-000-000)'),
('1ae6718e-2127-4695-aade-8c4edd2abad5', 'Supply of electrical plug points (power outlets), including wall boxes, delivery charges and other accessories

Brand: Schneider, Legrand, Clipsal type'),
('56495008-8acf-49e5-82c4-af714b14feb6', 'Supply of electrical switches, including delivery charges and other accessories

Brand: Schneider, Legrand, Clipsal type'),
('c187e064-e16f-4400-a22d-f2a2972e51ac', 'Supply of recessed downlights / spotlights, including delivery charges and other accessories

Location: Kitchen'),
('d54f2a28-e711-45b4-be7f-7a93c3d8ccc7', 'Supply of recessed downlights, including delivery charges and other accessories

Location: Master Bathroom, Bathroom 02 & Powder Room'),
('71246948-bc93-4d01-ab81-5907dffee42d', 'Supply, installation, testing and commissioning of electrical system and all related accessories as per approved drawings, specifications, and authority standards.

Note: Affected/Damaged Area Only'),
('ad418aba-be03-441a-a228-b08774f0ed29', 'BACK KITCHEN:

Supply and Installation of modular kitchen with porcelain countertop & backsplash. Melamine for shutters, drawer fascia, and other exposed parts. Finger pull and Push to open mechanism. Melamine internals. Tandem box drawers. {3000K} LED strip lights as per design

Appliances/Accesorries/Sanitarywares: not included
Countertop/Backsplash/: 12mm thk Ascale Tivoli White
Shutters/Drawer Fascia/Carcass: 18mm thk Egger or equivalent melamine
Budgetary Cost for Porcelain: 4500Dhs/Slab
Slab Qty Required: 2 Slabs

Size: 2715 + 1680 + 1130 x 3400ht x 670 tall unit
(3685 + 3120) mm x 1600mm ht x 350mm D wall unit,
(3685 + 2025 + 3120)mm W x 1000mm ht x 670mm D base unit'),
('c8116d4d-10e3-4c94-aca6-4b9b4ec81378', 'BATH STORAGE:

Supply and Installation of bathroom storage unit with veneered MDF for exposed parts. Push to open cabinets and melamine for all internal parts

Stone shelf: not included, adjusted to veneer shelf
Shutter/Open shelves: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine'),
('d47a36ed-0b7f-4fec-8bb8-27db3d23c060', 'C1. Entrance Foyer Corridor / Central Void / Lobby
Crown Moulding

supply and installation of 300 mm high crown moulding in GRC or HDF, as per approved drawings and details. The item shall include preparation and submission of samples, detailed shop drawings, fixing, jointing, surface preparation, and paint finish, complete in all respects.'),
('1a55f391-06f2-486c-bf59-9cfa27e6f2be', 'C2. Garage
Crown Moulding

supply and installation of 150 mm high crown moulding in GRC or HDF, as per approved drawings and details. The scope shall include samples, shop drawings, fixing, finishing, and paint application, complete in all respects.'),
('942105e8-1f5d-4e2b-8fe9-b297c5544d11', 'C6. Dinning Room & Buffet Neiche
Crown Moulding

supply and installation of 300 mm high crown moulding in GRC or HDF, measured and paid based on actual quantities executed. The item shall be carried out in accordance with approved drawings and details and shall include preparation and submission of samples, detailed shop drawings, cutting, fixing, jointing, surface preparation, and application of paint finish, complete in all respects.'),
('308cb38d-13dd-416c-9dac-e3c1e5c6938f', 'C7. Lounge, Entertainment Lounge 1 & 2
Crown Moulding

supply and installation of 300 mm high crown moulding in GRC or HDF, measured and paid based on actual quantities executed. The item shall be carried out in accordance with approved drawings and details and shall include preparation and submission of samples, detailed shop drawings, cutting, fixing, jointing, surface preparation, and application of paint finish, complete in all respects.'),
('216400bf-62e2-4efd-a737-3ebf78f95fda', 'C8. Lounge / Library
Crown Moulding

supply and installation of 300 mm high crown moulding in GRC or HDF, measured and paid based on actual quantities executed. The item shall be carried out in accordance with approved drawings and details and shall include preparation and submission of samples, detailed shop drawings, cutting, fixing, jointing, surface preparation, and application of paint finish, complete in all respects.'),
('88405834-ef41-42ab-8310-5973272fadaf', 'C8. Lounge / Library
Wooden Coffered Ceiling – Walnut (Polish Finish)

supply and installation of a wooden coffered ceiling system in walnut wood with approved polish finish, measured and paid based on actual quantities executed. The scope shall include detailed setting-out, framing, panelling, coffer formation, surface preparation, polishing works, and full coordination with MEP services, including lighting, air-conditioning, sprinklers, and other concealed services. The item shall further include preparation and submission of detailed shop drawings and full-scale mock-ups for review and approval by the Architect and Client, complete in all respects.'),
('adf59318-41f0-4097-9b26-4c04af5a0c33', 'C9. Home Office
Crown Moulding

supply and installation of 300 mm high crown moulding in GRC or HDF, measured and paid based on actual quantities executed. The item shall be carried out in accordance with approved drawings and details and shall include preparation and submission of samples, detailed shop drawings, cutting, fixing, jointing, surface preparation, and application of paint finish, complete in all respects.'),
('ccefe812-d24c-450a-94f1-53882e3ea156', 'CLADDING + STORAGE:

Supply and Installation of wall cladding with mix of grooved veneered MDF and mirror. Storage with veneered MDF with decorative grooves as per design for shutters. Push to open mechanism. Melamine for all internal parts.

Tile cladding: by main contractor/others
Cladding/Shutter: grooved MDF in veneer finish
Mirror: 6mm thk belgium grade tinted mirror
Carcass/Internal: 18mm thk Egger or equivalent melamine
Size: 430mm W x 2600mm ht veneer cladding,
 (150 + 150)mm W x 2600mm ht mirror cladding,
 700mm W x 2600mm ht x 225mm D 
storage,'),
('c621b21c-a546-47b8-9835-0f2ee5d58eac', 'CLADDING:

Supply and Installation of cladding in veneered MDF. 

Cladding: 18mm thk MDF in veneer finish
Size: (5885 + 200)mm W x 3400mm ht'),
('20da10d5-f45c-40d7-aadf-fd462941fc9f', 'CLADDING:

Supply and installation of wall cladding with grooved MDF in veneer finish. {3000K} LED strip lights as per design. Provision for sockets and switches.

Sockets/switches: not included
Size: 3725mm W x 1000mm ht x 40mm thk.'),
('165581d0-7724-426e-a67c-552497a7f086', 'CP-01 Carpet (Supplied by SCL)

Installation of Carpet roll including required carpet underlay (Durafit 500), adhesive, cutting, and cleaning.

Location: VIP lounge, Meeting room'),
('3de29161-e2e3-40d4-a0a5-d1f6f10f92a6', 'CP-02 Carpet Tile (Supplied by SCL)

Installation of Carpet tile including required carpet underlay (Durafit 500), adhesive, cutting, and cleaning.

Location: Small meeting rooms, Cash collecting room, Training room'),
('de4bf732-9c2d-4ffe-9cd7-2cba9357e9ce', 'CP-03 Axminster Carpet (Supplied by SCL)

Installation of Axminster carpet, 80% Wool, 20% Nylon, including carpet underlay (Durafit 500), required adhesive, cutting, and cleaning.

Location: Events hall'),
('ceefe008-5f46-468b-8346-c7da16c0d04a', 'Careful demolition and removal of existing floor tiles, including tile adhesive, mortar bedding (where applicable), minor surface preparation, collection of debris, loading, carting away, and disposal to an approved dumping site. 

Note: Works shall include protection of adjacent finishes and services and leaving the floor substrate ready for subsequent flooring works.

Location: First Floor'),
('d0a9c81b-dc2a-43a1-a32c-ec16c7452858', 'Careful dismantling and removal of existing ceiling finishes, including gypsum boards/frames (if any), hangers, fixings, cutting around services, protection of adjacent finishes, loading, carting away, and disposal of debris to approved dumping area

Location: Living/Dining, Family 1, Main Entrance, & Corridor Area'),
('75c389a3-fb96-4558-b1e3-d5d0d805e74a', 'Careful removal of existing glass door and partition (3000 mm L × 2200 mm HT), including detaching, handling, and transporting all materials off-site, while protecting adjacent finishes

Location: Living Area Door going to Loggia'),
('11fa74a6-4a1e-4d20-b788-c0db6f4e34ba', 'Careful removal of existing window, including dismantling of frame and glazing, unscrewing/removal of fixings, handling of glass panels, protection of surrounding finishes, and disposal of removed materials to approved site

Size: 800mm L x 1750mm HT 
Location: Family 2'),
('3a777c89-3bc7-4f66-820d-88ff835744a6', 'Careful removal, relocation, and reinstallation of existing door at Master Bathroom, including frame adjustment, alignment, fixing, hardware reconnection (handles/locks), finishing, and protection of adjacent surfaces

Location: Master Bathroom'),
('5dd2b7c3-e075-45af-bb42-36e78eb47f2e', 'D14. Sons Bedroom
Crown Moulding

supply and installation of 300 mm high crown
moulding in GRC or HDF, as per approved drawings and details. The item shall include preparation and submission of samples, detailed shop drawings, fixing, jointing, surface preparation, and paint finish, complete in all respects.'),
('8ce03d1a-b2ba-4ad6-906a-6facf91129c9', 'D2. Corridor / Cleaner cabinet / Kitchenette
Crown Moulding

supply and installation of 300 mm high crown moulding in GRC or HDF, as per approved drawings and details. The item shall include preparation and submission of samples, detailed shop drawings, fixing, jointing, surface preparation, and paint finish, complete in all respects.'),
('fa66acf4-e43a-475a-9055-dbaef1f0f9aa', 'D4. Master Bedroom
Crown Moulding

supply and installation of 300 mm high crown moulding in GRC or HDF, as per approved drawings and details. The item shall include preparation and submission of samples, detailed shop drawings, fixing, jointing, surface preparation, and paint finish, complete in all respects.'),
('ac18c891-c63e-40fc-8469-e1000e1173e7', 'D5. Master Bed Lounge
Crown Moulding

supply and installation of 300 mm high crown moulding in GRC or HDF, as per approved drawings and details. The item shall include preparation and submission of samples, detailed shop drawings, fixing, jointing, surface preparation, and paint finish, complete in all respects.'),
('411ae2da-a433-4f46-8fbe-abd9e1a4e1f2', 'DESK + DRAWERS + OPEN SHELVES + CLADDING:

Supply and installation of study area joinery to have desk, drawers, open shelves, and cladding. Desk, drawers, and open shelves to have painted MDF for all exposed parts. Drawers with pull handle and Blum soft closing drawer runners. Melamine for all internal parts. {3000K} LED strip lights as per design. Wall cladding in veneered MDF.

Desk/Drawer external/Open Shelves: 18mm thk MDF in P.U. paint finish
Drawer Carcass/Internal: 18mm Egger or equivalent melamine 
Cladding: 18mm thk MDF in veneer finish
Size: 1885mm W x 300mm ht x 600mm D desk,
1575mm W x 200mm ht x 600mm D drawers,
3nos. 975mm W x 100mm thk x 350mm D open shelves,
(1950 + 320)mm W x 2800mm ht cladding'),
('624e5398-7ea5-45c6-80a6-eaf126ac746b', 'DRESSER UNIT + DISPLAY SHELVES:

Supply and Installation of dresser unit with veneered MDF backing and open shelves, curved as per design. Desk with painted MDF, curved as per design. Display shelves in painted MDF. Guard rail in SS finish metal. {3000K} LED strip lights as per design

Backing/Open shelves: curved MDF in veneer finish
Desk: Curved MDF in paint finish
Display shelves: 18mm thk MDF in P.U. paint finish 
Size: 2045mm W x 2800mm ht x 600mm D dresser unit,
 1105mm W x 2800mm ht x 170mm D display 
shelves'),
('a5d9495b-29ca-4d02-98f2-b924c2b63a09', 'FEATURE WALL 1:

Supply and installation of feature wall with veneered MDF panelling and tinted mirror. Veneer to have curves and metal inlay as per design. All to have proper MDF backing. Including access panel for DBs with push to open mechanism

Cladding: Curved MDF in veneer finish
Metal Inlay: 20mm wide metal inlay on grooves
Cladding: 6mm thk tinted mirror
Size: 5500mm W x 7300mm ht x 100mm thk.'),
('0c0af7f0-b5a8-46bd-8bc7-e57e2cc4f779', 'FEATURE WALL 2:

Supply and installation of feature wall with MDF panelling in primer finish top receive wallpaper. MDF to have curves and metal inlay as per design. All to have proper MDF backing. 

Cladding: Curved MDF in primer finish to receive wallapaper
Metal Inlay: 20mm wide metal inlay on grooves
Wallpaper: supplied by client, installation by us
Size: 2185 mm W x 7300mm ht x 100mm thk.'),
('00bffa02-736d-4446-823e-2464056e9cec', 'FLUTED WALL CLADDING:

Supply and installation of wall cladding made of fluted MDF with oak wood veneer finish

Location: Master Bedroom'),
('aeb6ca50-bea7-4304-b438-92149ae1601b', 'FT-02 Porcelain Tile

Supply and installation of Porcelain tile laid in approved pattern including required adhesive, cutting, and cleaning.

Material: RAK ceramic or equivalent 
Finish: 60x60 cm - Paleo White - R10
Location: Sales Gallery and Pre-Function toilets'),
('36df7633-5cb4-4143-bbf7-c8683a488fe4', 'FT-04 Vinyl Tile

Supply and installation of LVT flooring laid in approved pattern including required adhesive, cutting, and cleaning.

Specification: The Floorist or equivalent 
Finish: Wood-look Finish
Location: Sales Hall'),
('1944d77b-da4f-42aa-bd47-5a2b09d6a763', 'FV-01 Vinyl Roll

Supply and installation of Vinyl roll including required adhesive, cutting, and cleaning.

Material: 6.2mm thk Taraflex multi-use - Gerflor
Location: Kids room'),
('e01322e7-0b8b-482e-801f-f3b356221cf3', 'Fabrication, Supply & Installation of Aluminum ''L'' Shape Curtain Wall FIX Window With 2 shutter sliding (1 fix+1 slider) door w/ (Thermal Break) Aluminum Systems.

Glass Specification: -
Vision Glass: 28/32mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 16/20mm M/F Spacer + 6mm Thick HD Grey Glass)
Profiles: Mullion/Transom, Pressure Plate, Cover Cap, Connector, Slider Frame, Track flush, Track divider, track cover, keeper, interlock, shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved color

Item Code: AD-16
Size: 9100mm W x 3500mm Ht
Location: Master Bedroom'),
('70dbdacb-b157-4e5e-b12d-b14a6988eaf0', 'Fabrication, Supply & Installation of Aluminum 2 shutter sliding (1 fix + 1 slider) Door w/ (Thermal Break) Aluminum Systems.

Glass Specification: -
Vision Glass: 32mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 20mm M/F Spacer + 6mm Thick HD Grey Glass)
Profiles: - Slider Frame, Track flush, Track divider, track cover, keeper, interlock, shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved color

Item Code: W12
Size: 4400mm W x 3500mm Ht
Location: Bedroom 02'),
('b56d9a6b-322c-4da4-8586-f4c79d303e3b', 'Fabrication, Supply & Installation of Aluminum 3 shutter sliding (1 fix+2 slider) window w/ (Thermal Break) Aluminum Systems.

Glass Specification: -
Vision Glass: 32mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 20mm M/F Spacer + 6mm Thick HD Grey Glass)
Profiles: Slider Frame, Track flush, Track divider, track cover, keeper, interlock, shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved color

Item Code: AD-04
Size: 6720mm W x 3900mm Ht
Location: Family Living'),
('85529c38-b48f-4b78-92c7-39cca95ac90f', 'Fabrication, Supply & Installation of Aluminum 4 shutter center opening sliding (2 fix+2 slider) Door w/ (Thermal Break) Aluminum Systems.

Glass Specification: -
Vision Glass: 32mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 20mm M/F Spacer + 6mm Thick HD Grey Glass)
Profiles: Slider Frame, Track flush, Track divider, track cover, keeper, interlock, shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved color

Item Code: AD-07
Size: 7250mm W x 3900mm Ht
Location: Gym'),
('dcfb8a2f-eb7d-46bb-9249-60e13d74bf20', 'Fabrication, Supply & Installation of Aluminum Curtain Wall FIX Window With 2 shutter sliding (1 fix+1 slider) window w/ (Thermal Break) Aluminum Systems.

Glass Specification: -
Vision Glass: 28/32mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 16/20mm M/F Spacer + 6mm Thick HD Grey Glass)
Profiles: Mullion/Transom, Pressure Plate, Cover Cap, Connector, Slider Frame, Track flush, Track divider, track cover, keeper, interlock, shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved color

Item Code: W04
Size: 4400mm W x 3900mm Ht
Location: Hallway'),
('8d5f852b-ee49-486d-ba97-4ba8fb9cb4ad', 'Fabrication, Supply & Installation of Aluminum Curtain Wall FIX Window With 4 shutter Center opening sliding (2 fix+2 slider) window w/ (Thermal Break) Aluminum Systems.

Glass Specification: -
Vision Glass: 28/32mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 16/20mm M/F Spacer + 6mm Thick HD Grey Glass)
Profiles: Mullion/Transom, Pressure Plate, Cover Cap, Connector, Slider Frame, Track flush, Track divider, track cover, keeper, interlock, shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved color

Item Code: AD-08
Size: 10900mm W x 3900mm Ht
Location: Family Living'),
('5778ecca-01b5-4381-9cd6-9249b63d124a', 'Fabrication, Supply & Installation of Aluminum Single shutter hinge door w/ (Thermal Break) Aluminum Systems.

Glass Specification: -
Vision Glass: 24mm Thick DGU Glass (6mm Thick HD Grey Tempered Glass + 12mm Air gap + 6mm Thick Clear Tempered Glass)
Profiles: Mullion/Transom, Pressure Plate, Cover Cap, Connector, Outer Frame, Shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved color

Item Code: AD-15
Size: 900mm W x 2400mm Ht
Location: First Floor'),
('bcce3473-a486-4a8b-a14b-e4e5f43ea984', 'Fabrication, Supply & Installation of Aluminum Single shutter hinge door with fix window by Vitro Vizion (Thermal Break) Aluminum Systems.

Glass Specification: -
Vision Glass: 24/28mm Thick DGU Glass (6mm Thick HD Grey Tempered Glass + 12/16mm Air gap + 6mm Thick Clear Tempered Glass).
Profiles: Mullion/Transom, Pressure Plate, Cover Cap, Connector, Outer Frame, Shutter, Glass Support, Gaskets, Silicon Sealant & All Accessories
RAL Color: As per Approved powder coated color

Item Code: AD-17
Size: 2300mm W x 2400mm Ht
Location: Basement Floor'),
('fc50dd8f-27bf-431b-9f8b-6ad2915dd07e', 'Fabrication, Supply & Installation of Aluminum Top Hung Window w/ (Thermal Break) Aluminum Systems.

Glass Specification: -
Vision Glass: 24mm Thick DGU Glass (6mm Thick Clear Tempered Glass + 12mm M/F Spacer + 6mm Thick HD Grey Glass)
Profiles: Mullion/Transom, Pressure Plate, Cover Cap, Connector, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved color

Item Code: W26
Size: 600mm W x 900mm Ht
Location: Driver Room'),
('abe06f6d-2025-4f46-8326-98b39a3c2e49', 'Fabrication, Supply and Installation of Skylight w/ Aluminum Systems.

Glass Specification: -
Vision Glass: 32.52mm Thick DGU Laminated Glass
RAL Color: As per Approved color

Location: Skylight-01
Window Code: SL-01
Size: 600mm W x 3950mm L'),
('700ea403-bec5-4177-89c1-fffb5953afa6', 'Fixing of client-supplied 13 AMP double wall-mounted socket with integrated USB-C ports, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('e2daf8c5-cf7c-487c-bd91-dbace8c310ac', 'Fixing of client-supplied Plumbing round brass angle valve, including alignment, connection to pre-installed piping, securing, and leak testing.

Location: Master Bathroom, Bathroom 1 & 2');
insert into scheduler.rate_fix_stage (id, description) values
('daac61fa-c2e6-4d67-83d0-cb5a553d73ec', 'Fixing of client-supplied WC, including alignment, securing to pre-installed wall bracket/concealed frame, connection to pre-installed plumbing lines, sealing, checking for proper flushing operation, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix (frame, concealed cistern, and plumbing rough-in) to be provided by main contractor.'),
('b532769e-fa78-4ec2-8e3c-7eedecb434e4', 'Fixing of client-supplied floor-mounted electrical floor box, including alignment, faceplate installation, and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('84e67a42-fee6-4f4b-9af9-13a4f07f9d7b', 'Fixing of client-supplied flush plate, including alignment, securing to pre-installed concealed cistern, ensuring proper operation of dual-flush mechanism, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix (cistern installation and concealed plumbing) to be provided by main contractor.'),
('f1ad2460-a23c-473c-9a68-c22528c9a60e', 'Fixing of client-supplied freestanding bathtub, including leveling, alignment, securing to floor, connection to plumbing (drain & overflow), and final inspection.

Location: Master Bathroom'),
('aeaf3c45-1872-4750-9e9e-78bc08996dfa', 'Fixing of client-supplied hand spray, including alignment, connection to pre-installed plumbing lines, securing wall brackets, testing for leaks, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix plumbing (concealed pipes and valves) to be provided by main contractor'),
('55e731e4-d410-427e-8286-300364bb2df4', 'Fixing of client-supplied lighting switch, including connection to pre-installed wiring and faceplate installation.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('297129f3-cfb0-4027-be63-9806a2ced077', 'Fixing of client-supplied mixer, including alignment, connection to pre-installed plumbing lines, securing to sink, countertop, or wall, testing for leaks, and final finishing. 

Location: Master Bathroom
Note: First fix plumbing (supply lines, concealed pipes) to be provided by main contractor.'),
('27557e7d-e938-4980-a739-6df6e860a434', 'Fixing of client-supplied plumbing round washbasin siphon / bottle trap, including connection to pre-installed drain and trap piping, alignment, sealing, and leak testing.

Location: Master Bathroom, Bathroom 1 & 2'),
('0bc2d871-05c9-496d-9d81-916fba7033a7', 'Fixing of client-supplied shower set, including showerhead, hand shower, mixer/valve, wall brackets, connection to pre-installed plumbing lines, alignment, testing for leaks and proper flow, and final finishing.

Location: Master Bathroom
Note: First fix (concealed plumbing and rough-in) to be provided by main contractor.'),
('9f08aa8d-1407-488b-90c5-c27f9888f688', 'Installation of Silver Travertine natural stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-01b
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Powder Room & Family Dining Area'),
('911e396f-9522-4f69-863e-c2ec8722cc89', 'Fixing of client-supplied single switched socket outlet, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing. 

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('988411e4-68ee-440e-a84c-25729740ea07', 'Fixing of client-supplied soft-closing toilet seat cover, including alignment and secure attachment to WC.

Location: Master Bathroom, Bathroom 1 & 2'),
('d53b9db8-c5bf-4291-bbf2-9e451aa5a353', 'Fixing of client-supplied toilet paper holder, including alignment, securing to wall, checking stability, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix (wall preparation, backing/support as required) to be provided by main contractor.'),
('4ce3b2f8-8377-4814-9663-da26be96e4b6', 'Fixing of client-supplied twin switched socket outlet, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('56e6c6f6-7792-45ec-b5d4-de2158f3848c', 'Fixing of client-supplied wall-mounted 5 AMP socket, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('c682fb38-47ca-4535-a9a4-358ffd2194ed', 'Fixing of client-supplied wall-mounted bath mixer with handshower, handshower holder, water outlet, diverter, and rectangular cover plate, including alignment, securing, connection to pre-installed plumbing, and testing.

Location: Master Bathroom, Bathroom 1 & 2'),
('578d8a53-c2fc-42ce-b7a6-e611124d8fb2', 'Fixing of client-supplied wall-mounted concealed bath mixer, including alignment, securing, connection to pre-installed concealed plumbing, and final testing.

Location: Master Bathroom, Bathroom 1 & 2'),
('ac933e0f-1418-4fd7-ba2c-f80b99aaf8c3', 'Fixing of client-supplied wall-mounted multi-purpose outlet, including alignment, faceplate installation, and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('fc83eeab-ed5e-41b0-ba5a-414f9aece19f', 'Fixing of client-supplied wall-mounted multi-purpose outlet, including faceplate installation and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('d884184f-a64d-4972-bf55-79a58c974f6d', 'Fixing of client-supplied wall-mounted shaver socket, including faceplate installation, alignment, connection to pre-installed wiring by main contractor, testing for proper operation, and final finishing.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('437367a2-cd5e-4737-9924-b5337839a706', 'Fixing of client-supplied wall-mounted single switched socket with twin USB outlets, including alignment, faceplate installation, and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('81bfb68a-3eda-461b-af0f-9a0b8c95eb1c', 'Fixing of client-supplied wall-mounted twin switched sockets with double data outlets, including faceplate installation and connection to pre-installed wiring by main contractor.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('68cf6e75-f433-4818-9335-97e649e6d2d9', 'Fixing of client-supplied wash basin, including alignment, securing to countertop, connection to pre-installed plumbing (water supply and drainage), testing for leaks, and final finishing. 

Location: Master Bathroom, Bathroom 1 & 2
Note: First fix plumbing (supply and drainage lines) to be provided by main contractor.'),
('bbd7ace1-10ce-4c66-a55f-926289530e3b', 'Fixing, termination, and final connection of a client-supplied single switched socket outlet, including installation and alignment of faceplate, secure fixing to back box, connection to pre-installed wiring provided by the Main Contractor, functional testing, and making good around the installation.

Note: Main Contractor to carry out first fix and provide wiring, containment, and back boxes. Bolsover to execute second/final fixing only.'),
('c1a04a5a-daf3-423a-ba5a-2e815f396dd5', 'HEADBOARD (OPTION 01):

Supply and installation of head board made of MDF with oak wood veneer finish, details as per drawing, colour as per approved sample

Size: 3650mm L x 2800mm HT
Location: Master Bedroom'),
('6ae0e779-a0de-4782-85a7-5dabd93e33f0', 'HEADBOARD (OPTION 02):

Supply and installation of head board made of MDF with fabric finish and both side oak wood veneer finish, details as per drawing,colour as per approved sample

Size: 3650mm L x 2800mm HT
Location: Master Bedroom'),
('44dcc81e-a348-4c47-b617-f825038d403c', 'HEADBOARD (OPTION 03):

Supply and installation of head board made of MDF center portion marble finish and both side oak wood veneer finish,details as per drawing, colour as per approved sample (Excluding marble work)

Size: 3650mm L x 2800mm HT
Location: Master Bedroom'),
('b426f5e8-55a3-4100-8e55-ecf70423c85c', 'HEADBOARD:

Supply and installation of head board made of MDF with center portion fabric finish and both side flutted and plain oak wood veneer finish, details as per drawing, colour as per approved sample

Size: 4460mm L x 3000mm HT 
Location: Guest Bedroom'),
('b32c4947-ba64-40e2-82e3-7007db10bd64', 'HEADBOARD:

Supply and installation of head board made of MDF with flutted design and both pu paint and oak wood veneer finish, details as per drawing, as per approved sample

Size: 4680mm L x 2750mm HT
Location: Bedroom 02'),
('5c97fc51-59c2-405b-9108-924bf51b6cc6', 'HEADBOARD:

Supply and installation of head board made of MDF with wood veneer finish, center portion marble finish including mirror cladding. details as per drawing,colour as per approved sample (Marble work excluded) 

Size: 4400mm L x 2700mm HT
Location: Master Bedroom'),
('2bd043bc-a26f-47dc-b78a-90bf43ec1b0c', 'ISLAND COUNTER:

Supply and installation of island counter to have drawers and seating. Drawers with linen finish melamine for drawer fascia and side panels. Finger pull and Blum soft closing drawer runners. Melamine for all internal parts. Top drawer internal to be lined with velvet fabric. Countertop to be in tinted glass. 
Metal finish skirting
Seating and backrest to be cushioned. Drawer below as per design with same finished as others.

Drawer Fascia/Side panel/Carcass/Internal: 18mm thk Egger or equivalent melamine
Countertop: 6mm thk tinted glass
Cushion: Upholstered MDF with approve fabric (from our supplier catalog) and high density foam.
Skirting: 100mm wide metal sheet on MDF
Size: 1705mm W x 900mm ht x 650mm D'),
('d088c6fa-900b-49c8-959e-e5d9a41ae59a', 'Installation of Amalgama Herringbone semi-engineered timber flooring, including acclimatization, surface preparation, underlay placement, fixing in herringbone pattern, sanding and UV oil finishing (if required), edge trimming, and final cleaning.

Drawing Code: FF-EW-01
Type: Amalgama Herringbone/Prime
Material Code: HW3021 
Finish: UV Oiled
Location: Bedroom 01 & Bedroom 02'),
('fdb29d3b-7661-4ea2-aa02-086622f417a2', 'Installation of Fiandre Luna Limestone porcelain floor tiles, including cutting, leveling, laying with approved adhesive, alignment of joints, grouting with matching color, cleaning, and protection of finished surface.

Drawing Code: FF-PO-01a
Type: Fiandre - Luna Limestone Porcelain Tile
Size: 1200mm x 1200mm
Finish: Slate Finish
Location: Guest Bathroom'),
('375db95a-158b-4d1c-a3ed-7a46bac325a8', 'Installation of SPC flooring over existing tiles with 3 mm thick self-leveling underlayment, including surface preparation, adhesive, laying in straight pattern, and finishing.

Type: Straight Pattern
Location: First Floor Flooring (excluding bathrooms and balconies)'),
('f5970b30-efdc-49d1-8bd8-427e9b12638d', 'Installation of Silver Travertine natural stone countertop, including surface preparation, cutting/trimming adjustments, fixing with adhesive, alignment, edge finishing, sealing, and final cleaning.

Drawing Code: CN-ST-01b
Type: Silver Natural Travertine Stone
Location: Bathroom 02'),
('0943bc0c-8967-4ebd-b91c-2c387ab41dd3', 'Installation of Travertine natural stone countertop, including surface preparation, cutting/trimming adjustments, fixing with adhesive, alignment, edge finishing, sealing, and final cleaning.

Drawing Code: CN-ST-02a
Type: Natural Travertine Stone
Location: Bathroom 01'),
('3f530e6a-58c0-421e-a58b-140f03afa3e2', 'Installation of a client-supplied chandelier, including fabrication and installation of suitable support structure if required, fixing of chandelier to ceiling, electrical connection to existing point, alignment, leveling, testing, and final cleaning — complete in all respects as per manufacturer’s instructions and site conditions.

Location: Family Living, Dining Area & Powder Room'),
('0ea68a49-4153-481c-9660-bb0d7fc714ef', 'Installation of bathroom floor tiles, including surface preparation, adhesive, laying, grouting, and finishing.

Location: Master Bathroom, Bathroom 02, Powder Room, Guest Bathroom'),
('205a202f-6dfc-417b-998f-f9400d86b22e', 'Installation of client-supplied 5 AMP wall-mounted electrical socket, including alignment, fixing, connection to existing wiring, and second/final fix only.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('9483912d-f0ab-4e44-aa8a-0992d354db44', 'Installation of client-supplied Emperador White marble stone flooring, including surface preparation, leveling, alignment, fixing with approved adhesive/mortar, joint finishing, grouting with matching color, polishing if required, and final cleaning.

Drawing Code: RF-MS-01a
Type: Emperador White Marble
Size: 120cm x 120cm
Finish: Polished Finish
Location: Master Bathroom'),
('3b4b3a45-6c4e-4f58-a603-db5d81add4b5', 'Installation of client-supplied Emperador White marble thresholds, including surface preparation, cutting/adjustment if required, alignment, fixing with approved adhesive/mortar, polishing, joint finishing, and final cleaning.

Drawing Code: TH-MS-01
Type: Emperador White Marble
Size: Cut-to Size
Finish: Polished Finish
Location: 
1. Powder Room = 0.85m L x 0.20m W - (2 Nos)
2. Guest Bathroom = 0.90m L x 0.17m W - (2 Nos)'),
('cf5e84a9-1bea-480c-bb1f-f13bb716dc0c', 'Installation of client-supplied Floor Tiles, including handling, adhesive, levelling, laying, grouting, cleaning & protection

Type: As per proposed plan
Size: As per proposed plan
Location: GF & FF Floorings (excluding garage flooring)
Note: Staircase Flooring to be quoted in separate item'),
('2512d9b4-3157-4bd5-b55c-aab01539fdd9', 'Installation of client-supplied HDMI outlet with wall faceplate, including alignment, fixing, and second/final connection to existing wiring.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('37a09877-3553-40e9-8999-915ae5aa5706', 'Installation of client-supplied bathroom wall tiles to the internal face measuring 0.80m × 2.40m, including surface preparation, tile adhesive application, cutting and fitting, alignment, grouting, joint finishing, edge detailing, and protection of completed works. Works also include preparation and painting to the external surrounding wall area outside the tiled section.'),
('c7f7b10a-0e2b-4f64-897f-1c838a8d6409', 'Installation of client-supplied floor tiles, including setting out, cutting, edge finishing, application of premium cementitious tile adhesive, levelling, alignment, spacers, movement joints where required, grouting, cleaning, and protection.

Code: FL02B
Brand: Kutahya (Client-Supplied)
Size: 60cm x 60cm
Location: Refer to GF flooring finishes layout'),
('e848e088-c00a-4bcf-bf3e-eb0ff478d242', 'Installation of client-supplied marble for countertop and vanity counter finishes, including surface preparation, cutting/trimming adjustments, fixing with adhesive, alignment, edge finishing, sealing, and final cleaning.

Drawing Code: CN-MS-03 & JN-MS-03
Type: White Calacatta marble
Finish: Polished Finish
Location: Powder Room'),
('6d272446-9364-4530-8f87-e1b994906f3d', 'Installation of client-supplied outdoor floor tiles including surface preparation, leveling where required, tile layout setting out, tile adhesive application, cutting and laying of tiles to proper alignment and slope, grouting, joint filling, edge finishing, and protection of finished works.'),
('75c63704-444d-4411-8245-51b5913744aa', 'Installation of client-supplied outdoor wooden flooring, including surface preparation, leveling, fixing with suitable adhesive/fasteners, alignment, joint finishing, cleaning, and protection of finished surfaces.

Location: Terrace Area'),
('e1cf4808-0fd7-42ac-b3f7-5a1abec71a58', 'Installation of client-supplied stone flooring (2 cm thick), including surface preparation, leveling, adhesive fixing, precise setting out, joint grouting, cleaning, and protection of finished surfaces — complete in all respects as per manufacturer’s specifications and approved sample.

Thickness: 2cm stone
Location: Master Bathroom & Shower Flooring'),
('67432714-5134-4551-9b00-94f8e7ab8f40', 'Installation of client-supplied stone skirting (9.5 cm high), including surface preparation, leveling, adhesive fixing, precise setting out, joint grouting with matching color, sealing, cleaning, and protection of finished work — complete in all respects as per approved sample.

Material: Stone skirting
Location: Master Bathroom Skirting Area'),
('e346a342-913e-479a-8565-a9c9cb940a58', 'Installation of client-supplied track lighting system with 2 LED spotlights on a 5.92 m aluminum track, including alignment, mounting, connection to existing wiring, and testing — second/final fix only.

Location: Master Bedroom
Note: First-fix wiring by main contractor.'),
('21073d0e-49f4-4330-9453-26237060cd7d', 'Installation of client-supplied trimless recessed LED spotlight, including marking, fixing of fixture, connection to pre-run wiring, alignment, testing, and making good to surrounding finishes.'),
('23aa6cdc-d0ab-4a6b-8642-ea7cf2579a3d', 'Installation of client-supplied wall light, including fixing, alignment, connection to existing wiring, testing, and cleaning'),
('9741dee0-f92c-4a5d-a068-b1d986d15e09', 'Installation of client-supplied wall-mounted TV point, including alignment, fixing, connection to existing wiring, and second/final fix only.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('fbde518e-e9ec-4580-a119-fbc84be6a062', 'Installation of client-supplied wall-mounted double data outlet, including alignment, fixing, connection to existing wiring, and second/final fix only.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('006bf0ce-a4df-48e8-acf3-1e490a8d628d', 'Installation of client-supplied wall-mounted double switched socket with integrated USB charging ports, including alignment, fixing, connection to existing wiring, and second/final fix only.

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('cce2e153-05c7-4f1c-8057-8bd1d0da3169', 'Installation of client-supplied wall-mounted multi-purpose outlet, including alignment, fixing, connection to existing wiring, and second/final fix only.

Specification:
Drawing Code: 5P
Type: Wall-mounted outlet at 30 cm above finished floor level (AFFL) and above as per site condition
Outlets:
- 2 × Twin Switched Sockets (13A)
- 2 × HDMI Outlets (twin)
- 2 × Data Outlets (double Cat6/Cat6a)

Notes:
- Main contractor to complete first fix electrical wiring.
- Bolsover responsible only for second/final fixing.'),
('13089c08-56e3-4c62-9abe-f9b2d26af253', 'Installation of large-format floor tiles over existing tiles, including surface preparation, adhesive, laying, grouting, and finishing.

Location: Ground Floor Flooring (excluding Bathrooms, Carport & Landscaping)'),
('c65e1ed9-d690-4078-9829-37011f878b6a', 'Installation of light frame, including alignment, fixing, leveling, support structure, and finishing as per approved design.

Location: First Floor Area'),
('bda2a43e-db48-4918-be6b-b9e2085a237e', 'Installation of natural travertine stone flooring, including cutting, surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups as required, and final cleaning.

Drawing Code: FF-ST-02a
Type: Natural Travertine Stone
Location: Bathroom 01 & 02'),
('22f904c3-df3b-4b93-b38b-a7676c3faaf2', 'Installation of natural travertine stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-02a
Type: Natural Travertine Stone
Location: Guest Bathroom'),
('58db9470-8560-402d-8b86-56988128a4ec', 'Installation of raked natural travertine stone wall cladding, including cutting, surface preparation, fixing on suitable adhesive/sub-frame, alignment, joint finishing, and final cleaning.

Drawing Code: WF-ST-02b
Type: Raked Natural Travertine Stone
Location: Bathroom 02'),
('1a1203de-9619-4216-9747-044fefc86a0a', 'Installation of raked natural travertine stone wall cladding, including surface preparation, fixing with approved adhesive/mortar, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-ST-02b
Type: Raked Natural Travertine Stone
Location: Guest Bathroom'),
('75ce360b-5c5d-466d-b2f7-9bb0ca7811de', 'Installation of trimless A/C grill, including preparation of ceiling opening, alignment, fixing, leveling, integration with HVAC duct, finishing, and protection of surrounding surfaces.

Location: First Floor Area'),
('88055bf5-859f-4ff4-82d5-a4f9eaf09c36', 'Installation only of client-supplied pendant light, including fixing of mounting base, electrical connection to existing ceiling point, height adjustment, alignment, testing, and final cleaning.'),
('07df4663-a35c-4aee-8830-7ce7c4c187a5', 'KITCHEN CABINET: 

Supply and installation of kitchen cabinet made of MDF with oak wood veneer finish, details as per drawing, colour as per approved sample, excluding sink & mixer (charges for installing marble for kitchen counter, marble supply by client (excluding back splash)

Size: 3213mmL x 650mmW x 3050mmHT 
Location: Family Dining Area'),
('5e8b8c66-0647-4875-ba21-d3b98b0f55b4', 'L-01 Laminate High Gloss

Supply and installation of laminate high gloss, including all necessary items required for fixing.

Location: VIP lounges, 9 pax meeting room'),
('42a6feb6-0588-41bc-869b-55dc4ef3c3c6', 'LAUNDRY:

Supply and Installation of modular laundry with porcelain countertop & backsplash. Melamine for shutters, drawer fascia, and other exposed parts . Finger pull and Push to open mechanism. Melamine internals. Tandem box drawers. {3000K} LED strip lights as per design

Appliances/Accesorries/Sanitarywares: not included
Countertop/Backsplash/: 12mm thk Ascale Tivoli White
Shutters/Drawer Fascia/Carcass: 18mm thk Egger or equivalent melamine
Budgetary Cost for Porcelain: 4500Dhs/Slab
Slab Qty Required: 1Slab
Size: 2135mm W x 3400mm ht x 640mm D tall unit,
(3085 + 1400)mm W x 1000mm ht x 640mm D base unit,
4785mm W + 1400mm ht open shelves'),
('c8bda989-c583-4f27-8354-676e9152dfcf', 'LVT Skirting

Supply and installation of LVT skirting, including all necessary accessories required.

Considered Height: 100mm
Location: Kids room, AV room, Pantry, Kitchen, Control room, Store room, Equipment room'),
('ae3ee620-5b7f-44e2-af23-bb3429b8c86b', 'MDF Skirting

Supply and installation of MDF skirting in metallic lacquer paint, including all necessary accessories required.

Considered Height: 100mm
Location: VIP lounges, 9 pax meeting room, Training room, Event hall stage.'),
('2a0a3faf-d066-40b5-a3f2-9c19d782a906', 'MIRROR + CLADDING:

Supply and Installation of vanity mirror with MDF backing. {3000K} LED strip back lighting as per design. Cladding in veneered MDF.

Mirror: 6mm thk belgium grade clear mirror
Cladding: 18mm thk MDF in veneer finish

Size: 1775mm W x 2100mm ht mirror,
 500mm W x 2100mm ht cladding'),
('19e5c6f6-6fbb-4973-9403-800a77755a6b', 'MIRROR FRAME:

Supply and installation of 6mm mirror with edge metal trim, electroplated finish

Size: 1740mm L x 1900mm HT 
Location: Master Bathroom'),
('2adb4490-bc86-4ec7-aedb-7b02b4ec3eb6', 'MIRROR FRAME:

Supply and installation of 6mm mirror with frame

Size: 1740mm L x 1900mm HT
Location: Bathroom 02'),
('4a4ceadf-1bdd-45fe-9334-31c980169de9', 'MIRROR WALL:

Supply and Installation of mirror wall cladding with 6mm thk tinted mirror on MDF backing. {3000K} LED strip baccklighting as per design

Size: 1830mm W x 2700mm ht'),
('99d59e06-897a-4b56-b058-e2defe41a397', 'MIRROR:

Supply and installation of vanity mirror in 6mm thk belgium grade mirror with MDF backing

Accessories/Sanitarywares: not included
Size: 1160mm W x 1600mm ht'),
('481af154-d496-4914-8571-bdec4cec09a0', 'MIRROR:

Supply and installation of vanity mirror in 6mm thk belgium grade mirror with metal frame. Provision for wall light, tap, and mixer.

Accessories/Sanitarywares: not included
Size: 1200mm W x 1400mm ht'),
('5127e87b-72ec-4722-b1f0-d5736098a073', 'Marble Threshold

Supply and installation of marble threshold including necessary adhesives as required.

Location: Toilets, Janitor room, Kitchen, Pantry'),
('f7240999-c609-451a-9c67-b5694d05c456', 'Metal Floor Trim

Supply and installation of transition strip including necessary adhesives as required.

Location: Between different floor finishes'),
('12dffa70-75c8-47ac-9a02-70d7ad0f36e9', 'NICHE CLADDING + SHELVES:

Supply and installation of niche cladding with marble, open shelves to have marble on 1pc. And glass for 2pcs. {3000K} LED strip lights on switch control.

Niche Work: by main contractor/others
Cladding/Niche shelf: 20mm thk ----- Natural Marble
Niche shelves: 12mm thk belgium grade glass
Marble: supplied by client, fabrication and installation by us
Size: 250mm W x 2600mm ht x 250mm D Niche'),
('b478186b-2bff-4d8c-b683-3b2496bc99f9', 'NICHE SHELVES:

Supply and Installation of vanity unit with integrated sink in marble. Painted MDF for fascia and side panel. Veneered MDF or drawer fascia. Push to open mechanism. Melamine for all internal parts. 

Countertop: TBC marble
Fascia/Side panel: 18mm thk MDF in P.U. paint finish
Drawer Fascia: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Marble: supplied by client, fabrication and installation by us
Size: 1000mm W x 2800mm ht x 20mm thk.'),
('c7cb79bf-feda-4cb4-8af9-6a83362a7a00', 'NICHE SHELVES:

Supply and installation of niche shelves with 18mm thk metallic finish laminate

Size: 380mm W x 40mm thk. X 380mm D'),
('3d4a1d34-442e-4de8-8c53-47b2eb0c768d', 'NICHE SHELVES:

Supply and installation of niche shelves with glass. 

Stone shelf: not included, adjusted to glass shelf
Niche shelves: 12mm thk belgium grade glass
Size: 300mm W x 12mm thk. X 225mm D'),
('7f01365c-9a7d-4113-9c98-1b71c0c22264', 'NICHE SHELVES:

Supply and installation of wardrobe unit with painted custom cute shutters. Custom painted handle and Blum soft closing hinges. Melamine for all internal parts. Black or SS finish hanger rods. Internal drawers with melamine for all parts, finger pull and Blum soft closing drawer runners. {3000K} LED strip lights on switch control.

Shutter: MDF in P.U. paint finish with custom cutting
Carcass/Internal: 18mm thk Egger or equivalent melamine 
Size: 4485mm W x 2800mm ht x 600mm D'),
('05397eb7-e23f-4a51-af9b-0dc06d74b42c', 'OPEN SHELF AND WALL CLADDING: 

Supply and installation of open shelf made of SS metal shelf and back wall wood veneer finish, colour as per approved sample, details as per drawing

Size: 6970mmL x 3050mm HT
Location: Family Dining Area'),
('f994638e-a812-4b1e-8df1-1ef83861bd03', 'OPEN SHELF:

Supply and Installation of open shelf with mirror for shelf, and veneered MDF for back panel. To have proper metal fixing.

Open shelf: 9mm thk tinted glass
Back panel: 18mm thk MDF in veneer finish
Size: 1120mm W x 325mm ht x 325mm D'),
('27cfd04f-74ce-44ed-b38c-66ae51579ee3', 'Option 1: FT-05 Luxury Vinyl Tile

Supply and installation of LVT flooring laid in approved pattern including required adhesive, cutting, and cleaning.

Specification: The Floorist or equivalent
Location: Events hall stage'),
('9cde9fcc-36a1-443f-910c-eb36c735228a', 'PANTRY UNIT:

Tandem II Depot - Anthracite finish - Kesseboemer
Size: 1200mm W x 1750mm ht'),
('11be1fe4-ebfa-4147-94b6-c73c2a712c6e', 'PANTRY:

Supply and Installation of modular pantry with marble countertop, backsplash, and 2nos. of open shelves. Melamine for shutters, drawer fascia, and other exposed parts . Finger pull and Push to open mechanism. Melamine internals. Tandem box drawers. {3000K} LED strip lights as per design

Appliances/Accesorries/Sanitarywares: not included
Countertop/Backsplash/: Fior de Bosco Natural Marble
Shutters/Drawer Fascia/Carcass: 18mm thk Egger or equivalent melamine
Marble: supplied by client, fabrication and installation by us
Size: (600 + 600)mm W x 2600mm ht x 670mm D tall unit,
 1980mm W x 1000mm ht x 670mm D base unit'),
('8ac9fb09-6a8d-4c92-9c0d-d8bed58f4260', 'PARTITION + DISPLAY SHELVES:

Supply and Installation of partition in decorative glass with metal frame. To be fixed with metal rod on both ceiling and floor. Display shelves in laminate finish for all parts. To be fixed with metal rod 

Unit to not have swivel motion
Display shelves to not have curved design
Partition: 15mm thk decorative glass
Display shelves: 18mm thk MDF in metallic finish laminate
Size: 3440mm W x 3400mm ht x 300mm D'),
('dea1244a-76f2-4e00-b22c-79d7e5b3618f', 'Preparation of subgrade to GF & FF floor areas (excluding garage), including cleaning, removal of debris and loose materials, compaction as required, moisture checking, application of bonding agent/primer where necessary, and making the subgrade ready to receive screed and final floor finishes.

Location: GF & FF Floorings (excluding garage flooring)'),
('c3f335b0-9892-421c-9b8f-5856558ab858', 'Removal and screeding of existing flooring prior to installation of new marble tile, including careful breaking and removal of existing tiles, scraping and removal of adhesive/mortar, surface leveling, cleaning, disposal of debris to approved facility, preparation of substrate, and application of cement–sand screed to required thickness

Location: Entrance Area'),
('05186567-f394-428b-89c3-86370426340b', 'Removal of existing ceilings, including careful dismantling, handling, and disposal of all debris — complete as per approved specifications.

Location: Walk in, Hall & Stair Hall'),
('273d9af2-a2b8-4fb9-bf37-2bd6702fd949', 'Removal of existing wall tiles, including careful dismantling, handling, and disposal of debris — complete as per approved specifications.

Location: FF Shared Bathroom & Master Bathroom Shower Wall Area'),
('c30c5c13-46b0-47b2-a7af-25d9626e3353', 'SHELF:

Fabrication and supply of shelf made of MDF with pu paint finish, back wall made of MDF with wood veneer

Size: 3650mm L x 2800mm HT 
Location: Master Bedroom'),
('15bcbf66-01a3-46e2-aebc-b1bb18225bd4', 'SHOW KITCHEN:

Supply and Installation of modular kitchen with marble countertop, backsplash, frame cladding, island countertop, waterfall legs, and fascia cladding. veneered MDF for shutters, drawer fascia, and other exposed parts.Push to open mechanism. Melamine internals. Tandem box drawers. {3000K} LED strip lights as per design.

Appliances/Accesorries/Sanitarywares: not included
Countertop/Backsplash/Cladding/Island countertop/Waterfall Legs: 20mm thk Calacatta Viola Natural marble
Open hsleves/Shutters/Drawer Fascia: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Marble: supplied by client, fabrication and installation by us

Size: 2250mm W x 3400mm ht x 
670mm D tall unit.
2000mm W x 1000mm ht x 
670mm D base unit,
2250mm W x 3400mm ht 
veneer cladding,
3000mm W x 1100mm ht x 
1290mm D island'),
('2b59f8ee-fc17-44cc-be78-09263c06514e', 'STORAGE + NICHE SHELVES

Supply and Installation of storage with veneer MDF shutters. Push to open mechanism. Melamine for all internal parts. Niche with LED lights and acrylic. Nishe shelves in tinted glass.

Shutters: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Nishe shelves: 6mm thk tinted mirror
Size: 1545mm W x 1400mm ht x 225mm D'),
('1466f98c-37a4-413f-928a-d5cb25617ef8', 'STORAGE OVER WC:

Supply and Installation of storage over water closet with veneered MDF for shutters. Push to open mechanism. Melamine for all internal parts 

Shutters: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Size: 1355mm W x 1800mm ht x 500mm D'),
('f88868ee-7716-4ad7-b8a2-c7e8e3a4d4a3', 'STORAGE:

Supply and Installation of storage above water closet with veneered MDF for shutters and other exposed parts. Push to open mechanism. Melamine for all intternal parts

Drawer Fascia: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Size: 1600mm W x 1400mm ht x 100mm D'),
('893a67d3-88c2-422f-aa2a-b8cdb53f2c5a', 'STORAGE:

Supply and Installation of storage above water closet with veneered MDF shutters, and other exposed parts. Push to open mechanism. Melamine for all internal parts

Shutter/Exposed: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Size: 910mm W x 1600mm ht x 200mm D'),
('16dc142a-8d7e-4577-9980-79b0fdcfd178', 'STORAGE:

Supply and Installation of storage unit with laminate open shelves. 1 open shelf in travertine with 2 metal rod fixing. Backing in curved veneered MDF. {3000K} LED strip lights. Closed cabinet with veneered MDF shutters. Push to open mechanism. Blum soft closing hinges. Melamine for all internal parts

Open shelves: 18mm thk metallic finish laminate
Open shelf: 20mm thk Natural Traverine
Backing: Curved MDF in veneer finish
Shutter/Exposed: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Marble: supplied by client, fabrication and installation by us
Size: 2165mm W x 3000mm ht x 600mm D open shelving,
700mm W x 3000mm ht cladding,
700mm W x 3000mm ht x 600mm D storage'),
('4fdd6cf6-895c-496a-b80c-8edec21c37aa', 'Second fixing (installation) of client-supplied LED strip light for cove lighting in wet areas, including installation into pre-prepared aluminium profile/channel, connection to pre-installed waterproof LED driver and wiring, sealing for moisture protection, alignment, testing, and commissioning, complete as required.

Item Code: LT18
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('ebbdcbf2-3223-4789-b2c7-d0d22b8589d0', 'Second fixing (installation) of client-supplied LED strip light for cove lighting, including mounting of LED strip into pre-prepared profile/channel, connection to pre-installed wiring and driver, alignment, testing, and commissioning, complete as required.

Item Code: LT17
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('b370e2ad-2861-49cc-bc38-94ddcc36be22', 'Second fixing (installation) of client-supplied LED strip light for mirror backlighting, including installation into pre-prepared mirror recess/channel, connection to pre-installed wiring and LED driver, alignment for uniform halo effect, testing, and commissioning, complete as required.

Item Code: LT21
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('2a3a858b-a3c1-4a8f-98c7-dbb9c5152a3a', 'Second fixing (installation) of client-supplied LED strip light for niche lighting applications, including installation into pre-prepared niche/aluminium profile, connection to pre-installed wiring and LED driver, alignment for continuous linear lighting effect, testing, and commissioning, complete as required.

Item Code: LT19
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('4bc6516b-d33b-40dd-b78f-156a14dabc9c', 'Second fixing (installation) of client-supplied indoor directional light, including connection to pre-installed wiring, mounting on ceiling or track (as applicable), aiming/beam direction adjustment, alignment, testing, and commissioning, complete as required.

Item Code: LT27
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('5798b107-ab61-4c2a-92a6-29578be30338', 'Second fixing (installation) of client-supplied magnetic track spotlight system, including insertion of spotlight heads into pre-installed magnetic track, electrical connection verification, positioning, alignment, testing, and commissioning, complete as required.

Item Code: LT11
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('c9348e6f-d255-4a59-9042-534f550ab116', 'Second fixing (installation) of client-supplied pendant lights, including assembly (if required), connection to pre-installed wiring, suspension from ceiling point, height adjustment, alignment, testing, and commissioning, complete as required.

Item Code: LT28
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('18778ffa-efb0-458c-a741-f95edba73138', 'Second fixing (installation) of client-supplied recessed ceiling panel downlight for kitchen area, including connection to pre-installed wiring, fixing into prepared ceiling cut-out, alignment, testing, and commissioning, complete as required.

Item Code: LT09
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('6c6c528c-9d6e-4035-afc6-2aab970e08a7', 'Second fixing (installation) of client-supplied recessed downlight for outdoor use, including connection to pre-installed wiring, fixing into ceiling/soffit cut-out, sealing for weather protection, alignment, testing, and commissioning, complete as required.

Item Code: LT06
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('9d6c1c95-1843-40fe-9601-4a1c8dbfc90d', 'Second fixing (installation) of client-supplied recessed downlight for service areas, including connection to pre-installed wiring, fixing into ceiling cut-out, alignment, testing, and commissioning, complete as required.

Item Code: LT04
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('791dd406-7781-45c5-b02e-78294e65beae', 'Second fixing (installation) of client-supplied recessed downlight suitable for wet areas, including connection to pre-installed wiring, fixing into ceiling cut-out, alignment, testing, and commissioning, complete as required.

Item Code: LT02
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('2f8268af-16e5-408f-8914-15035dbc12ee', 'Second fixing (installation) of client-supplied recessed semi-trimless downlight, including connection to pre-installed wiring, installation into prepared ceiling cut-out, alignment for semi-trimless finish, testing, and commissioning, complete as required.

Item Code: LT01
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('e11e3457-43a0-4546-9b41-10b8b7f65a99', 'Second fixing (installation) of client-supplied recessed technical downlight, including assembly (if required), connection to pre-installed wiring, fixing into ceiling cut-out, alignment, testing, and commissioning, complete as required.

Item Code: LT03
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('bdf45cbc-0b0f-4a7f-b5d4-c27e322c834a', 'Second fixing (installation) of client-supplied surface-mounted downlight for indoor areas, including connection to pre-installed wiring, surface fixing on ceiling, alignment, testing, and commissioning, complete as required.

Item Code: LT07
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('c6b3897e-8aeb-45bc-9df3-3445128f0711', 'Second fixing (installation) of client-supplied surface-mounted downlight for outdoor use, including connection to pre-installed wiring, surface mounting on external wall/soffit, weatherproof sealing, alignment, testing, and commissioning, complete as required.

Item Code: LT08
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('22b561df-4cc2-4bd7-a19a-1613b928dc7b', 'Second fixing (installation) of client-supplied surface-mounted wall light for outdoor use, including termination to pre-installed wiring, mounting on wall surface, sealing for weather protection, alignment, testing, and commissioning, complete as required.

Item Code: LT12
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('be4577f2-9132-4d41-b262-0544cf1e5e22', 'Second fixing (installation) of client-supplied suspended decorative light, including assembly (if required), connection to pre-installed wiring, height adjustment, alignment, testing, and commissioning, complete as required.

Item Code: LT10
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('8353a13b-e636-4a99-9b17-70fb4c7d55dc', 'Supply & fixed installation of Aluminium-based decorative laminate, Brushed Bronze Polished, including cutting, shaping, alignment, fixing to substrate, polishing, surface protection during works, and final cleaning — complete in all respects.

Drawing Code: M005
Material: Aluminium-based decorative laminate Brushed
Finish: Brushed Bronze (Polished)
Size: 1.0mm thk.'),
('992fa7bd-c920-4a4b-a80c-997102bc7284', 'Supply and Installation of 10mm thk. Clear glass partition & door with electroplated frame

Size: 1700mm W x 2600mm H
Location: Guest Bathroom'),
('5b161d6d-e4cb-44cd-b78d-238cf36509dc', 'Supply and Installation of 12mm thk. Clear glass partition & doors with electroplated frame

Size: 4180mm W x 2800mm H
Location: Master Bathroom'),
('75f4ccaa-07d3-42e2-8c15-2b849274b80a', 'Supply and Installation of 12mm. Thk. Clear glass partition & door with electroplated frame

Size: 2200mm W x 2720mm H
Location: Bedroom 02 Bathroom'),
('ec9f3eac-4fb9-4151-8304-55dfb06a7e40', 'Supply and Installation of 6mm thk. Clear mirror (refer to design)

Size: 2160mm W x 2800mm W
Location: Master Dresser'),
('5b22c929-1ed1-410f-b232-df90a8f29246', 'Supply and Installation of 6mm thk. Clear mirror with backlight (refer to design)

Size: 1460mm W x 2800mm H
Location: Master Dresser'),
('c76f99f1-cc20-41d6-8a4b-ffbfc6dc3f01', 'Supply and Installation of Floor Tiles, including supply of approved tiles, adhesive, grout, surface preparation, leveling, cutting, joint filling, and finishing. All works to include labor, tools, protection, and site cleanup.

Location: Lobby & Entry Area'),
('19d2af84-ab4f-4b3e-a400-8e9adc3741e7', 'Supply and Installation of Outdoor CCTV Camera, including mounting brackets, connection to existing or new cabling, power supply, configuration, testing, and commissioning. Complete in all respects.

Location: Outdoor Area'),
('e794b602-eb4c-4c71-86b7-a8300e37efb1', 'Supply and Installation of SPC flooring on staircase rise and tread, including surface preparation, cutting, fitting, stair nosing, and finishing, complete in all respects.

Location: Staircase Rise & Run'),
('b5fe9d1a-5fc3-4b5b-9a0f-543e7d3433d2', 'Supply and Installation of custom sun-ray pattern mirror over kitchen door as per approved design, including cutting, edging, fixing, alignment, and final cleaning. Complete in all respects.

Location: Kitchen Area'),
('54cb6938-d826-4cb7-972b-800d527293a4', 'Supply and Installation of mosaic floor and wall tiles over existing tile surfaces, including thorough surface preparation (cleaning, roughening, and priming if required), application of approved tile adhesive, precise setting out, cutting around edges, fixtures and openings, grouting with matching color, sealing if required, cleaning, and protection of finished surfaces. All necessary labor, tools, and consumables to be provided — complete in all respects as per manufacturer’s specifications and approved sample.

Tile Brand/Type: Mosaic Tiles (as per approved sample)
Application: Floor and Wall installation over existing tiles
Tile Size: 2.5 x 2.5
Location: Bathroom 01 & Master Bathroom (entire floor & shower wall area)'),
('59c202a5-8250-46db-8582-19b35a37bccd', 'Supply and Installation of porcelain wall tiles over existing tile surfaces, including thorough surface preparation, application of approved tile adhesive, precise setting out, cutting around edges, fixtures and openings, grouting with matching color, sealing if required, cleaning, and protection of finished surfaces. 

Location: Guest Washroom Shower wall area
Tiles PC Rate: 150 AED/sqm'),
('32d08a0d-392b-4ce8-a36a-ff4cc872bfa6', 'Supply and application of Greige paint (NCS-S-1002-Y50R, Semi-glossy finish) on wall surfaces, including surface preparation (cleaning, sanding, patching, priming), two coats of approved paint, touch-ups, and final cleaning.

Drawing Code: WF-PT-03
Type: NCS-S-1002-Y50R (Greige Paint Finish)
Finish: Semi-glossy finish
Location: Bedroom 02 & Bedroom 01'),
('e6c2de6e-5d87-4813-8612-461bea26d9ca', 'Supply and application of a complete waterproofing system to all wet areas, including initial waterproofing prior to screeding and final waterproofing after screeding, applied to floor surfaces and vertical wall upturns to a height of 300mm above finished floor level, complete with surface preparation, primers, waterproofing membrane/coating, treatment of corners, joints, pipe penetrations, protection of completed works, and pond testing.

Location: pantry area as per new flooring layout'),
('f67736e3-4384-4d9a-821d-e46b639b6f50', 'Supply and application of ceiling paint on gypsum board ceiling (one coat primer, two coat stucco, two coat fenomastic white)

Note: 
1. additional 1.20m L return at staircase'),
('fbe19ce3-58d3-4238-bd22-669890dafbd1', 'Supply and application of ceiling paint, including one coat of primer, two coats of stucco putty, and two coats of Fenomastic paint, with surface preparation, sanding, masking/protection of adjacent finishes, and final cleaning.

Location: Living/Dining, Family 1, Main Entrance, & Corridor Area'),
('3887f47f-a2c5-40b1-b5ad-a788a1337a54', 'Supply and application of ceiling paint, including surface preparation, priming, and two coats of approved paint — complete as per specifications.

Location: Entire Area'),
('b5164bce-7a97-4bcc-9900-5b31d19b54ec', 'Supply and application of cementitious floor screed to receive new floor finishes, including surface preparation, level marking, mixing, laying, compaction, finishing, curing, and all associated works required to achieve a smooth, level substrate ready for installation of floor tiles or other finishes.

Location: New Flooring works only as per flooring plan'),
('bc40fa35-a3ff-49d8-a973-ee017af0c322', 'Supply and application of cementitious waterproofing to bathroom flooring and wall upstands up to 300 mm height, including surface preparation, reinforcement at corners and penetrations, minimum two coats, 24–48 hour pond testing, touch-ups, and final cleaning.

Location: Master Bathroom'),
('508db11b-66cd-41ab-bcfd-c2616cbf1fec', 'Supply and application of cementitious/brush-applied waterproofing system to floor areas and wall up to 300mm height, including surface preparation, priming, application of waterproofing membrane in multiple coats as per manufacturer specification, reinforcement at corners/joints where required, and conducting pond/water flooding test.

Location: Wet Areas Only'),
('a11bd7d4-fa16-487f-9526-97fd22f465ef', 'Supply and application of cement–sand screed to floor surfaces to achieve a smooth, level, and even base suitable for final floor finishes, including materials, mixing, laying, leveling, curing, cleaning, and protection.

Location: Master Bathroom'),
('a5766fab-945d-4251-a21a-a87a35ad5e9e', 'Supply and application of champagne metallic textured paint on wall surfaces, including surface preparation, two coats of approved paint, touch-ups, and final cleaning.

Drawing Code: WF-PT-05
Type: Champagne finish metallic textured paint
Location: Main Entrance Area & Family Living Area'),
('5cc1f4fb-49d2-4d0a-8d6a-21c762aedfc1', 'Supply and application of epoxy self leveling up to 3mm thickness.

Warranty: 1 year
Location: GF - Garage'),
('cc17964e-f4e4-405a-93b2-bc811c8ea78e', 'Supply and application of ivory textured paint on wall surfaces, including surface preparation (cleaning, sanding, patching, and priming), application of two coats of approved textured paint, finishing to achieve uniform texture and color, touch-ups, and final cleaning.

Drawing Code: WF-PT-07
Type: Ivory textured paint
Location: Corridor Area'),
('f03681eb-f9f3-4e33-baee-2b6ff12b79b9', 'Supply and application of microcement wall finish, including surface preparation, base coat, top coat, and finishing — complete as per approved specifications.

Location: Master Bathroom & FF Shared Bathroom'),
('a4c38d3a-67a7-4e71-91e7-82c7356ce226', 'Supply and application of paint on newly installed gypsum board ceiling, including surface preparation, filling of joints and minor defects, sanding, priming, two coats of finish paint, masking/protection of adjacent surfaces, and cleaning of completed work.

Location: Dining Area'),
('a7c89ac2-31f1-470d-9351-144351115aae', 'Supply and application of stucco paint, including surface preparation, priming, and two coats of approved stucco finish — complete as per approved specifications.

Location: Balcony'),
('48b4349e-e744-4b9a-b341-eb88f9049612', 'Supply and application of wall paint, including one coat primer, two coats of putty/stucco (if required), and two coats of final paint, with surface preparation, sanding, masking/protection of adjacent finishes, and final cleaning

Location: Entire First Floor Walls excluding bathrooms'),
('1afbee41-270a-4038-8992-e3bb2f7bbdba', 'Supply and application of wall paint, including one coat primer, two coats stucco, and two coats matte white finish, surface preparation, patching of minor defects, sanding, masking/protection of adjacent surfaces, and cleaning of completed work

Location: Master Bedroom, Bedroom 02, Bedroom 03 & Family 2'),
('201d281d-677a-4c9f-808f-019a816a329c', 'Supply and application of wall paint, including surface preparation, priming, and two coats of approved paint — complete as per approved specifications.

Location: Entire Ground Floor Area except Bathrooms'),
('4bf1be23-b981-4843-acb5-a51e03bbdd48', 'Supply and application of washable/hygienic paint over existing bathroom wall tiles, including surface preparation (cleaning and degreasing), sealing of grout joints to level the surface, application of primer coat, and two coats of washable/hygienic paint using brush/roller. 

Location: Powder Room Entire Walls'),
('0dcd276c-ee19-490e-82f5-3590c641a000', 'Supply and application of waterproofing membrane on flooring and wall surfaces up to 300 mm height, including surface preparation, application of primer, two coats of waterproofing material, sealing of joints, and pond testing to ensure watertightness — complete as per approved specifications.

Location: Master Bathroom & FF Shared Bathroom'),
('2639e4f9-72c7-4039-a073-8d85affd949c', 'Supply and application of white epoxy floor coating system to prepared floor surfaces, including surface preparation, grinding and cleaning, crack and minor surface defect repairs, primer application, epoxy coating application, finishing coats, curing, and protection of completed works.

Code: FL04
Location: Refer to GF flooring finishes layout'),
('6eaa0781-c87f-4136-85f9-f23def3e3672', 'Supply and apply epoxy flooring all necessary fixing accessories all in accordance with the drawings and specifications

Location: Garage'),
('af6e8257-cd8d-45d7-ba0a-a5d10ab59a1d', 'Supply and apply of paint on the ceiling. (One coat primer, two coat stucco, two coat Rich mat white)'),
('27b232f1-6e43-4ce7-9fb5-ce2cf54a8454', 'Supply and construction of a reinforced concrete platform for the staircase structure, including formwork, reinforcement steel (as required by the approved structural drawings), Grade C30/37 ready-mix concrete, concrete placing, vibration, levelling, finishing, curing, edge formation, stripping of formwork, and all labour, materials, plant, equipment, and accessories necessary to complete the works. 

The item shall also include the supply, fabrication, cutting, delivery, and installation of Dekton floor finish, including premium tile adhesive, cutting, edge finishing, jointing, levelling, grouting, cleaning, and protection, in accordance with the manufacturer''s recommendations and approved shop drawings.

Platform Height: 175mm
Floor Finish: Dekton – Cosentino (or approved equivalent)
Supply PC Rate (Dekton): AED 400.00/m² (subject to change based on the final approved size, thickness, finish, brand, and country of origin).
Location: Staircase Area

Note: The above supply rate is a Prime Cost (PC) allowance and is subject to change based on the final approved tile size, thickness, finish, brand, and country of origin.'),
('e9deaa12-8d25-465d-8ccb-db9721c35999', 'Supply and construction of interior walls using lightweight blockwork (10 mm thickness), including supply of blocks, mortar, alignment, leveling, curing, and protection of completed surfaces

Size: 915mm L x 3300mm HT
Location: Master Bathroom'),
('22e6246a-2d63-4f85-87e9-30c5b3573810', 'Supply and construction of masonry parapet wall on roof perimeter, including blockwork construction, cement-sand mortar, alignment, curing, and finishing. Works shall also include plastering on both internal and external faces of parapet wall, surface preparation, and corner finishing.

Location: Entire Roof Top'),
('946d9f38-1323-4c12-89a4-72c97e8e8ecf', 'Supply and fix Ceramic wall tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

PC Supply Rate: AED 360 / m²'),
('9bdf70db-8325-4cc2-99a8-6774cd648110', 'Supply and fix Marble Tread and riser (Supply P.C. Rate AED 480/m), including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

PC Supply Rate: AED 480 / LM'),
('ee18d076-05eb-48b1-ac23-39e46aaf8337', 'Supply and fix Non Slip Ceramic tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications

Location: Bathrooms and Balcony
PC Supply Rate: AED 360 / m²'),
('daf3bd5a-44e4-4699-ac65-fd87c2d20d32', 'Supply and fix cut to size Marble tiles, including grouting, protection, and all necessary fixing accessories all in accordance with the drawings and specifications.

Location: Main Entrance
PC Supply Rate: AED 480 / m²'),
('bba964f3-0d29-4af0-8486-af9418ba31f6', 'Supply and fix skirting tile/threshold including setting material, grout and all necessary fixing accessories all in accordance with the drawings and specifications.

Ceramic Skirting (Supply P.C. Rate AED 28/Lm)'),
('ff140cc3-cdfd-45f4-9f74-85c65b5bc4ef', 'Supply and fixed installation of Bronze Metal Skirting, including precision cutting, adhesive or mechanical fixing as required, leveling, alignment, polishing, protection during works, and final cleaning — complete in all respects.

Drawing Code: FL004
Material: Aluminium Brushed
Finish: Polished
Height: 175mm
Thickness: 1.0mm'),
('f3dc327e-2329-4fb4-bf68-7600ac663cad', 'Supply and fixed installation of Green Carpet for Gym Flooring, including surface preparation, alignment, cutting, joining, edge finishing, cleaning, and final handover — complete in all respects.

Drawing Code: FL009
Type: Burmatex - Made in UK
Collection: Universal Fibers® Thrive® matter carbon 
Dimensions: 50cm x 50cm
Total Weight: 4024 gsm
Total Thickness: 7.0mm'),
('34101af2-55ba-4561-94c9-716548216efd', 'Supply and fixed installation of Green Marble Effect Ceramic Tile. Works to include surface preparation, approved adhesive bedding, precise setting out, mechanical cutting for openings, 3 mm joint spacing, polymer-modified grouting, matching skirting, perimeter/movement joints where required, surface cleaning, protection, and handover — complete in all respects.

Drawing Code: FL003
Type: Equivalent as per 3D Design
Supplier: Local Market'),
('cbc9aee8-bb8a-46dd-be56-e01eb4c371d4', 'Supply and fixed installation of Green Marble Effect Ceramic Tiles, including approved waterproofing membrane application, surface preparation, adhesive bedding, precise setting out, mechanical cutting for openings, 3 mm joint spacing, polymer-modified grouting, matching skirting, perimeter/movement joints as required, surface cleaning, protection, and final handover — complete in all respects

Drawing Code: FL003'),
('b7a6bec7-b678-4605-8a37-f192eb5f3fe6', 'Supply and fixed installation of Grey Marble Effect Ceramic Tile, including approved waterproofing membrane application, surface preparation, adhesive bedding, precise setting out, mechanical cutting for openings, 3 mm joint spacing, polymer-modified grouting, matching skirting, perimeter/movement joints as required, surface cleaning, protection, and final handover — complete in all respects

Drawing Code: FL008
Type: Equivalent as per 3D Design
Supplier: Local Market'),
('836e9cd4-32f1-43d1-86a0-5fee93e60f9a', 'Supply and fixed installation of Terrazzo White Tile for the waterfall feature wall, including surface preparation, adhesive bedding, precise setting, cutting for openings, matching joints, grouting, cleaning, protection during works, and final handover — complete in all respects.

Drawing Code: M010
Type: Equivalent as per 3D Design
Supplier: Local Market'),
('0b32d411-fc2e-4b8a-af38-759e2443c79c', 'Supply and fixed installation of beige carpet for Gym Flooring, including surface preparation, alignment, cutting, joining, edge finishing, cleaning, protection, and final handover — complete in all respects.

Drawing Code: FL010
Type: Carpet Tile (Nebulous - 2)
Yarn: 100% Universal Nylon 66 & Nylon 6
Pile Weight: 746 gsm
Pile Height: 4.0mm - 8.5mm ( +/- 0.5 mm )'),
('00c0826a-73ad-4c16-b8e1-a68782b68e4e', 'Supply and fixed installation of bronze metal skirting (upper and lower of walls), including precision cutting, alignment, fixing, polishing, edge finishing, surface protection during works, and final cleaning — complete in all respects.

Drawing Code: M005
Material: Aluminium-based decorative laminate Brushed
Finish: Brushed Bronze (Polished)
Height:100mm
Thickness: 1.00mm'),
('881480e8-da8e-412d-9ec9-b6222b63a928', 'Supply and fixed installation of bronze metal skirting. Includes precision cutting, adhesive bedding or mechanical fixing as required, leveling, alignment, polishing, protection during works, and final cleaning — complete in all respects.

Drawing Code: M005
Material: Aluminium-based decorative laminate Brushed
Finish: Brushed Bronze (Polished)
Thickness: 1.0mm
Height: 100mm'),
('ce57307e-1a83-4d1a-b2e4-76273fcfa3ba', 'Supply and fixed installation of metal cladding for wall, including measuring, cutting, alignment, mechanical fixing or adhesive as per manufacturer’s instructions, finishing, cleaning, and protection of surfaces.

Drawing Code: WF-MT-01a
Type: 304 1mm with Electro Plating Bronze Finished
Location: Powder Room');
insert into scheduler.rate_fix_stage (id, description) values
('b6554b88-3e9c-4247-8ebd-1dbda836793a', 'Supply and installation of 20 mm electro plating bronze finished metal skirting along wall perimeters, including cutting, edge treatment, fixing with adhesive and/or mechanical fasteners, alignment, joint finishing, and final cleaning.

Drawing Code: SK-MT-01b
Type: 304 1mm with Electro Plating Bronze Finished
Location: Family Dining Area'),
('a835384d-d28e-4c12-a43d-8bca22fef59a', 'Supply and installation of 60x60cm 9mm regular
gypsum ceiling tile with T24 grid suspension'),
('1f691a86-af22-47f6-b3db-c82520cc019a', 'Supply and installation of Chelsea Fusion Diamond Mirror – Bronze Tint, including site measurement verification, cutting to size, polishing of edges, provision of backing support as required, adhesive fixing/system fixing, alignment, leveling, joint treatment, and final cleaning.

Drawing Code: MIR-01
Brand/Type: Chelsea Fusion Diamond Mirror - Bronze Tint 
Size: 2000mm W x 7000mm H
Location: Main Entrance'),
('25a74dc1-a037-4a60-8c20-f196a06649f8', 'Supply and installation of Electroplating Bronze Finished Metal for wall, including cutting to size, alignment, fixing with adhesive and/or mechanical fasteners, edge finishing, and final cleaning.

Drawing Code: WF-MT-01a
Type: SS 304 1mm Electroplating Bronze Finished
Location: Master Bedroom'),
('e39fff3d-2f25-415c-a27b-7128679e3dec', 'Supply and installation of Electroplating bronze finished metal transition strips, including cutting, fitting, alignment, and finishing.

Drawing Code: WF-MT-01a
Type: 304 1mm with Electro Plating Bronze Finished
Location: Guest Bedroom, Family Living (Glass Partition) & Main Entrance (Mirror Wall)'),
('df4be07b-a365-4ce6-92c8-bfdc0dd8194e', 'Supply and installation of LVT flooring over existing tiles, including supply and application of self-levelling compound (3 mm) to receive finish floor, surface preparation, adhesive, cutting, laying, finishing, and protection.

Thickness: 2.5mm thick
Location: Living/Dining & TV Room Area
Note: Any additional thickness due to site conditions to be treated as variation.'),
('3ad27c9f-44de-4fb4-9586-bd3fe9d68ab1', 'Supply and installation of LVT flooring, including provision and application of 4–5mm self-levelling compound over existing flooring, supply and installation of M2 LVT Wood Finish in Straight Plank style (Size: 177.8mm × 1219.2mm × 2.5mm thick; Color: TBC), complete with surface preparation, alignment, cutting, fixing, and finishing.

Note: Final self-levelling thickness to be confirmed based on site condition; any additional thickness will be treated as a variation.

Location: Reception Area, Employees Workstation, Workstation Office, Meeting Area, Pantry/Break Room, GF Hallway, GM''s Office, Secretary Room, Operations Room, Logistics Room, Finance Room, Meeting Room, FF Hallway'),
('8ab3cc38-3668-461a-9823-ce5f3a1d8cf2', 'Supply and installation of Laminated Metal Mesh Glass Partition, consisting of multiple panels at 485mm width each, including site measurement verification, fabrication of laminated metal-mesh glass panels, edge polishing, provision of all fixing accessories, brackets, channels, alignment, leveling, and secure installation.

Drawing Code: PR-GL-03
Brand/Type: Laminated metal mesh glass
Panel Configuration:
- Each panel approx. 485 mm (L)
- Panels spaced at equal distance
- Panels operable/opening at 40° angle
Location: Main Entrance'),
('16253538-5530-4f30-aad6-a41d9a509731', 'Supply and installation of MDF framing system to support 2mm thick mirror wall and travertine stone wall, including fabrication, fixing, alignment, leveling, and finishing.

Location: Entrance Area (Diamond Mirror)'),
('9951176f-3ffe-46ca-bdb9-d7216f5c96eb', 'Supply and installation of Tiles, including surface preparation, application of approved tile adhesive, precise setting out, leveling, cutting around edges and openings, grouting with matching color, cleaning, and protection of finished surfaces. All necessary materials, labor, tools, and consumables to be provided — complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Type: BagnoDesign – Sartoria (Tbrick Aquamarine)
Size: 5.2cm x 16cm x 10mm thickness
Material Cost: 300 AED/sqm
Location: 2 Units in Living Room & New Kitchen Counter'),
('82db042a-11a6-476c-b4cd-79f699a5a842', 'Supply and installation of Timber Veneer Oak 13.024 wall cladding with matt finish, including cutting, edge treatment, fixing on suitable sub-frame or adhesive backing, alignment, joint finishing, polishing/touch-ups, and final cleaning.

Drawing Code: WF-VE-01a
Type: Timber Veneer Oak 13.024
Finish: Matt Finish
Location: Corridor'),
('cd4f705e-600d-4349-8c61-13f936991bc0', 'Supply and installation of White Terrazzo Flooring, including surface preparation, leveling, adhesive application, precise setting out, cutting around edges and fixtures, grouting with matching color, polishing/sealing if required, protection of adjacent finishes, and final cleaning. Complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Type: Arabuild - White Terrazzo
Size: 120cm x 120cm
Finish: Matte 
Location: Entire Floor Area excluding Master Bathroom'),
('f573b851-d5ce-4d5e-9c77-a703111eadbe', 'Supply and installation of a round carpet, 2000mm diameter, in beige and black color scheme, featuring faded black stripes and flecks on a beige base. Material to be polyester with a soft matte feel, high pile, and rich 10mm pile height. Works include site measurement, edge binding, placement, trimming, and final cleaning.

Brand/Type: Regal Ombre Luxe Area Carpet
Product ID: Zen Ashton Round
Location: Reception Area'),
('037ee99e-c247-449f-be04-35d75090401f', 'Supply and installation of access panel, including cutting/opening in ceiling, fixing of frame, installation of panel door with hinges or locking mechanism, alignment, leveling, finishing, and protection of surrounding surfaces.

Location: Master Bathroom, Bathroom 02 & 03'),
('e3906be3-160b-477c-a0b6-bf3d2d190fa9', 'Supply and installation of angle valve with flexible hose, including connection to water supply, alignment, testing, and protection of surrounding finishes

Brand: Local Market
Location: Master Bathroom, Bathroom 02 & 03'),
('4a36a854-bb44-4471-81d2-85d92d984123', 'Supply and installation of bidet/hand spray, including wall or floor fixing, connection to cold water supply, alignment, sealing, testing, and protection of surrounding finishes.

Brand: Local Market
Location: Master Bathroom, Bathroom 02 & 03'),
('bc1a369a-5ee8-4777-916f-d7c9aa2991af', 'Supply and installation of bottle trap, including connection to wash basin drain, alignment, sealing, testing for proper drainage, and protection of surrounding finishes

Brand: Local Market
Location: Master Bathroom, Bathroom 02 & 03'),
('73d47b77-2b4a-40a0-bc4a-7435a6272794', 'Supply and installation of cement-sand floor screeding with varying thickness from 50mm to 150mm, including surface preparation, cleaning, level setting, bonding agent where required, supply of cement, sand and additives, mixing, placing, compaction, leveling, finishing and curing.

Location: Entire Ground Floor'),
('20cc1e5c-972d-451b-9806-01eb9d451618', 'Supply and installation of complete waterproofing system to wet areas including floors and upturn on walls up to 300mm height, including surface preparation, primer application, waterproofing membrane system (liquid applied / sheet membrane as per specification), sealing of joints, corners and penetrations, protection layer, and pond (flood) testing to ensure water tightness.

Location: Wet Areas only (refer to layout)'),
('f7a38d68-2ed0-4c82-98a6-3da550b58045', 'Supply and installation of concealed sliding/secret door integrated within wall panelling, finished to match corridor wall panelling, including door leaf, concealed sliding mechanism/track, framing, soft-close hardware, finger pull or concealed handle, alignment, finishing, and protection of adjacent surfaces

Size: 1050mm L x 2200mm H
Location: Corridor Area'),
('24919cee-5136-4dcd-ae6c-8171ebb64a99', 'Supply and installation of door threshold strip at floor finish transitions, comprising aluminum as specified in the finishes schedule. Works shall include measuring, cutting to size, fixing with approved adhesive, alignment, leveling, edge finishing, sealing.

Code: FT01
Type: Aluminum (price is provisional, subject to change depending on material/finish)
Location: Storage Hidden Door'),
('2fd1c974-fa7b-47e6-a68e-6aca17afacad', 'Supply and installation of floor and wall tiles, including surface preparation, adhesive/bedding application, precise laying, cutting, jointing, leveling, grouting, cleaning, and protection of finished surfaces.

Brand/Type: Local Market
Location: Master Bathroom'),
('b727c037-65ae-4ff3-9e79-b7005aaa1ea6', 'Supply and installation of floor drop transition profile at locations where there is a change in floor level between adjacent finishes, including fabrication and installation of metal trim approved transition profile, complete with cutting, leveling, fixing, edge finishing, and sealing.

Code: FT02
Type: Aluminum (price is provisional, subject to change depending on material/finish)
Location: Refer to flooring finishes layout'),
('8be21fb5-3fdb-4551-9391-642583da940f', 'Supply and installation of floor edge/corner profile, including aluminium finish edge trim, cutting to size, drilling, fixing with suitable adhesive, alignment, corner detailing, sealing, finishing.

Code: FT03
Type: Aluminum (price is provisional, subject to change depending on material/finish)
Location: Refer to flooring finishes layout'),
('0232847d-d040-4672-8c55-bdafe5d33b9b', 'Supply and installation of floor tiles, Tile Type 1, including tile adhesive, grout, spacers, cutting, alignment, leveling, edge finishing, cleaning, and all associated works required for complete installation in accordance with approved flooring plan and client-approved samples.

Mark: FF2
Size: 1200mm x 600mm

Notes:
1. As per approved flooring plan.
2. Final tile design/material subject to client approval.
3. PC Rate for tile supply: AED 150/m²'),
('628e842f-1ad4-4aa7-ba4b-a3c416cedf79', 'Supply and installation of floor tiles, Tile Type 2, including tile adhesive, grout, spacers, cutting, leveling, alignment, finishing, and all associated works required for complete installation as per approved flooring plan and client-approved samples.

Mark: FF3
Size: 600mm x 600mm

Notes:
1. As per approved flooring plan
2. Sample to be submitted for client approval prior to installation
3. PC rate for tile supply: AED 120/m²'),
('80ddced3-5299-4028-a8b2-813a55ed4404', 'Supply and installation of floor tiles, Tile, including tile adhesive, grout, spacers, cutting, leveling, alignment, finishing, and all associated works required for complete installation as per approved flooring plan and client-approved samples.

Mark: FF4
Size: 1200mm x 600mm

Notes:
1. As per approved flooring plan
2. Sample to be submitted for client approval prior to installation
3. PC rate for tile supply: AED 150/m²'),
('e16320f4-6759-4401-935c-a5feb3c3156e', 'Supply and installation of floor tiles, including surface preparation, adhesive application, precise laying, cutting, leveling, jointing, grouting, cleaning, and protection of finished surfaces.'),
('8ce5663b-125f-4cd6-942d-56125472e769', 'Supply and installation of floor transition profile between stone and wood flooring, including aluminium, cutting to size, drilling, fixing with suitable anchors/adhesive, alignment, joint sealing, and finishing.

Code: FT04
Type: Aluminum (price is provisional, Subject to change depending on material/finish)
Location: Entrance Door'),
('708d623a-8ba1-4595-af15-d0c8848bf3d8', 'Supply and installation of high-quality Luxury Vinyl Tile (LVT) flooring over existing tile flooring, including all surface preparation (cleaning and self leveling - 3mm thk.), adhesive application, precise cutting, alignment, joint treatment, edge finishing, and protection of finished works. Complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Supplier: floors by Metre Squared
Style: Straight Plank
Finish: Wood
Color: Desert Oak
Size: 177.8 m x 1219.2mm x 2.5mm thk.
Wear Layer: 0.3mm
Location: All floor areas, excluding master bathroom floor, bathroom 01 floor and service areas

*Note: Thickness will vary depending on the actual site condition, any additional will be considered as variation.'),
('114c55b8-ef16-4e49-80cb-ffa29c58b9e7', 'Supply and installation of light frame, including alignment, fixing, leveling, support structure, and finishing as per approved design.

Location: Living/Dining, Family 1, Main Entrance, & Corridor Area'),
('56e8bd52-03b7-444a-9586-8d1f724cb94f', 'Supply and installation of marble flooring, including surface preparation, cutting to size, adhesive fixing, grinding, crystallization, polishing, and finishing.

Location: Entire Area excluding Bathrooms'),
('5059cd38-2997-4839-9039-80f8f08d6e39', 'Supply and installation of marble tile flooring, including cutting to size, surface preparation, precise laying, leveling, grouting, edge finishing, cleaning, and protection of completed surfaces.

Type: Polaris White
Thickness: 2cm
Size: 63.5cm x 63.5cm
Finish: Polished
Location: Entrance Area as per client''s instruction
Note: Sample provided for client''s/designer''s approval'),
('39df4c69-e7cb-4d40-a268-fa647d73abed', 'Supply and installation of metal ceiling panels, including cutting, fixing to ceiling framework, alignment, leveling, finishing, and protection.

Drawing Code: CF-MT-02
Type: Dark Bronze Metal 
Finish: Satin
Location: Master Bedroom'),
('329f0c0b-bfe1-4a9f-9451-29810ccc4c3c', 'Supply and installation of metal finish threshold, including cutting to size, fixing, leveling with floor finishes, alignment, and final cleaning.

Location: Bathroom 01 & 02'),
('2dc88932-3c20-4ed2-b75b-5ee1a8111e28', 'Supply and installation of metal transition strip, including cutting to size, fixing, alignment, and final cleaning.

Type: Aluminum'),
('29262500-72fa-4b4d-9d92-41f51c30bbb0', 'Supply and installation of mixer tap, including connection to hot and cold water supply, alignment, sealing, testing, and protection of surrounding finishes

Brand: Local Market
Location: Master Bathroom, Bathroom 02 & 03'),
('819ff061-4334-4da4-b7f7-6dc19fb3fa82', 'Supply and installation of moisture-resistant (MR) gypsum board ceiling, including metal framework, suspension system, cutting to size, jointing, screwing, finishing with joint compound, sanding, and surface preparation for painting.

Location: Master Bathroom, Bathroom 01 & Bathroom 02'),
('ad72d0f7-f191-401f-b2dd-87523549eb3b', 'Supply and installation of motorized curtain, including track, motor, controls (remote), approved curtain fabric, fixing, wiring connection, testing, and commissioning. Complete in all respects.

Location: Salon Area'),
('e326e6a9-c8d6-43d6-97f0-21829dd2716e', 'Supply and installation of new 13 cm high PU/Fiber skirting in paint finish, including surface preparation, alignment, fixing, priming, application of two coats of approved paint, joint treatment, cleaning, and protection of adjacent surfaces — complete in all respects.

Material/Finish: PU/Fiber skirting in paint finish
Location: Powder Room'),
('9c8c68ab-5ffc-4297-8eb3-3bc45bcbbfc1', 'Supply and installation of new Customized shape Marble top on BBQ counter (damaged area only), Water feature area and planters on swimming pool end.'),
('fa4d3ee2-b097-4940-9444-e5591a8fc5c8', 'Supply and installation of new PU/Fiber skirting with painting over existing tile skirting, including cutting, alignment, fixing, priming, application of two coats of approved PU/Fiber paint, joint treatment, and protection of adjacent surfaces. Complete in all respects including labor, tools, consumables, and site cleaning.

Material: PU/Fiber Skirting (150mm HT x 20mm width)
Existing Tile Skirting Height: 100mm
Location: Over existing tile skirting'),
('d2d6aa94-b6c2-4085-b619-72445dc03f9e', 'Supply and installation of new fire-rated (FR) gypsum ceilings, including framing, suspension system, finishing, joint treatment. — complete as per approved specifications.

Location: Stair Hall, Hall, Walk in, Master Bed, Bedroom 01, & Bedroom 02 , New Balcony Room'),
('2dca5768-1819-4e25-8cb2-4c923b55f9bf', 'Supply and installation of new floor tiles over existing tiles on the ground floor area only, including surface inspection, cleaning and roughening of existing tiles, application of approved tile-on-tile adhesive, precise laying, leveling, cutting, grouting, cleaning, and protection of finished surfaces.

Location: Dining, Patio, Living, Kitchen, Entry, Lobby, Maids Room & Toilet, Common Toilet, GF Room, Washing & Drying Area excluding landscaping & garage area'),
('78adcd5b-1d11-4b7b-9142-db93e25526bc', 'Supply and installation of new floor tiles, including surface preparation, adhesive application, precise laying, cutting, leveling, grouting, cleaning, and protection of finished surfaces'),
('82b112d7-a7b3-4b27-916e-1049c1883546', 'Supply and installation of new gypsum board ceiling, including metal framing, gypsum board fixing, shadow gap edging, integration of electrical wirings, alignment, leveling, joint finishing, sanding, protection of adjacent surfaces, and cleaning of completed work.

Location: Dining Area'),
('516ccc91-fddb-4bfc-a991-199eac758173', 'Supply and installation of new handles for all internal doors, including removal of existing handles, fixing of new handles, alignment, and testing for proper operation. Complete in all respects.

Location: Ground Floor'),
('c314d313-1185-4822-99d9-b7b6cf13a978', 'Supply and installation of new porcelain floor tiles in grey matt finish, including surface preparation, adhesive, grouting, and finishing — complete as per approved specifications.

Location: Master Bathroom & FF Shared Bathroom'),
('9affc375-2176-49ea-9b49-60d2f19f5fa1', 'Supply and installation of new porcelain tiles over existing tiles in shower area, including surface preparation, mechanical roughening of existing tiles, application of bonding agent/adhesive suitable for tile-on-tile installation, fixing of new tiles, grouting, cleaning, and finishing.

Location: Bedroom 01 & 02 Shower Area only
Zellige Tiles PC Rate: 280 AED/sqm'),
('0e147d23-49e6-4e73-b840-dc951a011a9c', 'Supply and installation of new porcelain wall tiles in grey matt finish, including surface preparation, adhesive, grouting, and finishing — complete as per approved specifications.

Location: FF Shared Bathroom & Master Bathroom Shower Wall Area'),
('a09bb7b2-9310-4dd2-a23f-1c0387b3ece9', 'Supply and installation of new porcelain wall tiles over existing tiles in shower area, including surface preparation, mechanical roughening of existing tiles, application of bonding agent/adhesive suitable for tile-on-tile installation, fixing of new tiles, grouting, cleaning, and finishing.

Location: Master Bathroom Shower Area only
Tiles PC Rate: 250 AED/sqm'),
('df43b7e1-ba55-4e17-826b-1c3a9035bbd8', 'Supply and installation of new roof tiles as per the approved design and specifications, including surface preparation, fixing over waterproofing layer with appropriate adhesive or mechanical fasteners, alignment.

A. Installation of clay rooftile includes the following:
1. Supply and installation of Bitumen Treated Batten wood 
2. Supply of Stainless Steel nails or screw as required by the project
B. Installation of ridge including the following:
1. Supply and installation of batten wood concrete
2. Supply of stainless steel nails or screw as required by the project 
3. Supply and Application of Geotextile
4. Supply and Application of 50mm Polysterene
5. Supply and Application of torch applied waterproof
6. Supply and Appliation of Birdstopper
7. Flashing connecting wall and roof'),
('e8a80aaa-0c7b-4ccd-baa6-92314eeb8838', 'Supply and installation of new roof tiles, including surface preparation, fixing over waterproofing layer with appropriate adhesive or mechanical fasteners, alignment.

Location: New Storage Room'),
('0811f930-1280-42fb-99d5-e086d76bc1a4', 'Supply and installation of new shower set system, including mixer, overhead shower, hand shower, wall mounting, plumbing connections, and finishing — complete as per approved specifications.

Location: Master Bathroom & FF Shared Bathroom'),
('9bae804b-79e2-47b7-8d48-752191efb40e', 'Supply and installation of new skirting (13 cm high) in paint finish, including cutting, alignment, fixing, priming, application of two coats of approved paint, joint treatment, and protection of adjacent surfaces — complete in all respects.

Material/Finish: PU/fiber in paint finish
Location: Living & Dining Area'),
('b42721cf-ea7a-477e-b043-e8e647ae05a5', 'Supply and installation of new wall-mounted water closet with bidet, including concealed cistern, flushing system, mounting hardware, plumbing connections, and finishing — complete as per approved specifications.

Location: Master Bathroom & FF Shared Bathroom'),
('e1f9ef2a-8086-49e7-a5d5-9562d5237ba8', 'Supply and installation of new wash hand basin with custom-made vanity counter, including:
- Countertop & Carcass: 18mm moisture-resistant MDF with internal melamine finish
- Wash Basin: Ceramic or porcelain basin as per approved design and sample
- Faucet & Fittings: Client-approved faucet, drain, and accessories (supply included)
- Hardware: Handles, hinges, and brackets as required
- Installation: Proper fixing, plumbing connections, alignment, joint sealing, surface protection, and final cleaning

Configuration:
- Vanity Size: Approx. 900mm L × 500mm D × 850mm H (customizable per space)
- Storage:
1–2 internal drawers for toiletries.
1 cabinet door for storage beneath basin.
- Hardware: Soft-close hinges for doors/drawers, concealed handles or finger pulls.
- Optional: Small countertop backsplash to prevent water splash.

Location: Maids Bathroom'),
('6c29840f-206e-49d4-9b4a-f2babc39ca8a', 'Supply and installation of new window, including fabrication, delivery, fixing into prepared openings, alignment, leveling, sealing, glazing, finishing, and protection of surrounding surfaces

Size: 800mm L x 1750mm HT 
Location: Family 2'),
('8bfd6bea-7fc8-48a7-9b1b-8a68438acb37', 'Supply and installation of niche with 3 open shelves, including cutting, alignment, fixing, leveling, joint finishing, and protection.

Dimension: 2150mm HT × 370mm L x 170mm depth
Shelves Finish: PVD Brushed Bronze
Sidewall Finish: Greige paint (NCS-S-1002-Y50R, semi-gloss)
Location: Bedroom 01'),
('49a7baa8-90f9-44db-8618-128fe1fba2ed', 'Supply and installation of niche with 5 open shelves, including cutting, alignment, fixing, leveling, joint finishing, and protection.

Drawing Code: NI-ST-01b
Dimension: 2370mm HT x 300mm L x 450mm D
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Master Bathroom'),
('4e889dfc-328a-4756-a218-02b40d16f3cd', 'Supply and installation of niche, including cutting, alignment, fixing, leveling, joint finishing, and protection.

Drawing Code: NI-ST-01b
Dimension: 250mm HT x 950mm L x 200mm D
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Master Bathroom'),
('ad66f44d-cf13-4d4f-8e22-764c28ab2c62', 'Supply and installation of paving stone complete with bedding layer, alignment, joint filling, cutting, edge finishing, compaction, and all associated works required for complete installation.

Mark: FF1

Notes: 
1. Paver thickness to be confirmed
2. As per flooring plan.
3. Considered Material & PC Rate: 60mm & 150 AED/sqm'),
('23215339-a14f-4701-889f-200ebf0652b6', 'Supply and installation of porcelain tiles for flooring, including surface preparation, adhesive application, precise cutting, laying, leveling, grouting, cleaning, and protection of finished surfaces.

Type: Carrara Gold
Finish: Matt
Size: 120cm x 120cm, 9mm thk.
Location: GM''s Bathroom'),
('ae28f051-8122-4613-b30c-ec27c236a627', 'Supply and installation of porcelain tiles on floor and walls, including surface preparation, adhesive application, cutting, laying, grouting, cleaning, and protection.

PC Rate: 150 AED / sqm
Size: 60 x 120cm
Location: Bathroom (3a - 012)'),
('3a340479-6a9d-4a76-b56c-88c2586d95fe', 'Supply and installation of porcelain tiles on floor, including surface preparation, adhesive application, cutting, laying, grouting, cleaning, and protection.

PC Rate: 150 AED / sqm
Size: 60 x 120cm
Location: Maids Bathroom (3a - 017)'),
('07413128-7526-4d97-a38a-000c976aa85b', 'Supply and installation of raked/fluted timber veneer panels for ceiling, including surface preparation, fixing to ceiling framework, precise alignment of fluted pattern, leveling, finishing, and final cleaning.

Drawing Code: WF-VE-01c
Type: Timber Veneer Oak 13.024 Raked / fluted, Open pores
Finish: Matt Finish
Location: Walk-in Wardrobe'),
('979bc1a6-e30d-4e36-a7d4-b0033cb899f8', 'Supply and installation of regular gypsum board ceiling, including metal framework, suspension system, cutting to size, jointing, screwing, finishing with joint compound, sanding, and surface preparation for painting.

Location: Staircase Area'),
('d2e98ba9-d833-42f1-a733-13a5c8170848', 'Supply and installation of screeding on flooring, including surface preparation, mixing, leveling, finishing, and curing — complete as per approved specifications.

Location: Master Bathroom & FF Shared Bathroom'),
('48066b92-a301-4663-848b-fe0adbd25e71', 'Supply and installation of sheer curtain for double-height glass window, including track system, fixing, alignment, and final cleaning. Complete in all respects.

Location: Staircase Area'),
('b724ff91-d634-48e0-8417-e08cd213b183', 'Supply and installation of shower set, including fixing to wall, connection to hot and cold water supply, alignment, sealing, testing for proper operation, and protection of surrounding finishes — complete in all respects.

Brand: Local Market
Location: Master Bathroom & Bathroom 03'),
('3cbf6bb3-5007-47f2-a5d3-69ea9d896a99', 'Supply and installation of skirting at removed cupboard area, including supply, cutting, fixing, filling joints, and preparation for painting.

Type: PU/Fibre skirting
Location: Bedroom (3a - 013)
Note: at the Removed cupboard area only.'),
('a734763f-4b6b-4c58-9cb5-710967936fbc', 'Supply and installation of tempered glass shower door and partition for shower area in Bathroom 03, including all necessary aluminum/SS profiles, hinges, handles, seals, alignment, leveling, fixing, and protection of adjacent finishes

Location: Bathroom 03'),
('ed3a891a-a68f-4ab2-94c1-3ba6920a5081', 'Supply and installation of tile flooring, including cementitious adhesive and grout.

Location: GF - Back Kitchen, Laundry, Maid''s Bedroom and Bathroom
Assumed Tile Size: 60x60cm
Location: FF - Bedroom 3
NOTE: Tile supply rate of AED 150/m2 is considered. Subject to final approved drawings and specifications from Client.'),
('023c965e-d55e-4a42-ba7b-1ae9f95d2bb5', 'Supply and installation of tile skirting, including cutting to size, adhesive application, alignment, jointing, cleaning, and protection of finished surfaces

Height: 100mm
Location: Dining, Patio, Living, Kitchen, Entry, Lobby, Maids Room, GF Room, Washing & Drying Area'),
('c1cf8efa-bebd-4d1e-80ca-e5351f13b053', 'Supply and installation of tile-insert linear floor drain (500mm L), including proper leveling, connection to drainage system, waterproofing integration, and finishing with surrounding floor tiles — complete as per approved specifications.

Location: FF Shared Bathroom'),
('0375544f-e90d-45dd-8a13-91e4e4aa9db3', 'Supply and installation of tile-insert linear floor drain (900mm L), including proper leveling, connection to drainage system, waterproofing integration, and finishing with surrounding floor tiles — complete as per approved specifications.

Location: Master Bathroom'),
('b6f55641-0573-41d1-b4b5-a229c133125e', 'Supply and installation of tile-insert square floor drain (100mm × 100mm), including proper leveling, connection to drainage system, waterproofing integration, and finishing with surrounding floor tiles — complete as per approved specifications.

Location: Master Bathroom & FF Shared Bathroom'),
('b11cd2c9-d03e-49bd-a4b5-212da7ecf0ff', 'Supply and installation of timber veneer panels for ceiling, including surface preparation, fixing of panels to ceiling framework, alignment, leveling, finishing with approved adhesive or mechanical fixing, and final cleaning.

Drawing Code: CF-VE-01a
Type: Timber Veneer Oak 13.024 Matt finish
Finish: Matt Finish
Location: Guest Bedroom'),
('c7ea3fcb-5206-4972-9f93-7ae9f6eb2098', 'Supply and installation of towel holder, including wall fixing, alignment, leveling, and protection of surrounding finishes

Brand: Local Market
Location: Master Bathroom, Bathroom 02 & 03'),
('c8c6fb98-6010-4174-a946-9c34eac9fa6f', 'Supply and installation of transition/edge profile for LVT flooring and tile flooring junctions, including cutting, fixing, alignment, finishing, and protection — complete in all respects.'),
('7b3235f6-f6c2-4657-949c-5f395d5d5199', 'Supply and installation of vanity countertop and splashback tiles fabricated from Silestone slabs (Et. Calacatta Gold Pulido, polished finish), including cutting, edge polishing, surface preparation, adhesive bedding, alignment, joint sealing, grouting, silicone perimeter sealing, protection, and final cleaning — complete in all respects as per manufacturer’s specifications and approved shop drawings.

Tile Brand/Type: Silestone designed by Cosentino — Et. Calacatta Gold Pulido
Finish: Polished Marble Effect
Application: Vanity Countertop, Splashback, & Bathtub wall below
Tile Size: As per manufacturer’s standard
Location: Master Bathroom, Bathroom 01, Guest Washroom & drain covers (4 Nos)'),
('6cae3d07-b718-4611-a049-f958e7cff3a0', 'Supply and installation of wall cladding with curved MR MDF backing and fluted marble profile, including cutting, alignment, fixing, surface protection, and final cleaning — complete in all respects.

Size: 400 + 1880 + 800mm L x 3000mm ht x 40mm D
Backing: Moisture-resistant MDF (MR MDF) curved as per design
Cladding Material: Fluted Verde Alpi Nuvalto Marble (M002)
Budgetary Cost for Marble: 5,400 AED/slab
Slabs Required: 3 slabs'),
('52324700-5f26-40c6-b7fe-a7961d11ee4f', 'Supply and installation of water closet, including fixing to floor, connection to soil and vent pipes, alignment, sealing, testing for proper operation, and protection of surrounding finishes

Brand: Local Market
Location: Master Bathroom, Bathroom 02 & 03'),
('a4377211-f8f0-4c21-8796-aea22ba9b4ec', 'Supply and installation of wood-look porcelain floor tiles, including tile adhesive, grout, spacers, cutting, alignment, leveling, finishing, and all associated works required for complete installation as per approved flooring plan and client-approved samples.

Mark: FF5
Size: 1200mm x 600mm

Notes:
1. As per approved flooring layout plan
2. Sample/mock-up to be submitted for client approval prior to installation
3. PC rate for tile supply: AED 150/m²'),
('9888f75b-5f6d-4613-9709-1bca069c7ca5', 'Supply and installation of wooden flooring in chevron pattern, glue down installation only.

Specification: 
- Parquet Mardegan Legno Emotion (Origin: Italy)
- 45° chevron made in oak, oiled or varnished color Emotion
- Thickness: 15mm 3 layers (5,2mm top layer + fir + oak)
- Surface finishing: Brushed
- Selection mixed A/B

Location: FF - Master Bedroom, Bedroom 1, Bedroom 2, Bedroom 3, and SF - Lounge
NOTE: Wooden flooring supply rate of AED 890/m2 is considered. Subject to final approved specifications from Client.'),
('adc202fd-bf62-4f12-a410-7214744c089b', 'Supply of Amalgama Herringbone semi-engineered timber flooring, including supply of material

Drawing Code: FF-EW-01
Type: Amalgama Herringbone/Prime
Material Code: HW3021 
Finish: UV Oiled
Location: Bedroom 01 & Bedroom 02'),
('8c5fc90a-1902-4fa7-bee4-f4385079b819', 'Supply of Fiandre Luna Limestone porcelain floor tiles, including supply of materials.

Drawing Code: FF-PO-01a
Type: Fiandre - Luna Limestone Porcelain Tile
Size: 1200mm x 1200mm
Finish: Slate Finish
Location: Guest Bathroom'),
('260326e4-fd46-49a4-a131-b1805e166249', 'Supply of SPC flooring including delivery charges and other accessories

Type: Straight Pattern
Location: First Floor Flooring (excluding bathrooms and balconies)'),
('bfff130b-e7f7-4273-bd11-eb5227ba3441', 'Supply of Silver Travertine natural stone countertop, including supply of material and template

Drawing Code: CN-ST-01b
Type: Silver Natural Travertine Stone
Location: Bathroom 02'),
('0a9bdf9a-071a-408b-a53b-598f14cb4a6b', 'Supply of Silver Travertine natural stone wall cladding, including supply of material.

Drawing Code: WF-ST-01b
Type: Silver Travertine Natural Stone
Size: cut-to-size
Finish: Honed & unfilled
Location: Powder Room & Family Dining Area'),
('3248f3c2-0f7b-4332-bf61-1c6fdc87dfca', 'Supply of bathroom floor tiles, including delivery charges and other accessories

Location: Master Bathroom, Bathroom 02, Powder Room, Guest Bathroom'),
('d9a14aaa-ea66-4670-bc42-4fb130504dfa', 'Supply of floor-mounted water closet (WC), including delivery charges and other accessories

Brand: Kludi
Location: Master Bathroom, Bathroom 02, & Powder Room'),
('d3a5543a-5809-4481-9e91-53f3982b2eac', 'Supply of large-format floor tiles including delivery charges and other accessories

Location: Ground Floor Flooring (excluding Bathrooms, Carport & Landscaping)'),
('e8b7bc77-ccf3-42f4-8c93-794bdb5b07fa', 'Supply of marble countertop for vanity unit, including cutting, delivery charges and other accessories

Size: 2000mm x 600mm D
Location: Master Bathroom'),
('a32cc2f7-d130-4278-ae69-1433c5fa06dc', 'Supply of natural travertine stone wall cladding, including supply of material.

Drawing Code: WF-ST-02a
Type: Natural Travertine Stone
Location: Guest Bathroom'),
('cfcef377-530d-4860-ad54-183bd33a453d', 'Supply of outdoor tiles, including delivery charges and other accessories

Location: Outdoor'),
('60113428-9d48-4a9c-8b3b-9c054e549473', 'Supply of raked natural travertine stone wall cladding, including supply of material.

Drawing Code: WF-ST-02b
Type: Raked Natural Travertine Stone
Location: Guest Bathroom'),
('33252656-2fe4-4335-bcb2-bafa2ea73aa9', 'Supply of raked natural travertine stone wall cladding, including supply of materials

Drawing Code: WF-ST-02b
Type: Raked Natural Travertine Stone
Location: Bathroom 02'),
('75eea838-d22d-4ee4-8f98-83a996a0ce83', 'Supply of wall tiles, including delivery charges and other accessories

Location: 
1. Guest Bathroom (floor area: 2.00m x 2.35m)
2. Powder Room (floor area: 1.40m x 2.00m)
3. Master Bathroom (floor area: 3.25m x 2.95m)
4. Bathroom 02 (floor area: 1.60m x 3.35m)'),
('b2739e08-afa2-4947-a1b9-8b6e3415368b', 'Supply, Cutting-to-size and installation of marble flooring, including approved setting materials and all necessary fixing accessories.

Specification: 0152 - 2cm Calacatta Cremo (Cremo Delicato)
Location: GF - Hallway, Study/Cinema and WC, Guest WC, Show Bar, Living Room, Show Kitchen, Dining, FF - Hallway, Master Bedroom, and Master Bathroom
NOTE: Marble supply rate of AED 950/m2 is considered, subject to final slab selection by Client.'),
('c2e1404b-95e5-4aab-91bb-30b2aabf3f02', 'Supply, Fabrication, and Installation of a built-in cabinet including all materials, fittings, hardware, and professional installation.

Construction & Materials:
- Carcass / Structure: 18mm moisture-resistant MDF with internal melamine finish.
- Front & Side Panels: Lacquered MDF with PU satin finish.
- Top Surface (Optional): Quartz
- Hardware: Concealed hinges, soft-close drawer runners, and handles as per approved design.
- Installation: Proper leveling, alignment, fixing, joint sealing, and surface protection during handover.

Configuration:
- Drawers: 3–4 drawers along front for storage
- Shelves / Compartments: Adjustable shelves in remaining sections
- Handles: Concealed finger pull or matte black handles
- Finish: PU satin finish on exposed MDF surfaces

Size: 3200mm L x 400mm D
Location: Kitchen Area'),
('01c66e11-6c4f-4cc3-a244-e18f38aa1b03', 'Supply, cutting to size, fabrication, and installation of aluminum shadow gap in mirror-clad walls, comprising 10mm x 10mm black powder-coated aluminum profile, including fixing accessories, alignment, cutting, joint treatment.

Code: SK02E
Type: Aluminum (price is provisional, subject to change depending on material/finish)
Final Skirting Ht: TBC'),
('81c992d4-8b4e-4997-9a01-14675a16ee67', 'Supply, cutting to size, fabrication, and installation of architectural aluminum shadow gap profile, comprising 10mm x 10mm black powder-coated aluminum profile, installed at the junction of floor finishes and aluminum cladding wall systems to create a continuous recessed shadow line. Works shall include profile fabrication, cutting, fixing brackets, alignment, joint treatment, and touch-up.

Code: SK02B
Type: Aluminum (price is provisional, subject to change depending on material/finish)
Final Skirting Ht: TBC'),
('e0f8cef9-8684-48c7-8d18-4edd9a3603bf', 'Supply, cutting to size, fabrication, and installation of recessed flush baseboard skirting system comprising 50mm MDF baseboard finished to match adjacent joinery works, installed flush with the finished wall surface and incorporating a continuous 10mm x 10mm recessed U-channel groove profile finished in a color matching the wall paint. Works shall include backing supports, framing adjustments, groove profile installation, finishing, fixing accessories, alignment.

Code: SK03
Final Skirting Ht: TBC
Type: Aluminum (price is provisional, subject to change depending on material/finish)
Note: Price subject for change depending on final material selection.'),
('751497eb-29f5-41a7-8e56-f7a7eb2b56b0', 'Supply, cutting, and installation of carpet including surface preparation, trimming to required dimensions, fixing using 8mm underlay system, edge finishing, alignment, and final cleaning.

Specifications:
Manufacturer: Lusso
Product Number: Lusso Eleonara 521060
Finish/Color: As per approved sample
Installation: Cut to size'),
('4f35d139-f399-4be1-8efa-db5139e775b8', 'Supply, cutting, delivery, and installation of stone tile skirting with recessed shadow gap detail, including stone tile supply, cutting to size, edge finishing, formation of a continuous 10mm high recessed shadow gap, backing supports where required, adhesive fixing, alignment, joint treatment, and cleaning.

Code: SK01
Final Skirting Ht: TBC
Note: Price subject for change depending on final material selection.'),
('3aeec5ee-4b6f-4f15-bf54-e4c0d59e5340', 'Supply, cutting, delivery, and installation of tile skirting with recessed shadow gap detail, including tile supply, cutting to size, edge finishing, formation of a continuous 10mm high recessed shadow gap, backing supports where required, adhesive fixing, alignment, joint treatment, and cleaning.

Material: same as Crema D''Orcia Aura
Code: SK01
Final Skirting Ht: TBC
Note: Price subject for change depending on final material selection.'),
('6fffd247-bb8f-44f4-b843-e350d77a7239', 'Supply, delivery, and installation of customized engineered wood flooring, complete with underlay (where specified), adhesive, perimeter expansion gaps, trims, transition strips, cutting, fitting, and all labour, materials, tools, and accessories necessary for a complete installation in accordance with the manufacturer''s recommendations and approved shop drawings.

Code: FL03B
Brand: Parador
Material/Finish: Customized Engineered Wood Flooring – Classic 3060 Oak Nougat, Select Grading, Wide Plank, Matt Lacquer Finish (or approved equivalent)
Plank Size: 2,200 × 185 × 13mm
Top Layer: Approx. 3.6mm
Supply PC Rate: 400.76 AED/sqm (Subject to change based on the final approved tile size, thickness, finish, brand, and country of origin)
Location: Refer to flooring finishes layout'),
('c84e0c2c-922c-4b2d-b55e-3866e5ca7cbf', 'Supply, fabricate, deliver, and install architectural aluminum shadow gap skirting comprising a 10mm × 10mm black powder-coated aluminum shadow gap profile, installed at the junction of painted wall finishes and floor finishes to form a continuous recessed shadow line. 

Works includes cutting to size, mitred corners, fixing brackets/clips, alignment, joint treatment, touch-up to cut edges, sealant where required, cleaning, and all necessary accessories and consumables.

Item Code: SK01
Final Skirting Ht: TBC
Note: Price subject for change depending on final material selection.'),
('4ed91f2f-70a2-456a-9098-552d1fc595ed', 'Supply, fabricate, deliver, and install architectural aluminum shadow gap skirting to mirror-clad wall systems, comprising a 10mm × 10mm black powder-coated extruded aluminum profile to form a continuous recessed shadow gap between the mirror cladding and finished floor. 

Works includes cutting to size, mitred corners, concealed fixing, fixing brackets/clips, alignment, joint treatment, touch-up to cut edges, sealant where required, cleaning, and all necessary accessories and consumables.

Item Code: SK02
Final Skirting Ht: TBC
Note: Price subject for change depending on final material selection.'),
('7a1c7e40-0c3e-4359-a03c-e34f6be403b0', 'Supply, fabricate, deliver, and install wood shadow gap skirting to MDF/MR MDF clad walls, comprising moisture-resistant MDF shadow gap profile with 10mm high black painted recessed shadow gap detail. 

Works includes cutting to size, fabrication, edge finishing, concealed fixing, joint treatment, sanding, primer, black PU paint finish to the shadow gap recess, alignment, cleaning, and all necessary accessories and consumables.

Item Code: SK03
Final Skirting Ht: TBC
Note: Price subject for change depending on final material selection.'),
('59d84c01-b199-4008-9721-741614687433', 'Supply, fabrication, and installation of a custom-made console, including:
- Structure: 18mm moisture-resistant MDF or marine plywood carcass with internal melamine finish.
- Top Surface: Quartz
- Front & Side Panels: Lacquered MDF with PU satin finish
- Hardware: Concealed hinges, drawer runners, and handles (matte black).
- Installation: Proper leveling, alignment, fixing, joint sealing, and final surface protection.
- Complete in all respects as per approved design, materials, and finish samples.

Configurations:
- Drawers: 2–3 drawers along front for storage
- Open Compartment / Shelf: Optional open shelf below quartz top for display or storage
- Handles: Matte black concealed or external handles as per approved design
- Finish: PU satin finish on exposed MDF surfaces

Size: 1600mm L x 400mm D
Location: Kitchen Area'),
('92fc899d-6d97-4538-8632-2479b365c35d', 'Supply, fabrication, and installation of a premium circular console as requested by the client, including all materials, finishes, hardware, and professional installation.

Construction & Materials:
Structure / Carcass: 18mm moisture-resistant MDF, internally finished with melamine.
- Top Surface: Engineered quartz
- Front & Side Panels: lacquered MDF with PU satin finish.
- Base / Pedestal: Circular or custom-shaped support with concealed fixing for stability.
- Hardware & Accessories: Concealed brackets or supports as required.
- Installation: Proper leveling, alignment, surface protection, and final cleaning.

Configuration:
- Top: Solid circular top (Ø1000mm)
- Base: Single pedestal or cross-frame for stability
- Finish: PU satin lacquer
- Optional: LED accent lighting under tabletop or integrated storage (if required)

Size: 1000mm Dia.
Location: Staircase Area'),
('7d940ad2-ed2e-4f25-85ac-0de23afd54ca', 'Supply, fabrication, and installation of custom electrical closet, including:
- Carcass: 18mm moisture-resistant MDF with internal melamine finish
- Doors/Front Panels: Lacquered MDF with PU satin finish
- Handles & Hardware: Concealed finger pull / integrated profile handles, hinges as required
- Internal Provision: Adequate space for distribution boards and electrical panels, including proper cable entry points
- Installation: Proper alignment, fixing, joint sealing, surface protection, and final cleaning

Configuration:
- Doors: 2–3 panels (depending on internal layout, full height swing type).
- Compartments: Separate internal sections for DBs, electrical panels, and cable management.
- Handles: Concealed finger pull handles for a clean front appearance.
- Cable Access: Cutouts or knockouts at top/bottom/back panels for cable entry and maintenance.

Size: 1350mm L x 200mm D
Location: DB Area'),
('ab41f99f-4137-449c-a121-531382999f50', 'Supply, fabrication, and installation of custom-made shelving unit for bar area, serving as a visual separation between the dining and living rooms. Works include:
- Structure: Combination of powder-coated metal frame and lacquered MDF shelves.
- Shelves: PU-painted MDF with satin finish.
- Optional Features: Integrated LED strip lighting and tempered glass inserts for premium look.
- Installation: Secure fixing, alignment, surface protection, and final cleaning.
- Complete in all respects as per approved design and material sample.

Configuration:
- Shelves: 3–4 horizontal shelves, spaced evenly
- Frame: Slim metal frame for open display look
- Lighting: Optional integrated LED strips along underside of shelves
- Glass Inserts: Optional tempered glass panels on selected shelves or sides
- Visual Separation: Open design to allow light and partial visibility between spaces

Size: 1700mm L x 300mm D x 1100mm HT
Location: Between Dining Room & Living Room'),
('69b06cf5-1c06-4897-b029-e47e43b15e2f', 'Supply, fabrication, and installation of custom-made storage cabinet below staircase, including:
- Carcass: 18mm moisture-resistant MDF with internal melamine finish
- Doors/Front Panels: Lacquered MDF with PU satin finish
- Handles & Hardware: Concealed finger pull / integrated profile handles, imported soft-close hinges and runners
- Internal Fittings: Adjustable shelves and compartments as per design requirements
- Installation: Proper alignment, fixing, joint sealing, surface protection, and final cleaning

Configuration:
- Doors: 6–7 panels (depending on slope, each approx. 400mm wide)
- Sections: Multiple compartments following staircase slope
- Shelves: Adjustable shelves in each compartment
- Drawers / Compartments: Optional drawers or pull-out trays at lower levels
- Handles: Concealed or finger-pull handles to maintain smooth front surface
- Slope Adaptation: Cabinet height varies following staircase incline; panels cut to fit under risers precisely

Size: 2550mm L x 1150mm D x variable height following staircase slope 
Location: Staircase Area (Ground floor)'),
('7fffe1e3-8b64-4136-9ab1-f031a990448e', 'Supply, fabrication, and installation of custom-made wardrobe including:
- Carcass: 18mm moisture-resistant MDF with internal melamine finish
- Shutters/Doors: Lacquered MDF with PU satin finish
- Handles: Concealed finger pull / integrated profile handles
- Hardware: Imported soft-close hinges, runners, and internal accessories
- Internal Provisions: Dedicated space for IT rack, washer and client-supplied dryer above washer, hanging rails, shelves, and drawers as per approved layout
- Back Panel: 9mm MDF board with melamine finish
- Base & Skirting: MDF plinth with matching PU finish
- Installation: Proper alignment, joint sealing, surface protection, and final cleaning

Configuration:
- Doors: 5 panels (~520mm each, full height swing type)
- Sections: 3–4 compartments
- Appliance Section:
 - Lower compartment: Washer recess
 - Upper compartment: Dryer recess with ventilation
 - IT Rack Section: Adjustable shelves and cable management provisions
- Other Sections: Combination of hanging rails, adjustable shelves, drawers, and accessory trays

Size: 2600mm L x 600mm D x 2400mm HT
Location: Maids Room
Note: Appliance provided by client.'),
('8f671616-9833-4092-a901-1c930a9a7906', 'TRAVERTINE PORCELAIN TILE WALL CLADDING (LARGE FORMAT):

Supply and installation of travertine wall cladding including surface preparation, adhesive application, fixing, leveling, grouting, edge finishing, cleaning, and protection of adjacent finishes.'),
('a112c88e-813b-4a39-982a-990e6dbdc7ae', 'TV + FIREPLACE UNIT:

Supply and Installation of TV Unit with cladding in fluted Grigio Perlatto Marble to hang from ceiling with proper MDF and metal support inside. Provision for 50" TV to be in pivot mechanism for rotation. Metal trim around TV. Bottom console cladded with Grigio Perlatto wo have proper MDF boxing inside. Provision for fire cassette. 

Hanging Size: 1845 x 2050ht x 200mm
Console Size: 2500 x 300ht x 415mm
Location: Master Bedroom'),
('eeda4961-c815-445b-b8b3-1e5a73285f1a', 'TV UNIT + DESK:

Supply and installation of TV unit with wallpaper cladded MDF for backsplash. Frame to be in painted MDF. Desk to be in painted MDF. 3nos. of drawers below with wallpaper cladded MDF drawer fascia. Standard handle and Blum soft closing drawer runners. Melamine for all internal parts.

Wallpaper: supplied by client, installation by us
Back panel/Drawer Fascia: 18mm thk MDF in primer finish, to receive wallpaper
Frame/Desk: MDF in P.U. paint finish
Carcass/Internal: 18mm thk MDF or equivalent melamine
Size: 2005mm W x 2800mm ht x 600mm TV Unit,
 2005mm W x 50mm thk. x 550mm Desk,
 700mm W x 700mm ht x 600mm Drawers'),
('948118b2-f48b-4666-9762-28b7822cee54', 'TV UNIT + DISPLAY SHELVES:

Supply and installation of TV unit with cladding in MDF in primer finish, to receive wallpaper. Open shelf at the bottom with same finish. Veneered MDF for back panel. Travertine cladding on bottom right corner. Display shelves in veneered MDF for all parts. {3000K} LED striplights as per design

Wallpaper: supplied by others, installation by us
Cladding: 18mm thk MDF in primer finish to receive wallpaper
Back panel/Shelves 18mm thk MDF in veneer finish
Cladding: 20mm thk natural travertine
Marble: supplied by client, fabrication and installation by us
Size: 3095mm W x 2800mm ht x 500mm TV Unit
400mm W x 2800mm ht x 500mm display shelves'),
('b64114c5-bb3d-4de9-a268-e0e107ae28e7', 'TV UNIT:

Supply and Installation of TV unit with mix of flat and fluted marble for cladding. Veneered MDF for back panel, side panels, and open shelves. Marble for dividers. Provision for TV to be flushhed in the unit. {3000K LED strip lights as per design.

Cladding: 20mm thk Natural Travertine striata
Cladding: Fluted Natural Travertine striat
Back panel/Side panel/Open hsleves: 18mm thk MDF in veneer finish
Divider: Calacatta Viola Marble
Marble: supplied by client, fabrication and installation by us
Size: 5690mm W x 3400mm ht x 505mm D'),
('346044ee-1990-47c1-88f7-3316dd243dfa', 'TV WALL UNIT:

Supply and installation of wall cladding made of MDF with both side oak wood veneer finish, in center mirror finish, colour as per approved sample, details as per drawing

Dimension: 5200mm L x 3050mm HT
Location: Family Living
Note: Base Joinery Item to be checked and confirmed'),
('f05ebfc0-1a49-4a83-aa07-bba31ed41fc2', 'TV WALL:

Supply and installation of TV wall made of MDF with pu paint finish, including floating table wood veneer finish and side open shelf made of MDF with wood veneer finish

Size: 3620mm L x 2750mm HT
Location: Bedroom 02'),
('508ca29d-6172-41de-833a-e97968724991', 'Tile Skirting

Supply and installation of Tile skirting, including all necessary accessories required.

Considered Height: 100mm
Location: Pantry, Sales gallery and Pre-function area toilets
Note: Exclude tile skirting inside Male & Female toilet cubicles'),
('8f392d4c-1ce2-44ec-a400-0f95c8ca074e', 'VANITY + MAKEUP TABLE:

Supply and Installation of 2nos. of mirrors with 6mm thk belgium grade clear mirror with painted wooden frame and MDF backing. {3000K} LED strip lights as per design.

Size: 800mm W x 2600mm ht'),
('5a81ef40-c807-417e-a348-3730dff94ed6', 'VANITY + MAKEUP TABLE:

Supply and installation of vanity unit to have custom countertop and sink as. Cabinet below to extend to make-up table. Painted MDF counterop. Drawers below with fluted painted MDF drawer fascia and push to open mechansim. Melamine for all internal parts

Sanitarywares: not included
Countertop/Fascia/Custom sink: 20mm thk Calacatta viola Natural Marble
Countertop: 18mm thk MDF in P.U. paint finish
Drawer fascia: Fluted MDF in P.U. paint finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Marble: supplied by client, fabrication and installation by us
Size: 1325mm W x 900mm ht x 600mm D Vanity,
 1000mm W x 700mm ht x 600mm D make-up table'),
('149a84a6-14ba-4b22-ab75-fe8a8149f8b3', 'VANITY + MIRROR:

Supply and Installation of vanity unit with marble countertop, fascia, and 1no. of integrated sink. To have cabinet below. Cabinet below with 4nos. of drawers. Grooved veneered MDF for drawer fascia. Finger pull and Blum soft closing drawer runners. Melamine for all internal parts.
6mm thk belgium grade clear mirror with MDF backing
Sanitarywares: not included

Countertop/Fascia/Custom sink: 20mm thk Calacatta Viola Natural Marble
Drawer fascia: Grooved MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Marble: supplied by client, fabrication and installation by us
Size: 1065mm W x 900mm ht x 600mm D'),
('3d4639b4-f1bd-4323-ae45-75049777b5a6', 'VANITY COUNTER WITH SIDE OPEN SHELF:

Supply and installation of vanity counter made of Metal framing and marine plywood to accomadate marble cladding and side shelf made of MDF with oak wood veneer finish, details as per drawing, colour as per approved sample, marble supply by client

Size: 2570mm L x 580mm W x 900mm HT 
open shelf : 580mm L x 415mm W x 1900mm HT
Location: Master Bathroom'),
('ad1e9f92-aa38-4527-9bf5-d3b4e520d63c', 'VANITY COUNTER:

Supply and installation of vanity counter made of MDF with inside melamine and outside wood veneer finish (Excluding wash basin and mixer), marble supply by client 

Size: 2300mm L x 500mm W x 250mm HT
Location: Bathroom 01'),
('26963e71-3b1f-4460-98a4-d0beb6b07408', 'VANITY COUNTER:

Supply and installation of vanity counter made of metal frame and plywood for marble (Excluding wash basin and mixer), Charges for installing marble for vanity counter, marble supply by client. 

Size: 2400mm L x 500mm W x 400mm HT
Location: Guest Bathroom'),
('1f1debae-4f43-472c-bb1d-2b149287ab61', 'VANITY COUNTER: 

Supply and installation of vanity counter made of metal framing with marine plywood cladding for accomadate marble cladding, details as per drawing (excluding wash basin, mixer), charges for installing marble for vanity counter, marble supply by client (excluding backsplash)

Size: 1000mm L x 700mm W x 900mm HT
Location: Powder Room'),
('a5b20662-93d4-46fa-9242-5764b52de8ce', 'VANITY MIRROR:

Supply and Installation of custom shaped vanity mirror with 6mm thk belgium grade mirror framed with custom cut solidwood with paint finish

To have 1 paint finish only
Size: 1660mm W x 1600mm ht x 30mm thk.'),
('010d9085-8031-40d2-b810-54448cad7f8b', 'VANITY MIRROR:

Supply and Installation of vanity mirror with 6mm thk belgium grade mirror on MDF backing. {3000K} LED strip backlighting as per design

Size: 2555mm W x 1100mm ht'),
('10eea31e-1d18-411a-985e-616eb8779c6c', 'VANITY:

Supply and Installation of vanity unit with custom counter in marble. To have proper MDF boxing inside. To have cabinet on either side. Countertop, and drawer fascia in veneered MDF. Push to open mechanism. Melamine for all internal parts

Sanitarywares: not included
Custom Counter: 20mm thk Fascination Natural Marble
Countertop/Fascia: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Marble: supplied by client, fabrication and installation by us

Size: 600mm Ø x 900mm ht counter,
 2275mm W x 900mm ht x 600mm D cabinet'),
('e30944c8-d894-44e6-a7ad-fc186566d21c', 'VANITY:

Supply and Installation of vanity unit with custom sink and fascia with edge detail. Cabinet below with 4nos. of drawers. Exposed parts to be in veneered MDF -- curved as per design. Standard handles and Blum soft closing drawer runners. Melamine for all internal parts

Countertop/Custom sink/Facsia: TBC marble
Drawer Fascia: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Marble: supplied by client, fabrication and installation by us
Size: 2055mm W x 900mm ht x 600mm D'),
('cb04eeb4-8046-4dce-bd66-5364b02e9eeb', 'VANITY:

Supply and installation of vanity unit with marble for countertop, fascia, 1no. of integrated sink, and open shelf. 2nos. of drawers below with Slatted veneered MDF, finger pull and Blum soft closing drawer runners. Melamine for all internal parts. {3000K} LED strip lights as per design

Sanitarywares: not included
Countertop/Fascia/Custom sink/Shelf: 20mm thk Calacatta Viola Natural Marble
Drawer fascia: Slatted MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Marble: supplied by client, fabrication and installation by C5
Size: 1200mm W x 900mm ht x 600mm D'),
('a301ae7a-093d-4107-b87e-bd65cb0e5c37', 'WALL CLADDING + BOOKSHELF:

Supply and Installation of wall cladding with metal framed primer finished MDF -- to receive wallpaper, for middle part. Left side to be cladded with veneered MDF. Provision for sockets and switches Right side to have open library with veneered MDF for shelves and side panels. Linen finish melamine for back panel. {3000K} LED strip lights as per design

Sockets/switches: not included
Wallpaper: supplied by others, installation by us
Middle Cladding: metal framed 18mm thk MDF with primer finish, to receive wallpaper
Cladding/Side panels/shelves: 18mm thk MDF in veneer finish
Back panel: 18mm thk Egger or equivalent melamine
Size: 280mm W x 2800mm ht middle,
930mm W x 2800mm ht left,
930mm W x 2800mmht x 330mm bookshelf'),
('8cecca3b-e6d9-4579-bfd4-eb60470d42ac', 'WALL CLADDING:

Supply and installation of wall cladding made of MDF with PU paint finish, including plain and ribbed design and open shelf 

Location: Bedroom 01'),
('4099d1aa-fda6-4c8a-af0d-2495d557f091', 'WALL CLADDING: 

Supply and installation of wall cladding made of flutted MDF with oak wood veneer finish, colour as per approved sample,details as per drawing 

Size: 1950mm L x 1900mm HT
Location: Powder Room'),
('c8561e9a-5e41-41cc-8341-61118cc81d00', 'WALL CLADDING:
Supply and installation of wall cladding with PVC leather cladded MDF. {3000K} LED strip lights as per design. Provision for sockets and switches

Sockets/switches: not included
Cladding: upholsteres MDF with approved PVC leather (from our supplier catalog}
Size: 3155mm W x 700mm ht x 40mm thk.'),
('8738ae96-79ec-4249-adee-6546711a875c', 'WALL CLADDING:

Supply and installation of wall cladding with painted MDF. Wall moulding as per design. To receive wallpaper. Bottom part to be cladded with marble.

Cladding: 18mm thk MDF in P.U. paint finish
Moulding: 30mm wide solidwood in P.U. paint finish
Cladding: 20mm thk Travertine
Marble: supplied by client, fabrication and installation by us
Size: 4230mm W x 2600mm ht painted,
 30LM moulding,
 4230mm W x 200mm ht marble'),
('63f74776-a1e6-41c9-b307-384ca024e8cf', 'WARDROBE:

Supply and installation of wardrobe unit with mirror cladded painted MDF shutters. Standard metal handle and /Blum soft closing hinges. Melamine for all internal parts. Black or SS finish hanger rods. Internal drawers with melamine for all parts, finger pull and Blum soft closing drawer runners. {3000K} LED strip lights on switch control.

Shutter: 18mm thk MDF cladded with 4mm thk belgium grade mirror.
Carcass/Internal: 18mm thk Egger or equivalent melamine 
Size: 2105mm W x 2600mm ht x 600mm D'),
('e3e18268-202d-467a-b103-5f4b6aabdaeb', 'WARDROBE:

Supply and installation of wardrobe unit with mix of glass and fabric shutters. Integrated metal handle and air hinges/Blum soft closing hinges. Veneered MDF for other exposed parts. Melamine for all internal parts. Black or SS finish hanger rods. Internal drawers with melamine for all parts, finger pull and Blum soft closing drawer runners. {3000K} LED strip lights on switch control.

Shutter: 4mm thk tinted glass with metal frame
Shutter: fabric cladded MDF with metal frame
Side panel: 18mm thk MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine 
Size: (1780 + 1850 + 4100 + 4200)mm W x 2800mm ht x 600mm D'),
('9018240b-e183-4990-a6b1-106b6284a02d', 'WARDROBE:

Supply and installation of wardrobe unit with painted custom cute shutters. Custom painted handle and Blum soft closing hinges. Melamine for all internal parts. Black or SS finish hanger rods. Internal drawers with melamine for all parts, finger pull and Blum soft closing drawer runners. {3000K} LED strip lights on switch control. Display shelves in veneered MDF, curved as per design.

Shutter: MDF in P.U. paint finish with custom cutting
Carcass/Internal: 18mm thk Egger or equivalent melamine 
Display shelves: 18mm thk MDF in veneered MDF 
Size: 1405mm W x 2800mm ht x 500mm D'),
('2f6b26d9-8b57-4351-bd81-a719c29660e6', 'WT-01 120x60 Porcelain Tile

Supply and installation of 120x60 Porcelain tile, including all necessary adhesive, cutting, cleaning.

Finish: Clay stone white, R10 Specification: 
RAK ceramics or equivalent
Location: Male & Female toilets, Kitchen, Pantry, Janitor room
Note: Wall finishes for the POD toilets by Sobha'),
('84e58398-d2a7-4365-9332-285441491e64', 'ARM CHAIR:

Ref Code: F10-06
Material/Finish/Color: Fabric
Size: 82 x 82 cm
Note: Fabric to be supplied by client'),
('44f03fe2-2bb4-4924-bd48-f0de2496343c', 'ARM CHAIR:

Ref Code: F11-03
Material/Finish/Color: Solid Wood with Outdoor Fabric
Size: W76 x D83 cm
Fabric PC Rate: 100 AED per meter'),
('33fb6a49-cf5f-486e-bfa9-4079a5eb04a5', 'ARM CHAIR:

Ref Code: F18-01
Material/Finish/Color: Solid Wood with Outdoor Fabric
Size: 90 x 80 cm
Fabric PC Rate: 100 AED per meter'),
('35826625-bf19-45ba-9304-cdbcb4b13de6', 'ARM CHAIR:

Ref Code: F7-05
Material/Finish/Color: As per reference image
Size: 90W x D100 cm
Note: Fabric to be supplied by client'),
('f9f8a9ff-63bf-41b8-a2f7-9f56f304cd06', 'ARM CHAIR:

Ref Code: F9-05
Material: As per reference image
Size: 64W x D63 x 66H x 36 SH
Note: Fabric to be supplied by client'),
('2c503c34-b446-4686-8001-abb53948f6fc', 'ARMCHAIR:

Ref Code: F16-02
Material/Finish/Color: Solid Wood with Outdoor Fabric
Size: 90 X 70 cm
Fabric PC Rate: 100 AED per meter'),
('64b10262-2f5c-46b4-b141-3e6a4e17ba41', 'Amy Executive Visitor/Lounge Chair in Z13 Vegan Leather:
Finish Options: Z13 Clemence Vegan Leather Family (Black, Grey, Red, Roman Tan or Khaki Beige)
Functions: Height Adjustment and Swivel movements
Body: Internal Steel Frame and Moulded Foam
Base: Aluminum Alloy 4-Cross base in combination black and brushed finish
Certificate: BIFMA Quality Certified Class-3 Gas Lift
Dimensions: 770 x 770, H820mm
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Warranty: 5 Years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('1c2af45d-e5f0-4b60-8f66-cec69a5a739f', 'BASE (KING - 180 x 200):

Ref Code: F8-02
Material/Finish/Color: Solid Wood / veneer 
Size: 220 x 220 cm
Note: Matress excluded'),
('d4d8c1c7-e86c-4308-8be6-3bde1e4753ee', 'BASE (SUPER KING - 200 x 200)

Ref Code: F9-02
Material: Textures fabric
Size: 220 x 220 cm
Note: Client supplied fabric & matress excluded'),
('8f03c491-0ade-45d7-89a8-8ce05dbb25ce', 'BED BASE:

Ref Code: F6-02
Material/Finish/Color: Fabric with Wooden Base
Size: Super King - 220 x 220 cm
Note: Client supplied fabric & mattress excluded'),
('1114f4f8-01af-4b7f-bd09-12536e7bb257', 'BENCH:

Ref Code: F4-07
Material: Fabric with Wooden Legs
Size: W180 x D50 cm
Note: Fabric to be supplied by client'),
('98025a9b-d1d6-49cb-b0b2-62faea7e6762', 'BUILT - IN BOOKSHELF:

Ref Code: F9-07
Material/Finish/Color: Veneer
Size: 220L x 30D x 170H'),
('196fab3f-477d-4b17-9777-2418a59deb71', 'Bean Center Oval Coffee Table in 8 MFC Top Options - 1200*600*420mm:
Elevate your executive lounge with this stylish and functional coffee table.

Top Finish: 8 Different MFC Colors (CF01, CF05, CF06, CF08, CF09, CF12, CF41 or CF42)
Sustainability: E0 environmental wood board (18mm thick)
Black epoxy powder coated steel loop legs
Felt Glides to avoid scratching floor material
Designed by Claudio Bellini (Milan, Italy)
Dimensions: 1200 x 600, H420mm
Warranty: 5-year
Note: ON ORDER BASIS. Lead time is 8-10 Weeks'),
('5d43f0fd-ccda-492b-9a2d-9b484f5c705e', 'Bean Center Round Coffee Table in 8 MFC Top Options - 600*350mm:
Elevate your executive lounge with this stylish and functional coffee table.

Top Finish: 8 Different MFC Colors (CF01, CF05, CF06, CF08, CF09, CF12, CF41 or CF42)
Sustainability: E0 environmental wood board (18mm thick)
Black epoxy powder coated steel loop legs
Felt Glides to avoid scratching floor material
Designed by Claudio Bellini (Milan, Italy)
Dimensions: D600, H350mm
Warranty: 5-year warranty
Note: ON ORDER BASIS. Lead time is 8-10 Weeks'),
('24a7606d-42ec-443b-a41b-712c9acb7f00', 'Bean Side Round Coffee Table in 8 MFC Top Options - 400*420mm:
Elevate your executive lounge with this stylish and functional coffee table.
Top Finish: 8 Different MFC Colors (CF01, CF05, CF06, CF08, CF09, CF12, CF41 or CF42)
Sustainability: E0 environmental wood board (18mm thick)
Black epoxy powder coated steel loop legs
Felt Glides to avoid scratching floor material
Designed by Claudio Bellini (Milan, Italy)
Dimensions: D400, H420mm
Warranty: 5-year
Note: ON ORDER BASIS. Lead time is 8-10 Weeks'),
('c651f226-0012-4ca0-9681-efb1c2d3e7b7', 'Bee Curved 3-Seater Sofa in S13 Vegan Leather - 2350*900, H820mm:
The Bee Straight 3-Seater Sofa offers a luxurious seating experience for the modern office.

Finish Options: Black, Dark Grey, Coffee, Lemon Yellow, Khaki Beige and Roman Tan Eco-Leather: Sustainably Sourced Vegan Leather (S13 Collection)

This luxurious 3-seater sofa features a stunning post-modern minimalist curving shape.
Seat & Backrest: S13 vegan leather with plush internal cushion & curving armrest/backrest
Legs: Black Gunmetal Electroplated Steel Legs
Eco-friendly wood frame and high-density foam for lasting comfort
Designer: Claudio Bellini (Milan, Italy)
Dimensions: 2380 x 1060, H820mm
Warranty: 5-year warranty
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('bb9b2d36-7ab2-4344-977b-608108c15e5a', 'CHAISE LOUNGE:

Ref Code: F5-02
Material/Finish/Color: Fabric
Size: 150 x 110 cm
Note: Fabric to be supplied by client'),
('39d4ae2b-f025-4869-962a-9b4b0ae8d55e', 'COFFEE TABLE WITH FIREPIT:

Ref Code: F15-02
Material/Finish/Color: Travertine
Size: 240 x 70 cm'),
('6151d18a-c0a0-42fc-8431-a7ed9b89e783', 'Cadi Round Meeting Table for 4Pax in CF05/CF09 MFC - D1000,H750mm:

Top Finish Options: 25mm MFC (CF05 White or CF09 Log Walnut)
Frame: Center Tube Steel Leg with Round Base (White or Meteor Grey Epoxy powder coated)
Made from high-quality E0 grade environmental wood board
Designed by Claudio Bellini (Milan, Italy)
Dimensions: D1000, H750mm
Warranty: 5 Years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks'),
('862a0579-c51c-4e55-90b7-48b0d94cfaa3', 'Canon Mobile Pedestal in CF05 White MFC - 402*470*585mm:

Storage: Two Pull-Out Drawers, One Filing Drawer
Security: Central Locking System
Mobility: Four Heavy-Duty Soft Castors
Sustainability: E0-Grade Environmental Wood Board
Finish: White CF05 MFC Finish with Chamfered Edge Doors
Dimensions: W402 x D470 x H635mm
Warranty: 5 Years'),
('1d4aad47-b265-406e-adc9-a9518585eb0a', 'Coffee Table:

Ref Code: F2-04
Material/Finish/Color: Dark Walnut Burl Wood
Size: W160 x D70 x 40H CM'),
('99a094a7-9c77-4a5d-9c1b-ae0212c86181', 'Console:

Ref Code: F2-05
Material/Finish/Color: Black Venner Wood or Solid Wood
Size: 150 x 35cm'),
('02716718-3775-4c61-8a7b-607099e42877', 'DAYBED:

Ref Code: F12-01
Material/Finish/Color: Solid Wood with Outdoor Fabric 
Size: 120 x 100 cm
Fabric PC Rate: 100 AED per meter'),
('1ca60c7b-b1ea-446c-a7ae-3f607e190032', 'DESK (FIXED IN HEADBOARD):

Ref Code: F8-04
Material/Finish/Color: Solid Wood / Veneer
Size: W260 x D50 cm 
75H (Bottom)
80H (Top)');
insert into scheduler.rate_fix_stage (id, description) values
('eab8b210-223d-4f38-ae3a-4f3e110bd8fb', 'DESK:

Ref Code: F11-01
Material/Finish/Color: As per reference image (Except the leg should ve solid rectangular travertine finish)
Size: 250 x 110 cm'),
('54a9a468-f635-4ff4-a385-d981c4859ebf', 'DINING CHAIR:

Ref Code: F13-02
Material/Finish/Color: Solid Wood with Outdoor Fabric
Size: W70 X D80 cm
Fabric PC Rate: 100 AED per meter'),
('24278e62-9b75-4358-b696-622321611765', 'DINING CHAIR:

Ref Code: F14-02
Material/Finish/Color: Solid Wood with Outdoor Fabric
Size: W64 x D62 cm
Fabric PC Rate: 100 AED per meter'),
('143bf1c3-9648-4502-9d18-ab9850e6d24b', 'Depa Executive Highback Chair in Z13 Vegan Leather & Down Double Padded Seat & Back Detail:
Finish Options: Z13 Clemence Vegan Leather Family
(Black, Grey, Red, Roman Tan or Khaki Beige)
Ergonomic Features:
- Advance synchronized-tilting (AST) mechanism
- 3-position reclining lock angle
- Special Double padded down cushioned seat and back
- Fixed Aluminum Alloy Loop Armrest
- Steel-reinforced internal high resilience foam frame for durability
- Class-3 BIFMA certified gas lift
- R350mm Polished aluminum steel 5-star base for stability
- 60mm Reinforced PU quiet casters for smooth and silent rolling
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Dimensions: 700 x 679, H1175mm
Warranty: 5 years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('165e08b4-2f4c-40cb-ad7d-3669e2557291', 'Depa Executive Highback Chair in Z13 Vegan Leather:
Finish Options: Z13 Clemence Vegan Leather Family (Black, Grey, Red, Roman Tan or Khaki Beige)
Ergonomic Features:
- Advance synchronized-tilting (AST) mechanism
- 3-position reclining lock angle
- Steel-reinforced internal high resilience foam frame for durability
- Class-3 BIFMA certified gas lift
- Fixed Aluminum Alloy Loop Armrest
- R350mm Polished aluminum steel 5-star base for stability
- 60mm Reinforced PU quiet casters for smooth and silent rolling
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Dimensions: 650 x 670, H1150mm
Warranty: 5 years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('f426a6b6-5bbe-4057-8ad5-7286b67a0c8e', 'Dezzy Executive Visitor Chair in Z13 Vegan Leather & Chrome Cantilever Legs:
Finish Options: Z13 Clemence Vegan Leather Family
(Black, Grey, Red, Roman Tan or Khaki Beige)
Body: Internal Steel Frame and Molded Foam & Upholstered Armrest
Base: Chrome Electroplated Steel Cantilever Legs
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Dimensions: 705 x 585, H940mm
Warranty: 5 years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('2a03ec3b-da83-4720-b2ea-0d7f8c1a1ed2', 'Ergo Midback Chair in SD Mesh Back Fixed Armrest & Black Frame (Tilt Mech):
Black Fabric Foam Cushioned Seat with Options of 3D Mesh Backrest: (SD01) Grey, (SD03) Green, or (SD05) Black

Ergonomic Features:
- Tilting (AT) Mechanism w/ Upright Lock
- Height Adjustable Lumbar Support
- Fixed Armrest with Durable PP Armpads
- Internal Black Frame with Grey Lumbar
- Black Nylon Starbase with Reinforced PU (Quiet) Castors
- BIFMA Quality Certified Class-3 Gas Lift
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Dimensions: 605 x 690, H985mm
Note: ON ORDER BASIS. Leadtime 8-10 Weeks'),
('72676ffe-f6af-43ba-8c1e-d6ffc82cd62d', 'Ergo+ Highback Chair in SD Mesh Back 1D Armrest & Black Frame:
Black Fabric Foam Cushioned Seat with Options of 3D Mesh Backrest: (SD01) Grey, (SD03) Green, or (SD05) Black
 
Ergonomic Features:
- Advance Synchronized-Tilting (AST) Mechanism
- 3-Position Recline Lock
- Height Adjustable Lumbar Support
- 2D Height and Angle Adjustable Headrest
- Adjustable Armrests with Durable PU Armpads
- Internal Black Frame with Grey Lumbar
- Black Nylon Starbase with Reinforced PU (Quiet) Castors
- BIFMA Quality Certified Class-3 Gas Lift
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Dimensions: 680 x 680, H1110mm
Note: ON ORDER BASIS. Leadtime 8-10 Weeks'),
('40c69866-6121-4c95-9cd4-6ec089c230ad', 'Essens (Black+Black Marble) Round Center Coffee Table with PET Legs - 1000, H400mm:
Top Material: 1000mm Black Lorient Eco-Marble with Soft Curving edges (w/ Sustainable and Antimicrobial Certificates)
Leg Color is Black Matte Textured Finish
Round polyethylene base Ø45cm for coffee tables with height 40cm.
This base allows to build tables with round tops of up to Ø100cm and oval tops of 110x70cm. The inner counterweight is included.
Center Leg has pipe for wire management cable access
Manufactured by Inclass, Spain
Designed by Jonathan Prestwich
Overall Dimension: 1000, H400 mm (round tabletop)
Warranty: 5 Years
Note: Top is Subject to Production Schedule.'),
('fe9dbd1d-5e40-4160-b2c6-cc33df9cfbbc', 'Essens (Stone+White Marble) Round Side Coffee Table with PET Legs - 500,H450mm:
Top Material: 500mm White Eco-Marble with Soft Curving edges (w/ Sustainable and Antimicrobial Certificates)
Leg Color is Stone (Khaki Beige Finish)
Round polyethylene base Ø22cm for side tables with height 44cm.
This base allows to build tables with round tops of up to Ø50cm. The inner counterweight is included.
Center Leg has pipe for wire management cable access
Manufactured by Inclass, Spain
Designed by Jonathan Prestwich
Overall Dimension: 500, H450 mm (round tabletop)
Warranty: 5 Years
Note: Top is Subject to Production Schedule.'),
('85b61569-6601-4450-ba29-dc9063e2bd44', 'Gran 1-Seater Sofa in Z13 Vegan Leather and Khaki Fabric - Seat - 860*820,H760mm:
Backrest Finish Options: Black, Meteor Grey, Red, Roman Tan and Khaki Beige (Z13)

This luxurious 1-seater sofa features a stunning post-modern minimalist curving shape.
Backrest: Z13 vegan leather with plush internal cushion & curving armrest/backrest
Seat: Upholstered in special textured Khaki Fabric (MK01)
Detail: Stainless Steel Round Mirror Decorative Clasp
Eco-friendly wood frame and high-density foam for lasting comfort
Designer: Claudio Bellini (Milan, Italy)
Dimensions: 860 x 820, H760mm
Warranty: 5-year
Note: ON ORDER BASIS. Lead time is 8-10 Weeks'),
('8d2cb879-22c6-445f-a6c2-3729cc654705', 'HEADBOARD (FULL WALL):

Ref Code: F9-01
Material: Textured Fabric
Size: 469.5W x 140H
Note: Fabric to be supplied by client'),
('824ef2fa-1e01-427c-a13e-0882f79cc546', 'HEADBOARD:

Ref Code: F10-02
Material/Finish/Color: Fabric with Wooden Base
Size: 220 x 220 HB HT : 120
Note: Client supplied fabric & matress excluded'),
('84e629aa-d05c-452c-b883-f9823d71a36f', 'HEADBOARD:

Ref Code: F7-01
Material/Finish/Color: Fabric with wooden frame
Size: 445 x 140 cm 
Note: Fabric to be supplied by client'),
('3140c2a9-42e6-44cb-a360-8a0c6068b98c', 'Maddi Executive Desk with Credenza Return in CF26 Khaki or CF42 Mocha Oak MFC - 1800 1325,H750mm:
Option 1: CF26 Dark Khaki Main Finish with Meteor Grey undertones
Option 2: CF42 Mocha Oak Main Finish with Meteor Grey undertones
Top: Curved MFC in two finish options
Features: Wire management (2 power, 1 data, grommet), concealed lock in drawers, modesty panel
Legs: Anodized Grey Matte electroplated aluminum legs
Storage: Credenza return with pull-out shelves, CPU holder, and swing door cabinet
Sustainability: E0 environmental wood board
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Dimensions: 1800 x 1325 x H750mm
Warranty: 5 years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('a7dfcab4-a8a7-4aa9-9fd2-d5680d5eda3a', 'Maddi Executive Desk with Credenza Return in CF26 Khaki or CF42 Mocha Oak MFC - 2400*1900,H750mm:
Option 1: CF26 Dark Khaki Main Finish with Meteor Grey undertones
Option 2: CF42 Mocha Oak Main Finish with Meteor Grey undertones
Top: Curved MFC in two finish options
Features: Wire management (2 power, 1 data, grommet), concealed lock in drawers, modesty panel
Legs: Anodized Grey Matte electroplated aluminum legs
Storage: Credenza return with pull-out shelves, CPU holder & swing door cabinet
Doors: Black Acrylic Doors with Leather Handle
Sustainability: E0 environmental wood board
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Dimensions: 2400 x 1900 x H750mm
Warranty: 5 years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('004b6e26-5b45-4cbd-bcb6-3717703813bf', 'Maddi Rectangular Meeting Table in CF26/CF42 - 
2800*1400*750 mm:

Top Finish Options: 25mm MFC (CF26 Dark Khaki, CF42 Mocha Oak)
Frame: "A" Shape Anodized Aluminum Leg
Wire Management: Standard with 1 double-flip cable box (with bottom box, without socket) and Optional FGN 14.07 serpentine tube on line.

Made from high-quality E0 grade environmental wood board
Designed by Claudio Bellini (Milan, Italy) 
Dimensions: W2800 x D1400 x H750mm
Warranty: 5 Years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks'),
('6ce7788c-2ab5-48df-b076-6115d0920297', 'Maddi Round Meeting Table in CF26/CF42 - 
D1200,H750mm:
Top Finish Options: 25mm MFC (CF26 Dark Khaki, CF42 Mocha Oak)
Frame: 3 Pyramidal Anodized Aluminum Leg
Made from high-quality E0 grade environmental wood board
Designed by Claudio Bellini (Milan, Italy)
Dimensions: D1200, H750mm
Warranty: 5 Years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks'),
('a42b9413-7d9f-41ab-b729-35c5606197dd', 'NIGHSTAND:

Ref Code: F10-04
Material/Finish/Color: Travertine Finish
Size: 45W x 40D x 40H'),
('25fc514a-23d9-4fe2-8c23-6e8c11c96700', 'NIGHT STAND (FIXED IN HEADBOARD):

Ref Code: F8-03
Material/Finish/Color: Solid Wood / Veneer 
Size: 30 x 30 x 15H cm'),
('dbfa531c-ae3c-4163-a36b-41f2eb906f6f', 'Norway Reception Counter for 1-2 Pax in CF09 or CF12 Walnut MFC - 3100*800*1010mm:
Experience the captivating design of the Norway Executive Collection. This exquisite Walnut melamine finish worktop that exudes elegance and style. This reception counter ensures an impressive first impression.

Finish Option 1: CF09 Log Walnut MFC
Finish Option 2: CF12 Coffee Walnut MFC

Materials: Walnut MFC in various options 
Panel Legs are in Lacquered Meteor Grey 
Upper Panel in Upholstered Dark Grey Vegan Leather
Wire Management: Optional Add-on
Desk Dimensions: 3100 x 800, H1010mm Table Height is 750mm
Warranty: 5 Years'),
('21036d97-1fe3-43d5-88a6-9bac9f070b25', 'OTTOMAN:

Ref Code: F5-03
Material/Finish/Color: Fabric
Size: 110 x 110 cm
Note: Fabric to be supplied by client'),
('fed747ac-3c5b-4535-aaf7-86055db76e1c', 'POUF:

Ref Code: F1-06
Material/Finish/Color: Fabric with Wooden Legs
Size: 45 x 45 cm
Note: Fabric to be supplied by client'),
('64c62d4c-e748-440d-aca9-a995f7adee32', 'POUF:

Ref Code: F4-08
Material/Finish/Color: Custom in Pierre Frey Gabriel F4065012 - Acajou
Size: W65 x D65 cm
Note: Fabric to be supplied by client'),
('6f28e6e6-30eb-4c3e-95ce-b243f9b9e31f', 'Planet Face-to-Face Workstation Cluster of 10 in various MFC finishes - 7000*1400mm (Black or White):

Configuration: 10-Person Workstation Cluster
Top: 18mm Melamine (5 Different Finishes Options)
Top Material: Finsa MFC Boards from Spain (Anti-bacterial, Sustainable)
Frame: O-Shape Steel (Black or White Epoxy)
Wire Management: Flip-Top Box (10pcs) + Center Leg as Cable Riser (4pcs)
Manufactured by BAFCO in the UAE.
Warranty: 5 Years
Individual Desk Size: 1400 x 700, H750mm
Overall Dimensions: 7000 x 1400, H750mm
Note: Limited stock available. Manufactured in the UAE.'),
('66674f41-6afb-4d40-88f7-7d9381d11bc4', 'Polestar+ Ergonomic Highback Chair in SD Mesh Back with Sunday Upholsted Seat & Black Frame: 
Fabric Options: 10 different MA Sunday Fabric Options for Seat Upholstery
(Ink Grey, Khaki, Coffee, Grey, Indigo, Blue, Yellow, Green, Red Orange & Rose Red)
Mesh Options: 10 different SD Concorde Mesh Options for Backrest Upholstery
(Black, Dark Grey, Grey, Khaki, Blue, Dark Blue, Yellow, Green, Orange & Red)
Ergonomic Features:
- Self-Adjusting Advance Synchronized-Tilting (SAST) Mechanism
- 4-Position Recline Lock
- Seat Depth Adjustable (Seat Sliding)
- Height Adjustable Soft PU Lumbar Support
- Height Adjustable Headrest
- Armrests: 3D Adjustable Armrest with Soft PU Armpads
- Frame: Internal Black Nylon Frame with 10 Different Mesh Upholstery Options
- Base & Castors: Black Nylon Starbase with Reinforced PU (Quiet)
- Certificate: BIFMA Quality Certified Class-3 Gas Lift
- Dimensions: 640 x 710, H1190mm
- Designer: Claudio Bellini (Milan, Italy)
- Manufacturer: Kano
- Warranty: 5 Years
 Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('0049deec-f0d5-4915-99a7-85c8feb9ae2b', 'SOFA:

Ref Code: F1-05
Material/Finish/Color: Fabric
Size: W380 x D110 x 130cm
Note: Fabric to be supplied by client'),
('758fab12-7cf9-48f5-8142-92eba5a4e129', 'SOFA:

Ref Code: F10-05
Material/Finish/Color: Fabric
Size: 270 x 90 cm
Note: Fabric to be supplied by client'),
('bdfa5863-628a-4b45-9e68-d83f47ba5317', 'SOFA:

Ref Code: F15-01
Material: Solid Wood with Outdoor Fabric
Size: 330 X 125 cm
Fabric PC Rate: 100 AED per meter'),
('8540a720-1bea-47b0-838f-4abdc8646404', 'SOFA:

Ref Code: F4-05
Material/Finish/Color: Custom in Pierre Frey Gabriel F4065012 - Acajou
Size: W380 x D110
Note: Fabric to be supplied by client'),
('8184e7cf-a9e3-4e53-9dfd-d456f5ce2a88', 'SOFA:

Ref Code: F5-01
Material/Finish/Color: Fabric
Overall Size: 440 x 110 cm
Chaise Size: 160 x 110 cm
Note: Fabric to be supplied by client'),
('47a1ffc2-5ac9-468a-9e33-e127e5680276', 'SPA BED:

Ref Code: F12-01
Material: As per reference image in travertine finish
Size: 180 x 60 cm
Note: Fabric to be supplied by client'),
('c0cf6798-4076-4bed-8363-a2bcdbcee89a', 'SUNBED:

Ref Code: F11-01
Material/Finish/Color: Solid Wood with Outdoor Fabric
Size: 90 x 200 cm
Fabric PC Rate: 100 AED per meter'),
('92110c1e-5978-438b-88b5-8bd421d79b4f', 'Secure Executive Armchair in Z13 Vegan Leather - 
650*650,H730mm:
Finish Options: Z13 Clemence Vegan Leather Family 
(Black, Grey, Red, Roman Tan or Khaki Beige)
Z13 Vegan leather upholstery with soft internal Molded Body
Solid wood and board frame with high-density foam for lasting comfort and sustainability.
Crafted by renowned designer Claudio Bellini (Milan, Italy)
Dimensions: 650 x 650, H730mm
Warranty: 5-year
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('5c99a2a6-20eb-440c-b943-68dce635406d', 'Staryo Visitor Chair in Black PP Shell with Chrome 4 Legs with Wheels:
Black Polypropylene (PP) Shell for Seat and Back TA02 Bluish-Grey Fabric Upholstered Seat
Fixed Armrest in Meteor Grey Finish
Chrome Electroplated 4 Legs with Quiet Castors
Dimensions: 520 x 545, H845mm
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Warranty: 5 Years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('fc5d4190-035f-4461-989f-565195b3188f', 'Staryo Visitor Chair in White, Red or Green PP Shell with Chrome 4 Legs:
White, Red or Green Polypropylene (PP) Shell for Seat and Back Chrome Electroplated 4 Metal Legs
Dimensions: 520 x 525, H855mm
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Warranty: 5 Years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('5f2b0c88-a7e6-44df-a226-497fe01d4992', 'Supply and installation of custom-made shower bench within shower area, including structural frame, moisture-resistant cement board backing, waterproofing membrane, and tile finish to match existing shower wall and floor tiles. Works to include alignment, sealing of all joints, surface finishing, protection of adjacent areas, and final site cleaning — complete in all respects as per approved design and specifications.

Finish: Matching tile finish (as per bathroom tile design) - mosaic tile
Structure: Galvanized metal or stainless steel frame with cement board and waterproofing layer
Location: Bathroom 01 - Shower Area'),
('45577a64-170b-43f6-a725-92976e2afda3', 'Supply and installation of shower bench with 2 cm stone finish over cement board structure, including fabrication of a moisture-resistant cement board support frame, proper fixing and reinforcement, installation of 2 cm thick stone slab with edge finishing, sealing of joints, waterproofing treatment at interfaces, alignment, and site cleaning. Works to include all materials, labor, tools, and protection — complete in all respects as per approved drawings and stone finish sample.

Size: 960 mm (L) × 400 mm (D) × 80 mm (H)
Materials:
- Structure: Moisture-resistant cement board with framing supports
- Finish: client supplied 2 cm thick stone (external finish)
Location: Master Bathroom - Shower Area'),
('cbb4b4ca-1cd8-498a-8a86-f7565aa03846', 'Universal 2-Level Swing Door Cabinet in 11 MFC Options w/ White or Dark Grey Body - 800*400 750mm:

Outer Body Finish Options: CF05 White or CF17 Meteor Grey
Main Door & Top Finish: 11 Different MFC Colors (CF01, CF05, CF06, CF08, CF09, CF12, CF16, CF17, CF39, CF41, or CF42)
Sustainability: E0 environmental wood board (18mm thick)
Warm Dark Grey Aluminum Alloy trim detail on chamfered corners
Foldable central locking key mechanism for added safety
4 pcs integrated foot adjustor for uneven floor level
2 pcs silver colour ABS linear handles
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Dimensions: 800 x 400 x H750mm
Warranty: 5 years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('6607d3f5-2716-475d-bda0-cffb2fb45286', 'Universal 3-Level Executive Credenza in 11 MFC Options w/ White or Dark Grey Body - 1800*400*1100mm:
Outer Body Finish Options: CF05 White or CF17 Meteor Grey
Main Door & Top Finish: 11 Different MFC Colors (CF01, CF05, CF06, CF08, CF09, CF12, CF16, CF17, CF39, CF41, or CF42)
Sustainability: E0 environmental wood board (18mm thick)
Warm Dark Grey Aluminum Alloy trim detail on chamfered corners
2pcs Foldable central locking key mechanism for the drawers
Integrated foot adjustor for uneven floor level
3-Level Open Shelf for easy accessibility or display
Designer: Claudio Bellini (Milan, Italy)
Manufacturer: Kano
Size: 1800 x 400, H1100mm
Warranty: 5 years
Note: ON ORDER BASIS. Lead time is 8-10 Weeks.'),
('8236cd32-f8c3-4f52-b957-c6755fdf7753', 'Universal Lumbar Loose Pillow in Sunday or Bastille Fabric Options - 600*300*150mm:
Finish Options: Teal Blue, Cyan, Green, Light Grey, Yellow and Salmon Pink 
Chic Fabric: Luxurious Textured Hemp Fabric called Bastille

Finish Options: Ink Dark Grey. Light Khaki, Coffee, Light Grey, Indigo Blue, Blue, Yellow, Green, Rose Red and Red Orange
Chic Fabric: Luxurious Polyester Linen Like textured fabric called Sunday

- Acoustically Rated and Fire-Retardant Fabric
- Non-deforming resilient inner filler
- 600 x 300mm, thickness150mm
- 5 Year Warranty'),
('bf83e1f3-2d6d-4f60-b4d6-465b88700ad0', 'WALL HEADBOARD DESIGN:

Ref Code: F10-01
Material/Finish/Color: As per reference image fabric in Pierre Frey Toundra F3928004 - Ambre
Size: 379.5W x 310H (Full Height)
Note: Fabric to be supplied by client'),
('3affaa32-3695-42cd-ad55-26f35b0a8d64', 'Fabrication, Supply & Installation of Aluminum 1 Shutter Swing Door by (Thermal Break) Aluminum Systems

Size: 1.50m L x 2.80m ht

Glass Specification: 
Vision Glass: 24mm Thick DGU Glass (6mm Thick HD Gray Tempered Glass + 12mm M/F Spacer + 6mm Thick Clear Tempered Glass)
Profiles: Frame, Shutter, Bottom, Glass Bead, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved Powder coated color.
Note: Pricing is provisional and subject to final design approval, glazing specification, hardware selection, finish, and structural requirements.'),
('30d9a5f7-fac3-4ce7-95af-0a4d9d9c2e53', 'Fabrication, Supply & Installation of Aluminum Curtain Wall Fix Window (1 point 90º Corner) with 1 shutter top hung openable window by (Thermal Break) Aluminum Systems.

Glass Specification: 
Vision Glass: 28mm Thick DGU Glass (6mm Thick HD Gray Tempered Glass + 16mm M/F Spacer + 6mm Thick Clear Tempered Glass)
Profiles: Transom/ Mullion, Pressure plate, Cover cap, Glass Support, Gaskets, Silicon Sealant & All Accessories.
RAL Color: As per Approved Powder coated color
Overall Size: 6.22m L x 3.595m ht
Location: FF Family Room

Note: Pricing is provisional and subject to the final approved design, structural calculations, aluminum system, glass specification, finish, hardware schedule, and engineering requirements.'),
('b5cf5a88-031b-4046-ace2-de4c7ddce210', 'Glass Manifestation

Supply and installation of glass manifestation, including all necessary items required for fixing.

Considered height up to 2.0m high 
Location: VIP lounges, 9 pax meeting room'),
('bd249fc4-9f33-4f61-8e03-8bc3003f5bd5', 'Glass Mat Gypsum Board Partition - Option 3

Supply and installation of 265mm thk straight Glass mat gypsum board partition including all necessary supports and accessories required.

Height considered - 4000mm H 
Brand: Gypsemna or equivalent 
Location: Toilets, Pantry, Janitor room
Note: Partitions in between toilet cubicles are excluded, as these are considered pre-fabricated cubicles and will be provided by SCL.'),
('389fb4cb-37e8-4a03-86a6-6051b8181cbc', 'MDF CNC in Metallic Paint & Tinted Mirror - Option 2

Supply and installation of MDF CNC in metallic paint including 6mm thk tinted mirror backing, including all necessary items required for fixing.

Location: Reception, Toilets, Events hall'),
('457998ae-cbf2-44a2-8b15-5d09856dddee', 'Single Glazed Glass Partition

Supply and installation of single glazed glass partition using 10mm thk clear tempered glass (non-acoustic) panel fixed with bronze coated channels, including all necessary accessories required.

Height considered - 800mm 
Location: Cash collecting room'),
('5906da7f-ea5b-47a6-9411-0dd729eed363', 'Supply and Installation of 10mm thk. frosted Shower Glass Partition and Door with mirror finish stainless steel frame

Size: 1100mm W x 2100mm H
Location: Maids Bathroom & Staircase Bathroom'),
('524cd482-af09-4104-8fbe-4b7585684258', 'Supply and Installation of 6mm thk. Clear mirror (refer to design)

Location: Master Bathroom'),
('904e32b2-57c5-4590-8fa8-877a05b93cbb', 'Supply and Installation of 6mm thk. Clear mirror (refer to design)

Location: Office Bathroom, Staircase Bathroom & Maids Bathroom'),
('3d65cc72-c721-494e-b84a-927a2ecea4e3', 'Supply and Installation of Aluminum glazed skylight set - flat circular skylight (4.50 sqm)

Location: Skylight at Staircase roof area'),
('0ca71e13-170a-4595-9fd1-fa9f11ac7dd0', 'Supply and Installation of Fixed Full Height Window (Vetromax F45 Fixed Window) - 2 Panels

Size: 2080mm W x 2650mm H
Location: GF Extended Area'),
('eb8743dc-21ff-475f-a27b-cace8d7136b0', 'Supply and Installation of Fixed Window (Vetromax F45 Fixed Window) - 1 Panel

Size: 950mm W x 2150mm H
Location: FF Lobby Area & Staircase Window'),
('6e182fb7-9475-4a96-ad64-48ec7d2ade5d', 'Supply and Installation of Fixed Window (Vetromax F45 Fixed Window) - 2 Panels

Size: 1500mm W x 2050mm H
Location: GF Office'),
('b6b525ba-5ae9-496c-a6cb-aa6706887ca4', 'Supply and Installation of Fixed Window (Vetromax F45 Fixed Window) - 3 Panels

Size: 2000mm W x 2050mm H
Location: GF Family Room'),
('dbe48bc4-87cf-4892-98a9-7cb5544dff03', 'Supply and Installation of Fixed and Sliding Door (Vetromax S28 Sliding Door)

Size: 2400mm W x 2400mm H (F + S)
Location: GF Living Room'),
('96d02495-b829-462a-9de6-915e2b69ac29', 'Supply and Installation of Fixed and Sliding Door (Vetromax S28 Sliding Door)

Type: 3 Panels - (1 fixed & 2 sliding)
Size: 1700mm W x 2650mm H
Location: GF Extended Area'),
('e3ba53a6-24c9-4610-8e01-12a557c5e140', 'Supply and Installation of Single Leaf Hinged Door (Vetromax Single Leaf Hinged Door)

Size: 900mm W x 1950mm H
Location: GF Store Room'),
('793317c1-3e9a-4cd9-9cc8-d0c3fbd7112d', 'Supply and Installation of Single Leaf Hinged Door (Vetromax Single Leaf Hinged Door) 

Size: 900mm W x 2400mm H
Location: Garage Area'),
('facb8589-6964-499b-b86e-18070a7bf056', 'Supply and Installation of Sliding Door (Vetromax S28 Sliding Door) 

Size: 1950mm W x 2150mm H (F + S)
Location: FF Master Bedroom, Bedroom 01 & Bedroom 02 - Balcony Area'),
('027ac758-9419-4d3e-a879-c2b787a51562', 'Supply and Installation of Window (Vetromax F45 Fixed Window) - 3 Panels

Size: 2000mm W x 1250mm H
Location: FF Den Study'),
('98924321-8d5e-4066-97fb-fb4298f5f3ab', 'Supply and Installation of Window (Vetromax Top Hung Window)

Size: 600mm W x 600mm H
Location: Maids Bathroom, Bathroom 02, Master Bathroom, Walking Closet, & Office Bathroom'),
('c543b6ac-68ba-437a-8d47-427b093045a3', 'Supply and Installation of aluminum door with wood look finish excluding ironmongaries
 
main swing door: 1.266m L x 3.0m ht
fixed panel: 0.608m L x 3.0m ht

Location: Foyer
Ironmongeries: By client'),
('b80e4d58-7eef-4248-bfe4-c9112b7c704a', 'Supply and Installation of glass partition. 
 
- 10mm Clear tempered glass. 
- All Glass tempered as per ASTM (American Society for Testing and Materials) 

Total Size: 1.924m L x 3.0m Ht (Fixed glass with partition)
Location: Foyer'),
('e5925fa3-d0ce-4f6c-b7d7-9e300695aa90', 'Supply and fixed installation of 18mm CURVED tempered CRYSTAL clear glass on BALCONY AND STAIRCASE. Size: 130cmH x 35cm radius Includes adhesive bedding or mechanical fixing as required, leveling, alignment, protection during works, and final cleaning — complete in all respects. 

Material: CRYSTAL GLASS (Polished) 
Supplier: LOCAL Supplier'),
('5588b290-8bc9-4287-8623-75b3d9bfcaa7', 'Supply and fixed installation of 18mm CURVED tempered CRYSTAL clear glass on Internal Living Bar. Size: 130cmH x 35cm radius Includes adhesive bedding or mechanical fixing as required, leveling, alignment, protection during works, and final cleaning — complete in all respects. 

Material: CRYSTAL GLASS (Polished) 
Supplier: LOCAL Supplier'),
('c2498472-cf04-4cfe-b6cc-a4a4b33077b7', 'Supply and fixed installation of 18mm tempered CRYSTAL clear glass on BALCONY AND STAIRCASE. Includes adhesive bedding or mechanical fixing as required, leveling, alignment, protection during works, and final cleaning — complete in all respects.

Material: CRYSTAL GLASS (Polished) 
Supplier: LOCAL Supplier'),
('3ebe5872-bf12-489a-a5ab-2bac889fdc0c', 'Supply and installation of 6mm thick clear mirror panels with timber backing. No metal frame.

Specifications: Guardian or Miro tech - 6mm thk.
Location: GF - Garage
NOTE: Subject to final approved drawings and specifications from Client.'),
('6a4e0725-c2ee-4fbc-a456-3f502ef79e5f', 'Supply and installation of 6mm thick clear mirror with metal frame, backlit LED, and timber backing.

Overall Size: 800mm W x 2925mm H
Location: SF - Massage Room'),
('7e87dc84-0d3d-49e3-83d2-950898c15d1c', 'Supply and installation of 6mm thick clear mirror with timber backing.

Overall Size: 1500mm W x 2000mm H
Location: FF - Wardrobe 2'),
('2173d72d-a633-4615-8684-788e44aaebcd', 'Supply and installation of NEW motorized garage roll-up door as per the approved design and specifications, including all necessary tracks, guides, rollers, motor assembly, control switches, safety sensors, and accessories for complete operation.

Size: ( 3000mm W x 2500mm Ht ) + 200mm Fix Panel
Door Brand: Olymps/Nasco Door
Panel Type: Middle Rib Design
Panel Color (Outside): White - RAL 9016
Panel Color (Inside): White
Motor Type: Somfy
C Rail Length: 3.5m
Panel Length: 2800
Panel Material: Polyurethane - Steel Sandwich Panel
Panel Thickness: 40mm
Lift Type: Standard Lift (SL)
Roller Type: Short Stem
Push Button: Including in offer
Remote Brand: Somfy
No. of Remotes: 4 Nos
Photocell Brand: Somfy
Warranty Period (years): 1 Year
Free Maintenance Period (years): 1 Year (every 4 months) 3 servicing & maintenance'),
('260c2650-e04b-4acc-9184-6c4e501a9efa', 'Supply and installation of aluminum framed 10 mm tempered glass shower partition and door, including all glass panels, frame, hinges, handles, seals, alignment, fixing, cleaning, and protection.

Size: 1.8m L x 3.2m Ht
Location: 2nd Bathroom (3a - 014)'),
('dbfc7907-0c73-45a6-89dd-45704c603ebd', 'Supply and installation of frosted glass panel (1500 mm L × 2200 mm HT) within the aluminum/wooden frame at main entrance, including silicone/gasket fixing, alignment, leveling, door hardware (handles/locks), sealing, finishing, and protection of adjacent surfaces.

Location: Main Entrance Area'),
('17f598aa-ee9d-4974-aaea-7b344f24c9fa', 'Supply and installation of full-height arched glazed partition door with steel frame as per design. Door and frame to be finished in powder-coated metal, with fluted tempered glass infill panels to both faces.

Total Size: 1.928m L x 2.60m Ht

Location: Kitchen Area
Ironmongeries: By client'),
('b4c29f32-1b1a-408f-a822-9bf07fc16b7d', 'Supply and installation of full-height glazed system comprising fixed glass panels on both sides and a central sliding glass door (10mm), complete with aluminum framing system, tempered safety glass, sliding track system, rollers, handles, locking mechanism, fixing accessories, weatherproof sealants, alignment, testing, commissioning.

Total Size: 465cm L x 240cm ht
Location: Master Bedroom
Note: Sizes to be confirmed and Price is provisional; final cost depends on actual site measurement.'),
('fb227130-b891-4c93-bce0-014a7534c8e0', 'Supply and installation of sliding door made of metal framing with ribbed or frosten glass finish, details as per drawing, colour as per approved sample 

Size: 3.8m ht x 1.45m W
Location: Display Shelves Area (Living/Dining)'),
('15f6109e-351b-4de1-b816-a85c22e3f2ac', 'Supply, fabricate, and install full-height curtain wall glazing system comprising powder-coated aluminum mullions and transoms, pressure plates, cover caps, EPDM gaskets, structural silicone sealant, weather seals, drainage provisions, fixing brackets, and anchors.

Size: 102mmL x 3.0m ht
Location: New covered portico'),
('094e399c-2b9b-4552-b1a7-1c898e4b3590', 'Supply, fabrication, and installation of mirror TV unit made of  mm thick tempered dielectric mirror glass with polished edges, fabricated in three vertical panels (two smaller side panels and one central panel for TV), including internal custom aluminum framework for structural support, integration of Samsung QN90 Series 85" Smart 4K TV, mounting, alignment, electrical and AV connection, cable concealment, testing, and final cleaning.

TV Specification: Samsung QN90 Series - 85 inch Smart - 4K TV - High Specification Panel
Total Mirror TV Unit Size: 3450mm W x 2900mm H x 86mm D
Location: GF - Cinema'),
('bec68975-bbc7-4067-95dc-2478152be8fe', 'Supply, fabrication, and installation of shower glass door, comprising 10mm thick clear tempered safety glass, complete with shower glass towel handle/holder, heavy-duty stainless steel hinges, brackets, patch fittings, seals, silicone, fixing and accessories.

Size: 3.0m ht x 0.90m W

Location: Bathroom 01, Bathroom 03, Bathroom 04, & Master Bathroom (tinted glass for shower & WC doors)'),
('58eddcdd-e8e7-4d3e-aed6-2e60da3e1dd3', 'Supply, fabrication, and installation of sliding glass door comprising 10mm thick clear tempered safety glass (or as per approved design), complete with heavy-duty sliding track system, rollers, floor guide, handles, locks, patch fittings, brackets, seals, silicone, and fixing accessories.

Size: 3.30m ht x 1.15m W
Location: Master Bathroom'),
('9bf4723f-09ec-4f0b-85a0-cc14b51e5689', 'Vanity Mirror

Manufacture and installation of Vanity mirror using 6mm thk silver mirror with demister pad, including anti-corrosive coating and all necessary items required for fixing.

Dimensions: 1000mm L x 200mm W x 1800mm H
Location: Sales Gallery & Pre-function - Female & Male toilets'),
('0815d855-4917-4edf-ad1c-6a2d3fdf8e46', 'Removal of existing flush plate and supply & installation of new flush plate, including disconnection, alignment, fixing, sealing, testing, and commissioning. Works to include all labor, tools, consumables, minor adjustments, and site cleaning — complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Type: Bagno Design - Aquaeco
Type: Dual Flush Plate with Rectangular Buttons
Size: 236 x 8 x 152 mm
Finish: Glossy White
Location: Bathroom 01, Master Bathroom & Guest Washroom'),
('974f3b7a-6932-4775-9479-82f1c7ceebf2', 'Removal of existing thermostat & Relocated to proposed 
new location by using necessary materials & control cables, 
Conduit piping, control cable tracing & Termination. 

Location: Master Bedroom & Bedroom 01'),
('4f789a2c-2121-4a6b-96ed-865ffed186aa', 'Removal of existing tile insert floor drain and supply & installation of new tile insert floor drain, including supply and installation of tile inside the drain, alignment to existing drainage system, sealing, testing, and site cleaning. Works to include all labor, tools, consumables, minor adjustments, protection of adjacent finishes, and complete finishing — complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Type: AquaDrain Heavy Duty Tile Drain - (Consentino Tile)
Material: Stainless Steel Grade 316
Location: Bathroom 01 & Master Bathroom'),
('0dee3e88-856c-42c7-a0a0-6ca522309804', 'Removal of existing tile insert rectangular shower floor drain and supply & installation of new tile insert rectangular shower floor drain, including supply and installation of tile inside the drain, alignment to existing drainage system, sealing, testing, and site cleaning. Works include all labor, tools, consumables, minor adjustments, protection of adjacent finishes, and complete finishing — complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Type: AquaDrain Contract Reversible Shower Channel Cover with Tile Insert (Consentino)
Material: Stainless Steel Grade 316
Tile Insert Depth: 12-13 mm
Location: Bathroom 01 & Master Bathroom'),
('dfab072f-3c61-42ed-bea0-e71bae2a1979', 'Removal of existing towel holder and supply & installation of new Universal Heated Towel Rail with Thermostat Heating Control, including wall fixing brackets, concealed power connection, alignment, and testing. Works to include safe removal of existing fittings, sealing of wall penetrations if required, site protection, and final cleaning — complete in all respects as per manufacturer’s specifications and approved sample.

Brand: Bagno Design
Heating Temperature: 40–50°C
Power Rating: 400 Watts
Voltage: AC 220–240 V
Protection Rating: IPX4
Size: 500 × 99 × 800 mm
Finish: Matt White
Includes: Fixing kit
Location: Bedroom 1 Bathroom & Master Bathroom'),
('4d8a36e9-9d73-4c73-882d-ace9113bbe91', 'Supply and Installation of Edge Sanitario ceramic countertop wash basins, including alignment, cutting/fitting of countertop if required, sealing, connection to existing water supply and drainage system, leak testing, minor adjustments, and site cleaning. All labor, tools, consumables (sealant, gaskets, brackets), protection, and minor adjustments included — complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Series: Edge Sanitario
Material/Finish: Ceramic, White

Location: Master Bathroom & Bathroom 01'),
('bc2c633c-36e7-4f43-8246-f964c6affad4', 'Supply and installation of Kludi RAK wall-mounted extra paper roll holder, including alignment, fixing, sealing, protection of adjacent finishes, and site cleaning — complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Type: Kludi RAK
Finish: Chrome Finish
Location: Bathroom 01, Master Bathroom & Guest Washroom'),
('d4f9cc4d-1ab9-4e71-8f03-00b37e1507b1', 'Supply and installation of Rectangular Towel Ring, wall-mounted type, including wall fastening with screws and dowels, alignment, sealing, and final cleaning. Works to include all necessary labor, tools, and minor protection of surrounding finishes — complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Type: RAK Kludi
Material/Finish: Chrome Plated
Shape: Rectangular, rod in square profile'),
('cf9c6c60-3356-46dd-8ef7-0233b2bbeef6', 'Supply and installation of Stratoz deck-mounted tall basin mixers with 2 flexible hoses (1/2”) and non-slotted polished chrome finish pop-up waste, including connection to existing water supply, alignment, testing, minor adjustments, and site cleaning. Works include all labor, tools, consumables, protection of adjacent finishes, and complete installation as per manufacturer’s specifications and approved sample.

Brand/Type: Stratoz – Deck Mounted Tall Basin Mixer
Location: Master Bathroom, Bathroom 01, & Guest Washroom'),
('fe69dade-4f6c-462d-99c1-05325c7b8a7e', 'Supply and installation of dedicated hair dryer socket, including connection to existing wiring, proper fixing, alignment, testing, and commissioning. Works to include all labor, tools, consumables, minor protection, and site cleanup — complete in all respects.

Location: Bathroom 01 & Master Bathroom Area'),
('68296ec6-9f41-40d1-a001-4988fb247e90', 'Supply and installation of linear air grille (850 mm × 90 mm), including supply, fixing, connection to duct, testing, and making good surrounding finishes.

Location: Maids Bathroom (3a - 016)'),
('b0809724-b60c-4b81-b2e5-bc7abdcc9ea2', 'Supply and installation of linear air grille (90 mm × 540 mm), including supply, fixing, connection to duct, testing, and making good surrounding finishes.

Location: 2nd Bathroom (3a - 014)'),
('3d69e042-2625-443e-818c-4dcc579926fc', 'Supply and installation of new double electrical sockets, including connection to existing wiring, proper fixing to wall, alignment, testing, and commissioning. Works to include all labor, tools, consumables, minor protection, and site cleanup — complete in all respects.

Location: Kitchen Area'),
('4877722a-72d0-4192-8174-f1f57c788fc4', 'Supply and installation of recessed LED downlights (3 Nos., 93 mm dia.), including wiring, fixing, testing, and making good ceiling finishes.

PC Rate: Downlights (93mm. Dia.): 120 AED / Nos.
Location: Maids Bathroom (3a - 016)'),
('4c350164-87c5-4f1f-bd13-4793b631bf0c', 'Supply and installation of recessed LED downlights (93 mm dia.), including wiring, fixing, testing, and making good ceiling finishes.

PC Rate: 120 AED / Nos.
Location: Kitchen - (3a - 005)'),
('336aeace-395f-471b-a26b-490b020c9117', 'Supply and installation of wall-mounted double-arm magnifying mirror(s), including alignment, fixing to wall, connection if required, sealing, minor adjustments, protection of adjacent finishes, and site cleaning. Works to include all labor, tools, consumables, and complete finishing — complete in all respects as per manufacturer’s specifications and approved sample.

Brand/Type: Bagno Design - Hotel Wall Mounted Double Arm Mirror Mag x3 
Size: 203 x 505 x 295mm
Finish: Chrome Finish
Location: Bathroom 01 & Master Bathroom'),
('5f00cf57-2697-4af1-bffa-8ad555f00cca', 'Supply, installation, testing and commissioning of fire fighting system and accessories, complete as per civil defense requirements and approved drawings

Note: Affected/Damaged Area Only'),
('835c6195-f542-48c8-9120-48f17bea428c', 'ABRA Seating:
(OPTION 2)

Supply and Installation of Cushioned Seating with Storage with wooden frame on all exposed parts, upholstered with high density foam seat and back rest. Melamine finish for internals. 

Handle: Finger Pull
Carcass: Egger or Equivalent Melamine
Exposed Parts: MDF in Veneer finish'),
('f4a0a051-5303-473b-8e0b-4ccfeed753da', 'Accessories for kitchen:

a. Cutlery Tray - Ash Nordic Finish - Kesseboehmer
b. Hailor Waste Bin - Dark Grey Finish - 450mm - 32 x 2 Litre - Kesseboehmer

Location: Kitchen Area'),
('a7a6debb-b17c-4a59-a540-b3308e8b96ff', 'BASE CUPBOARD:

Supply and installation of base cupboard with veneered MDF for all exposed parts. Finger pull and Blum soft closing hinges. Melamine for all internal parts.

Top/Shutters/Exposed: MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Size: 3040mm L x 540mm ht x 350mm D
Location: ROOM 1.1 Staff Office'),
('f32b74bb-d78c-429d-a806-c6c4d579a286', 'BATHROOM 01 VANITY CABINET

Supply and Installation of vanity unit made with 18mm MR mdf with P.U. paint finish for all exposed parts 18mm premium quality melamine for internal hidden parts Open shelving on either side of sink in p.u. paint finish Blum soft closing drawers runners

Size: 1400mmL x 300mmH x 600mmD
Location: Bathroom 01
Note: 
1. Silestone designed by Cosentino — Et. Calacatta Gold Pulido supply and installation is quoted in separate item (Item C9)
2. Supply and Installation of Wash Basin & Mixer is quoted in separate item (Item 13 & 21)'),
('88856914-ecfb-4a55-aa07-1d382eec5b0d', 'BATHROOM 01 VANITY MIRROR REFIXING

Charges for removal of existing mirror frame removal and refixing

Location: Bathroom 01'),
('3bfd1da1-8244-4af4-a9e7-98a745d00600', 'BED ROOM 01 WARDROBE REMOVAL AND NEW CARCASS, DOOR REUSING

Charges for removal of existing wardrobe and new melamine finish cabinet ,door using existing and repainting, including shelves ,hangers,

Cabinet Size: 2070mmL x 600mmD x 2600mmHT'),
('b34b50fd-a210-4c77-ae44-bf7cfe24aeed', 'BEDROOM-1 ROOM WARDROBE AND TV UNIT

Supply & Installation of wardrobe made of mdf with inside melamine finish including shelf hanger ,door using existing and repainting , tv area wood veneer finish floating table and side panel ,tv panel made of mdf with framing pu paint finish 

Size: 3500mmL x 600mmD x 2000mmHT'),
('c2f906f0-fb4b-4ea2-b9c8-00a82358075e', 'BEDSIDE TABLE IN BEDROOM 01:

Supply and Installation of bedside tables with drawer in MDF with pu paint finish for all external parts. Finger grooved handle with Blum soft closing drawer runners.

Size: 500mmL x 400mmW x 550mmHT'),
('329bbac7-e576-4470-ac8a-43f5ba559305', 'BEDSIDE TABLE: 

Supply and installation of bedside table made of MDF with oak wood veneer finish,details as per drawing 

Size: 500mm x 500mm x 700mmHT'),
('cb213a27-35f0-4e67-8b57-e510a1bd921d', 'BOOKCASE CORRIDOR: 

Supply and installation of bookcase made of MDF with paint finish, details as per drawing colour as per approved 
drawing 

Floating shelf : 1950mm L x 630mm W x 100mm THK - 1Nos 
Shelf : 740mm L x 478mm W x 40mm TH - 4Nos'),
('60772e39-f591-403a-9040-9b016776f255', 'BOOKCASE MASTER BEDROOM: 

Supply and installation of bookcase made of MDF with oak veneer finish, with bottom cabinet and top shelves, details as per drawing colour as per approved drawing 

Size: 1114mm L x 357mm W x 2600mm HT'),
('ad0c94ec-0fcd-4ebb-a89b-16260d9196d6', 'BOOKCASE in Living Room:

Supply and Installation of bookcase with 2nos. of legs in MDF with P.U. high glossy Paint finish. 4nos. of 36mm thk shelves in P.U. high glossy paint finish

Size: 1250mmL x 400mmW x 2500mmHT'),
('1e219d5d-2169-4a54-b224-42d5e8a9c657', 'Bedroom 01 & 02 Passage Wall Cladding:

Supply and Installation of wall feature with Veneered MDF to have decorative grooves that visually blend with DP panel opening

Doors + Panel for DB Panel: not included

Size: 2500mm L x 2600mm ht x 20mm thk.
Location: Bedroom 01 & 02'),
('392d252f-0656-49f9-93d6-85e7c2b184b9', 'Bedroom 01 Cabinet:

Supply and installation of two cabinet made with melamine for carcass and shelves. Veneered MDF for shutters. Finger pull with Blum soft closing drawer runners. Powder coated hanger rods and custom metal handles LED strip lights on power switch. 

Internal/external/shelves: Premium quality melamine (Egger)/ 
18mm (ML)
Shutters: Veneered MDF

Size: 0.78m L x 0.3m D x 2.6m ht
Location: Bedroom 01'),
('d4332c3d-c343-44a0-879a-33c5d2061a08', 'Bedroom 02 Cabinet:

Supply and installation of cabinet made with melamine for carcass and shelves. Veneered MDF for shutters. Finger pull with Blum soft closing drawer runners. Powder coated hanger rods and custom metal handles LED strip lights on power switch.

Internal/external/shelves: Premium quality melamine (Egger)/ 
18mm (ML)
Shutters: Veneered MDF

Size: 3.80m L x 0.60m D x 2.60m ht
Location: Bedroom 02'),
('c2b3cea0-c759-4fb9-bbfa-262889f7a53f', 'Bedroom 03 Cabinet:

Supply and installation of two cabinet made with melamine for carcass and shelves. Veneered MDF for shutters. Finger pull with Blum soft closing drawer runners. Powder coated hanger rods and custom metal handles LED strip lights on power switch

Internal/external/shelves: Premium quality melamine (Egger)/ 
18mm (ML)
Shutters: Veneered MDF

Size: 1.00m L x 0.60m D x 2.60m ht
Location: Bedroom 03'),
('bf24d3a3-079b-4689-9d3d-bd1b5a938f75', 'Bedroom 03, 02 & 01 Bathroom Mirror:

Supply and Installation of vanity mirror with 6mm thk belgium grade mirror on MDF backing and storage behind. Melamine for internals. 

Size: 1.20m L x 1.00m ht x 20mm thk.
Location: Bedroom 03, 02 & 01 Bathroom'),
('2f3daed2-20c4-41f8-bdc2-beae703c7711', 'Bedroom 03, 02 & 01 Bathroom Vanity:

Supply and Installation of vanity with marble countertop. Veneered drawers finger pull with Blum soft closing drawer runners. Melamine for internals. 

Countertop: 20mm thk Natural Marble
Fascia/Drawer fascia: Veneered MDF
Carcass/Internal: 18mm thk premium quality melamine 
Sanitarywares: not included
Budgertory cost for tavertine slab : 4000 aed

Size: 1.40m L x 0.60m D
Location: Bedroom 03, 02 & 01 Bathroom'),
('60a8bc4e-8704-405b-97f0-b1a6abb6a35e', 'Buffet Back Counter

Manufacture and installation of Buffet back counter made of MDF wooden structure with cladding in travertine flexible clay panel finish, Glacier white marble countertop, and fixed shelves, including LED strip light and all necessary items required for fixing.

Dimensions: 8400mm L x 600mm W x 800mm H Location: Pre-function area'),
('4a054148-bc8d-4ca0-984f-6efa3c4c014b', 'Buffet Front Counter

Manufacture and installation of Buffet front counter made of MDF wooden structure with cladding in travertine flexible clay panel finish, U-channel in black finish, and Glacier white marble countertop, including all necessary items required for fixing.

Dimensions: 8400mm L x 800mm W x 800mm H Location: Pre-function area'),
('7a7b2635-4f86-4db2-a070-88f46b93023a', 'CABINET (ELEVATION D):

Supply and installation of cabinet made of MDF 
with wood veneer laminate finish on inside and side panel. including pantry counter, marble finish hanging shelves with concealed wall framing support, marble finish backwall, shelves, doors, drawers, LED strip light below shelf. details as per approved drawing. 

Size: 3900mmL x 600mmW x 3900mmHT
Location: Master Bedroom'),
('620a2137-1c09-4863-8df0-893d56708ec6', 'CABINET WITH TILE CLADDING 

Supply & Installation of cabinet made of plywood framing with tile cladding under storage cabinet made of mdf with inside melamine finish, outside pu paint finish 

Size: 1200mmL x 600mmD x 950mmHT
Note: Tile Cladding is quoted in separate item (Item C16)'),
('bb568fa2-e22b-4063-9832-114daa097e4c', 'CABINET:

Supply and installation of cabinet made of mdf with wood veneer finish cabinet including marble cladding (marble supply by client)'),
('7e48ad4f-9e04-488f-9cca-40c2b47549c8', 'CUPBOARD: 

Supply and installation of cupboard made of MDF with inside melamine finish and outside PU paint finish 

Size: 694mm L x 600mm W x 2400mm HT'),
('39a02e26-c01d-4846-a5b0-76c25b555024', 'Cabinet : 

Supply and installation of cabinet made of MDF with inside melamine and outside wood laminate finish including hidden door shelves, marble cladding, colour as per approved sample, details as per drawing. 

Marble rate: 600/sqm 
Size: 6690mmL x 2700mmW
Location: GF - Pantry

Note: Pricing is provisional and subject to the final approved joinery design, material selection, hardware schedule, and shop drawings.'),
('013b4eef-dda0-467e-8bad-53366a478a30', 'Café Back Counter

Manufacture and installation of Café back counter made of MDF wooden structure with cladding in veneer finish, engineered stone or corian countertop, and 2 layers fixed shelves, including LED strip and all necessary items required for fixing.

Dimension: 6100mm L x 600mm W x 900mm H 
Location: Sales area'),
('a502f7ff-60f1-484b-9db2-d8be9164878d', 'Careful cutting and formation of a new door opening in existing blockwall, including demolition of required portion, structural edge preparation, lintel provision (if required), reinforcement, plastering, alignment, and making good to surrounding finishes, ready for door installation.

Location: Bedroom 03/Office Room'),
('109ea54a-6313-4456-bb64-42b76c6ab852', 'Careful dismantling, relocation, and reinstallation of existing wooden door including frame and ironmongery, from current position to new designated opening, including protection, transportation within site, re-fixing, alignment, adjustment, and making good.

Location: Bedroom 03/Office Room'),
('dbcc15c5-b427-4547-b843-1331891330d2', 'Cash Collecting Table

Manufacture and installation of Cash collecting table made of MDF wooden structure with cladding in travertine flexible clay panel finish, solid surface countertop, including all necessary items required for fixing.

Dimension: 4740mm L x 600mm W x 900mm H
Location: Cash collecting room'),
('70f8c111-8304-4f18-bf90-2136f563f3b0', 'Chipping of wall to provide electrical provisions for TV unit, including careful removal of existing plaster/concrete, making channels for conduit and wiring, debris removal, and making good surrounding surfaces.

Location: GF TV Room'),
('1bf8a52d-b0e7-4dc9-9234-4ce83ecb4425', 'Countertop:

a. Stone: Taj Mahal Quartzite: Countertop, Bullnose Edges, Backsplash, Island Countertop, Stone Lamination

Location: Kitchen Area'),
('fc1dceec-01ba-4503-8285-c53d4d29da4b', 'DESK:

Supply and Installation of desk with cabinet and drawers below. Veneered MDF for most exposed parts. Finger pull with Blum soft closing hinges and drawer runners. Melamine for all internal parts Cladding in ceramic tiles.

Top/Fascia/Exposed: MDF in veneer finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Stone Rate considered: 500/sqm
Size: 2600mm L x 900mm ht x 900mm D
Location: ROOM 2 Entry Hall'),
('bcba3ad2-5cb7-4c73-b636-49ea8e1d77d5', 'DISPLAY SHELVES (GROUND FLOOR):

Supply and installation of display shelves made of MDF with fabric finish cladding, 5mm thick black 
aluminium profile strip, wood veneer laminate finish on side panel, stone cladding natural stone on wall finish, 10mm thick stone shadow gap on skirting. including wood veneer laminate hanging shelves with concealed LED strip lights and wall framing support on drawers, shelf, details as per approved drawing. 

Size: 3730mmL x 600mmW x 4050mmHT'),
('4f8e466d-adfa-4288-bda3-1a3edbcb93a2', 'DISPLAY SHELVES:

Supply and Installation of wall mounted display shelves with veneered MDF for shelves and 3 nos of decorative back panel in marble

 Size: 900mm L x 1000mm ht x 270mm D
Location: ROOM 2 Entry Hall'),
('b5c487a8-c7f2-465f-8292-49f2b3e73656', 'Dining Area Low Cabinet:

Supply and installation of low cabinet with drawers. Natural marble countertop. Veneered MDF for drawer fascia and other exposed parts. Finger pull with Blum soft closing drawer runners. Melamine internals

Countertop: Natural Marble
Drawer Fascia/Exposed: MDF with P.U. paint finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Budgertory cost for tavertine slab : 4000 aed

Size: 
a. 1.40m L x 0.50m D x 1.20m ht
b. 1.15m L x 0.30m D x 1.20m ht

Location: Dining Area'),
('ce32ed56-a94d-4c40-af1f-da2be9f79d4c', 'Display Table 1

Manufacture and installation of Display table made of MDF wooden structure with cladding in travertine flexible clay panel finish, U-channel in black finish, 100mm high metallic PU paint finish, bottom shadow skirting, and MDF table top, including all necessary items required for fixing.

Dimension: 6700mm L x 4700mm W x 750mm H 
Location: Sales area
Note: Scale model to be provided by Client'),
('f780af11-0c16-47aa-bd54-776995bbdda3', 'Display Table 2

Manufacture and installation of Display table made of MDF wooden structure with cladding in travertine flexible clay panel finish, U-channel in black finish, 100mm high metallic PU paint finish, bottom shadow skirting, and MDF table top, including all necessary items required for fixing.

Dimension: 2300mm L x 1650mm W x 750mm H 
Location: Sales Area
Note: Scale model to be provided by Client'),
('575def8a-c8eb-49c3-84c3-edbc0cf52c02', 'Display Table 3

Manufacture and installation of Display table made of MDF wooden structure with cladding in travertine flexible clay panel finish, U-channel in black finish, 100mm high metallic PU paint finish, bottom shadow skirting, and MDF table top, including all necessary items required for fixing.

Dimension: 1100mm L x 760mm W x 750mm H 
Location: Sales Area
Note: Scale model to be provided by Client'),
('95cac16a-00a2-43f4-80e6-381423d5c583', 'FAMILY AREA TV UNIT (FIRST FLOOR):

Supply and installation of family area tv unit made of MDF with wood veneer finish, stone finish on back wall, laquer paint finish, lacquer paint finish on open shelf area and side panel. including pantry counter with top marble finish, cabinet, shelf, doors, marble finish hanging shelves wall framing support & LED strip lights. details as per approved drawing. 

TV unit size: 1300/TBC 
Size: 6770mmL x 640mmW x 3300mmHT 
Marble Rate considered: 850.00 AED/sqm'),
('502245a4-31ee-48a6-b527-4696ce72ab87', 'FAMILY POWDER ROOM VANITY COUNTER: 

Supply and installation of vanity counter made of MDF with wood laminate finish, fluted design, counter top marble finish, LED strip light as per approved sample, details as per drawing.

Size: 2450mmL x 720mmW x 1050mmHT
Marble rate considered: 700.00 AED/sqm
Note: Excluding mixer'),
('60f8cf35-7b2a-4ac3-bcc6-d8e228292744', 'FF - Family Living TV Unit:

Supply, fabrication & installation of TV unit in MDF, MDF shelves in white paint, drawers in MDF with oak veneer finish as per drawing (Marble is not included in this item)

Overall Size: 6650 x 450 x 3000mm
Location: FF - Family Living Area
Note: LED Light included'),
('7bccdd67-d976-4d7d-b1c9-bb72514b6d23', 'FF - Study Room:

Supply, fabrication, and installation of Divider in MDF w/ LED strip lighting, drawers in MDF with oak veneer finish as per drawing (Marble is not included in this item).

Location: FF - Study Room'),
('3f5a1141-b65f-4f80-ba4c-14f8b2112590', 'FF BATHROOM 1 VANITY COUNTER : Supply and installation of vanity 
counter made of 18mm MR MDF with inside melamine finish and outside 
oakwood veneer finish,includinG corian top, colour as per approved 
sample 
(Excluding washbasin and mixer) 
Size :1200mmLx600mmX450mmHT'),
('1828ce78-e11a-4438-beb1-e8dda746fb77', 'FF BATHROOM 3 VANITY DRAWER : Supply and installation of vanity 
counter made of 18mm MR MDF with inside melamine finish and outside 
oakwood veneer finish,including corian top colour as per approved 
sample 
(Excluding washbasin and mixer) 
Size :1200mmLx600mmX450mmHT'),
('c71bd9a3-3c0e-4958-b0e8-49ec0a117f17', 'FF BEDROOM 01 WARDROBE : Supply and installation of wardrobe made 
of MDF with inside melamine finish and outside PU paint finish,including 
skirting,LED lighting,hanger rod,drawers,shelves , details as per drawing, 
colour as per approved sample 
Size :1900mmLx600mmX2800mmHT'),
('2b9f1f15-6295-4aac-bc01-feec9117ef0d', 'FF BEDROOM 02 WARDROBE : Supply and installation of wardrobe made 
of MDF with inside melamine finish and outside PU paint finish,including 
skirting,LED lighting,hanger rod,drawers,shelves , details as per drawing, 
colour as per approved sample 
Size :4260mmLx600mmX2800mmHT'),
('3031d665-c11f-4ea0-ab32-359ac3fcb1ec', 'FF BEDROOM 03 SILVER MIRROR: Supply and installation of mirror 6mm 
thk with 1.2mm thk black powder coated metal frame, details as per 
drawing, colour as per approved sample 
Size :1590mmLx1900mmHT'),
('493e62ee-7031-42e7-90d0-79b7e3b005b4', 'FF BEDROOM 03 WARDROBE : Supply and installation of wardrobe made 
of MDF with inside melamine finish and outside PU paint finish,including 
skirting,LED lighting,hanger rod,drawers,shelves , details as per drawing, 
colour as per approved sample 
Size :1200mmLx600mmX2800mmHT'),
('0ccbce0a-1def-4cdb-ae64-d73973c9fd30', 'FF BEDROOM 03 WARDROBE, DRAWER UNIT: Supply and installation of 
wardrobe made of MR MDF with inside melamine finish and outside PU 
paint finish,including skirting,LED lighting,hanger rod,drawers,shelves , 
details as per drawing, colour as per approved sample 
Size :1590mmLx600mmX200mmHT'),
('805489b3-39d4-4e08-94e9-e73c314b0d01', 'FF Bedroom Bedbase:

Supply and installation of bed base with upholstered MDF with approved fabric (FB-03) and high density foam. To have proper framework, lift up mechanism, and storage inside. Ottoman bench not included.

Size: 2000mm L x 2000mm W x 400mm ht
Location: Master Bedroom, Bedroom 01 & 03'),
('32583584-4763-4ea2-820a-d1fbb4589120', 'FF Bedroom Headboard Cladding:

Supply and installation of headboard cladding with fabric. 

Inner: Upholstered fabric with high density foam (FB-05)

Size: 3600mm L x 1000mm ht x 80mm thk.
Location: Master Bedroom, Bedroom 01 & 03'),
('557d19b7-8513-4b8f-a751-681c39ccccf3', 'FF FAMILY LIVING WALL CLADDING : Supply and installation of wall 
panel made of MDF with oakwood veneer finish,including 20mm thk 
skirting details as per drawing ,colour as per approved sample 
Size :3990+1270+5130mmLx2800mmHT'),
('605c1bd4-b7fb-43da-b92c-f1b4012dd388', 'FF MASTER BATHROOM VANITY COUNTER : Supply and installation of 
vanity counter made of 18mm MR MDF with inside melamine finish and 
outside fluted desin with oakwood veneer finish,including corian top 
colour as per approved sample 
(Excluding wash basin and mixer) 
Size :3350mmLx600mmX325mmHT'),
('d9698e6d-186d-494b-8898-9fa5e706401c', 'FF MASTER BEDROOM DRAWER UNIT : Supply and installation of drawer 
unit made of MR MDF with inside melamine finish and outside PU paint 
finish, details as per drawing, colour as per approved sample 
Size :1135mmLx480mmX200mmHT'),
('90b838ca-02b0-48b7-94b1-7a965415c7c1', 'FF MASTER BEDROOM SILVER MIRROR: Supply and installation of mirror 
6mm thk with 1.2mm thk black powder coated metal frame, details as per 
drawing, colour as per approved sample 
Size :1135mmLx1900mmHT'),
('05a40c31-80c7-44cc-90db-fe8debf198be', 'FF MASTER BEDROOM WALK IN CLOSET 2 : Supply and installation of 
wardrobe made of MDF with inside and outside PU paint finish,shutter 
glass with balck powder coated aluminium frame with middle handle, 
including skirting,LED lighting,hanger rod ,drawers, shelves , details as per 
drawing, colour as per approved sample 
Size :1150mmLx600mmX2800mmHT'),
('69eac9a6-7a7d-4097-a4bc-bbf61d2d16b2', 'FF MASTER BEDROOM WALK IN CLOSET : Supply and installation of 
wardrobe made of MDF with inside and outside PU paint finish,shutter 
glass with balck powder coated aluminium frame with middle handle, 
including skirting,LED lighting,hanger rod ,drawers, shelves , details as per 
drawing, colour as per approved sample 
Size :3500mmLx600mmX2800mmHT'),
('225c90e8-f632-413e-999e-677b61571542', 'FF SHOW KITCHEN BASE CABINET : Supply and installation of wall panel 
made of MDF with inside melamine and outside oakwood veneer 
finish,,colour as per approved sample , 
(Excluding sink,mixer and all appliances) 
Marble rate considered : 500/sqm 
Size :2585mmLx600mmX900mmHT'),
('e477d225-5a36-4ebc-949c-53512f094a70', 'FF SHOW KITCHEN ISLAND CABINET : Supply and installation of full 
island cabinet made of 18mm MR MDF with inside melamine and outside 
oakwood veneer finish,,colour as per approved sample ,(Marble work 
excluded) 
Size :2300mmLx1100mmX900mmHT'),
('0205ce35-6e09-42a3-999b-5ce242787366', 'FF SHOW KITCHEN ISLAND CABINET TOP : Supply and installation of 
island cabinet wood top made of 18mm MR MDF with oakwood veneer 
finish,,colour as per approved sample 
Size :1600+2600mmLx750mmX900mmHT'),
('548f52ed-cd5b-4a14-967f-2bd78fd015ef', 'FIRST FLOOR NEW DOOR: 
Supply and fixing of frame and architrave made of solid wood with paint finish, door made of hardwood framing, solid core, both side 6 mm layers of MDF with solid wood lipping and paint finish,details as per drawing. 

Note: Including lever, handle, locking and ironmongeries as specified

Size: 1000mmL x 2400mmHT x 245mm'),
('49a71890-f21e-4107-8527-70ac8ae9f4b8', 'FLUSH/JIB DOOR: 

Supply and Installation of Flushed Wooden Door, made of hardwood framing, solid core, both side 6 mm layers of MDF with solid wood lipping and PU paint finish, details as per drawing. 

Size: 900mm L x 2400mm H
Location: Master Bedroom, Laundry/Store Room, Master Bathroom, Guest Toilet Door
Note: New Door Handles will be provided by client'),
('c49a8d2a-3796-41df-81a7-bf88ee1e72b3', 'FORMAL POWDER ROOM CABINETS (ELECTRICAL CABINET):

Supply and installation of cabinets made of MDF with inside laminate finish and outside wood veneer finish. including doors, shelves, LED strip light. details as per drawing 

Size: 990mmL x 435mmW x 3800mmHT'),
('213f9de8-6643-4222-a8fb-953445dfc3f8', 'FORMAL POWDER ROOM CABINETS (TELEPHONE CABINET):

Supply and installation of cabinets made of MDF with inside laminate finish and outdoor wood veneer. including doors, shelves, LED strip light. details as per drawing 

Size: 1210mmL x 470mmW x 3800mmHT'),
('d07814af-2d7e-469e-936d-e59eef597c7f', 'FORMAL POWDER ROOM VANITY COUNTER: 

Supply and installation of vanity counter made of marine plywood with fluted marble finish including LED strip light, as per approved sample, details as per drawing.

Size: 1600mmL x 720mmW x 900mmHT
Marble rate considered: 700.00 AED/sqm
Note: Excluding Mixer'),
('f6cb1d18-ae35-481c-b4d6-17fcbc79efdd', 'FORMAL POWDER ROOM WALL CLADDING:

Supply and installation of cabinets made of MDF with wood veneer finish. details as per drawing. 

Size: 6045mmL x 3800mmHT'),
('8f54e3b6-07b7-418b-9514-3f8841c6f3fa', 'Fabrication, Supply and Installation of Cupboard

Size: 600mm L x 600mm D x 2200mm HT
Location: Utility Room'),
('30c9ed8d-1a0c-4ad1-ad51-26081b8d979a', 'Fabrication, Supply and Installation of TV Console

Size: 2850mm L x 400mm D
Location: Living Room'),
('6f976bfe-08ef-497d-b45f-3fc76d9b4b78', 'Fabrication, Supply and Installation of Vanity Counter, excluding wash basin and mixer

Size: 1300mm L x 300mm HT x 700mm D
Location: Master Bathroom'),
('57c7a112-450f-488a-a87c-f8d1e161a12e', 'Fabrication, Supply and Installation of Walking Closet Cabinet

Size: 3400mm L x 2200mm HT x 600mm D
Location: Walking Closet'),
('00de35f9-ed37-4ccb-ad16-75612f9e1486', 'Fabrication, Supply and Installation of Wardrobe Cabinet (inside melamine, outside PU Matt paint)

Size: 3000mm L x 2200mm HT x 600mm D
Location: Bedroom 02');
insert into scheduler.rate_fix_stage (id, description) values
('7eb1c8ca-6763-496d-be55-4e69e7affb99', 'Fabrication, Supply and Installation of Wooden Wall Partition

Size: 2.5m HT x 1.0m L
Location: at entrance lobby & dining area'),
('6ed988ec-695c-4e36-bd24-b4af95368d78', 'Family Room Display Unit:

Supply and installation of display unit with veneered MDF cladding including floating curved center structure in STONE finish (natural travertine). Veneer shelves. Base console in veneer. Finger pull with Blum soft closing drawer runners. Melamine internals

Wall Cladding: 20mm thk natural travertine
open shelving: veneer finish + vertical dividers (natural travertine)
Base console/Drawer Fascia: Floating shelf: MDF in veneer 
finish
Carcass/Internal: 18mm thk Egger or equivalent melamine
Budgertory cost for tavertine slab : 4000 aed

Size: (1.40m + 4.10m + 1.40m) L x 0.40m D x 2.60m ht

Location: Family Room'),
('70bde145-755d-4dd1-b85c-72a14388c2bf', 'Foldable Doors:

Supply and installation of 4 nos foldable wooden doors made in MR MDF with veneer finish. Including standard folding fitting 

Size: 3035mm Length
Note: It will not be soundproof'),
('c57f1204-efeb-4ed5-ab11-be269d9f4fe4', 'Foyer Architrave:

Supply and Installation of arch architrave made with veneered MDF
Architrave: MDF in veneer finish

Location: Foyer'),
('f0ecbd75-6e33-4ceb-bedd-fcaa8a494453', 'GARMENT STORAGE:

Supply and Installation of garment storage to have hanging storage and drawer at the bottom. SS or black finish hanger rod. Painted MDF for frame and drawer external. Finger pull and Blum soft closing drawer runners. Melamine for all internal parts.

Frame/External: 18mm thk MDF in P.U. paint fninish
Carcass/internal: 18mm thk Egger or equivalent melamine
Size: 1000mm L x 1685mm ht x 500mm D
Location: ROOM 19 Treatment Room'),
('ad154d89-b17c-424e-b9b7-504343d0acbf', 'GF - Formal Living TV Unit:

Supply, fabrication & installation of Formal Living TV unit made of MDF, then shelves in MDF with metallic paint, drawers in MDF with oak veneer finish as per drawing (Marble is not included in this item)

Overall Size: 4800 X 450 X 3000 mm
Location: GF - Formal Living Area
Note: LED Light included'),
('dfd357ff-b512-457f-a556-ad1382301e89', 'GF - TV Room:

Supply, fabrication & install of TV Unit in MDF, drawers in MDF with oak veneer finish, wall molding with paint finish as per drawing (Marble is not included in this item)

Overall Size: 4200 x 450 X 2300mm
Location: GF - TV Room
Note: LED Light Included'),
('99058e61-3d04-4e25-9ce8-fc0f38e5d5e7', 'GF LOBBY WOODEN CLADDING : Supply and installation of wall panel 
made of MDF with oakwood veneer finish,including skirting, details as per 
drawing ,colour as per approved sample 
Size :1000mmLx2800mmHT'),
('55bafbef-9774-4586-bf00-9194e481692f', 'GF LOBBY WOODEN WALL CLADDING : Supply and installation of wall 
panel made of MDF with oakwood veneer finish,including skirting, 
details as per drawing ,colour as per approved sample 
Size :1005+1005mmLx3000mmHT 
Size: 4840mmLx3000mmHT 
Size: 4840mmLx6900mmHT'),
('909ff922-cac2-4515-921e-eaed13d841bc', 'GF PLAYROOM BATH VANITY COUNTER : Supply and installation of vanity 
counter made of 18mm MR MDF with inside melamine finish and outside 
fluted design with oakwood veneer finish,including corian top, colour as 
per approved sample 
(Excluding mixer) 
Size :1200mmLx600mmX450mmHT'),
('3d178d0d-7610-4ac9-8b3b-923415def046', 'GF PLYROOM WARDROBE : Supply and installation of wardrobe made of 
MDF with inside melamine finish and outside white oak wood veneer 
finish,including skirting,LED lighting,hanger rod,drawers,shelves , details 
as per drawing, colour as per approved sample 
Size :1900mmLx600mmX3000mmHT'),
('3446e249-1311-4847-a64e-8234dfc5bd72', 'GF WASHROOM WARDROBE Supply and installation of full cabinet made 
of 18mm MR MDF with inside melamine finish and outside PU paint 
finish,including 20mm skirting ,drawers,handles,hanging doors,LED strip 
light details as per drawing ,colour as per approved sample 
Size :1440mmLx600mmWx3000mmHT'),
('2d86ce3f-d381-4eb7-b261-a35256249590', 'GF WASHROOM WOODEN CLADDING : Supply and installation of wall 
panel made of MDF with oakwood veneer finish details as per drawing, 
including skirting,colour as per approved sample 
Size :275+275+700+275mmLx3000mmHT'),
('75cae50e-be2d-4dd1-a602-fc6e66a7a569', 'GUEST WASHROOM VANITY CABINET
Supply and Installation of vanity unit made with 18mm MR mdf with P.U. paint finish for all exposed parts 18mm premium quality melamine for internal hidden parts 
including 3 nos drawers Blum soft closing

Size: 1430mmL x 300mmH x 540mmD
Location: Guest Washroom
Note: 
1. Silestone designed by Cosentino — Et. Calacatta Gold Pulido supply and installation is quoted in separate item (Item C9)
2. Supply and Installation of Wash Basin & Mixer is quoted in separate item (Item 13 & 21)'),
('026dc0b9-bfdb-4771-86bc-f048d99b8e3c', 'GUEST WASHROOM VANITY MIRROR REFIXING

Charges for removal of existing mirror frame removal and refixing

Location: Guest Washroom'),
('8955b203-7691-4ddb-b322-e8e870ce1d9c', 'Guest Room & Telephone Room New FireRated Door & Frame (90 min): 

a) Removal of the existing damaged door frame and architrave 

b) Supply and Installation of Fire rated door and frame solid beech wooden frame and archtrave wood veneer finish, door made of 60/90 miniute ideal mineral core, wood veneer finish, colour as per approved sample, details as per drawing'),
('4032f644-602d-4a0b-9bca-e931ece96c2c', 'Guest Room Bed Head Board:

Removal of the damaged bed headboard and supply and installation of a new headboard with wood veneer finish and fabric cladding, matching existing room decor. colour as per approved sample'),
('0051e600-70be-4384-87c1-a202e8c42150', 'HANGING VANITY COUNTER (ELEVATION B):

Supply and installation of MDF with wood veneer hanging counter with concealed LED strip lights and wall framing support. including open shelf made MDF with pu paint finish with concealed framing support. details as per approved drawing. (excluding mirror) 

Size: 5600mmL x 350mmW x 750mmHT
Location: Master Bedroom'),
('2128c140-6e0e-4ad1-b54a-00f5c28dc6e8', 'HANGING VANITY COUNTER AND HANGING SHELF (ELEVATION A):

Supply and installation of MDF with wood veneer laminate hanging counter and shelf with concealed LED strip lights and wall framing support. details as per approved drawing. 

Size: 1600mmL x 650mmW x 3550mmHT
Location: Master Dresser'),
('40688b15-13c4-4eb8-8a07-07e041f7ad49', 'High Table

Manufacture and installation of High table made of MDF wooden structure with cladding in travertine flexible clay panel finish, solid surface countertop, including all necessary items required for fixing.

Dimensions: 8400mm L x 800mm W x 1000mm H Location: Pre-function area'),
('3a82efd5-3663-4a4d-85b7-3ab4550e8440', 'Joinery Component 01 - Counter/Bar
(OPTION 1)

Supply and installation of bar counter made of MDF with inside melamine and outside PU paint finish, outside wall MDF with tile finish, colour as per approved sample details as per drawing 

Note: Tile installation charges included, Tile supply by client 
Size: (2985+1240+2985+2985+2015+2985)mm x 700mm W x 1110mm HT 
Inside low height wall: (2985+2985)mm L x 1200mm HT'),
('8c33c05f-a829-4dde-bb06-1d8645c454b9', 'Joinery Component 01 - Counter/Bar
(OPTION 2)

Supply and installation of counter and partition wall with veneered MDF for frame structure and open shelves for reception desk, perforated MDF with same veneer finish for speakers. Pin lights installed at the bottom to point up. To receive brick installation.

Brick supply and installation: by others
Metal cladding will be included upon confirmation of areas to cover
Countertop/Open Shelf: MDF Veneer
Brick Structures: Sand Brick by Brickhouse Technical Services LLC
OPTION 2: to have proper framework and metal support on wooden structure to stand on its own
Size: (7810 + 2985 + 800 + 2985 + 2985)mm W x 1110mm ht x 150mm D counter,
 2575mm W x 2500mm ht x 150mm D tall partition'),
('94ed90d9-1bf6-4708-a34c-3a907690d50d', 'Joinery Component 01 - Counter/Bar
(OPTION 3)

Supply and installation of counter and partition wall with veneered MDF for frame structure and open shelves for reception desk, perforated MDF with same veneer finish for speakers. Pin lights installed at the bottom to point up. To receive brick installation.

Wall structure: by others
Brick supply and installation: by others
Metal cladding will be included upon confirmation of areas to cover
Countertop/Open Shelf: MDF Veneer
Brick Structures: Sand Brick by Brickhouse Technical Services LLC
OPTION 3: Millworks to be done on a wall structure. The wall will support the weight of the joinery
Size: (7810 + 2985 + 800 + 2985 + 2985)mm W x 1110mm ht x 150mm D counter,
 2575mm W x 2500mm ht x 150mm D tall partition'),
('96b735c4-f545-4135-95a0-538880985099', 'Joinery Component 02 - Supper Table:
(OPTION 2)

Supply and installation of supper table with veneered MDF for table top and legs. To have lift up and down mechanism -- to change height of table. Metal inlay detail as per design

Table Top/Base: Veneered MDF
Table Line Details: Bronze Metal Inlay
Size: 3435mm L x 1200mm W x 750mm HT 
 3 nos. 300Ø x 670mm ht, legs'),
('1b3601f3-d89a-442d-b1b7-639db03c63a4', 'Joinery Component 03 - Dining Table:

Fabrication and supply of table top made of SS brushed electroplat bronze finish, center portion coral stone, leg and base made of SS electroplated bronze finish, colour as per approved sample, details as per drawing 

Size: 700mm L x 700mm W x 770mm HT'),
('3718b8a1-adf2-47bb-b2bc-5854ea8c97f7', 'Joinery Component 04 - Dining Chair:

Fabrication and supply of dining chair made of solid 
wood with wood veneer finish, seat cushion made of high density foam with fabric cladding,colour as per approved sample, details as per drawing.
 
Size: 440mm Dia. x 700mm HT'),
('efbc0ef5-d2d2-484a-b18b-e3b276517b9f', 'Joinery Component 05 - Service Station:

Fabrication and supply of service station made of MDF with wood veneer finish, with storage cabinet and drawer, including stone cladding in groove, colour as per approved sample, details as per drawing. 

Size : 1000mm L x 625mmW x 995mm HT'),
('5b5bdd93-f334-470d-81d8-81763241955e', 'Joinery Component 06 - Lounge Partition + Sofa:

Fabrication and supply of Lounge Partition made of MDF with wood veneer finish, and seating made of high density foam with fabric cladding, colour as per approved sample, details as per approved sample. 

Bigger Partition Size: 5295mm L x 600mm W x 1200mm HT 
Small Partition Size: 4290mm L x 600mm W x 450mm HT 
Sofa Size: 5295mm L x 800mm W x 645mm HT'),
('296e38e9-2ce0-4691-8d73-bc69947f4024', 'Joinery Component 07 - Bench:
(OPTION 1)

Fabrication and supply of bench made of solidwood with wood veneer finish,bottom leg electroplated metal finish, colour as per approved sample, details as per approved sample 

Size: 2435mm L x 395mm HT'),
('d497b8d5-7960-4392-84b4-419b94816872', 'Joinery Component 07 - Bench:
(OPTION 2)

Supply and Installation of bench to be have organic shape wood seating. 2nos of metal cladded legs. Proper metal support as required. 

Size: 2435mm L x 395mm HT 
Bench Surface: Organic Shaped Solid Wood
Bench Base: Metal Finish
Solid wood: supplied by client, fabrication and installlation by us.'),
('225d00de-e81a-4c24-b888-e93d18155afd', 'Joinery Component 09 - Hostess Desk:

Fabrication and supply of hostes desk made of MDF with wood veneer finish, including cork cladding, colour as per approved sample, details as per approved sample 
 
Size: 500mm D x 1100mm HT'),
('383f58b2-586b-4454-bba0-f76993e9b2a2', 'Joinery Component 10 - Storage Unit

Fabrication and supply of storage cabinet made of MDF with inside melamine and out side wood veneer finish, including drawers, colour as per approved sample, details as per approved sample 
 
Size: 4455mm L x 500mm W x 2100mm HT'),
('b787e26c-e287-42a9-aa06-7ff0b80032f1', 'KITCHEN CABINET FOR OVEN 
Supply and Installation of cabinet made of existing joinery items 

Location: Kitchen 
Size: 600mmL x 600mm D x2400 mm HT'),
('e30da7e6-7149-45f3-bd78-5e75ed163c79', 'KITCHEN CABINET: 
Supply and installation of cabinet made of inside melamine and outside PU paint finish, colour as per approved sample (electrical work will be quoted separately) 

Size: 724mmL x 546mmW x 2700mmHT'),
('b11ea484-013a-47bf-ac6c-60eefb3809df', 'KITCHEN CABINET:

Supply and installation of kitchen cabinet made of 
MDF with outside lacquer paint finish, inside melamine finish, outside wood veneer laminated finish on panels, lacquer paint finish, champagne finish on metal handle, dekton porcelain tile on counter top and walls. including doors, slate wood veneer laminate with glass, cabinets, drawers, shelves, cabinet shelves push to open, pull out trash bin, LED strip light below. details and colour as per approved drawing.
 
Marble Rate Considered: 700.00 AED/sqm 
Full height cabinet: 6530+3945mmL x 600mmW x 3800mmHT (Elevation- E+F)
Note: 
1. Excluding sink, mixer and all kitchen accessories and appliances'),
('540181a0-f531-42e6-a665-e7b2fd90907c', 'KITCHEN ISLAND COUNTER UNIT:

Supply and installation of kitchen island counter made of MDF with inside melamine finish, outside wood veneer laminated finish, champagne finish on metal frame, dekton porcelain tile on counter top. including cabinets, drawers, shelves, LED strip light inside the cabinet. details and colour as per approved drawing. 

Size: 4100mmL x 1200mmW x 900mmHT
Marble Rate considered: 700.00 AED/sqm
Note: Excluding all appliances'),
('50454138-04b3-40b6-a495-57cd74bd943c', 'KITCHEN OPEN DISPLAY SHELF
Supply and Installation of open display shelf made of plywood framing with tile cladding.
 
Location: Kitchen Opening
Size: 1500mmL x 600mm D x 40mm HT
Note: Tile Cladding is quoted in separate item (Item C16)'),
('8acac504-194a-46b1-9594-80e6efd2e5ca', 'Kitchen Cabinet

Manufacture and installation of Kitchen cabinet made of MDF structure comprising of bottom and upper cabinets in wood laminate finish with stone countetop.

Dimensions: 7400mm L x 400mm/600mm W x 3000mm H 
Location: Pantry'),
('df29ebbb-64be-4bd9-9469-e6987f402924', 'LAUNDRY CABINET: 

Supply and installation of laundry cabinet made of MR MDF with inside and outside melamine finish, details as per drawing colour as per approved sample 

Size: 1800 + 700mm L x 700mm W x 950mm HT'),
('65854af6-207c-4f22-8f8b-d02b11823ec0', 'LAUNDRY FLOATING SHELVES: 

Supply and installation of floating shelves made of MDF with melamine finish,details as per drawing,colour as per approved sample 

Size: 2800+1850mm L x 600mm W x 38mmHT - 3Nos'),
('14982ae7-2c43-4680-a2c0-c00d05c7152c', 'Laundry Cabinet & Hidden Door:

Supply and installation of laundry cabinet made of MDF with PU paint finish, details as per 3D, Colour as per approved sample (excluding appliances) 

Cabinet : 1000mmLx650mmWx2400mmHT 
Hidden door : 900mmLx2400mmHT'),
('ec28bb70-6c23-4829-8f9f-d386d0588f1a', 'MAID ROOM VANITY CABINET
Supply and Installation of vanity unit made with 18mm MR mdf with P.U. paint finish for all exposed parts 18mm premium quality melamine for internal hidden parts including 1nos drawers Blum soft closing 

Size: 650mmL x 300mmH x 540mmD
Location: Maidroom Area
Note: Supply and Installation of Wash Basin & Mixer is quoted in separate item (Item 13 & 21)'),
('5dbdee24-4513-4bb5-99e2-da6b75576524', 'MASTER BATHROOM VANITY BOTH SIDE MIRROR CABINET WITH CENTRE AREA MIRROR CLADDING ONLY ABOVE VANITY

Supply and installation of mirror cabinet made out of MR MDF shutters, cladding with mirror and carcass inside carcase melamine with LED strip light, details as per drawing 

Size: 1500mmL X 1000MMHT X 120MM'),
('2451df38-1f13-4a2b-9e46-cb0dd2f39173', 'MASTER BATHROOM VANITY CABINET

Supply and Installation of vanity unit made with 18mm MR mdf with P.U. paint finish for all exposed parts 18mm premium quality melamine for interanal hidden parts Blum soft closing drawers runners

Size: 1550mmL x 550mmH x 600mmD
Location: Master Bathroom
Note: 
1. Silestone designed by Cosentino — Et. Calacatta Gold Pulido supply and installation is quoted in separate item (Item C9)
2. Supply and Installation of Wash Basin & Mixer is quoted in separate item (Item 13 & 21)'),
('a9cb8ab9-b3ec-43aa-b323-e81d2da0988a', 'MASTER BATHROOM VANITY COUNTER: 

Supply and installation of vanity counter made 
of metal framing with marine plywood cladding and stone cladding above plywood, including drawers and inbuilt wash basin, LED light, Excluding mixer. Details as per drawing, colour as per approved sample 

Size: 2100mm L x 530mm W x 950mm HT
Note: Stone Cladding & Countertop will be supplied by client'),
('5500e8d1-a978-4b83-a267-c566b4569056', 'MASTER BATHROOM VANITY MIRROR REFIXING

Charges for removal of existing mirror frame removal and refixing

Location: Master Bathroom'),
('19b327f6-3963-456a-a086-c526cc97c1b1', 'MASTER BATHROOM:

Supply and installation of vanity counter made of MDF with marble finish facia, counter top marble finish including LED strip light, as per approved sample, details as per drawing.

Size: 4100mmL x 400mmW x 4500mmHT
Note: Excluding mixer'),
('dd9da56c-a713-4af9-aed0-0c4870696c1d', 'MASTER BED ROOM WARDROBE 

Supply & Installation of wardrobe made of mdf with inside melamine finish, door using existing and repainting , wooden framing for floating table tile cladding (white quartz), including pu paint finish shelf 

Size: 1100mmL x 400mmD x 1900mmHT
Note: White Quartz which client have but need to be cut to size.'),
('aaaf255e-5df3-46a8-ba9e-6b4fa93b7ec7', 'MASTER BEDROOM DESK: 

Supply and installation of desk made of MDF with wood veneer finish, details as per drawing 

Size: 1500mmL x 600mmW x 850mmHT'),
('c82dc712-504a-4882-b7fe-f8a956925d95', 'MASTER BEDROOM HEAD BOARD : Supply and installation of head board 
made of MDF with PU paint finish 
Size : 4240mmLx570mmWx2800mmHT'),
('cb95e37c-a218-4176-9623-08593426f912', 'MASTER POWDER ROOM WALL CLADDING:

Supply and installation of wall cladding made of MDF with laminate finish 

Size: 1140mmL x 4500mmHT'),
('1a576f53-ca38-4cf4-92f9-bee9acb1b9b5', 'MASTER VANITY PULL OUT: 
Supply and installation of new launtry pull out drawer made of inside melamine finish, door using existing

Size: 810mmL x 407mmW x 934mmHT'),
('49012228-0b94-47de-bb19-3c09eb2196bb', 'MASTER WALK-IN CLOSET

Supply & Installation of open closet made of mdf with pu paint finish including shelves, hangers, soft closing drawers, 3000k warm white led lights

Size: 2200mm L x 600mm D x 2600mm HT'),
('9d7494fb-a724-4ff5-a056-5a606805d5c5', 'MASTERS WARDROBE (OPTION A):

Supply and installation of wardrobe unit with
veneered MDF for shutters and other exposed parts, Finger pull and Blum soft closing hinges. Glass shutters with integrated handles and air hinges. Melamine for all internal parts. Black or 
SS finish hanger rods. Internal drawers with same melamine finish, finger pull and Blum soft closing drawer runners. {3000K} LED strip lights on switch control Dresser with marble countertop. same veneer finish for drawer fascia and other exposed parts. Finger pull and Blum soft closing drawer runners. Melamine for all internal parts. Mirror ro be with metal frame, suspended from ceiling. {3000K frontfacing LED strip lights Chest of drawers with same veneer finish for fascia. Tinted glass countertop. Top drawers to be upholstered with velvet for jewelries and accessories. Melamine for all other internal parts 

Shutters/External Drawer/External: 18mm thk MDF in veneer finish 
Shutter/Island Top: 4mm thk tinted glass with metal frame
Carcass/Shelves: 18mm thk Egger or equivalent 
melamine
Dresser top: TBC marble/pocelain
Dresser Mirror: 6mm thk belgium grade clear mirror
Maximum wardrobe height @2.8m, fixed panel on top

Size: (4050 + 2640 + 2550 + 2550 + 1460 + 4230 + 2850)mm W X 600mm D X 3000mm HT wardrobe
 1500mm W X 600mm D X 750mm Ht dresser table
 800mm W X 20mm THK X 2000mm ht dresser mirror
 2nos. 1020mm W X 640mm D X 900mm HT island chest
 1255mm W X 400mm D X 3000mm HT open shelves'),
('f87a7c9e-7c46-474f-a0ce-513dfa8adcec', 'MASTERS WARDROBE (OPTION B):

Supply and installation of wardrobe unit with veneered MDF for shutters and other exposed parts, Finger pull and Blum soft closing hinges. Glass shutters with integrated handles and air hinges. Melamine for all internal parts. Black or SS finish hanger rods. Internal drawers with same melamine finish, finger pull and Blum soft closing drawer runners. {3000K} LED strip lights on switch control Dresser with marble countertop. same veneer finish for drawer fascia and other exposed parts. Finger pull and Blum soft closing drawer runners. Melamine for all internal parts. Mirror ro be with metal frame, suspended from ceiling. {3000K} frontfacing LED strip lights

Shutters/External Drawer/External: 18mm thk MDF in veneer finish
Shutter: 4mm thk tinted glass with metal frame
Carcass/Shelves: 18mm thk Egger or equivalent 
melamine
Dresser top: TBC marble/pocelain
Dresser Mirror: 6mm thk belgium grade clear mirror
Maximum wardrobe height @2.8m, fixed panel on top

Size: (4050 + 5200 + 4230 + 2850 + 1600 + 1000 + 1000 + 1000 + 1000)mm W X 600mm D X 3000mm HT wardrobe,
 2nos. 1200mm W X 600mm D X 750mm HT dresser table,
 2nos. 800mm W X 20mm thk X 2000mm ht dresser mirror,
 1255mm W X 400mm D X 3000mm HT open 
shelves'),
('3cf520d4-825b-4f2b-bc02-2505922927d5', 'Manufacture and installation of custom made bed side table consisting of 1x soft closing drawer in push to open mechanism and marble plinth. Internal carcasses in MFC, table top in faux leather finish, and rest of panels in metallic paint finish. 

Overall Size: 1280mm W x 400mm D x 370mm H
Location: FF - Bedroom 03 Bedside Tables
NOTE: Faux leather supply rate of AED 100/Lm is considered. Marble supply priced separately. Subject to final approved drawings and specifications from Client.'),
('361d5e4b-abff-4dd4-8f04-6fcc6acc4c40', 'Manufacture and installation of custom made storage unit consisting of internal shelves and flat hinged doors in fingerpull. Internal carcasses in MFC and external in metal effect laminate finish.

Overall Size: 210mm W x 200mm D x 1600mm H
Location: GF - Cinema Bathroom Storage Unit
Note: Subject to final approved drawings and specifications from Client.'),
('87a5e48e-fc87-4730-8947-1dc7fd92c847', 'Manufacture and installation of custom made vanity unit consisting of corian countertop, integrated sink, storage space, and flat hinged doors in push to open mechanism. Internal carcasses in MFC and external in SS metal sheet cladding.

Overall Size: 1110mm W x 865mm D x 850mm H
Location: GF - Garage Vanity Unit
NOTE: Excluding tap, accessories, and all related MEP works. Subject to final approved drawings and specifications from Client.'),
('9523cf0a-c588-4bc5-90ca-72d786532b09', 'Manufacture and installation of frame, finished in veneer sprayed 20% gloss.

Overall Size: (2750+2160+2750)mm L x 460mm H
Location: FF - Bathroom 3 Vanity Unit'),
('691a1ce4-6d2d-47fe-9247-94557a07fcc0', 'Master Bathroom Cupboard:

Supply and Installation of open display shelf with push to open shutter. Veneered MDF with melamine carcass. {3000K} LED strip lights as per design.

Shutters/Open Shelves/Framing: MDF in veneer finish
Carcass/Shelves: 18mm thk Egger or equivalent melamine

Size: 1.00m L x 0.30m D x 2.60m ht

Location: Master Bathroom'),
('74cc7465-3a01-4f26-8156-0f65f9258fd5', 'Master Bathroom Vanity Mirror:

Supply and Installation of vanity mirror with 6mm thk belgium grade mirror on MDF backing and storage behind. Melamine for internals. 

Size: 1800mm L x 1000mm ht x 20mm thk.
Location: Master Bathroom'),
('2816a311-383f-4435-b15d-6189d4d71e54', 'Master Bedroom New Accessories Drawers:

Supply and installation of low-height cabinet with full-height backing in veneer finish. Cabinet to include veneered MDF countertop, veneered MDF drawer fascias and all exposed surfaces.

Provide concealed metal support framework and/or column 
cladding as required to withstand load and ensure structural 
stability. Drawers to be complete with finger pull detail and 
Blum soft-closing runners. Internal carcass to be melamine 
finish.

Drawer accessories to be quoted separately upon client 
confirmation.

Countertop: Veneered MDF
Drawer Fascia/Exposed: MDF with P.U. paint finish
Carcass/Internal: 18mm thk Egger or equivalent melamine

Size: 
a. 3.40m L x 0.35m D x 0.90m ht (low cabinet)
b. 3.40m L x 0.1m D x 2.60m ht (backing)

Location: Master Bedroom'),
('cabb5b7b-0726-4c60-adab-c08bca4bd740', 'Master Dressing Cupboard A:

Supply and installation of wardrobe made with melamine for carcass and shelves. Glass with metal frame for shutters. Blum soft closing hinges and drawer runners. Powder coated hanger rods and custom metal handles. LED strip lights on power switch.

Size: 4.75m L x 0.60m D x 2.60m ht
Location: Master Bedroom'),
('558c366c-28e3-497f-92e5-04c37eea32de', 'Master Dressing Cupboard B:

Supply and installation of wardrobe made with melamine for carcass and shelves. Glass with metal frame for shutters. Blum soft closing onyx black hinges and drawer runners. Powder coated hanger rods and custom metal handles. LED strip lights on power switch

Internal/external/shelves: Premium quality melamine (Egger)/ 
18mm (ML)
Shutters: 5mm thk belgian grade tinted glass with metal frame

Size: 3.101m L x 0.60m D x 2.60m ht
Location: Master Dressing Area'),
('3d9058b0-4f3f-483b-b939-13ab600f8a4f', 'Master Dressing Cupboard C:

Supply and installation of wardrobe made with melamine for carcass and veneered MDF in externals or exposed parts. Glass with metal frame for shutters with Blum soft closing hinges Drawer runners for open shelving. Powder coated hanger rods and custom metal handles. LED strip lights on power switch.

Internal: Premium quality melamine (Egger)/ 18mm (ML)
External/Shelves: MDF in veneer finish 2nos. 
Shutters: 5mm thk belgian grade tinted glass with metal frame

Size: 1.00m L x 0.30m D x 2.60m ht
Location: Master Dressing Area'),
('f28096c7-7301-45e3-9b75-9a61636e8a68', 'NOORA AND LEENA BATHROOM VANITY PULL OUT DRAWER: 
Supply and installation of pull out made of inside melamine and outside lovered design, PU paint finish, colour matching to existing cabinet

Size: 500mmL x 600mmW x 620mmHT'),
('381a7a7b-680f-4697-810c-84a37bad934a', 'New Accessories Mirror:

Supply and Installation of vanity mirror with 6mm thk belgium grade mirror on MDF backing.
LED: not included

Size: 3.20m L x 1.00m Ht x 20mm thk.'),
('477041ec-a267-4571-8f88-3413fb4d542a', 'Office Room Desk:

Supply and installation of computer desk with drawers on both sides and open workspace in the center. All cabinetry to have MDF in veneer finish for drawer fascia and other exposed parts. Finger pull with Blum soft closing drawer runners. Premium quality melamine for all internal parts.

Size: 2000mm L x 800mm ht x 600mm D
Chair: not included
Location: Office Room'),
('0807c8b8-9a63-4fe3-9fc1-3ef7a76ee7a8', 'Office Room Storage:

Supply and installation of built-in library cabinet/gym equipment storage unit with melamine for carcass and veneered MDF in externals or exposed parts. The upper section shall consist of a combination of closed cabinets and open shelving. Base cabinets to feature push to open mechanism and blum soft-closing hinges.
Not designed for prolonged storage of heavy gym accessories

Shutters: MDF in veneer finish
Carcass/Shelves: 18mm thk Egger or equivalent melamine

Size: 4.35m L x 0.3m D x 2.60m ht
Location: Office Room'),
('1bcd82ef-359d-4263-b02c-dec87ca3b3bc', 'POWDER ROOM VANITY COUNTER: 

Supply and installation of vanity counter made of metal framing with marine plywood cladding and marble cladding above plywood including drawers and inbuilt wash basin, Excluding mixer. Details as per drawing, colour as per approved sample 

Size: 1863mmL x 400mm Wx 300mm HT
Note: Countertop Finish will be supplied by client'),
('d74071a1-6cce-4530-a93d-dc07f37c954d', 'Pantry Cabinet

Manufacture and installation of Pantry cabinet made of MDF structure comprising of bottom and upper cabinets in wood laminate finish with stone countetop.

Dimensions: 3350mm L x 400mm/600mm W x 3000mm H 
Location: Pantry'),
('4c9bbb5f-fd34-46d0-b460-4a5c3eb69993', 'Passage Area Pocket Sliding Door:

Supply and installation of internal sliding wooden door made with semisolid wood door leaf (with wooden trim design) and solid wood frame in approved veneer finish with premium quality soft closing sliding tracks and mechanism.

Size: 0.80m L x 2600mm ht
Location: Passage Area'),
('6aeec56e-f2ef-44af-85f5-ec20021fb694', 'Pocket Door for Kitchen:

Supply and fixing of door and frame made of solid hard wood white PU matt painted finish, door made of Solid core hard wood framing, layers of MDF, PU Matt painted finish with glass screen archtrave as per approved sample (Excluding ironmongaries)

Size: 800mm L x 2157mm ht'),
('0d00dcb7-6362-4328-ad4d-019c30490170', 'Powder Room Mirror:

Supply and Installation of vanity mirror with 6mm thk belgium grade mirror on MDF backing

LED: not included

Size: 1200mm L x 1000mm ht x 20mm thk.

Location: Powder Room'),
('3206628f-690d-4b4e-9224-1ece76be0e22', 'Powder Room Vanity Counter:

Supply and installation of vanity unit with marble countertop, including metal support framework and wall-mounted framing.

Mirror/LED: not included
Countertop: 20mm thk Natural Marble 
Carcass/Internal: 18mm thk premium quality melamine (ML)
Sanitarywares: not included

Size: 1.55m L x 0.60m D x 0.25m ht

Location: Powder Room'),
('0a06ab0a-fa48-4ce7-b4ae-39dbbb7e0d8f', 'RECORD STUDIO - DJ TABLE:

Supply and installation of table with veneered MDF for table top. Provision for equipment to be inset on the table. Bottom cabinet in painted finish for exposed parts. Pull handles and Blum soft closing drawers. Melamine for all internal parts

Equipment: not included
Top: 18mm thk MDF in veneer finish
Drawer Fascia: 18mm thk MDF in P.U. paint finish
Carcass/Shelves: 18mm thk Egger or equivalent melamine
Size: 2000mm W x 800mm D x 900mm ht'),
('b67cc3e3-5612-4c3c-b727-3f282df6a38d', 'REMOVAL OF EXISTING KITCHEN CABINET AND REFXING 
charges for removal of existing cabinet and refixing of top cabinet opposite wall

Location: Kitchen Area'),
('4f666eee-e493-4a21-a854-aeaa45e7e7bb', 'Reception Desk

Manufacture and installation of Reception desk made of MDF wooden structure with cladding in travertine flexible clay panel finish, metallic PU paint at bottom, solid surface countertop, inner drawers and shelves, including all necessary items required for fixing.

Dimension: 4000mm L x 1000mm W x 1100mm H Location: Reception area'),
('a2a0f032-2d87-41f8-bcd6-d3d8aef98557', 'Replacement of Bedside Table: 

Fabrication and supply of new bedside table made of MDF with wood veneer finish, colour as per approved sample'),
('654e56e8-0172-4fd3-b967-ef99e7b82fb3', 'SHOES AND BAGS CLOSET (ELEVATION B):

Supply and installation of shoes and bags shelf made of MDF with pu paint finish. including shelves, pullout drawers, glass doors, LED strip light. details as per approved drawing. 

Size: (2360+630)mmL x 650mmW x 3550mmHT
Location: Master Dresser'),
('0aff8788-0800-4e59-b28f-bd157cbec763', 'STAIRCASE STORAGE SHELF: 
Supply and installation of storage shelf made of melamine finish, colour as per approved sample. 

Size: 1130mmL x 2200mmL x 2230mmL X 400mmW - 2Nos'),
('c40b6ea2-d8b9-4aef-aa6d-c9ce3d02285b', 'STORAGE UNIT:

Supply and Installation of wall storage unit with cupboard above and below. All exposed parts to be in painted MDF. Shutters with Finger pull and Blum soft closing hinges. Melamine for all internal parts. 

Sanitarywares: not included
Countertop: to be in paint finish instead of stone
Open shelves/Back Panel/External: MDF in P.U. paint finish
Carcass/internal: 18mm thk Egger or equivalent melamine
Size: 1200mm L x 900mm ht x 600mm D for base & 1200mm L x 600mm ht x 400mm D for wall
Location: ROOM 3 Consultation Room'),
('20cb2033-7b28-4952-8967-b169d8dfe010', 'STORAGE UNIT:

Supply and Installation of wall storage unit with open shelves above, and cupboard below. All exposed parts would be in veneered MDF. Shutters with Finger pull and Blum soft closing hinges. Melamine for all internal parts 

Open shelves/Back Panel/External: MDF in veneer finish
Carcass/internal: 18mm thk Egger or equivalent melamine
Size: 2200mm W x 2600mm ht x 400mm D
Location: ROOM 1 STAFF OFFICE'),
('34b239d0-a5a0-444a-b360-fc05fe671489', 'Stairs Handrail:

Supply and installation of stair handrail system with wall brackets. Handrail to be finished in wood-like finish as per approved design. Including necessary supports, fasteners, and complete fixing system for proper installation.

Handrail: Premium quality MDF / solid core base with wood veneer finish or high-pressure laminate (HPL) wood-grain finish. Brackets/Supports: Powder-coated mild steel or stainless steel wall-mounted brackets.

Length: 22.5 LM'),
('0bb6a728-e480-422a-904c-d579d47bcbd6', 'Supply & Installation of Breakfast Bar, including pocket cabinet door mechanism - 2 nos. left & right

Size: 1.367m L x 0.55m D x 2600mm ht
Location: Kitchen Area
Note: Excluding Appliances & other decorative items.'),
('981051e7-026b-4bd9-8c78-2b2ad4cf2f67', 'Supply & Installation of full height Door Leaf & Door Frame as per given size & design, Solid Wood Door frame, Door leaf is Semi Solid in approved Color P.U Matt/Semi Gloss Paint finish. 

Ironmongeries: By client

Size: 700 - 1000mm L x 2600mm ht
Location: Master Bathroom'),
('7533141a-e801-470a-aa7b-518f90f8a6d9', 'Supply & Installation of wardrobe made with 18mm premium quality decorative melamine for carcass, shelves and all interrnal hidden parts, 18mm veneered mdf with P.U. stain finish for doors and all exposed parts, Blum soft closing hinges and drawer runner premium quality decorative metal handles.

Size: (1880 + 2784 + 1880mm) L x 2500mm Ht x 600mm D
Location: Reading (3a - 015)'),
('60da2d31-5789-4c96-8542-18adf9f1847a', 'Supply and Application of Ceiling Paint (one coat primer, two coat stucco, two coat fenomastic mat white).

Location: Affected Demolished area'),
('8cbb4a84-534c-41db-99eb-5a867413f694', 'Supply and Fix Solid Wooden Balustrade with handrail including solid wooden handrail, gypsum handrail, gypsum moulding on wall, metal bronze electroplated wall rail.

Size: 1100mm L x 2200mm HT x 600mm D
Location: Staircase Area'),
('02d63637-42aa-4cc4-a483-f081c110f5a5', 'Supply and Installation of Built-in Cabinet Behind Bath - Master Bathroom, including MDF/melamine carcass, mirror-front doors, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: Full Height × 1,000 mm L × 350mm D
Note: Countertop, lighting, or specialized hardware (soft-close, branded handles) are not included.'),
('24e856de-b555-4f70-9aee-9d0659425431', 'Supply and Installation of Cabinet:

1. Left & Right Cabinet:
Carcass/Exposed Panels: Made of 18mm thick 211 Stream Oak Melamine finish.
Shutters/Shelves: Made of 18mm thick 50 Cool White Melamine finish.
Back Panel: Made of 6mm thick 211 Clear Stream Oak melamine.
Size: 1200mm W x 500mm D x 3000mm H

2. Middle Bottom Cabinet:
Carcass/Shutters: Made of 18mm thick 50 Cool White Melamine finish.
Size: 2340mm W x 500mm Dx900mm H

Open Shelves: Made of 18mm thick 211 Clear Stream Oak melamine. 3 nos.
Open Display Back Panel: Made of 18mm thick MDF laminated (White carara 1776 PU) finish.

Overall Size: 4740mm W x 500mm D x 3000mm H
Note: NO DRAWERS'),
('f30509d4-0742-4e3c-92a6-1aa95ca4aa04', 'Supply and Installation of Cabinet:

Carcass/Shelves/Exposed Side Panels: Made of 18mm thick MDF with 50 Cool White Melamine finish.
Shutters: Made of 18mm thick MDF with 211 Clear Stream Oak melamine.
Back Panel: Made of 6mm thick MDF with 50 Cool White Melamine finish.
Size: 1000mm W x 600mm D x 3000mm H'),
('ce12cacc-59bd-4113-8a34-e19cb8df6cdc', 'Supply and Installation of DB Cabinet:

Carcass/Shelves: Made of 18mm thick cool white melamine MDF with PVC lipping.
Shutters: Made of 18mm thick MDF veneered finish.
Size: 900mm (W) × 400mm (D) × 3000mm (H)'),
('7c359d38-30b4-4a59-8d34-239c123e1f5b', 'Supply and Installation of Drawers for kitchen;
a. 3 drawers at the wall unit, 6 drawer at the breakfast bar and 9 drawers for island counter

Location: Kitchen Area'),
('91ba65d7-5bd5-40e2-83db-92ef0648b01c', 'Supply and Installation of Full Height Wardrobe – Bedroom 2, including MDF carcass with melamine finish, full-height doors, internal shelving, hinges, handles, and standard hardware, fabricated and installed in accordance with approved drawings and specifications.

Size: 2800mm ht x 600mm D x 2350mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Soft-close hardware, mirrors, LED lighting, or premium accessories are charged separately.'),
('b16ff732-d283-498d-9882-34a0567eb1a0', 'Supply and Installation of Full Height Wardrobe – Bedroom 3, including MDF carcass with melamine finish, full-height doors, internal shelving, hinges, handles, and standard hardware, fabricated and installed in accordance with approved drawings and specifications.

Size: 2800mm ht x 600mm D x 2285mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Soft-close hardware, mirrors, LED lighting, or premium accessories are charged separately.'),
('9112527e-bc6d-425f-9594-aaeec6d414ff', 'Supply and Installation of Jack & Jill Vanity Counter, including MDF carcass with melamine finish, internal shelving, drawers/doors, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 900mm ht x 600mm D x 1785mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: 
1. Countertop, wash basin, faucet, and plumbing fixtures are not included and quoted separately'),
('d31d2094-5429-44af-9b9c-05e905beb372', 'Supply and Installation of Kitchen Cabinet with Island, including base cabinets, wall cabinets, island carcass, MDF carcass with melamine finish, internal shelving, drawers/doors, standard cabinet hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Kitchen Cabinet Size: 2500mm ht x 700mm D x 6210mm L
Kitchen Island Size: 3600mm L x 1300mm D x 900mm ht

Location: GF Kitchen Cabinet'),
('064ca9ef-22dd-4d1b-b500-4fd1b6cddac6', 'Supply and Installation of Kitchen;
a. Kitchen Unit, Island Unit, Doors, Hinges, Hardware, Handle (microcement for curved hoods)

Specifications:
Carcass: 18mm thk premium quality melamine
Shutters: 18mm thk veneered MDF matt stain finish
Hinges: Soft Closing Blum Austria
Drawers: Soft Closing Tandem Box - Blum Austria
Handle: Push to open/Gola profile
Countertop: Taj Mahal Quartzite
Plinth: 100mm Ht same as door finish
Lighting: LED Strips

Location: Kitchen Area
Note: Excluding Appliances, sanitary wares & other decorative items.'),
('0e4c5d41-b1f2-455c-903c-48036e9efbe2', 'Supply and Installation of Low-Level Cabinet – Gym, including MDF carcass with melamine finish, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 450 mm H × 450 mm D × 2105 mm L
Note: Countertop, premium hardware, or integrated lighting are not included and quoted separately.'),
('6c9da9cb-ce76-4eba-97f0-898d5e9dbfe5', 'Supply and Installation of Master Bedroom Island Unit, including MDF carcass with melamine finish, internal shelving, drawers (if any), standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 900mm ht x 850mm D x 3450 mm L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Glass tops, mirrors, LED lighting, premium hardware (soft-close, branded systems) are charged separately.'),
('9d9d1a67-174c-4121-9df7-589da1e583fa', 'Supply and Installation of Master Closet Wardrobe and Integrated Column, including MDF carcass with melamine finish, full-height doors, internal shelving, drawers, standard hardware, curved detailing around structural column, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 2800mm ht x 600mm D x (2850mm + 6050mm + 2850mm) L
Material/Specification: MDF carcass in melamine finish, internal shelving and standard hardware
Note: Special features such as LED lighting, soft-close premium hardware, or glass inserts are charged separately.'),
('b0d251c0-f8d5-4148-b952-45f4a9d28e7a', 'Supply and Installation of Rectangular Vanity Mirror, including cut-to-size mirror, polished edges, mounting/fixing accessories, alignment, and installation, complete in accordance with approved drawings and specifications.

Size: 1000mm ht x 1800mm L
Location: Master Bathroom
Note: Backlit, LED, or decorative framed mirrors are not included and must be quoted separately.'),
('cc8320c4-0e8c-4c63-a8e4-09f64f5e050c', 'Supply and Installation of Shoe Cabinet – RHS of Entrance Door, including MDF carcass with melamine finish, internal shelving, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 345mm L x 250mm D x 900mm ht
Note: Countertop, premium hardware, or integrated lighting are not included.'),
('9c0c8aec-66a6-437c-9b50-8ba2a52cabf6', 'Supply and Installation of Steel Framework for Floating Bed – Master Bedroom, including fabrication of steel frame, supports, fixing to wall/floor, alignment, welding, grinding, and finishing, complete in accordance with approved drawings and specifications.

Size: 2,040 mm L × 2,095 mm W'),
('fb7a8e37-1787-44d4-82fd-afa93c7c2986', 'Supply and Installation of Veneered Headboard – Master Bedroom, including MDF carcass, veneer finish, standard hardware, fabrication, delivery, and installation, complete in accordance with approved drawings and specifications.

Size: 1200mm ht x 2035mm L'),
('68b870aa-c791-4067-9619-cd749e30dd1f', 'Supply and Installation of Wall mounted shelves with LED comprising of 50mm thick black color melamine finish.

Size: 4710mm L x 250mm W x 40mm T
Note: Directly fixed to wall with metal bracket including LED lights with profile.'),
('19fe54da-a1ce-4bcf-9154-d0627272d79d', 'Supply and Installation of gypsum board ceiling, ready to receive primer

Location: Affected Demolished area
Note: Cutting of ceiling for light frame and A/C grill to be confirmed and quoted separately.'),
('7c47617b-7d36-4ba0-8783-a853f1ea6e2e', 'Supply and Installation of marble tile with polished finish for joinery items, including cutting to size, edge finishing.

Joinery Items & Approximate Sizes:
Formal Living: 1 No. of 5750mm L × 450 mm D
GF TV Room: 1 No. of 4600 mm L × 450 mm D
FF Family: 1 No. of 5000 mm L × 450 mm D
Study Room: 11 Nos. of 500 mm H × 450mm D

Type: Polaris White
Thickness: 2cm'),
('858f10ea-4d31-4fee-bfbe-b30004821c8c', 'Supply and Installation of vanity with marble countertop. Veneered drawers finger pull with Blum soft closing drawer runners. Melamine for internals. 

Countertop: 20mm thk Natural Marble
Fascia/Drawer fascia:c Veneered MDF
Carcass/Internal: 18mm thk premium quality melamine 
Sanitarywares: not included
Budgetary cost for tavertine slab : 4000 aed

Size: 2.00m L x 0.63m D x 0.45m ht
Location: Master Bathroom'),
('563086be-e17b-448a-a3aa-00c3832c85c5', 'Supply and application of ceiling paint on new gypsum ceilings, including surface preparation, priming, and two coats of approved paint — complete as per specifications.

Location: New Gypsum Ceilings'),
('d8a0a98c-cec4-490f-a50b-2b260430524f', 'Supply and fixing of kitchen cabinets with premium MDF carcass, PU paint finish, premium hardware, soft-close systems, LED internal lighting, glass shutters, shelves, drawers, and premium marble countertop & backsplash, complete including fixing, alignment, and finish.

Size: (3400 + 2160 + 3400)mm L x 2600mm ht x 620mm D
Location: Kitchen
Note: Supply and installation of sanitary wares and kitchen accessories to be treated as variation.'),
('da82135b-0f6e-490a-ab28-42336876b239', 'Supply and installation of 12mm cement board ledge wall for wall-hung water closet, including cement board, framing, waterproofing, alignment, finishing, and protection of surrounding wall surfaces.

Location: 2nd Bathroom (3a - 014)'),
('c085d818-fe52-4043-83c1-242d60d33d06', 'Supply and installation of 60 × 60 cm ceiling panels for kitchen area, including ceiling grid/frame, leveling, alignment, cutting to fit, suspension system, and protection of adjacent finishes.'),
('a9c1816f-4be0-430b-9206-476c276b623e', 'Supply and installation of 6mm thick clear frameless mirror with timber backing as per approved design

Overall Size: 1110mm W x 2005mm H
Location: GF - Garage Vanity Unit'),
('faa87847-51dc-4fc8-b47a-c68447c21bce', 'Supply and installation of Base Unit:

Carcass/Shelves/Exposed Side Panels/Drawers: Made of
18mmthick MFC board (White SC B3822) finish.
Shutters: Made of 18mm thick MFC board (White SC
B3822) finish.
Back Panel: Made of 18mm thick MFC board (White SC
B3822) finish.
Size: 3710mm W x 600mm D x 950mm H'),
('00bad3a8-476d-47d6-9b72-afd850cec898', 'Supply and installation of Cabinet

Left & Right Cabinet:
Carcass/Exposed Side Panels: Made of 18mm thick 50 Cool White Melamine finish.
Shutters/Shelves: Made of 18mm thick 50 Cool White Melamine finish.
Back Panel: Made of 6mm thick 50 Cool White Melamine finish.
Size: 1200mm W x 500mm D x3000mm H

Middle Bottom Cabinet:
Carcass/Shutters: Made of 18mm thick 211 Clear Stream Oak melamine. Shutter with grooving lines.
Size: 2400mm W x 500mm D x 900mmH

Upper Middle Display Cabinet:
Open Display Back Panel: Made of 18mm thick MDF laminated (White carara 1776 PU) finish.
Size: 2400mm W x 500mm D x 3000mm H

Open Shelves: Made of 18mm thick 211 Clear Stream Oak melamine.
Overall Size: 4800mm W x 500mm D x 3000mm H'),
('0db42a26-49ce-4dd3-85ca-2e215a770086', 'Supply and installation of Cabinet:

Carcass/Exposed Panels: Made of 18mm thick MDF with White Melamine Finish.
Shutters/Shelves: Made of 18mm thick MDF with White Melamine Finish.
Back Panel: Made of 6mm thick MDF with Stream Oak melamine.
Size: 1200mm W x 500mm Dx 3000mm H'),
('56d571e8-553a-4034-b314-72e549d3d5ca', 'Supply and installation of Cabinet:

Left & Right Cabinet:
Carcass/Exposed Side Panels: Made of 18mm thick MDF with 50 Cool White Melamine finish.
Shutters: Made of 18mm thick MDF with 211 Clear Stream Oak melamine.
Back Panel: Made of 6mm thick MDF with 50 Cool White Melamine finish.
Size: 795mm W x 500mm D x 3000mm H

Middle Bottom Cabinet:
Carcass/Shutters: Made of 18mm thick MDF with 50 Cool White Melamine finish.
Size: 2400mm W x 500mm D x 900mm H

Upper Middle Display Cabinet:
Open Display Back Panel: Made of 18mm thick MDF laminated (White carara 1776 PU) finish.
Open Shelves: 18mm thick MDF with black color melamine finish.

Overall Size: 3990mm W x 500mm D x 3000mm H
Note: No Drawers'),
('3b131dad-a0d6-4ece-aad9-a1c72d00f885', 'Supply and installation of Fridge Unit:

Carcass/Shelves/Exposed Side Panels: Made of 18mm
thick MFC board (White SC B3822) finish.
Shutters: Made of 18mm thick MFC board (White SC
B3822) finish.
Back Panel: Made of 18mm thick MFC board (White SC
B3822) finish.
Size: 900mm W x 750mm D x 3000mm H'),
('b5aba903-5dd0-42f6-8202-7d4125caf4ba', 'Supply and installation of Kitchen upper cupboard and lower cupboards, doors, shutters, hinges, hardware, handle.

Specifications:
Carcass: 18 mm thk premium quality melamine
Shutters: 18mm thk veneered mdf matt stain finish
Hinges: soft closing Blum Austria
Handle: Push to Open/Gola profile
Countertop: Natural marble
Plinth: 100mm Ht Same as door finish
Lighting: LED strips

Size: 4000mm L x 2600mm ht x 620mm D
Location: Kitchen (3a - 005)
Note: Supply and Installation of natural marble countertop, backsplash and accessories is to be confirmed and quoted separately.'),
('0ee467ae-5a80-4306-93be-55f7cddfb698', 'Supply and installation of Low Cabinet:

Carcass: Made of 18mm thick MDF with 50 Cool White Melamine finish.
Shutters: Made of 18mm thick MDF with 211 Clear Stream Oak melamine.
Back Panel: Made of 6mm thick MDF with 50 Cool White Melamine finish.
Size: 3000mm W x 500mm D x 650mm H'),
('4eb4a274-1797-4261-8047-3e810e986c10', 'Supply and installation of TV console, including moisture-resistant MDF carcass, inside melamine finish, outside wood veneer finish, soft-close drawers (Blum), reinforced shelves, optional LED strip lighting, fixing, alignment, and finishing.

Size: (2650)mm L x 400mm D x 500mm ht
Location: Bedroom'),
('e940faae-f519-47c5-a742-27d86ab226cf', 'Supply and installation of Wall Mounted Table finish comprising of 30mm thick MDF Board with oak veneer finish.

Size: 2190mm L x 510mm W x 50mm T'),
('32682552-ef41-468d-9f88-b2279470097b', 'Supply and installation of Wall Mounted Vanity Drawer + Shelves FLW) finish:

Drawer mounted: Comprising of MFC board ( M6344 Karlstad Oak Grey)
Worktop: Made of 12mm thick porcelain tiles. Including white wood substrate and LED lights underneath.
Size: 1600mm W x 600mm D x 400mm H'),
('389aa0ef-4d8c-4c7d-bf12-757ae92fca8e', 'Supply and installation of Wall Mounted Vanity Drawer + Shelves:

Drawer mounted: Comprising of MFC board ( M6344
Karlstad Oak Grey) finish.
Worktop: Made of 12mm thick porcelain tiles. Including white wood FLW) finish. substrate and LED lights underneath.
Size: 2000mm W x 600mm D x 400mm H'),
('e3bb5358-678f-48d2-8688-0a45776c1a82', 'Supply and installation of Wall Mounted Vanity Drawer comprising of MFC board (M6344 Karlstad Oak Grey FLW) finish.

Worktop: Made of 12mm thick porcelain tiles.
Size: 1500mm W x 600mm D x 200mm H'),
('fa2c5faa-699d-4dd3-b79d-c30d4e50c5da', 'Supply and installation of Wall Mounted Vanity Drawer with down sink:

Worktop: Made of 12mm thick porcelain tiles. Including white wooden substrate.
Size: 2000mm W x 600mm D x 200mm H'),
('d7947dfd-172e-49f3-a53a-3059b7eaf9bd', 'Supply and installation of Wall Upper Cabinet:

Carcass/Shutters/Shelves: Made of MDF board with (M6344 Karlstad Oak Grey FLW) finish. Including LED works.
Size: 1500mm W x 200mm D x1100mm H'),
('882d5efa-83c3-4810-b612-821e207c4321', 'Supply and installation of cabinets made with melamine for carcass and shelves. Veneered MDF for shutters. Finger pull with Blum soft closing drawer runners. Powder coated hanger rods and custom metal handles LED strip lights on power switch 

Internal/external/shelves: Premium quality melamine (Egger)/18mm (ML) 
Shutters: Veneered MDF

Size: (965 + 2100 + 2049mm L) x 2600mm ht x 600mm D
Location: Walk-in -Dressing'),
('fcc7a214-9667-43f1-a07d-28445575eb11', 'Supply and installation of cement board ledge wall for wall-hung water closet, including cement board, framing, waterproofing, alignment, finishing, and protection of surrounding wall surfaces.

Location: Bathroom (3a - 012)'),
('9be09595-1078-4b0f-8f76-8ea57643ca0c', 'Supply and installation of curtain pelmet with 18 mm plywood backing, including cutting, fixing, alignment, jointing, sanding, surface finishing, protection during works, and handover — complete in all respects.'),
('4a5194e0-5059-48a8-99a4-c2afce65fba6', 'Supply and installation of double-sided MR MDF wall partition, including metal/timber framing, MDF panels on both sides, fixing, alignment, leveling, joints finishing, surface preparation for painting or laminate, and protection of adjacent finishes.'),
('81160d77-896d-4ccf-aac7-0d021ec3e4d1', 'Supply and installation of high-level storage in Maids Room, including:
- MDF carcass with white laminated finish
- Soft-close drawers and hinged doors
- Durable handles and hardware
- Fixing and alignment to wall
- Finishing, sanding, and touch-ups

Size: 3.0m L x 2.0m H x 0.5m D'),
('6ef32247-e08c-460a-836c-714a46cdc431', 'Supply and installation of loft bed with integrated drawers in Maids Room, including:
- plywood frame with white laminated finish
- Loft bed platform with safety railing
- Integrated drawers underneath (soft-close)
- Mattress support slats
- Fixing, alignment, sanding, and finishing

Size:
- Length: 2.0 m
- Width: 1.0 m
- Height: 2.0 m (from floor to top of loft bed)'),
('e104368e-927b-4233-b340-7b5b905acb60', 'Supply and installation of new moisture-resistant (MR) gypsum ceilings, including framing, suspension system, finishing, joint treatment. — complete as per approved specifications. 

Location: Master Bathroom & FF Shared Bathroom'),
('865584ab-1166-4c40-9aac-62a089117f41', 'Supply and installation of new wardrobes made of MDF, including carcass, doors, hinges, handles, shelves, drawers, and finishing as per approved design

Size: 2800mm HT x 3000mm L
Location: FF Bedroom 01 & 2 and Master Bedroom'),
('12014d9e-22ee-4cc1-910a-326990f79c72', 'Supply and installation of wardrobe cabinet made of moisture-resistant MDF carcass with internal textured melamine finish and external natural wood veneer finish with matte PU coating, including framed doors, soft-close drawers (Blum), hanging rails, shelving, integrated LED lighting, and all necessary accessories, complete with fixing, alignment, and finishing.

Size: (2300 + 2200)mm L x 2460mm ht x 600mm D
Location: Bedroom'),
('a93efc9a-240a-4c18-8b2c-d757571a025a', 'Supply of countertop mixer tap, including delivery charges and other accessories

Brand: Bagno Design
Location: Master Bathroom, Bathroom 02 & Powder Room'),
('56e321d1-c677-40b9-981b-ae957eea0e1b', 'Supply of wardrobe handle, complete with fixing screws and accessories, finish and size as per approved sample.

Location: Office/Study Room (3 Nos) & Kid''s Playroom (2 Nos)'),
('3f509a43-c002-4676-84e2-f6ecdae17c47', 'Supply, Fabrication, and Installation of L-type Wardrobes including:
Construction & Materials: 
- Carcass: 18mm moisture-resistant MDF, internal finish in melamine.
- Shutters/Doors: Lacquered MDF with PU satin finish
- Handles: Concealed finger pull / integrated profile handles in matte black.
- Hardware: Imported Blum / Hafele soft-close hinges, runners, and internal accessories (shelves, drawers, hanging rails, and accessory trays).
- Back Panel: 9mm MDF board with melamine finish.
- Base & Skirting: MDF plinth with matching PU finish.
- Installation: Proper alignment, joint sealing, polishing, surface protection, and final cleaning.

Configuration:
1450mm Section:
- Doors: 3 panels (~483mm each, full height swing type)
- Drawers: 2–3 internal drawers
- Shelves: 3–4 adjustable shelves
- Hanging space: 1 short-hang section (shirts/pants)
- Accessories: Pull-out tray or small divider trays
2100mm Section:
- Doors: 4 panels (~525mm each, full height swing type)
- Drawers: 4 internal drawers (2 per section)
- Shelves: 6 adjustable shelves
- Hanging space: 1 long-hang section (dresses/coats), 1 short-hang section (shirts/pants)
- Accessories: Pull-out tray, hanging rod, small divider trays
Overall:
- Doors: 7 panels total
- Sections: 2 major L-type compartments
- Drawers: 6–7 nos.
- Shelves: 9–10 adjustable shelves
- Hanging space: Long and short hang sections as above

Sizes: (1450mm L + 2100mm L) × 600mm D × 2400mm HT
Location: Bedroom 02'),
('e22726ff-d9dd-4a24-8e34-08e30c96dfca', 'TABLE

Supply and fixing of table made of MDF with wood veneer finish top and leg, including marble cladding on top and leg (marble supply by client, installation charge included)'),
('8e36b11d-67dd-4c70-b4f5-f812a97230f8', 'TV UNIT : 

Supply and installation of TV unit made of MDF with inside melamine and outside PU paint, including open shelves, marble base 

Size: 4950mm L x 350mm W x 3000mm ht
Location: FF Living Area
Notes: Pricing is provisional and subject to the final approved joinery design, material selection, hardware schedule, dimensions, and shop drawings.'),
('e74f6680-caa3-487e-b103-8ff2a3e02425', 'TV Unit:

Supply and installation of TV unit with marble cladding. Provision for TV, sound bar, and open shelves to be flushed. To have proper framework behind. Bottom part to be in veneer with push to open mechanism and melamine internal shelving. Open shelf to have marble backing, and metal for inner frame and shelves. Extended vanity table to be in veneer with drawer in push to open mechanism and melamine internal shelving. Full length vanity mirror with 6mm thk belgium grade mirror on MDF backing.

Budgetary cost for tavertine slab : 4000 aed
Stool and sofa: not included
TV Unit and Open shelf backing: Marble to be supplied by client
Bottom panel: Veneered MDF
Inner framee/shelves: 1.5mm thk powdercoated hallow metal
Curved panel cladding: Marble to be supplied by client
Internal: 18mm thk premium quality melamine (ML)

Size: 4.98m L x 0.40m D x 2.60m ht
Location: Master Bedroom'),
('8ab1cd69-a49c-44a6-9c3c-0316a3699cca', 'VANITY COUNTER:

Supply and Installation of vanity counter with 2 marble finishes. To have proper MDF boxing inside

Sanitary wares: not included
Provisional Cost for Marble: 500/sqm
Size: 1280mm L x 900mm ht x 600mm D
Location: ROOM 16 Water Closet'),
('a3a78979-5f3e-4ae0-9aa0-d68ea9859ce3', 'VANITY MIRROR:

Supply and Installation of 6mm thk belgium grade frameless round mirror with MDF backing.

Size: 1100mm dia.
Location: ROOM 17 Treatment Room'),
('a2a05fec-8d2b-46e9-9f63-e9362ca7c725', 'VANITY:

Supply and Installation of 6mm thk belgium grade mirror with MDF backing

Area: 6.81 sqm
Location: ROOM 20 Staff Room'),
('3d510fe8-739e-46c1-a0d3-67e38c98eba9', 'VANITY:

Supply and Installation of vanity unit with travertine countertop, integrated sink, and fascia. Cabinet below in special painted MDF shutters. Finger pull and Blum soft closing hinges. Melamine for all internal parts.

Sanitarywares: not included
Countertop: 20mm thk Natural Travertine
Provisional Cost for Marble: 500/sqm
Open shelves/Back Panel/External: MDF in limewash finish
Carcass/internal: 18mm thk Egger or equivalent melamine
Size: 1500mm L x 900mm ht x 600mm D
Location: ROOM 15 Treatment Room'),
('6f1b38f9-df96-4233-a633-6b2e9747437f', 'Vanity Counter: 

Supply and installation of vanity counter made of MDF with inside and outside laminate finish, colour as per approved sample, details as per drawing. 
 
Marble rate: 600/sqm 
Size: 1.41m L x 0.60m D x 0.90m ht
Location: FF WC
Note: Pricing is provisional and subject to final joinery design approval.'),
('0eeeaf82-8615-4c36-b399-792a67a4d08b', 'WALL CLADDING:

Supply and Installation of wall cladding in marble. To have proper MDF backing.
Internal door: quoted separately 

Marble Rate considered: 500/sqm
Size: (2300mm + 1000mm + 2300mm) x 1460mm
Location: ROOM 2 Entry Hall'),
('8fcc098c-2442-40b6-bf5c-ac045a36de19', 'WALL CLADDING:

Supply and Installation of wall cladding in reeded travertine. To have proper MDF backing.

Cladding: Reeded Natural Travertine
Provisional Cost for Marble: 500/sqm
Slab Qty Required: 2 Slabs
Location: ROOM 15 Treatment Room'),
('879593be-e641-4db8-8986-c25d1bd3012b', 'WALL CLADDING:

Supply and installation of wall cladding in 18mm thk MDF in venneer finish with decorative grooves as per design.

Location: ROOM 1.1 Staff Office'),
('b49a226d-4413-4f16-a364-22f9510801f2', 'WARDROBE:

Supply and installation of wardrobe made of MDF with inside melamine and outside fabric finish, LED strip light. details as per approved drawing. 

Size: (3730+3260)mmL x 650mmW x 3550mmHT
Location: Master Dresser'),
('831a8127-f1de-4bd0-abe0-759395d10a4f', 'Wall Moulding:

Supply and installation of decorative wall moulding with wood in P.U. paint finish'),
('5d46df58-fe71-4676-a2e4-d8c1755cd20f', 'Wardrobe Back Panel Replacement:

Removal of the damaged Wardrobe back and install a new 6mm MDF back panel matching existing room decor.'),
('f1018a7c-d673-4a8a-aaa7-f16eb46b8af3', 'Wooden substructure, consisting of wooden beams, topped with 18mm plywood.

Area=1200m2; L=60m, W=20m.'),
('88cdab81-b920-4e02-a93a-06bbcd57c187', 'Construction of BBQ station including masonry base, cement board, stone/porcelain cladding, grill housing, and sink counter.

Size: 3m L x 0.75m D'),
('2ad4c2be-a1b4-4441-8088-bca3a1501792', 'Delivery and Cutting to size for Client-Supplied Marble Tiles prior for installation.

Location: Powder Room (Walls & Floors only)'),
('50c50a19-5242-4d4e-8ecb-f5d969905777', 'Excavation, supply and installation of planter box in 100mm thick hollow blocks, including internal plastering, microcement finish (all exposed faces), backfilling with sweet soil (ready for planting) — complete as per approved design and specifications.

Material: 100mm thickness hollowblock
Size: 300mm (H) x 600mm (W) x 11,600mm (L)

Note: Plants to be supplied by client'),
('11b0cf2c-d68d-45f5-95d0-5e3114bb277a', 'Grinding, Crystallization and Final Repolishing for Client-Supplied Marble Tiles

Location: Powder Room (Walls & Floors only)'),
('f25a7d2b-3cb0-40ee-92f3-13809d6843e8', 'Inspect, repair, and re-apply waterproofing system to the existing roof, including removal of loose or damaged waterproofing materials, surface preparation, crack treatment, repair of defective areas, primer application, installation of new waterproofing membrane/coating, treatment of joints and penetrations, testing.'),
('53b4b86c-4d7e-4929-b08f-979b6b949fa2', 'Installation Only for Client-Supplied Marble Tiles,
including surface preparation, adhesive, precise laying, leveling, grouting, edge finishing, cleaning, protection of finished works.

Location: Powder Room (Walls & Floors only)'),
('1e294276-98d4-468b-a206-d73df4283e33', 'Installation of artificial grass, including surface preparation, leveling, infill, and finishing.'),
('2717ee6e-d94e-432d-8ba8-8ec50ae1afeb', 'Installation of outdoor tiles over prepared substrate, including surface cleaning, adhesive application, laying, grouting, and finishing.'),
('4ee0b1bd-5c4d-4d23-9857-79bbd220a4d4', 'Installation only of client-supplied Tiles including screeding and grouting.

Tiles will be supplied by the client.'),
('eeab1c70-27a3-496c-b8f9-d847fd7891cd', 'Lightweight screed / leveling compound with load distribution layer suitable for rooftop application to protect structural slab.'),
('3b97d96d-98fe-4c61-97d2-8f2f2437c11e', 'Preparation work for the Exterior subfloor to receive the final flooring tiles finish after removing the old tiles. All necessary works shall be considered for proper fixing.'),
('b9677486-6038-4fc4-a849-faf369142629', 'Protection of existing roof slab including supply and installation of waterproofing membrane, protective screed layer, and root barrier where required for landscape integration.'),
('250fd289-ad08-4fda-9556-d7eee036553e', 'Removal of existing concrete pavers, including lifting, stacking (if salvageable), or disposal to an approved dumpsite, and site cleaning — complete with all labor, tools, and equipment as per approved method statement.'),
('6549e6d6-d061-465b-b36e-0b44d5a1ac04', 'Site Inspection & Layout Marking:

We will inspect the area and mark the walkway alignment and stepping stone positions as per approved landscape design.');
insert into scheduler.rate_fix_stage (id, description) values
('42fbf9a1-31d4-4916-a6eb-dad24a7b9a73', 'Site Inspection & Layout Marking:

We will inspect the site and mark the exact location and dimensions of the barbecue and sink counter as per approved design and client requirements.'),
('5bc7c8e0-f926-4a18-ae82-f1c59fe4d5b9', 'Site Inspection:

We will inspect the pool structure and mark the exact location of the new skimmer on the pool wall, ensuring correct water level alignment and proper circulation as per pool size and design.'),
('96064e0b-f6cb-4687-8d1a-43a1640ed89c', 'Supply & Fabrication of new pouf in 18mm ply, upholstered in velvet grey fabric to be selected from our standard range

Size: 200 x 70 x 29H cm
Location: Living Area'),
('4fd3b13a-1765-4193-9676-2e2cd354cc42', 'Supply & Installation of Exterior granite landings tiles, as per the design. 

The supply price is 250/m² AED.'),
('b7a81184-d264-4177-bd0c-1aa07526062e', 'Supply & Installation of Exterior porcelain flooring tiles, as per the design. 

The supply price is 150/m² AED.'),
('08c7936a-0f91-4ced-b6a3-4957627d69b0', 'Supply & Installation of Exterior stone villa bottom border, as per the design. 

The supply price is 150/m² AED.'),
('caef9b5d-2b73-483e-ad9e-744aca25afd0', 'Supply & Installation of Moisture-Resistant (MR) Gypsum Board Ceiling, including suspension system, framing, boards, cut-outs for lighting/AC grilles/MEP items, jointing, finishing, primer, and final paint.

Location: Kitchen'),
('adbc7639-a58a-4b39-8a70-fca79e2ff945', 'Supply & Installation of Regular Gypsum Board Ceiling, including suspension system, framing, boards, cutting/openings for lighting, AC grilles & MEP items, jointing, finishing, primer and final paint.

Location: Storage'),
('b3a8dde9-df71-441d-b86c-cb8d5bf7623a', 'Supply and Installation of Anti-Slip Outdoor Floor Tiles, including surface preparation, screeding/levelling, bedding mortar/adhesive, alignment, cutting, grouting, edge finishing, cleaning, and complete handing over — all in accordance with approved samples and specifications.

Material: 600mm × 600mm, client-approved color/design

Location: Outdoor Back & Side Area (red highlight only) and Bedroom 01 & 02 Balconies'' Floorings'),
('4265a582-b801-4294-ab21-82bd1fcd6367', 'Supply and Installation of Electrical Shades,

Specifications: 
Awning Item - Arond 350. White Frame with retractable arms. Made in Spain. 2 year Manufacturers Warranty. Somfy Motor Operation with remote. 

Awning canopy - Awning canopy of size 4x3 with 
Recasans fabric in colour 2124-06 300gsm Acrylic Solution Dyed Fabric. 10 Year Manufacturer Warranty. Made in Spain, Water Repelent. 100% Solution Dyed. Reinforced Stitching'),
('2dc008ed-4303-44fa-a689-6aa8eb67d6e6', 'Supply and Installation of Electrical Works for Client-Supplied Ceiling Fans, including provision of conduits, cabling, junction boxes, fixing arrangements, connection to existing power supply, testing, and commissioning — complete in all respects as per approved drawings and Engineer’s instructions.

Location: Pergola Structure (Over the dining table area & over the seating area near TV unit)'),
('17f09a31-1842-4452-b36b-ae4d6eada2b1', 'Supply and Installation of Exterior-Rated LED Uplights recessed into the concrete plant box, including fixture supply (IP65+), waterproof wiring, conduiting, mounting accessories, connection to power source, and testing — all as per approved design and lighting layout.'),
('ed8904a0-d774-4af6-a05b-6d2927be0a2e', 'Supply and Installation of Manual Shades,

Specifications: 
- A380 Patented Arm
- Dustproof Screws Cover
- Cable Decorative Cap
- Durable Powered Coating with hidden cable cap
- Rust Protection
- Double springs folding arms'),
('d78b9b00-f424-48b6-a3ab-90bee708806e', 'Supply and Installation of Wood Finish Aluminum (Premium) in wood texture finish (as per design shared) with premium coating with natural wood appearance.'),
('ffb49a9c-bbdd-421b-8680-3a147ae54250', 'Supply and Installation of outdoor tiles, including surface preparation, leveling, cleaning of substrate, application of tile adhesive, precise laying and alignment, grouting with approved grout, cleaning of joints and finished surface, and protection of installed tiles.

PC Rate: 150 AED / sqm
Location: Roof Deck'),
('82fbec2f-22e6-4329-a115-c4a4104146a8', 'Supply and Installation of tile borders all over the outdoor floor tiles. 

Note: Tile border will be 40cm x 40cm and includes grouting. Color will be approved by client.'),
('33d159fc-519d-49ee-8cd7-e468404ffa0d', 'Supply and application of approved waterproofing system to roof deck flooring, including surface preparation and cleaning, primer application, supply and installation of liquid-applied, reinforcement at joints and corners, upturns at parapet walls, sealing around floor drains and penetrations, pond testing for leak-proofing, protection layer prior to tiling, and making good.

Location: Roof Deck'),
('f5cbd6c3-913c-4a91-b1cf-54e09403a42e', 'Supply and application of cement-sand screed to bathroom floors, including surface preparation, leveling, mixing of cement-sand (1:3 or 1:4) screed, proper slope toward drains, & curing.

Location: Guest Bathroom & Powder Room'),
('8b91608e-8cd5-476a-86ba-95b6274902d9', 'Supply and application of cementitious screed to achieve proper slope towards the floor drain at the entrance gate drainage point. Works to include:
- Surface preparation and cleaning of existing substrate
- Supply of approved cement/sand mix
- Accurate leveling and slope formation to ensure proper drainage
- Finishing, curing, and protection until handover
Complete in all respects as per approved design, site conditions, and relevant standards.'),
('fa1136c8-3d0d-417b-b2b4-87c9230def06', 'Supply and application of cement–sand plaster on newly constructed CHB walls as per proposed plan, including surface preparation, hacking/raking of joints, 12mm thick cement–sand plaster to both sides, leveling, finishing smooth, curing, & corner beads.'),
('f476fdfd-ebf3-446d-aff6-638a3d247c7f', 'Supply and application of cement–sand screed to roof deck surface prior to waterproofing and installation of new tiles, including surface cleaning and preparation, bonding agent, setting out levels, forming proper slopes to drainage points, laying and leveling screed, curing, finishing, and making good surfaces ready to receive waterproofing membrane and tiling.

Location: Roof Deck'),
('6b0fbb3d-8007-4078-9315-1c2366b2ba87', 'Supply and application of external waterproofing membrane to wall surfaces prior to the installation of outdoor façade cladding, complete with surface preparation, cleaning, primer (where required), two-coat flexible cementitious or polyurethane waterproofing system, treatment of joints, corners, penetrations and cracks with reinforcing mesh/band, curing, and protection.'),
('6d4de093-0b29-47f8-8ac6-199c5aa7c519', 'Supply and application of interior paint on newly plastered CHB walls as per proposed plan, including surface preparation (cleaning, sanding, patching and making good), one coat of primer, coat, two coat of stucco and two coats of approved paint.'),
('33c0a156-6baa-40b2-8ae1-18610c50f24c', 'Supply and application of two coats of waterproofing membrane on the entire floor area and wall surfaces up to 300 mm height, including surface preparation, priming, detailing at joints and corners, pond testing for a minimum of 24 hours, and all materials and labor — complete as per approved specifications.'),
('e73b07f0-483d-42c7-a8a1-cc6b03d303e3', 'Supply and application of waterproofing to bathroom floor and walls, including surface preparation, cleaning, priming, and application of approved cementitious waterproofing membrane (2–3 coats) to the entire floor area and to wall surfaces up to 300mm high and 1200mm high at vanity counter zones, including sealing around floor drains, pipe penetrations, corners with fiber mesh, and water ponding test.

Location: Guest Bathroom & Powder Room'),
('44467f69-7802-41b7-956d-d87274892ed1', 'Supply and complete installation of U-shape privacy fence as per shared design.

Fence Details:
- U-Shape Fence
Side 1: 2.2 meters
Front Side: 13.5 meters
Side 2: 2.2 meters
Height: 1 meter

- Slats installed at 45-degree angle for privacy
- Installation over existing marble fence'),
('bef0cbfa-888e-4fdb-834a-966a2ebf4b72', 'Supply and construction of concrete hollow block (CHB) wall as per proposed plan, including cement–sand mortar, laying in proper alignment and level, jointing, cutting, bonding, reinforcement ties, and curing.'),
('a9843f00-4194-4ab0-8721-e27d81ba3530', 'Supply and construction of gypsum board arch, including GI framing, double gypsum board cladding, forming curved profile, jointing, finishing and painting.'),
('9505f0e3-d884-4438-b44d-02d4279d7425', 'Supply and fixed Installation of Metal Laminate Strips, Includes precise cutting, adhesive bedding, mechanical fixing (if required), polishing, alignment, and full protection and cleaning of the installation.

Drawing Code: FL004
Material: Aluminium Brushed
Finish: Polished
Thickness: 1.00mm
Type: Equivalent as per 3D Design'),
('7a620e51-91b3-4a7b-9bec-fa8a360f637d', 'Supply and installation of BBQ counter with sink and mixer, including concrete base, countertop (granite), built-in BBQ grill housing, basic storage compartments, finishing, and alignment.

Size: 3m length
Granite/Marble Countertop: 300 AED per sqm
Wall Tiles PC Rate: 80 AED per sqm
Note: Additional 5,460 AED for SS Doors (4 Nos) for BBQ Counter if required'),
('66bf86fd-7f7c-479f-b017-77f1e0c3708d', 'Supply and installation of approved bathroom floor & wall tiles, including surface preparation, application of tile adhesive, cutting and laying of tiles to required pattern and levels, provision of spacers, grouting with approved waterproof grout, joint sealing at corners/edges, cleaning of finished surface, and protection until handover.

PC Rate of Tiles: 150 AED / sqm
Location: Guest Bathroom (excluding powder room)'),
('1063abce-4aaa-4eec-97f4-d3b4644ae88d', 'Supply and installation of fibreglass skimmer pool with large format tiles finish for light concrete look, including excavation, base preparation, placement, backfilling, basic MEP connections, and testing.

Size: 8.00 m × 2.80 m with depth 0.9m to 1.5m
Type: Fiber Pool with tiled finish
Pool Tile PC Rate: 80 AED per sqm'),
('a8224671-44b5-4805-b2d3-a99d1ad56af0', 'Supply and installation of floor screed — cement–sand screed (40 mm thick), mixed at a ratio of 1:3, laid to proper slope for drainage, including surface preparation, leveling, curing, and all materials and labor — complete as per approved specifications and site requirements.'),
('25a404cd-e494-4b75-86f3-6469b86cc12c', 'Supply and installation of glass railing system comprising tempered laminated safety glass panels, stainless steel/aluminum base shoe or point-fixed support system, fixing brackets, anchors, sealants, edge protection, alignment, testing.

Railing Length: 88cm + 240cm + 245cm + 103cm + 260cm + 103cm + 113cm + 510cm + 113cm + 87cm + 220cm + 87cm
Height: 1.20m'),
('15f461e0-4eb5-4182-a3fa-4837f705a8b4', 'Supply and installation of new outdoor floor tiles, including surface preparation, adhesive, grouting, edge finishing, cleaning, and all materials and labor — complete as per approved design, specifications, and site requirements.

Specification Notes:
1. Tile Size: (600 × 600 mm porcelain, anti-slip, outdoor grade)
2. Thickness: (10mm)
3. Adhesive: Exterior-grade tile adhesive (C2TE)
4. Grout: UV- and weather-resistant, color to match tile
5. Expansion joints where required'),
('023f4131-8fa4-44f8-b5ad-c149c99a2e3a', 'Supply and installation of outdoor stone brick cladding to existing perimeter wall, including removal of existing paint coating, surface preparation, cleaning, leveling of substrate, application of bonding agent and adhesive, cutting and fitting of stone brick cladding, jointing, pointing, sealing (if required), edge finishing.

Height: 3.0m
Location: Entire Perimeter Walls
Stone Brick Supply PC Rate: 150 AED/sqm'),
('80465138-93d3-4df5-8e4e-b777f6374efb', 'Supply and installation of planter walls, including masonry construction, plastering and finishing (internal & external), waterproofing for planter bed, alignment, leveling, and finishing.

Tile finish PC Rate: 80 AED per sqm'),
('f0f3e46d-71ac-4776-a5f4-0f8f548fa6b5', 'Supply and installation of pool heater/chiller system including supply, connection to pool piping and electrical supply, mounting, alignment, and basic commissioning.'),
('8a1daed3-59a9-4524-87b7-78da2e764308', 'Supply and installation of rooftop pergola structure including wind-resistant steel/timber frame, anchoring, and protective coating.

Size: 6m x 4m'),
('fd269b58-a9c2-41b8-86d5-2ec5666eb91d', 'Supply and installation of soundproof double-glazed partition system including:

- Aluminum acoustic framing system
- Double-glazed laminated acoustic glass panels
- Acoustic seals and gaskets
- Soundproof door (double glazed acoustic door)
- Ironmongery (hinges, handles, closers)
- Fixing, alignment, sealing, and finishing
- Basic acoustic treatment at joints

Location: BF - Music Room'),
('bb3ffc52-1a08-4062-8945-4acb84ed5bff', 'Supply and installation of stainless steel (SS) manhole cover with tiles/paver finish on top, as per approved design.

Size: 400mm × 400mm

Works to include removal of existing cover, preparation of opening, fabrication/fixing of SS frame and cover, installation of tiles/paver on top, alignment, and finishing.

Complete with all necessary materials, labor, fixing, and protection until handover.'),
('1f31926e-9ae0-4b70-99f3-9724c3bb5bfc', 'Supply and installation of stepping stones on the pathway as per approved design. Works to include:
- Site preparation and leveling of the pathway
- Supply and laying of stepping stones in approved layout and spacing
- Bedding with sand or mortar as required
- Alignment, leveling, and finishing to ensure stability and uniform appearance
- Cleaning and protection of installed stones until handover
- Complete in all respects as per design and site conditions.'),
('765259b3-eebb-4e3f-801b-0548b44550ad', 'Supply and plantation of Conocarpus erectus (Sphere form) as per approved landscape design.'),
('18d4ab8f-918d-49a7-b761-3b02022925c1', 'Supply and plantation of Vitex agnus-castus (Chaste Tree) as per approved landscape design.'),
('1af48d49-7071-4ed4-99a6-8d2efd336723', 'Supply and plantation of Washingtonia robusta (Mexican Fan Palm) as per approved landscape design.'),
('10baf992-2dc5-4b36-aefd-13355cf963ea', 'Supply, deliver, erect, maintain for the hire period, and dismantle steel Cuplock scaffolding system, complete with standards, ledgers, transoms, steel working platforms, base plates, sole boards, guard rails, toe boards, access ladders, bracing, scaffold ties, and all necessary accessories.

Work includes transportation, mobilization, erection, maintenance throughout the hire period, dismantling, and removal from site.

Dimensions:
Height: 9.00 m
Length: 38.00 m
Platform Width: 1.20 m
Hire Period: 120 Days

Note: The above rate is based on the stated dimensions and 120-day hire period. Any additional scaffold quantity, increased height or length, extended hire period, additional materials, third-party inspections/certifications, floor protection, modifications, or other site-specific requirements shall be measured and charged separately.'),
('d995c11b-ca75-4fb1-aa3b-d831b2483e5f', 'Supply, fabricate, cut, deliver, and install large-format exterior wall cladding panels, for outdoor walls/facade, including setting out, cutting to size, edge finishing, exterior-grade adhesive fixing and/or mechanical support system where required by the approved specification, alignment, joint treatment, weather-resistant sealant, trims, cleaning, and protection.

Material: Natural Travertine (Beige) (Final specification to be confirmed)
Size: cut-to-size (size to be confirmed)
Supply PC Rate: 485.00 AED/sqm (Subject to change based on the final approved tile size, thickness, finish, brand, and country of origin)'),
('1a173e5a-cdeb-47e3-ac10-210d51956859', 'System Type:

- Automatic irrigation system suitable for lawn areas, planter boxes, shrubs, trees, and palms around the villa. 
- Combination of drip irrigation (for plants, hedges, trees) and sprinkler system (for grass areas).'),
('3d715e0f-3c01-4e0c-98ca-2d1f62e5101b', 'Planter 1:

Fabrication & supply of custom made planter box 970mm(L)x220mm(W)x260mm(H) made of 20x20x2mm 316 grade brush finish SS SHS and 2mm thick 316 grade brush finish stainless steel sheet 

Note: Fabrication & Supply of Planter Box Stucture only excluding plants and soil.'),
('dbd23946-1d13-4d89-bd6a-754036345e72', 'Planter 2, 3 & 4:

Fabrication & supply of custom made planter box 1505mm(L)x220mm(W)x260mm(H) made of 20x20x2mm 316 grade brush finish SS SHS and 2mm thick 316 grade brush finish stainless steel sheet 

Note: Fabrication & Supply of Planter Box Stucture only excluding plants and soil.'),
('b05b0164-ce43-4ed1-9e29-064c22136527', 'Planter 5:

Fabrication & supply of custom made planter box 1210mm(L)x220mm(W)x260mm(H) made of 20x20x2mm 316 grade brush finish SS SHS and 2mm thick 316 grade brush finish stainless steel sheet 

Note: Fabrication & Supply of Planter Box Stucture only excluding plants and soil.'),
('7b321113-b0b5-44c6-805c-02e485a723af', 'Replacement of existing handrail brackets with brass brackets, including careful removal of old brackets, drilling, fixing of new brass brackets, alignment, and making good to all surfaces — complete in all respects, while keeping the existing wooden handrail in place as per client’s instruction.'),
('9161dd1f-5405-43d2-a15b-04f0e0310cf9', 'Supply & fixed installation of Aluminium-based decorative laminate (Stainless Steel Brushed), including cutting, shaping, alignment, fixing to substrate, polishing, surface protection during works, and final cleaning — complete in all respects.

Drawing Code: M004
Material: Aluminium-based decorative laminate
Finish: Stainless Steel Brushed'),
('4bfa7bbf-3be6-4f64-8818-5dadeb001542', 'Supply and Application of Microcement Flooring Finish, including surface preparation (cleaning, grinding if required), priming, application of multiple coats of microcement with smoothing and sanding between layers, sealing with protective topcoat, complete in all respects as per manufacturer’s specifications and approved sample.'),
('b1b0e3f8-4ffb-452a-96db-2b69e94a93b4', 'Supply and Installation of LED Strip Lighting with aluminum profile and diffuser, including necessary wiring, power driver/transformer, concealed mounting, connections to electrical supply, and proper alignment — complete in all respects.

Location: Pergola Structure & Stairs'),
('4fd6c8f2-cf73-47b7-b6be-6e289e526566', 'Supply and Installation of SPC (Stone Plastic Composite) Decking, including surface preparation, sub-frame (if required), fixing accessories, cutting, edge finishing, and proper alignment.

Material: Standard Domestic Grade = 4.00 mm thickness'),
('b23582ad-08ac-4ee0-839f-b64f0b477386', 'Supply and Installation of STC 35 Rated Acoustic Partition, comprising galvanized steel wall furring system with high-density mute core infill, mute board layers on both sides, and mute MLV (Mass Loaded Vinyl) membrane, finished with an additional mute board layer; partition built up to slab soffit including perimeter acoustic sealant, joint treatment, cut-outs for MEP services, and all necessary accessories.

Location: Ground Floor (VIP & Shisha Area Only)
Legend: Red Line Highlight'),
('be7c0ae3-5370-4a6c-a696-e9e94c783b05', 'Supply and fixed Installation of Metal Laminate Cladding for the glass balustrade on staircase and under stairs , consist of 60cm x 20cm cement board box with 15cm “U” shape steel insert cladded with aluminum sheet powder coated into BRONZETONE color as per specification. Includes precise cutting, adhesive bedding, mechanical fixing (if required), polishing, alignment, and full protection and cleaning of the installation. 

Material: Aluminium Brushed Finish: Polished 
Material Code: M2006 
Collection: Alu Plain Polished Bronzetone 
Supplier: local supplier only. Sample to provide by us.'),
('2f0a758f-0ff8-4554-b68e-39c478f07700', 'Supply and fixed Installation of Metal Laminate Cladding of the glass balustrade on staircase and under staircase slab, aluminum sheet powder coated into BRONZETONE color as per specification. Includes precise cutting, adhesive bedding, mechanical fixing (if required), polishing, alignment, and full protection and cleaning of the installation. 

Material: Aluminium Brushed Finish: Polished 
Material Code: M2006 
Collection: Alu Plain Polished Bronzetone 
Supplier: Local supplier only. Sample to provide by us.'),
('5a0446a0-167c-42d6-8069-309959719f4b', 'Supply and installation of Cement board shelf (100 mm × 200 mm) supported by steel bracket/frame, suitable for storing shampoo and bathroom accessories. Works to include cutting, fixing, alignment, leveling, sealing edges, finishing, and site cleaning — complete in all respects as per approved design and specifications.

Location: Bathroom 01 shower Area'),
('8123822c-3100-4cd1-bc26-739ab0006e7b', 'Supply, fabrication, and installation of a suspended glass bridge with glass railing, including tempered/laminated glass panels, stainless steel/aluminum structural supports, all necessary structural framing and anchoring, alignment, leveling, fixings, and final cleaning.

Size: 1100mm x 3000mm
Location: Glass Bridge Access Area'),
('ba0ec8c1-14ee-41e8-9e61-388a745c973e', 'Cement Board Partition - Option 2

Supply and installation of 265mm thk straight Cement board partition including all necessary supports and accessories required.

Height considered - 4000mm H
Brand: Gypsemna or equivalent 
Location: Toilets, Pantry, Janitor room
Note: Partitions in between toilet cubicles are excluded, as these are considered pre-fabricated cubicles and will be provided by SCL.'),
('f29a9ab5-4d08-49f7-9ae2-53e58c9672c0', 'Installation aluminum mesh system complete with aluminum framing/support structure and all necessary accessories, including brackets, anchor bolts, stainless steel fasteners, edge trims, sealants, and fixings.'),
('444f9c8c-d97d-4548-b19b-9bc0ba8b37eb', 'Metal Wall Trim

Supply and installation of metal wall and corner trim, including all necessary items required for fixing.

Location: As per the layout'),
('d8f401b7-ffab-47e8-914f-13223b48f75b', 'Pavilion with Column (Type C):

Supply and installation of pavilion metal ring structure fixed to concrete pillar with ropes and anchored to the ground

Size: 3025 mm in length total of 50 Lines 
Note: Rope to be supplied by client (the reduced cost will be on the separate item - Item C5b)'),
('e75cd9ec-7850-4a2a-8000-6f6e2a0fae93', 'Pavilion with Column (Type D):

Supply and installation of pavilion metal ring structure fixed to concrete pillar with ropes and anchored to the ground

Size: 2720 mm in length total of 50 Lines
Note: Rope to be supplied by client (the reduced cost will be on the separate item - Item C5b)'),
('5d4980f7-3a00-4257-8490-a90750c593eb', 'Pavilion without Column (Type A):

Supply and installation of pavilion metal ring with 20mm Manila Jute Rope fixed around internal MS rod with powder coating and anchored to the ground as per provided design

Size: 7280 mm in length total of 50 Lines 
Note: Rope to be supplied by client (the reduced cost will be on the separate item - Item C5b)'),
('c667b64a-57b3-425b-9cda-47168bbb978a', 'Pavilion without Column (Type B):

Supply and installation of pavilion metal ring with 20mm Manila Jute Rope fixed around internal MS rod with powder coating and anchored to the ground as per provided design.

Size: 6230 mm in length total of 50 Lines 
Note: Rope to be supplied by client (the reduced cost will be on the separate item - Item C5b)'),
('289db4a2-7a92-4332-8ebb-89946cf71f80', 'Relocation of Existing Thermostat in Living/Dining Area, including careful removal from existing location, rerouting of wiring, refixing at new location, testing for proper operation, and making good surrounding surfaces.

Location: Living/Dining Area'),
('2a2085fd-790e-4006-8c06-10ced4905236', 'Self-Levelling

Supply and application of self-levelling compound, ready to receive LVT flooring.'),
('76542817-f3e8-4919-9463-88bdb360b038', 'Supply & Fixed Installation of Aluminium Metal, including precision cutting, fixing (adhesive or mechanical), alignment, polishing, surface protection during works, and final cleaning — complete in all respects.

Drawing Code: M004
Material: Aluminium-based decorative laminate
Finish: Stainless Steel Brushed'),
('234d5ada-e2eb-4abc-8360-beddc6939617', 'Supply and Installation of new Blockwall, including mortar mix, jointing, alignment, curing, cutting around services, and scaffolding where required. Complete in all respects as per approved drawings and site conditions.

Location: Extended Area, Office Area, & Master Bathroom.'),
('e0475802-9e80-4f88-a37c-100d23184ee7', 'Supply and application of limewash finish to walls, including surface preparation, primer/sealer as recommended by manufacturer, multiple coats of limewash paint, and touch-ups.'),
('92ba155f-5339-4549-ad0a-2509ef6bcf44', 'Supply and fixed installation of bronze metal. Includes precision cutting, adhesive bedding or mechanical fixing as required, leveling, alignment, polishing, protection during works, and final cleaning — complete in all respects.

Drawing Code: M005
Thickness: 1.0 mm
Material: Aluminium-based decorative laminate Brushed
Finish: Brushed Bronze (Polished)'),
('42f90aa4-86bc-4ee2-8edd-1e6d0dd8a7ee', 'Supply and installation of Bronze Metal, including precision cutting, alignment, and fixing (mechanical/adhesive), polishing and chamfering of edges, surface protection during works, final cleaning and handover — complete in all respects.

Drawing Code: FL004
Material: Aluminium-based decorative laminate
Finish: Brushed Bronze (Polished)
Location: Waterfall Feature'),
('acb7f3b0-e67b-4e29-bfd7-b9d8c4d55696', 'Supply and installation of Kesseboehmer cutlery tray (Fini Liniq finish), including placement, fixing, alignment, and integration within drawer carcass — complete in all respects.

Product: Kesseboehmer Cutlery Tray
Finish: Fini Liniq
Accessories: Fixing hardware included'),
('d5723f67-00c0-479c-a66b-fd1fec37f28e', 'Supply and installation of access panel, including cutting, fixing, alignment, making good surrounding finishes, and protection.

Location: Maids Bathroom (3a - 017)'),
('9e0916f6-c2ea-448b-90df-79ebd4f196da', 'Supply and installation of hand spray set, including holder, flexible hose, connections to existing plumbing, fixing, testing, and commissioning. Complete in all respects.

Location: Maids Bathroom, Guest WC, & Entrance Toilet'),
('226aee38-cc86-4123-8859-d14edb1651ad', 'Supply and installation of pull-out waste bin, including fixing, alignment, integration with cabinet carcass, smooth sliding operation, and final handover — complete in all respects.

Product Details:
Type: Kesseboehmer pull-out waste bin
Finish: Anthracite
Accessories: Rails, brackets, fixing hardware included
Size: 450mm'),
('15248766-a664-4893-ab7f-07f96e39475c', 'Supply and installation of recessed wall niche with 2 cm thick stone finish and cement board backing (0.15 + 0.10 + 0.70 + 0.10 + 0.15 m), including cutting and preparation of wall opening, installation of moisture-resistant cement board substrate, fixing of stone panels to all sides (bottom, top, sides, and back if required), proper edge finishing, sealing of joints, waterproofing treatment, alignment, and site cleaning. Works include all materials, labor, consumables, tools, and protection — complete in all respects as per approved drawings and finish sample.

Size: 700 mm (L) × 100 mm (D) × 300 mm (H)
Finish: 2 cm thick stone (external finish) to be supplied by client
Location: Master Bathroom - Shower Area'),
('2fc748ee-b87a-4442-9ba9-ed730ce6e0d2', 'Supply and installation of residential/home elevator, including cabin, guide rails, motor, soft starter, control panel, doors, and related accessories.

Specifications: it depends (price may vary)
Type: Residential/Home Elevator
Travel: Ground + 2 Floors
Cut-out Size: 1505 mm x 1820 mm
Cabin Size: 1100 mm x 1500 mm

Location: Proposed Lift area near staircase ( G + 2)'),
('7ea07a80-0e50-4c16-b813-a89078dd1201', 'Supply of labor, equipment, abrasives, and consumables for polishing of existing white marble surfaces, including surface cleaning, grinding, successive grit polishing, buffing, finishing to high gloss, and final cleaning — complete in all respects.

Drawing Code: FL001
Material/Surface: Existing White Marble'),
('20572d72-1d9f-445d-abd0-f65aaa5eb5a9', 'Supply of tracklights, including delivery charges and other accessories

Type: 3 tracks with 3 adjustable heads per track depending on layout.
Location: Kitchen'),
('5db42ddd-133a-4989-9fe4-f990db54bb57', 'Supply of wall-mounted tissue holder, including delivery charges and other accessories

Brand: Bagno Design
Location: Master Bathroom, Bathroom 02 & Powder Room'),
('c9502d97-8c1f-4f29-8cba-1395348856cc', 'Supply, fabrication, and installation of manual roller blinds, including measurement, cutting to size, mounting brackets, roller tube, chain mechanism, fixing to wall/ceiling, alignment, testing, and protection of surrounding finishes.

Type: Manual Roller Blinds
Hardware: Louvolite
Fabric: Solar Weave Collection
Warranty: 1 years from the date of installation
Size: 2000mm W x 3000mm H
Location: Secretary Room'),
('8eb143db-bc7a-4c3b-bc4c-6b049271c888', 'Supply, fabrication, and installation of rotating solid wood panel, size 700 mm × 2500 mm, panel made of solid Meranti hardwood, kiln-dried and chemically treated with anti-termite solution. Panel to be supported with steel bracket assembly (top and bottom) including bearing rod mechanism to allow smooth rotation. Steel parts to be fabricated from powder-coated mild steel, securely fixed to structural substrate. Complete installation includes alignment, anchoring, protective finishing of wood, and final cleaning — all complete in all respects.'),
('1ae09929-a380-4b9e-ad01-5f01095a912e', 'BF-400 Production and installation of TREE BENCH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 400
Area: Courtyard A'),
('76d5a1af-ebba-4fc0-8ad4-702970a53dfa', 'BF-401A Production and installation of OUTDOOR LONG-HIGH BENCH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 401A
Area: Courtyard A'),
('9f60752a-b456-4d24-be85-4e555f82da79', 'BF-401B Production and installation of OUTDOOR SHORT-HIGH BENCH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 401B
Area: Courtyard A'),
('e76b1a25-1a70-47b3-86fb-b0c91b8a2c7c', 'BF-402 Production and installation of RECEPTION BENCH as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details.

Ref: 402
Area: Indoor Entrance'),
('2c29159e-38cb-4f46-a110-b54a012de021', 'BF-403 Production and installation of PLANTER BOX as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 403
Area: Courtyard A'),
('690ff34e-e1e4-41cb-a5df-9b22bb79eaf5', 'BF-404 Production and installation of RECEPTION COUNTER (one indoor, one outdoor) as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. Outdoor unit: all materials and finishes to be outdoor-rated and UV-resistant.

Ref: 404
Area: Arrival'),
('0061f1af-86f4-4172-977f-c18a495bc2fa', 'BF-405A Production and installation of OUTDOOR FEATURE A as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 405A
Area: Arrival'),
('1c0e25cf-212e-4c18-8c0b-a3df5c27251c', 'BF-405B Production and installation of OUTDOOR FEATURE B as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 405B
Area: Arrival'),
('49e2e1e7-789d-4cd5-b8f0-30e7be21dcba', 'BF-405C Production and installation of OUTDOOR FEATURE C as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 405C
Area: Arrival'),
('e47fe5fc-72b5-4b20-ad6c-b83134bf162a', 'BF-405D Production and installation of OUTDOOR FEATURE D as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 405D
Area: Arrival'),
('78fc8da0-4335-42e6-b2d2-2c9001d81151', 'BF-406A Production and installation of OUTDOOR SERVICE STATION as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 406
Area: Outdoor Dining'),
('4fe21868-1a38-4f67-89f1-dcc0abed22b1', 'BF-406B Production and installation of OUTDOOR SERVICE STATION as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 406
Area: Outdoor & Indoor Dining'),
('8e1e726a-5552-4f75-af15-1dad97313d28', 'BF-407 Production and installation of BANQUETTE SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 407
Area: Outdoor Dining'),
('c3577384-6674-4ce2-aa6e-ff1b84e8c342', 'BF-408A Production and installation of DISPLAY CABINET as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. 

Ref: 408A
Area: Indoor Entrance'),
('221cdc8f-2341-4346-8e3b-90e8c2ee3474', 'BF-409A Production and installation of DINING BOOTH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. 

Ref: 409A
Area: Indoor Dining'),
('dbe93287-a315-4f08-b1f3-591dfc60a54b', 'BF-409B Production and installation of METAL FRAME DIVIDER as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. 

Ref: 409B
Area: Indoor Dining'),
('0c5a3217-3544-4647-b517-0b8079c1b2d7', 'BF-410 Production and installation of ROUND BOOTH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. 

Ref: 410
Area: Indoor Dining'),
('582f4b85-5a0c-4ba0-922f-6c18bdc56eef', 'BF-412A Production and installation of FRONT BAR COUNTER WITH INTEGRATED DJ BOOTH as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. 

Ref: 412A
Area: Bar Area'),
('a670d456-81c6-429c-881b-87c6aa00b8a5', 'BF-412B Production and installation of BACK BAR COUNTER as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. 

Ref: 412B
Area: Bar Area'),
('5a61c393-c720-4551-821b-cfa95ba30146', 'BF-414 Production and installation of OUTDOOR COMPACT DJ BOOTH as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. (DESIGN TBD)

Ref: 414
Area: Indoor Dining'),
('7c5ff968-b0a9-4eb7-a0dc-2243b72607d1', 'BF-415 Production and installation of BAR BOOTH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. 

Ref: 415
Area: Bar Area'),
('b5e381fd-ae4f-4b0c-8bab-c1b0408bb2cd', 'BF-416 Production and installation of COURTYARD B BOOTH SEATING as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 416
Area: Courtyard B'),
('7dfe0165-fb2b-4af3-897e-32c3d171a6d8', 'BF-417A Production and installation of OUTDOOR PERGOLA FRAME (METAL STRUCTURE) as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 417A
Area: Courtyard B'),
('60ec0084-d67d-46be-b9b8-a284d3e6e86a', 'BF-417B Production and installation of OUTDOOR METAL FRAME WITH DECORATIVE BEADS as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 417B
Area: Courtyard A&B'),
('3ad0cb2d-2b02-450e-aa24-8a754309359a', 'BF-417C Production and installation of OUTDOOR METAL FRAME WITH DECORATIVE BEADS as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.s to be outdoor-rated and UV-resistant.

Ref: 417C
Area: Courtyard A'),
('a5160510-8d74-44b6-92e3-5e6707f443f6', 'BF-417D Production and installation of OUTDOOR METAL FRAME WITH DECORATIVE BEADS as per drawings and design. Contractor to refer to joinery drawings and specification sheets for details. All materials and finishes to be outdoor-rated and UV-resistant.

Ref: 417D
Area: Courtyard A'),
('8c6d4097-6f4f-4989-b1d7-6405a2f8f490', 'Preliminaries, including transport and delivery, mobilization and demobilization, site protection, temporary works, site supervision/QAQC, wastage handling and cleaning, and provision of tools, consumables, adhesives, and fasteners — complete in all respects'),
('cdb3b14a-78a3-4da9-8419-ef03ab4ff9db', 'Construction of New Room with Bathroom Above Garage — including full scope of works:

Scope of Work:
- Structural Support: Design, supply, and installation of structural elements (beams, columns, slab reinforcement) to support room and bathroom above garage.
- Block Works: Construction of walls using approved block type, including internal partition walls.
- Plastering: Internal and external cement plaster to walls, skim finishing where required.
- Roofing/Ceiling: Roof slab, waterproofing, and ceiling finishes.
- Flooring & Tiling: Floor finishes including ceramic/porcelain tiles in bathroom and room areas.
- Interior & Exterior Finishing: Painting, wall finishes, skirting, trims, and exterior façade finishes as per approved samples.
- MEP Works: Basic plumbing, electrical points, drainage, and fixtures in bathroom and room area.
- Site Works: Scaffolding, temporary support, debris removal, protection of existing structures, and cleaning.

Exclusions: Consultant & Engineering Company charges for approval will be qouted separately

Location: Above Garage Area'),
('73e88c5d-82c6-4376-8612-065e67ca8e2d', 'Design, Supply & Installation of Wardrobe Island Counter — Premium custom-made island counter for Dressing Area.

Construction & Materials:
- Carcass: 18mm moisture-resistant MDF, veneered on all exposed faces.
- Top Surface: 20mm thick marble.
- Front & Side Panels: High-quality natural wood veneer 
- Base & Skirting: MDF plinth with matching PU finish.
Hardware & Accessories: Imported Blum / Hafele soft-close hinges, runners, and concealed brackets for structural support. Optional integrated LED strip lighting for accent illumination.
Installation: Proper leveling, fixing, polishing, sealing, and surface protection during handover.

Configuration:
- Drawers: 4 full-extension soft-close drawers on one side for accessories or folded clothes.
- Pull-out Trays / Dividers: 1–2 pull-out trays for small items (jewelry, belts, or ties).
- Open Shelf / Display Area: Optional open shelf on one side for decorative items.
- Hanging Space: Not included (counter height is limited).
- Hardware: Soft-close Blum/Hafele runners for drawers; concealed brackets for structural support.

Size: 600mm W x 1220mm L x 900mm HT
Location: Dressing Area'),
('debe0c9a-4255-4d76-bcf6-4fdda36d0738', 'Dimensions: 3500mm L x 650mm W x 900mm H Location: Male & Female Toilet - Pre-Function Area'),
('8ca4a5e3-5d3a-4853-817a-86bf9708ffa4', 'Installation and second fixing of client-supplied ceiling-mounted shower head, including connection to pre-installed concealed water supply outlet, installation of ceiling arm/drop pipe (supplied by client), alignment, sealing, testing, commissioning.

Location: Shower Area'),
('1955a5c0-f195-4a2a-b96e-903f93effc6f', 'Installation and second fixing of client-supplied dual flush plate, including alignment, fixing to concealed cistern frame, connection and adjustment of actuation rods/mechanism, testing of flush operation, and commissioning.

Location: WC Area'),
('7d8405f1-efac-4352-93d9-7b45f4b88bf7', 'Installation and second fixing of client-supplied freestanding bath mixer with spout, including connection to pre-installed hot and cold water supply points, fixing to finished floor surface, alignment, sealing, testing, and commissioning.

Item Code: SW11
Location: Master Bathroom
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('8607f14b-9325-472f-9e88-ab2e20d10578', 'Installation and second fixing of client-supplied freestanding bathtub, including positioning, leveling, connection to pre-installed waste and overflow system, sealing, testing, and commissioning.

Item Code: SW10
Location: Master Bathroom
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('ba768f62-b0c0-437f-bc38-1f83c9ccae7e', 'Installation and second fixing of client-supplied linear tile-in floor drain, including alignment, level adjustment, fitting of tile insert cover, connection to pre-installed drainage outlet, sealing, testing, and commissioning.

Location: pantry'),
('15167583-7b85-4508-b88d-b5d897792f76', 'Installation and second fixing of client-supplied linear tile-in shower drain, including alignment, level adjustment, fitting of tile insert cover, connection to pre-installed drainage outlet, sealing, testing, and commissioning.

Location: Shower Area'),
('dd1847ba-c8a9-4be9-b88c-4092687fb699', 'Installation and second fixing of client-supplied robe hook, including setting out, drilling, fixing to finished wall surfaces, alignment, tightening of fixings, cleaning

Location: WC & Shower Area'),
('17a4cbd2-ca7c-4538-aff5-cde832d24108', 'Installation and second fixing of client-supplied shattaf set, including shattaf head, flexible hose, wall outlet connection, holder bracket, connection to pre-installed cold water supply point, alignment, sealing, testing, and commissioning.

Location: WC Area'),
('00b1aaf2-769c-4232-9761-2ee7a9f0b72e', 'Installation and second fixing of client-supplied shower mixer with diverter, including fitting of trim plate, handle(s), diverter control, connection to pre-installed concealed valve body, alignment, sealing, testing, and commissioning.

Location: Shower Area'),
('4738475b-f806-4cbe-b933-91ce0f81b7b7', 'Installation and second fixing of client-supplied square tile-in floor drain, including alignment, level adjustment to finished floor level, installation of tile insert cover, connection to pre-installed drain outlet, sealing, testing, commissioning.

Location: WC Area & Salon'),
('da931447-9ca4-4dda-998c-69df89f2e59b', 'Installation and second fixing of client-supplied surface mounted basin mixer, including fixing to countertop or basin deck, connection to pre-installed hot and cold water supply lines, installation of flexible hoses and fittings, alignment, sealing, testing, and commissioning.

Location: pantry'),
('9927b1f9-e628-40c0-b625-393599ef56fe', 'Installation and second fixing of client-supplied toilet roll holder, including setting out, marking, drilling, fixing to finished wall surface, alignment, tightening of fixings, sealing (if required), and cleaning.

Location: WC Area'),
('adf76d8d-9c87-46b0-bdf6-c89409fb6948', 'Installation and second fixing of client-supplied undercounter washbasin set, including basin positioning, fixing beneath countertop, connection to pre-installed hot and cold water supply lines and drainage outlet, installation of waste fittings, sealing, alignment, testing, and commissioning.

Location: pantry'),
('496dff8e-9b42-45ad-a928-299f22423a47', 'Installation and second fixing of client-supplied wall-hung water closet complete with seat cover, including fixing to pre-installed concealed carrier frame, connection to prepared water supply and drainage outlets, alignment, sealing, testing, and commissioning.

Location: WC Area'),
('064202c4-afe7-4df3-a467-536a3b8603e2', 'Installation and second fixing of client-supplied wall-mounted basin mixer, including installation of trim plate, spout, handle(s), connection to pre-installed concealed mixer body and water supply outlets, alignment, sealing, testing, and commissioning.

Item Code: SW05B
Location: Family Powder Room
Note: First fix by MEP Contractor (to be reviewed/confirmed and quoted separately); second fix, testing, and commissioning by Bolsover.'),
('6f6d39e5-8bae-41d4-a786-97ef1f4e85e0', 'Installation and second fixing of client-supplied wall-mounted shower head, including shower arm, escutcheon plate, fixing accessories, connection to pre-installed water outlet, alignment, sealing, testing, and commissioning.

Item Code: SW07C
Location: Master Bathroom, Bathroom 02
Note: 1st fixing to be done by MEP contractor, 2nd fixing to be done by Bolsover'),
('7860aa42-adc8-4a73-b4a8-66fe829cc7bc', 'Installation of client-supplied concealed cistern, fixing of frame/support system, alignment, connection to water supply and discharge line, flushing mechanism setup, testing for leaks, and proper coordination with wall build-up.'),
('dfc1290b-99f8-4770-aaf3-da85c5711188', 'Installation of client-supplied flush plate to concealed cistern, including fixing, alignment, testing and making good.'),
('34512231-de99-4066-9c09-4fdb8da9f600', 'Installation of client-supplied hand spray, including fixing, connection to existing water supply, sealing, testing, and commissioning'),
('aa99e2ab-6dc2-4190-ae91-874617c91557', 'Installation of client-supplied tissue holder, including fixing, alignment, and making good to finishes.'),
('93f76a75-0a2c-40f9-b4f4-0209c75663ad', 'Installation of client-supplied vanity mirror, including fixing, alignment, protection, and making good to wall finishes.'),
('b4240a1e-74e3-430f-8060-fd9c2e2e1ff8', 'Installation of client-supplied wall-mounted mixer, including fixing, connection to existing piping, testing and making good to finishes.'),
('68da7b2e-8250-4349-8602-5abf8188fc5c', 'Installation of client-supplied wall-mounted shower set, including fixing, connection to existing piping, testing, sealing, and making good to finishes.'),
('bc07bbcb-28d6-4174-a55e-409e211300b6', 'Installation of client-supplied water closet, including fixing, connection to existing water supply and drainage, sealing, testing and making good to finishes.'),
('36b04939-77c1-41b1-8437-f5ab02bbcc3d', 'Installation of countertop mixer tap, including connection to hot and cold water supply, testing, and alignment.

Brand: Bagno Design
Location: Master Bathroom, Bathroom 02, Powder Room'),
('2b234d1d-3860-4f4a-8a2a-4d5d2112ce84', 'Installation of countertop wash basin, including fixing to countertop, sealing, connection to existing water supply and drainage, and testing.

Brand: Bagno Design
Location: Master Bathroom, Bathroom 02 & Powder Room'),
('e1df0aee-8fd5-4aa5-8896-73c8b18f2f03', 'Installation of floor-mounted water closet (WC), including fixing to floor, sealing, connection to existing plumbing/drainage, and testing.

Brand: Kludi
Location: Master Bathroom, Bathroom 02, & Powder Room'),
('6e8a6948-b7f1-42cb-9530-401f3dca933d', 'Installation of hand spray / bidet spray, including wall-mounted bracket, flexible hose, connection to existing water supply, and testing.

Brand: Bagno Design
Location: Master Bathroom, Bathroom 02, Powder Room'),
('485b12a5-08a4-4af3-9d1c-988fbc2e6276', 'Installation of shower set, including wall-mounted showerhead, mixer, riser rail, connections to existing plumbing, fixing, and testing.

Brand: Bagno Design
Location: Master Bathroom & Bathroom 02'),
('ddaea573-ef31-45fe-83fc-4bf95d66a90c', 'Installation of wall tiles, including surface preparation, adhesive, laying, grouting, and finishing.

Location: 
1. Guest Bathroom (floor area: 2.00m x 2.35m)
2. Powder Room (floor area: 1.40m x 2.00m)
3. Master Bathroom (floor area: 3.25m x 2.95m)
4. Bathroom 02 (floor area: 1.60m x 3.35m)'),
('19c33e6a-c500-4c04-b292-7a2bf5db66b3', 'Installation of wall-mounted tissue holder, including fixing, alignment, and testing.

Brand: Bagno Design
Location: Master Bathroom, Bathroom 02 & Powder Room'),
('5e3e3417-e56b-44e1-acad-a0703b8d313d', 'Modification of existing plumbing system to suit new wash basin and mixer installation, including adjustment/extension of hot and cold water supply lines, drainage modification, connection to new basin position, testing, and commissioning,

Location: Powder Room'),
('e12dc328-a72e-4747-a331-dc715a70f573', 'Removal / demolition of existing non-structural wall, including breaking, dismantling, debris removal, and disposal.

Location: Master Bedroom Walk in Wardrobe'),
('0842105f-689c-486a-9fbb-682a3ca2b7ef', 'Removal and disposal of existing floor finishes, complete with site cleanup and preparation for subsequent works.

Location: Master bedroom & dressing area flooring excluding Master Bathroom & terrace 3 flooring'),
('257516a5-55ba-4c3b-97e8-62b654a9031a', 'Supply and Installation of Custom-Made Wardrobe — Premium built-in wardrobe for Master Bedroom.

Construction & Materials:
Carcass: 18mm moisture-resistant MDF, internal finish in melamine.
Shutters/Doors: Lacquered MDF with PU satin finish
Handles: Concealed finger pull / integrated profile handles in matte black.
Hardware: Imported Blum / Hafele soft-close hinges, drawer runners, and internal accessories.
Back Panel: 9mm MDF board with melamine finish.
Internal Fittings: Combination of shelves, drawers, hanging rails, and accessory trays as per approved layout.
Base & Skirting: MDF plinth with matching PU finish.
Installation: Proper alignment, joint sealing, polishing, surface protection, and final cleaning included.

Configuration:
- Doors: 8 panels (approx. 593mm wide × 2400mm high) — full height, swing type.
- Sections: 4 major compartments (~1187mm each).
- Drawers: 8 nos. (2 per section, internal).
- Shelves: 12 adjustable shelves (3 per section on average).
- Hanging Space:
2 long-hang sections (for dresses/coats).
2 short-hang sections (for shirts/pants).
- Accessories: Pull-out trays, hanging rods, divider trays.

Size: 4750mm L x 600mm D x 2400mm HT
Location: Master Bedroom'),
('09c27746-4cbf-410d-8a7a-ec36efd53015', 'Supply and Installation of Custom-Made Wardrobes — Premium built-in wardrobes, designed and fabricated to the following sizes:
- 3750mm (L) × 600mm (D) × 2400mm (H)

Construction & Materials:
- Carcass: 18mm moisture-resistant MDF, internal finish in melamine.
- Shutters/Doors: Lacquered MDF with PU satin finish
- Handles: Concealed finger pull / integrated profile handles in matte black finish.
- Hardware: Imported Blum / Hafele soft-close hinges, runners, and accessories (pull-outs, hanging rods, and drawer dividers).
- Back Panel: 9mm MDF board with melamine finish.
- Internal Fittings: Combination of shelves, drawers, hanging rails, and accessory trays as per approved layout.
- Base & Skirting: MDF plinth with matching PU finish.
- Installation: Proper alignment, joint sealing, polishing, surface protection, and final cleaning.

Configuration:
- Doors: 6 panels (each approx. 625mm wide × 2400mm high) — full height, swing type
- Sections: 3 major compartments (approx. 1250mm each)
- Drawers: 6 nos. (2 drawers per section, inside carcass)
- Shelves: 9 adjustable shelves (3 per section on average)
- Hanging space:
1 long-hang section (for dresses/coats)
2 short-hang sections (for shirts/pants)
Accessories: Pull-out tray, hanging rod, and small divider trays

Location: Dressing Area'),
('74339590-dd7c-4183-9a93-757ab7390f09', 'Supply and Installation of New Door Including Door Frame and Ironmongeries

Supply and installation of approved door leaf with matching frame, complete with hinges, lockset, handle, door stopper, and all necessary ironmongery. Works include preparation of opening, alignment, fixing of frame and leaf, sealing gaps, touch-up finishing, and protection of adjacent surfaces. Complete in all respects as per approved material sample, design, and specifications.

Size: 900mm x 2100mm
Location: Entry Area'),
('7b5ac435-3ef7-4f26-bc32-d921bedba00b', 'Supply and Installation of Tiles on Floors and Walls — including supply of approved tiles, tile adhesive, and grout; surface preparation; leveling; cutting for edges, corners, and openings; proper fixing and alignment; joint grouting; finishing and cleaning; all labor, tools, materials, protection, and site cleanup included — complete in all respects as per approved samples and specifications.'),
('4202bc6f-8618-448a-a50a-6c7bb26834fa', 'Supply and Provision of Electrical Sockets, including cutting, back boxes, fixing, connection to existing wiring, testing, and commissioning. Complete in all respects.

Location: Master Bathroom'),
('2c5270f6-8c3f-4615-8c38-36cd8cb95dda', 'Supply and application of paint on newly installed MR gypsum board ceiling, including surface preparation, joint filling, sanding, priming, two coats of finish paint, masking/protection of adjacent surfaces, and cleaning of completed work.'),
('4fb85cde-f718-47ca-8cb9-94964aa5b6bc', 'Supply and application of waterproofing membrane/coating on entire floor and walls up to 30 cm height, including surface preparation, priming, application of waterproofing material in accordance with manufacturer’s specifications, curing, pond testing, and protection of adjacent finishes.'),
('b73143d3-c81a-481a-848f-1ed2b6522d57', 'Supply and application of waterproofing to entire floor areas and up to 30 cm on walls, including surface preparation and pond testing.

Location: Study Room Washroom, Master Bathroom & Bedroom Bathroom'),
('b99c6373-9c39-4592-aefa-d034c6451c95', 'Supply and construction of new masonry wall, including blockwork, plastering on both sides, surface preparation, primer, and final paint finish.

Location: Master Bedroom Walk in Wardrobe'),
('fc4ee335-3095-46ff-8581-ee379164eb60', 'Supply and fixing of Master dressing cabinet made of MDF, wood veneer finish, including drawers, hagers, provision for locker fixing, Mirror and HPL laminate top.

Size: (1050 + 3300mm + 2200mm) L x 2500mm Ht x 600mm D
Location: Master Bedroom Walk in Wardrobe'),
('1bddf3f9-7cca-4614-ab9d-e61b071d8a7e', 'Supply and fixing of dressing table, including MDF carcass, melamine inside finish, PU painted outside finish, drawers/shelves.

Size: 300mm D x 700mm L
Location: Master Bedroom Walk in Wardrobe'),
('20c16481-a498-4904-b48c-6ccd1eda391a', 'Supply and installation of WC with soft-close seat and cover, suitable for floor/wall outlet, including close-coupled cistern with mechanism, fixing kit, alignment, sealing, testing, and protection of surrounding surfaces.

Brand/Type: BagnoDesign - Aquaeco
Material Code: COMP-000282
Finish: White'),
('7ee18e04-e8e4-41c1-8d77-4acf02c10eb1', 'Supply and installation of access panel, including frame, door, fixing, alignment, and finishing.'),
('d4804ab5-2f3a-47c6-b037-d5f98fec9a0d', 'Supply and installation of backlit LED mirror with aluminum frame, edge frosting, sensor switch, mains operated 220–240 V, IP44, including fixing kit, alignment, electrical connection to nearest power point, testing, and protection of finished surfaces.

Brand/Type: BagnoDesign - Stratos
Material Code: BDR-STR-160-FG
Size: 700mmx 55mm x 1600mm H
Finish: Frosted'),
('9af21130-c2f9-425a-861a-be14168a74c6', 'Supply and installation of bidet spray (shattaf) including spray head, flexible hose, wall bracket, angle valve connection, fixing accessories, testing, commissioning.

Notes:
1. Material sample to be submitted and approved by client prior to installation
2. Supply PC Rate: AED 70/No.'),
('9079599e-bfab-47b7-9637-5087a8e35a92', 'Supply and installation of bidet spray kit with 125 cm brass hose, including wall mounting, alignment, connection to water supply, sealing, testing for proper operation, and protection of surrounding surfaces.

Brand/Type: BagnoDesign - Bossini
Material Code: BOS-C98029B-WH
Finish: White'),
('d4f6e02c-74d3-4efb-a87c-c55a146bc36c', 'Supply and installation of concealed 2-hole basin mixer without waste, spout length 173 mm, stainless steel grade 316, minimum operating pressure 0.5 bar LP, including wall rough-in, alignment, connection to hot and cold water supply, sealing, testing for proper operation, and protection of surrounding surfaces.

Brand/Type: BagnoDesign - Studio 316
Material Code: BDM-STU-315-BS
Finish: Brushed Stainless Steel'),
('b43d539b-1351-4ded-b0bb-829b230c601d', 'Supply and installation of concealed cistern with support frame for wall-hung WC, including fixing, alignment, testing, and making good surrounding finishes.

Brand: Bagno Design / Sanipex
PC Rate: 1,500 AED / Nos.'),
('f82dd5dd-b365-468d-8a8e-ec1e120d73cc', 'Supply and installation of corner wash basin with deck mounted mixer including fixing accessories, brackets/supports, flexible connections, connection to water supply and drainage system, sealing, testing, commissioning.

Brand: RAK Ceramics

Notes:
1. Material sample to be submitted and approved by client prior to installation
2. Supply PC Rate: 350 AED/Nos. for corner wash basin & 320 AED/Nos. for deck mounted mixer'),
('95bbd994-0448-4c6b-830b-3d560dcc3d01', 'Supply and installation of countertop wash basin without overflow, including proper alignment, fixing to countertop, sealing with approved silicone, and protection of surrounding surfaces.

Brand/Type: BagnoDesign - Studio 316
Material Code: BDS-STU-705-WH
Size: 400mm dia. X 145mm
Finish: White');
insert into scheduler.rate_fix_stage (id, description) values
('e550950d-2cb1-4bdd-b60b-486f59326dbd', 'Supply and installation of deck mounted mixer including mixer unit, fixing accessories, flexible connections, connection to new hot and cold water supply lines, testing, commissioning.

Brand: Bagno

Notes:
1. Material sample to be submitted and approved by client prior to installation
2. Supply PC Rate: AED 550/Nos.'),
('64dc3eab-621a-48f2-859a-6245a92e76a0', 'Supply and installation of deck-mounted mono basin mixer with pop-up waste, including alignment, connection to hot & cold water supply, sealing, testing for leaks, and protection of finished surfaces.

Brand/Type: BagnoDesign - Mezzanine
Material Code: BDM-MEZ-301-B-CP
Finish: Chrome'),
('08b580ec-888c-4b35-a479-69787b19efa7', 'Supply and installation of downlights, including cutting, wiring, fixing, and testing.

Fixture Specs:
- LED Downlight, 7 W (or 600 lm)
- Color temperature: 4000 K (neutral white)
- IP44

Location: Master & Bedroom Bathroom'),
('af8a794e-f3ba-4d3d-90a8-b8d909e28a61', 'Supply and installation of floor mounted toilet (WC) including toilet bowl, soft-close seat cover, fixing accessories, connection to water supply and drainage system, sealing, testing, commissioning.

Brand: RAK Ceramics

Notes:
1. Material sample to be submitted and approved by client prior to installation
2. Supply PC Rate: 1000 AED/Nos.'),
('ac96fd6e-6f88-4d22-9e23-a3d49f68ea49', 'Supply and installation of floor trim, including cutting, alignment, fixing, jointing, and finishing. Complete in all respects.

Material: Aluminum
Location: Master Bedroom Only'),
('dacf6cbe-30bf-4b56-928f-3dfb99b9887e', 'Supply and installation of flush plate for wall-hung WC, including fixing, alignment, testing, and making good wall finishes

Brand: Bagno Design / Sanipex
PC Rate: 400 AED / Nos.'),
('f4ab8457-eb5f-4b43-bce5-938b5a418ee4', 'Supply and installation of glass shower door handle with integrated towel bar, including alignment, fixing on shower glass door, minor adjustments, and protection of adjacent surfaces. Complete in all respects with labor, tools, and accessories as per manufacturer’s specifications and approved sample.

Brand/Type: BagnoDesign - Hotel
Model Code: BDA-HOT-352-A-CP
Size: 485mm x 153mm
Finish: Chrome
Location: Master Bathroom Shower Glass Door'),
('de6bbd2f-54d9-426d-8485-7e073d10f30a', 'Supply and installation of illuminated LED mirror (white, warm & daylight) with dimmer, defogger touch switch, mains 220–240 V, IP44, including fixing kit, electrical connection, and protection.

Brand/Type: Bagno Design - Beach House
Material Code: BDR-BCH-0610-CL
Size: 600mm W x 30mm thk. x 1000mm HT
Finish: Clear'),
('905fd118-0e66-411d-8533-bb60ab75cf59', 'Supply and installation of linear-type insert floor drain for shower area, including connection to existing drainage system, alignment, fixing, sealing, testing, and protection of adjacent finishes.'),
('2aa4fbd8-5da8-46ba-8995-ad1da1c4402e', 'Supply and installation of marble flooring over existing tiles, including surface preparation, cutting to size, adhesive fixing, grinding, crystallization, polishing, and finishing.

Location: Master Bathroom & Bedroom Bathroom'),
('9b7bd514-2e63-4eee-ba19-ce114c9859fe', 'Supply and installation of mixer, including all connectors, fixing, sealing, connection to hot & cold water, testing, and making good surrounding surfaces.

Type: Deck Mounted
Brand: Bagno Design / Sanipex
PC Rate: 1,350 AED / Nos.'),
('dfb984af-94ca-4676-a944-4af79381bf04', 'Supply and installation of moisture-resistant gypsum board ceiling, including framing, boards, jointing, cut-outs for fixtures, primer and paint.

Location: Master Bathroom & Bedroom Bathroom'),
('bab1b9fa-655b-42ae-a0ae-44154be055dd', 'Supply and installation of new Luxury Vinyl Tile (LVT) flooring, including surface preparation, adhesive/bedding, cutting, jointing, alignment, final cleaning, and complete protection.

Pattern: Herringbone
Location: Master Bedroom Only'),
('5add8402-93ef-411c-adc3-55ae14553490', 'Supply and installation of new MR (Moisture-Resistant) gypsum board ceiling, including metal framing, gypsum board fixing, joint finishing, sanding, alignment, leveling, integration of electrical conduits if required, protection of adjacent surfaces, and cleaning of completed work.'),
('bfa4d618-f411-4945-8edf-0fd5111df348', 'Supply and installation of new access panel, including cutting/opening (if required), frame fixing, alignment, securing, and protection of adjacent finishes.'),
('41e9d023-be7c-4e01-a1a9-85c0ffe64dbf', 'Supply and installation of new fitted carpet flooring as per approved design and sample, including surface preparation, cutting, joining, alignment, fixing, and final cleaning. Complete in all respects.

Location: Dressing Area Only'),
('0cf67563-698e-4640-a50a-2c6c7d8e02f7', 'Supply and installation of new floor and wall tiles, including surface preparation, adhesive/bedding application, precise laying, cutting, jointing/grouting, leveling, edge finishing, cleaning, and protection of completed surface.

Brand: Local Market'),
('06c6f7c8-dcfe-4ccf-a1d8-aeca25bc651f', 'Supply and installation of new water closets in the same position, including connection to existing plumbing, alignment, leveling, sealing, testing, and protection of adjacent finishes.'),
('d045747f-837c-4b5a-b1ae-da75ce07f0ba', 'Supply and installation of overcounter sink including fixing accessories, supports/brackets, connection to water supply and drainage system, sealing, testing, commissioning.

Notes:
1. Material sample to be submitted and approved by client prior to installation
2. Supply PC Rate: 780 AED/Nos.'),
('eeebcc79-d033-427c-ab53-36abb805c0d4', 'Supply and installation of overcounter wash basin including fixing accessories, brackets/supports, connection to water supply and drainage system, sealing, testing, commissioning.

Brand: Bagno

Notes:
1. Material sample to be submitted and approved by client prior to installation
2. Supply PC Rate: 650 AED/Nos.'),
('1d3e81a8-9b77-46df-bfcc-f158bd96f217', 'Supply and installation of power point for client-supplied wall light, including supply of wiring (FRLS copper cable), PVC/GI conduit, back box, modular switch (if required), terminations, chasing, making good, testing and commissioning — complete in all respects.

Location: Powder Room & Corridor Area'),
('7bfc5a09-54c8-49a4-b420-b8f975799f97', 'Supply and installation of recessed downlights, including electrical connection to existing circuits, mounting within ceiling framework, alignment, leveling, wiring, testing, and protection of surrounding finishes

Location: First Floor Area, GF - Living, GF - Dining, GF - Family 01, Main Entrance & Corridor Area'),
('0748fe73-8145-4e08-b53f-1f39dbfcaf71', 'Supply and installation of rectangular mirror with curved edges and integrated LED lighting, including fixing, electrical connection, and finishing.

Location: 
a. 2 nos. for master bathroom
b. 1 nos. for bathroom 02'),
('1ea156f0-954b-44b5-8dd4-783843e04f7c', 'Supply and installation of round mirror with metal frame, including fixing to wall with appropriate anchors, alignment, leveling, and protection of surrounding surfaces.

Brand/Type: Bagno Design - Nara
Material Code: BDR-NAR-R110-A-MB
Size: 1100mm Dia. x 50mm
Finish: Matt Black'),
('4a772ae1-3e73-4456-932d-fd01931622bf', 'Supply and installation of shower set, including all connectors, fixing, sealing, testing, and making good surrounding wall surfaces.

Type: Shower Column with Shower Head Dia. 200 mm with 3 Function Hand Shower & Hose
Brand: Bagno Design / Sanipex
PC Rate: 1,200 AED / Nos.'),
('5d1756a4-b9bf-41a2-ab04-4dd16c220ff6', 'Supply and installation of side towel rail, including fixing to wall with appropriate screws and plugs, alignment, leveling, and protection of surrounding surfaces.

Brand/Type: BagnoDesign - Smooth
Material Code: BDA-SMO-712-D-CP
Size: 400mm W x 50mm 
Finish: Chrome'),
('3405cf81-dedd-4c6a-b7ea-8c43b5fabe0b', 'Supply and installation of square-type insert floor drain, including connection to existing drainage system, alignment, fixing, sealing, testing, and protection of adjacent finishes.'),
('2d0ae9dc-65a8-4141-93eb-b3252bb7d20b', 'Supply and installation of tempered glass shower partition and door, including all necessary aluminum/SS profiles, hinges, handles, seals, alignment, leveling, fixing, and protection of adjacent finishes.'),
('3db1543b-3f10-4e70-83d2-9e0f94f1c5f0', 'Supply and installation of tile insert floor drain, including proper leveling and alignment with surrounding floor tiles, connection to existing drainage pipework, sealing, testing for water flow, and protection of surrounding finishes.

Brand/Type: AquaDrain - Heavy Duty Tile Drain
Material Code: AQD-TG-14650A0-316-BS
Finish: Brushed Stainless Steel
Size: Outlet Dia. 51mm'),
('96d16f58-a39c-4726-9538-e2b24c10b6c1', 'Supply and installation of tile-insert floor drain, including supply of stainless steel drain, proper leveling, waterproofing, tile-insert frame, grouting, testing, and making good surrounding floor surfaces.

Brand: Bagno Design / Sanipex
PC Rate: 385 AED / Nos.'),
('bd058c4f-be5f-46db-967d-b697da67a366', 'Supply and installation of tile-insert linear type floor drain for shower, including supply (PC), fixing, leveling, testing, and making good surrounding floor finishes.

Brand: Bagno Design / Sanipex
PC Rate: 750 AED / Nos.'),
('b495e75d-d3df-4613-b34d-33dd5173fa24', 'Supply and installation of tile-insert square type floor drain, including supply (PC), fixing, leveling, testing, and making good surrounding floor finishes.

Brand: Bagno Design / Sanipex
PC Rate: 385 AED / Nos.'),
('46380c90-645f-4857-b584-00a17bcdba12', 'Supply and installation of tissue holder in the same position, including alignment, fixing to wall, and protection of adjacent finishes.'),
('8f6f8ac9-2b8d-4d54-8e6f-fa1ea651bc0c', 'Supply and installation of tissue holder, including supply, fixing, alignment, wall plugs, screws, and making good surrounding finishes.

Brand: Bagno Design / Sanipex
PC Rate: 250 AED / Nos.'),
('12915e35-d21a-4874-a39b-e4db1c9ccac5', 'Supply and installation of vanity counter hot & cold mixer in the same position, including connection to existing plumbing, alignment, fixing, sealing, testing, and protection of adjacent finishes.'),
('f76744d5-fae0-4f3a-b6cf-9b04e5c42943', 'Supply and installation of vanity counter wash basin in the same position, including connection to existing plumbing, alignment, fixing to countertop, sealing, testing, and protection of adjacent finishes.'),
('c3f29219-b31f-4bdf-837b-ac1a91adbee5', 'Supply and installation of wall hung water closet (WC) with soft close seat cover, including fixing, silicone sealing, testing, and making good surrounding surfaces.

Brand: Bagno Design / Sanipex
PC Rate: 1,100 AED / Nos.'),
('edc8647c-9e38-4bcb-9dd7-ff30549073d8', 'Supply and installation of wall-mounted toilet roll holder with cover, stainless steel grade 316, including fixing to wall with appropriate screws/anchors, alignment, leveling, and protection of surrounding surfaces.

Brand/Type: BagnoDesign - Dolphin
Material Code: BDA-BCH-710-BS
Size: 274mm Dia x 122mm
Finish: White'),
('67243f4f-fbd6-4216-a86a-2d27a3077edf', 'Supply and installation of wash basin, including fixing, silicone sealing, leveling, and making good surrounding surfaces.

Type: Countertop
Brand: Bagno Design / Sanipex
PC Rate: 1,000 AED / Nos.'),
('43f86b59-894e-4919-b5d2-937c401cdf2c', 'Supply of hand spray / bidet spray, including delivery charges and other accessories

Brand: Bagno Design
Location: Master Bathroom, Bathroom 02 & Powder Room'),
('d40b84d5-16e6-4c57-aa32-663388544bbd', 'Supply of shower set, including delivery charges and other accessories

Brand: Bagno Design
Location: Master Bathroom & Bathroom 02'),
('24861dfc-40ff-447e-9cb5-b1559f5955bb', 'Supply, Delivery, and Installation of recessed trimless LED downlights, with proper alignment, cutting of openings in ceiling, fixing, wiring connection to existing circuits, testing, and commissioning — complete in all respects.

Type: Recessed, Trimless
Size: 100mm x 100mm
Light Source: 3000K LED
Finish Colour: White
Location: Entire Area'),
('a710e4cd-cf5b-410d-8069-cd02f22686d3', 'Supply, Installation, Testing and Commissioning of plumbing works and all related accessories as per approved drawings and specifications.

Note: Affected/Damaged Area Only'),
('e7103cba-0d1b-4874-82b3-b035c4251895', 'Supply, fabrication, and installation of custom-made counter including:
- Carcass: 18mm moisture-resistant MDF with internal melamine finish
- Top Surface: Engineered quartz
- Front & Side Panels: Matching veneer
- Mini Fridge Recess: Provision for client-supplied under-counter refrigerator, including proper recess, ventilation, and connection
- Hardware & Accessories: Handles, hinges, and brackets as required
- Installation: Proper leveling, fixing, alignment, and surface protection

Configuration:
- Cabinet below quartz top:
 - 2–3 drawers on one side for storage.
 - Open compartment for mini fridge recess.
 - Optional pull-out tray for cutlery or small items.
- Hardware: Soft-close hinges for doors and drawers; concealed brackets for structural support.
- Optional: LED strip lighting under the quartz overhang for accent lighting.

Size: 1050mm L x 600mm D x 900mm HT
Location: Master Bedroom'),
('917f8d61-c034-4c6b-aa98-8a52d6dd5258', 'Supply, fixing, and connection of approved hot & cold water filters above ceiling, including all necessary fittings, brackets, supports, pipe connections, isolation valves, testing, and commissioning. Complete in all respects.

Location: Master Bathroom'),
('5a89585d-f0fe-4c72-b476-0e41b9edc2bb', 'Supply, installation, and connection of electrical socket to be placed inside a cupboard (vanity mirror area), including cutting/fitting of wall, proper fixing, connection to existing wiring, alignment, testing, minor adjustments, protection of adjacent finishes, and site cleaning — complete in all respects.

Location: Master Bathroom (Inside Vanity Mirror)'),
('d096f434-92ec-44cb-ae42-8361a963a915', 'Supply, installation, and connection of electrical socket to be placed on the bedside table, including cutting/fitting of wall, proper fixing, connection to existing wiring, alignment, testing, minor adjustments, protection of adjacent finishes, and site cleaning — complete in all respects.

Location: Master Bedroom'),
('08e51663-73d7-47b3-b35f-74cd5b96ff83', 'Supply, installation, and connection of electrical socket to be placed on the side of water closet area, including cutting/fitting of wall, proper fixing, connection to existing wiring, alignment, testing, minor adjustments, protection of adjacent finishes, and site cleaning — complete in all respects.

Location: Master Bathroom (console area)'),
('97b0eac9-9016-4eee-b8c6-3da434f95d0b', 'Supply, installation, and connection of electrical socket to be placed on the wall feature, including cutting/fitting of wall, proper fixing, connection to existing wiring, alignment, testing, minor adjustments, protection of adjacent finishes, and site cleaning — complete in all respects.

Location: Living Area'),
('0edaeb31-ffb2-4339-964e-29f6049debee', 'Crack filling, sanding, and application of majoon to walls, including surface preparation, filling of hairline and minor cracks, smooth sanding, touch-up leveling, and making surfaces ready for paint.

Location: Entire Wall Areas'),
('ef32e722-b465-43d6-ae88-cfbf846bc43e', 'Forming of decorative grooves in wood and natural stone wall cladding, including setting out, precision routing/CNC cutting or saw cutting, edge finishing, cleaning of grooves, dust control, touch-up of cut edges where required, and protection of adjacent finished surfaces.

Location: refer to wall finishes plan'),
('9306d0d2-08f2-4180-819e-29294a6bb8b2', 'Forming of decorative grooves in wood or natural stone wall cladding, including setting out, precision routing/CNC cutting or saw cutting, edge finishing, cleaning of grooves, dust control, touch-up of cut edges where required, and protection of adjacent finished surfaces.

Location: refer to wall finishes plan'),
('fe8401ca-e797-4437-8bd4-2b491d7b2e76', 'Gypsum Ceiling Paint

Prepare, supply and apply two coats of Jotun Fenomastic paint to the new gypsum ceiling. Including cove painting.

Location: Meeting rooms, VIP Lounges, 9 pax Meeting room, Training room, Kids room, AV room, Cash collection area, Walkway to event hall, Control room, Backstage area, Toilets, Kitchen, Pantry, Janitor room'),
('59540c03-3c01-4256-9f3c-862761c0d48d', 'Installation of client-supplied Wall Tiles, including handling, adhesive, levelling, laying, grouting, cleaning & protection

Type: As per proposed plan
Size: As per proposed plan
Location: Master Bathroom, Office Bathroom, Staircase Bathroom, Maids Washroom, Bathroom 02.'),
('6e6bc011-9c00-4849-889c-3d5ce69789c0', 'Installation of client-supplied stone wall finishes (2 cm thick), including surface preparation, leveling, adhesive fixing, precise setting out, joint grouting/sealing, cleaning, and protection of finished surfaces — complete in all respects as per manufacturer’s specifications and approved sample.

Thickness: 2cm stone
Location: Master Bathroom Shower Wall Area'),
('c39d9eb3-0ec2-459f-86a5-5529848e1bb7', 'Installation of client-supplied wall tiles, including setting out, cutting, edge finishing, application of premium tile adhesive, levelling, alignment, spacers, jointing, grouting, cleaning, and protection.

Item Code: WF06C
Brand: Kutahya (Client-Supplied)
Size: 60cm x 120cm'),
('653654e5-39ad-4fa8-8618-7cb65693aa1b', 'LT-01 Acoustic Faux Leather Cladding

Supply and installation of acoustic faux leather wall cladding, including all necessary items required for fixing. Including 20mm thk foam backing.

Location: Events hall'),
('94adbe3d-8388-4cf6-bb90-702e61fdee79', 'Manufacture, supply, and installation of decorative column panels in a combination of flat and slatted designs, finished in textured paint, including substrate/backing, framing (if required), slatted fabrication, application of textured coating, metal trim inlay, cutting, fixing, alignment, protection, and final cleaning.

Location: GF - Cinema and Living Area
NOTE: Subject to final approved drawings and specifications from Client.'),
('1935c520-3844-460c-8c88-2bc2348881a8', 'Manufacture, supply, and installation of laminate-finished wall panels, including substrate/backing board, framing (if required), cutting, fixing, edge trims, joints, alignment, and final cleaning

Specification:
Location: GF - Cinema Bathroom and FF - Master Bathroom
NOTE: Subject to final approved drawings and specifications from Client.'),
('90bdc5d5-669a-4974-a762-420f5d3460fd', 'Manufacture, supply, and installation of upholstered wall panels finished in faux leather, including backing board, foam padding, upholstery works, metal frame and/or metal inlays, cutting, fixing, alignment, protection, and final cleaning.

Specification: 0361 - 
Location: FF - Bedroom 1
NOTE: Faux leather supply rate of AED 100/Lm is considered, subject to final approved specifications from Client.'),
('f79028bf-a7de-4e37-ae3b-260ef52c51d3', 'Manufacture, supply, and installation of veneer-finished wall panels, sprayed to 20% gloss, including shop drawings, substrate/backing board, framing (if required), veneer pressing, spray finishing, cutting, fixing, edge detailing, joint alignment, protection, and final cleaning. 

Location: FF - Master Wardrobe and SF - Lounge
NOTE: Subject to final approved drawings and specifications from Client.'),
('98b02e81-3250-4c84-80a9-08bb089ddca9', 'Moisture Resistant Gypsum Cladding

Supply and installation of Moisture resistant gypsum cladding made of single layer, 12.5mm gypsum boards on one side, including furring channels (without Rockwool insulation) - up to the false ceiling level.

Brand: Gypsemna or equivalent
Location: Pre-function toilet areas'),
('b76bccd8-f6f8-47d2-8b08-efdecd41cbce', 'PA-01 White Fenomastic Paint

Supply and application of fenomastic wall paint in white finish, including all necessary items required for fixing.

Location: Pantry, AV room, Training room, Control room, Store room, Equipment room'),
('a971d4fb-9f9d-415f-903e-10963036a305', 'PA-02 Metallic Paint

Supply and application of metallic lacquer paint in bronze finish, including all necessary items required for fixing.

Location: To one side of existing columns, Above walls to Sales gallery and pre-function hall, One side of meeting rooms, Top partition of event hall and pre-function area'),
('4c52c4af-9804-4693-be54-d6fc7ae41969', 'PA-03 Black Fenomastic Paint

Supply and application of fenomastic wall paint in black finish, including all necessary items required for fixing.

Location: Backstage area'),
('0dd91d15-f2b4-4325-bf44-d924a379ba7e', 'PAINTING:

Painting of interior gypsum walls in white, including surface preparation, cleaning, minor repairs, and sanding as required. Scope includes application of two coats of approved primer and one coat of white Fenomastic paint.'),
('6a38ddd8-4683-4eb1-a736-5fa1c0ffae27', 'Preparation and painting of all externall wall surfaces, including villa facades and compound wall (fence), cleaning, surface repair, application of primer, and two coats of high-quality weather resistant exterior paint (e.g., Jotun Fenomastic Exterior, National Paint Weathercoat, or equivalent)'),
('2ebda7f1-e262-4984-9bc4-c36b6df163d6', 'RECORD STUDIO- ACOUSTIC WALL PANELING:

Supply and installation of acoustic wall panelling to have upholstered fabric for the outermost part. PET panels and foam on the middle for soundproofing, and MDF for backing, to be cladded on wall. 

Exposed: Fabric (from our supplier catalog)
Middle: Polyester fiber panel with acoustic foam
Backing: MDF
Size: (4000mm + 5450mm + 4000mm + 5450mm) x 100mm thk. x 3650mm ht'),
('cb5427e3-2abf-423e-bb69-a023a3e6ce24', 'Regular Gypsum Cladding

Supply and installation of Regular gypsum cladding made of single layer,12.5mm gypsum boards on three side, including furring channels (without Rockwool insulation)

Height considered - 6000mm H
Brand: Gypsemna or equivalent
Location: To existing structural columns in Sales gallery, tunnel, Pre-function area, and Event hall'),
('a88889ed-2c99-45a9-b78b-abdafd13d10c', 'Repainting of ceilings, including light surface preparation, cleaning, minor patching if required, application of two coat of approved emulsion paint, protection of adjacent surfaces, touch-ups, and site cleaning. Works include all labor, tools, consumables, and minor protection — complete in all respects.

Location: Living Area, Bedroom 01, Service Area, Master Bedroom, Kitchen Area, & WIC'),
('66676530-471c-4252-b419-a795d2d3255f', 'Ribbed Veneer Wall Cladding

Supply and installation of vertical slats wooden cladding with bronze metallic paint in between, including all necessary items required for fixing.

Location: Café, Kitchen'),
('b8385d3d-dd0e-492b-81e4-5a807c9c89f2', 'Supply and Application of Jotun Emulsion Paint over existing finished interior walls (excluding bathrooms), including light surface preparation, cleaning, minor patching, sanding, application of primer if required, two coats of approved paint, protection of adjacent surfaces, touch-ups, cleaning, and all labor, tools, and consumables — complete as per manufacturer’s specifications.

Type: Jotun Emulsion (Washable Paint – final brand/spec to be confirmed with client approval)
Location: All Interior Walls except bathrooms'),
('c5c24ec9-754e-4b49-9ac2-12f4c3ecd5c2', 'Supply and Application of Paint on the ceiling (one coat primer, two coat stucco, two coat rich mat white)'),
('ec0f77e2-476b-42a4-97e9-1509859d0888', 'Supply and Application of paint on the wall (One coat primer, two coat stucco, two coat rich mat white) 

Location: Second Floor'),
('0a240037-00b5-44fd-9669-861946d572e4', 'Supply and Application of wall paint (one coat primer, two coat stucco, two coat fenomastic mat white)

Location: GF Interior Walls excluding Bathrooms, Kitchens & Extension Area'),
('a1d44c5f-95f5-4e41-98a7-2a9ebc01293d', 'Supply and Application of wall paint (one coat primer, two coat stucco, two coat mat white)

Location: Bedroom (3a - 013)
Note: at the Removed cupboard area only.'),
('f3590aae-d4e7-4b71-8963-4af48a428596', 'Supply and Installation of Stone Cladding on Staircase Wall — including cutting and shaping for joints and openings; fixing to wall with approved adhesive; joint filling, cleaning, and finishing; complete with all necessary labor, scaffolding, tools, protection, and site cleanup.

Location: Staircase wall only'),
('a0beb273-6490-4f5a-82a8-85232e165bbf', 'Supply and Installation of Tile Cladding, including surface preparation, adhesive application, precise cutting, fixing, leveling, grouting, cleaning, and protection of finished surfaces.

Type: Italstone Greige
Finish: Matt
Size: 60cm x 120cm, 9mm thk.
Location: GF Female & Male Washroom'),
('5c24b0da-8c78-4e2b-8312-7b58b9168af3', 'Supply and Installation of cement board wall cladding 

Location & Size: W/C - 1.32 x 2.40m'),
('48136d3e-d978-43f8-99aa-95407f299b8e', 'Supply and application of Jotun Fenomastic paint, including surface preparation, filling of cracks with stucco, sanding, priming, masking/protection of adjacent surfaces, application of two coats of finish paint, and cleaning of completed work

Note: Final Color is subject to the client approval
Location: All GF & FF interior walls only excluding bathrooms & outdoor walls'),
('f4394d73-d810-42e2-903f-345fb1908c02', 'Supply and application of cement-sand plaster to block wall surfaces, including surface preparation, cleaning, installation of corner beads, screeding, leveling, finishing, and curing.'),
('595a4aa3-f1b9-455f-bd1d-c980aa43fbe9', 'Supply and application of cement-sand plaster to exterior wall surfaces, including surface preparation, hacking/bonding treatment where required, leveling, corner protection, curing, and finishing.

Mark: WF5
Note: As per wall finishing plan'),
('472b748a-6758-436d-a372-ce65a8839e24', 'Supply and application of high-quality bathroom-grade paint on ceiling surfaces, including preparation (cleaning, patching, priming), application of two coats of moisture- and mildew-resistant emulsion paint suitable for humid environments, touch-ups, protection of adjacent finishes, and final cleaning — complete in all respects as per manufacturer’s specifications and approved color sample.

Material/Finish: Moisture-resistant bathroom paint (e.g., Jotun Fenomastic Hygiene or equivalent)
Location: Powder Room'),
('93202e8c-c7ec-4eeb-886b-31f35798e6bf', 'Supply and application of high-quality bathroom-grade paint on wall surfaces, including surface preparation (cleaning, patching, sanding, priming), application of two coats of moisture- and mildew-resistant emulsion paint, touch-ups, protection of adjacent finishes, and final cleaning — complete in all respects as per manufacturer’s specifications and approved color sample.

Material/Finish: Moisture-resistant bathroom paint (e.g., Jotun Fenomastic Hygiene or equivalent)
Location: Master Bathroom Wall Area except Shower Wall Area'),
('34bc42d9-c9c3-4783-a1dc-cee21d64d7bc', 'Supply and application of high-quality paint on ceiling surfaces, including preparation (cleaning, patching, priming), application of two coats of emulsion paint, touch-ups, protection of adjacent finishes, and final cleaning — complete in all respects as per manufacturer’s specifications and approved color sample.

Material/Finish: Jotun
Location: New Living & Dining Area'),
('2ba66f2c-2e61-418e-8f2a-eb100a5b97c4', 'Supply and application of interior normal paint system to plastered wall surfaces in dry areas, including surface preparation, crack and imperfection filling, sanding, one coat primer, putty where required, and application of two coats of paint.

Item Code: WF01A
Brand: Jotun Fenomastic or approved equivalent'),
('715065c8-d561-45a4-a73f-ce2d1e720909', 'Supply and application of interior paint system to plastered wall surfaces in dry areas, including surface preparation, crack and imperfection filling, sanding, one coat primer, putty where required, and application of two coats of paint.

Item Code: WF01A
Brand: Jotun Fenomastic or approved equivalent'),
('f907f9af-3089-4be9-9a88-224637fef2fc', 'Supply and application of limewash paint finish in darker shade on prepared wall surfaces, including surface preparation, minor repair works, application of primer/base coat if required, and multiple coats of limewash to achieve uniform darker tonal variation and natural textured finish.

Mark: WF1.1
Notes:
1. As per wall finishing plan
2. Sample finish to be submitted and approved by client prior to application'),
('cdd7a0e3-7179-4166-8cbc-cba11f2e7e9c', 'Supply and application of limewash paint finish on prepared wall surfaces, including surface preparation, patch repair, primer/base preparation if required, application of multiple coats to achieve uniform natural lime finish effect.

Mark: WF1
Notes: 
1. as per wall finishing plan
2. Sample finish to be submitted and approved by client prior to application'),
('cc94155c-1320-45ec-813d-9032588ccb68', 'Supply and application of microcement finish on wall surfaces, including surface preparation, base coat, microcement layers, sealing, and protective topcoat

Size: Entire Walls
Type/Colour: Grey (sample is subject for client''s approval)'),
('b051a78c-13be-4526-be04-6b97907679cd', 'Supply and application of paint finish on prepared wall surfaces, including surface preparation, minor crack filling, sanding, application of primer/sealer, and multiple coats of high-quality emulsion paint

Mark: WF4
Notes: 
1. as per wall finishing plan
2. Sample finish to be submitted and approved by client prior to application'),
('da9b9f74-12e6-42ad-ac42-739244783cd7', 'Supply and application of paint on newly installed double-sided MR MDF wall partition, including surface preparation, filling minor defects, sanding, priming, two coats of finish paint, masking/protection of adjacent surfaces, and cleaning of completed work.'),
('2873c51c-531b-4f17-ab8a-792b83072046', 'Supply and application of painting works, including surface preparation and necessary accessories as required, complete as per approved drawings and specifications.

Type: Fenomastic washable Emulsion Paint'),
('fc98d974-f32c-42f5-8b1c-ca76fae78be7', 'Supply and application of white paint finish to internal plastered wall surfaces, including surface preparation, filling of minor imperfections, sanding, primer application, and application of finishing coats.

Code: WF01A'),
('bcdadb36-ec86-4e4d-9cfc-bb541da5475a', 'Supply and apply of paint on the interior wall. (One coat primer, two coat stucco, two coat Fenomastic mat white)

Location: GF & FF Floorings (excluding garage flooring)'),
('1a927a37-2947-454c-bf3b-8fab5c01f148', 'Supply and apply of paint on the wall (One coat primer, two coat stucco, two coat Rich mat white)

Location: Ground Floor'),
('9b371665-e08e-46f2-9be5-d65f1fbc958a', 'Supply and apply of paint on the wall. (One coat primer, two coat stucco, two coat Fenomastic mat white) - Only panel moulding area, Master bedroom & GF TV Room'),
('5ba8afbc-7301-4a1c-a165-f13a19c612db', 'Supply and construction of non-structural concrete blockwork walls, including setting out, laying of hollow concrete blocks, mortar, alignment, levelling, reinforcement where required, tying to structure, curing.

Location: Master Bedroom Main Door & Store HVAC ducting wall.'),
('ea9568c0-50f8-433a-81f7-a779295c4e8c', 'Supply and fixed installation of ARTE Lush Corduroy – wallpaper 29519 (green), including surface preparation, primer if needed, cutting, alignment, trimming, joining, edge finishing, smoothing, cleaning, protection during works, and final handover — complete in all respects.

Drawing Code: M007
Height: 10m High
Type: Wallpaper Green
Supplier: ARTE
Collection: LUSH CORDUROY - 29519'),
('f9cf2f1d-15e8-4452-81d4-09f4f6bb1874', 'Supply and fixing of new architrave made of 18mm MR MDF with PU paint finish, colour as per approved sample

Note: This item includes removal and disposal of existing door architraves.

Location: Small store room under stairs
Length: 3.5 RM
Size: 100 x 18mm'),
('88185300-41da-438a-8d28-212856d76a13', 'Supply and install wall-mounted corner shelf, including, proper alignment, and anchoring on tiled wall surface.

Location: Master Bathroom, Bathroom 02, Maids Bathroom, Staircase Bathroom Shower Area, Newly Added Bathroom'),
('8a57b429-162c-4097-8005-a6aa722647b9', 'Supply and installation of 12mm thick cement board ledge wall for W/C.

Location: Master Bathroom, Bathroom 02, Staircase Bathroom & Maids Bathroom, Newly Added Office Bathroom
Note: Niche Worktop will be provided by client'),
('12ea3b1c-b4ef-48c6-a6cf-110c340aae05', 'Supply and installation of 8mm thick clear glass partition with black powder-coated aluminum framing, including all necessary supports, fittings, alignment, sealing, and finishing.

Size: 5950mm L x 3300m HT'),
('ccb16c6d-5084-42a4-8ca7-7f601d88b1ed', 'Supply and installation of PU/Fibre skirting of 100 mm height, including cutting, fixing with adhesive/fasteners, finishing, alignment, and protection.

Type: PU/Fibre
Height: 100mm
Location: GF & FF Floorings (excluding garage flooring)'),
('3a2656fa-bc39-4c2b-9c81-f3f1653b06af', 'Supply and installation of aluminum cladding in brass finish, comprising fabricated aluminum panels with brass-effect finish, including subframe/support system, cutting to size, fabrication, fixing brackets, trims, joint treatment, and accessories.

Item Code: WF07
Note: Excluding the elevator area'),
('93644f0e-be4a-4e91-948e-bf318a4123f9', 'Supply and installation of aluminum cladding in brass finish, including aluminum panels, subframe/support system, fabrication, cutting to size, fixing accessories, trims, joint treatment, and alignment.

Item Code: WF07
Note: Excluding elevator area'),
('5b85c1be-58f3-45ad-9ba0-3abcecf567d8', 'Supply and installation of mirror finish, including mirror cutting, polishing of edges, backing protection, adhesive fixing and/or mechanical supports as required, alignment.

Mark: WF7
Note: As per wall finishing plan'),
('69ebf188-8b35-4e1d-ace8-1a8f2a4c5f0b', 'Supply and installation of natural stone wall cladding, including surface preparation, fixing system (cement adhesive/mechanical anchoring as required), cutting, alignment, jointing, sealing, finishing.

Mark: WF2
Notes:
1. As per wall finishing plan
2. Material sample to be submitted and approved by client prior to installation
3. PC rate for stone supply: AED 550/m²'),
('3d5f5373-e09b-4a81-b4a5-6e49e67dd6c3', 'Supply and installation of reeded (fluted) travertine stone wall cladding including surface preparation, fixing system (cement adhesive and/or mechanical anchoring as required), cutting, alignment, jointing, sealing, finishing.

Mark: WF3
Notes:
1. As per wall finishing plan
2. Material sample to be submitted and approved by client prior to installation
3. PC rate for Reeded Travertine supply: AED 750/m²'),
('edc2f513-a89e-496c-b599-9edbb396417d', 'Supply and installation of skirting suitable for LVT (Luxury Vinyl Tile) flooring, including cutting, fixing, alignment, finishing, and protection of finished surfaces.

Type/Material: PU/Fibre Skirting
Size: 100mm High'),
('da018b49-dab4-47d1-90bd-d24af0a1a60f', 'Supply and installation of wall tile including cementitious adhesive and grout.

Location: GF - Maid''s Bathroom
Assumed Tile Size: 60x60cm
NOTE: Tile supply rate of AED 150/m2 is considered. Subject to final approved drawings and specifications from Client.'),
('e6a9567a-cb1f-4848-95c8-783003dda407', 'Supply and installation of wall tile including cementitious adhesive and grout.

Specification: Alma Statuario Altissimo
Tile Size: 120x120x9mm
Location: GF - Back Kitchen
NOTE: Subject to final approved drawings and specifications from Client.'),
('0560d205-74b8-4814-9b95-95344a5ad1e1', 'Supply and installation of wall-mounted W/C shelf (0.30 m L × 0.25 m D × 2.3 m H) in cement board, including cutting, fixing, leveling, surface finishing, and protection

Location: Master Bathroom'),
('0b6f15fa-a330-484a-bb27-82df1669dee4', 'Supply and installation of wall-mounted metal finish wall trim/door stopper, including aluminium finish profile, cutting to size, drilling, concealed or surface fixing with suitable anchors and screws, alignment, AND sealing.

Item Code: WT01A
Type: Aluminum (price is provisional, subject to change depending on material/finish)
Location: In between Dining & Family Living Area'),
('76790141-ea59-4f9a-adaf-d092c04abbf9', 'Supply and installation of wood cladding to wall surfaces, comprising MDF with veneer finish, including backing support system, cutting, edge finishing, fixing accessories, trims, sealants, and alignment.

Item Code: WF02D'),
('20c96b8d-81d7-4940-9bc9-232f5d84f20f', 'Supply and installation of wood cladding to wall surfaces, comprising MR MDF with veneer finish, including backing support system, cutting, edge finishing, fixing accessories, trims, sealants, and alignment.

Code: WF02B'),
('33306971-295a-4083-be26-83c5ec75f016', 'Supply, Cutting-to-size and installation of marble cladding, glue fixed only

Specification: 0169 - 2cm Copacobana
Location: GF - Guest WC, SF - Lounge
NOTE: Marble supply rate of AED 670/m2 is considered. Subject to final approved drawings and specifications from Client.'),
('8ee67c9a-dc81-4350-8ac6-0f138fd403cd', 'Supply, Cutting-to-size and installation of marble cladding, glue fixed only.

Specification: 0152
Location: GF - Guest WC and FF - Master Bathroom
NOTE: Marble supply rate of AED 950/m2 is considered. Subject to final approved drawings and specifications from Client.'),
('f60e3161-8a47-4cab-bd83-9d45a76cdd04', 'Supply, cutting, and installation of aluminium sheet cladding, including surface preparation, fixing with approved mechanical/adhesive methods, alignment, joint finishing, and protection of finished surfaces.

Specification: 0410 - Aluminium
thickness: 2.0mm thick aluminium sheet
Location: GF - Garage'),
('9924a999-0766-43a8-86a9-9820dcc27f03', 'Supply, cutting, and installation of stainless steel sheet cladding, including surface preparation, fixing with approved mechanical/adhesive methods, alignment, joint finishing, and protection of surfaces.

Specification: 0405 - SS Metal Sheet 
thickness: 1.0mm thick stainless steel sheet 
Location: GF - Garage'),
('89b922ef-6c04-4b95-8c52-e28eab4f2281', 'Supply, cutting, delivery, and installation of large-format wall cladding, including setting out, cutting, edge finishing, drilling where required, premium adhesive, stainless steel mechanical fixings where required, jointing, levelling, alignment, movement joints, cleaning, and protection.

Item Code: WF06D
Brand: Consentino
Size: 1420mm L x 3200mm ht
Material: Dekton - AerisKC - Matt - 8mm Slab
Supply PC Rate: AED 334.00/m²
Location: Master Bathroom

Note: The above supply rate is a Prime Cost (PC) allowance and is subject to change based on the final approved tile size, thickness, finish, brand, and country of origin.'),
('fa97e74b-f0db-4f97-afbd-4652cd237f7c', 'Supply, cutting, delivery, and installation of porcelain wall tiles, including setting out, cutting to size, premium tile adhesive, joint spacers, grouting, movement joints where required, edge trims, sealant, cleaning, and protection.

Item Code: WF06A
Material: Similar as per plan (No Specification)
Supply PC Rate: 200 AED/sqm 

Note: The above supply rate is a Prime Cost (PC) allowance and is subject to change based on the final approved tile size, thickness, finish, brand, and country of origin.'),
('9328cceb-e780-4c40-9e59-52bb6ed4dd6c', 'Supply, cutting, delivery, and installation of wall cladding, including setting out, cutting, edge finishing, premium adhesive, stainless steel mechanical fixings where required, jointing, levelling, alignment, sealing, cleaning, and protection.

Item Code: WF06B
Brand: Consentino
Material: Dekton - MarmorioKC - Matt - 12mm Slab
Supply PC Rate: AED 607.00/m²
Location: Family Show Kitchen Back Wall

Note: The above supply rate is a Prime Cost (PC) allowance and is subject to change based on the final approved tile size, thickness, finish, brand, and country of origin.'),
('d5390085-8310-42c7-8680-8c70c7120e68', 'Supply, fabricate, cut, deliver, and install natural stone wall cladding, including detailed setting out, shop fabrication, cut-to-size processing, edge profiling and polishing, premium stone adhesive, stainless steel mechanical fixings where required, jointing, levelling, alignment, sealing, cleaning, and protection.

Item Code: WF03C
Brand: Glaze
Material: Costa Esmeralda – 20mm Thick Polished Stone Slabs
Size: Cut-to-Size (Final dimensions to be confirmed)
Supply PC Rate: 535.00 AED/sqm
Location: Master Bedroom Pantry & Master Bathroom Niches 

Note: The above supply rate is a Prime Cost (PC) allowance and is subject to change based on the final approved tile size, thickness, finish, brand, and country of origin.'),
('facaefe2-79c2-4546-a7ef-d774ac12cde4', 'Supply, fabricate, cut, deliver, and install natural stone wall cladding, including setting out, cutting, edge finishing, premium stone adhesive, stainless steel mechanical fixings where required, jointing, levelling, alignment, sealing, cleaning, and protection.

Item Code: WF03A
Brand: Salvatori × Collectional
Material: Crema d''Orcia | Honed
Tile Size: 305 × 610 × 13mm
Product SKU: 17435
Supply PC Rate: AED 1,150.00/m²

Note: The above supply rate is a Prime Cost (PC) allowance and is subject to change based on the final approved tile size, thickness, finish, brand, and country of origin.'),
('43e1b804-db42-477a-ad61-f0b0b77dcaf3', 'Supply, fabricate, cut, deliver, and install natural travertine stone wall cladding, including approved natural travertine stone panels cut to size, surface preparation, edge finishing, stone adhesive and/or stainless steel mechanical fixing system where required, alignment, leveling, joint treatment, sealant, edge trims, cleaning, and protection.

Item Code: WF04B
Material: Natural Travertine (Silver) (Final specification to be confirmed)
Size: cut-to-size (to be confirmed)
Supply PC Rate: 535.00 AED/sqm (Subject to change based on the final approved tile size, thickness, finish, brand, and country of origin)
Location: WC & Shower'),
('e4dabffe-0fb6-44b4-9cbf-d148f2c2b7de', 'Supply, fabricate, deliver, and install wood laminate wall cladding, comprising laminate finish bonded to moisture-resistant MDF substrate, complete with concealed fixing system, aluminum support framework, edge trims, joint treatment, cutting, fabrication, alignment, and all necessary accessories and consumables. 

Item Code: WF02B
Material: Laminate on Moisture-Resistant MDF
Brand: EGGER or approved equivalent
Finish: Wood Grain Laminate (Colour and Texture to be approved)'),
('81adc7ce-faf7-49dc-8c9d-be6613606f90', 'Supply, fabrication, and installation of electroplated metal shadow profile (SB-1/2 type), including cutting to size, fixing, alignment, joint finishing, protection, and final cleaning.

Notes:
1. Chipping/recess formation in wall is excluded and to be carried out by Main Contractor, as noted.
2. Final rate subject to approved shop drawings, profile dimensions, and finish samples.'),
('b8035704-596a-4194-a368-ccd778d95337', 'Supply, fabrication, and installation of manual venetian blinds, including measurement, slat cutting, headrail, bottom rail, tilt mechanism, cords, fixing brackets, installation to wall/ceiling, alignment, testing, and protection of finishes.

Type: Manual Venetian Blinds
Hardware: Louvolite
Fabric: Solar Weave Collection
Warranty: 1 years from the date of installation
Size: 1300mm W x 3000mm H
Location: Secretary Room'),
('0f7b1aba-c25c-49c2-a8d7-9ecaa121ff05', 'Surface preparation and refinishing of all affected wood wall cladding in the doorway area.'),
('e6e4760d-df1b-4fec-8003-55eb8edf9a9e', 'Surface preparation, smoothening, and painting of walls in Powder Room (excluding vanity counter area) to achieve a uniform finish suitable for subsequent installation of waterproof wallpaper. Works include cleaning, minor patching, sanding, priming, application of smooth finishing coat, protection of adjacent surfaces, and site cleaning — complete in all respects.

Location: Powder Room – Walls'),
('f969166c-750f-43b0-a09b-da8ca4106a57', 'TV Niche - 1

Manufacture and installation of TV niche made of MDF in metallic PU paint finish, including all necessary acessories required.

Dimensions: 2700mm L x 150mm W x 1500mm H Location: Sales Gallery Area'),
('780af243-b981-4ac9-94d4-86cf8b00c280', 'TV Niche - 2

Manufacture and installation of TV niche made of MDF in metallic PU paint finish, including all necessary acessories required.

Dimensions: 2000mm L x 150mm W x 1500mm H Location: Meeting rooms'),
('ca33b2be-f328-4500-a816-72ca89ed4f40', 'TV Niche - 3

Manufacture and installation of TV niche made of MDF in metallic PU paint finish, including all necessary acessories required.

Dimensions: 3000mm L x 150mm W x 1500mm H Location: VIP lounges, 9 pax Meeting room'),
('b1711043-52aa-44bf-8c09-b81f65aaeb89', 'WC-02 Wallpaper

Supply and installation of Wallpaper finish, including all necessary adhesives and accessories required for fixing.

Location: Kids room'),
('4ee7557d-b7e1-4493-9b04-775800fd0dbf', 'WV-01 Veneer Cladding - Option 1

Supply and installation of veneer oak cladding, including all necessary items required for fixing.

Location: Meeting rooms, Pre-function area - Kitchen entrance, Cash collection room'),
('4b8cfb56-e8c9-4339-afb7-22269a48a89b', 'Floor Waterproofing

Supply and application of floor waterproofing ready to receive porcelain tiles. 

Brand: Mapei or equivalent
Location: Sales Gallery and Pre-Function toilets, Pantry, Janitor room, Kitchen'),
('552a9d89-9252-4128-91ea-b34a7e5d4720', 'Roof Waterproofing:

Supply and application of Combo Roofing system waterproofing as per the minimum authority requirement.

Location: To Roof Area'),
('372a63d7-3cb8-46a9-8dc1-77009ec5e962', 'Supply and Application of Waterproofing on Floor Area and Wall up to 30cm Height, including surface preparation, application of waterproofing coating, corner joint treatment, and pond testing — complete as per approved specifications

Location: Powder Room Entire Floor Area & Wall upto 30cm Height'),
('fb2b90d7-6aca-431f-a142-f05bdef4fef4', 'Supply and application of approved waterproofing membrane for flooring and wall up to 30 cm height, including surface preparation, reinforcement at joints and corners, pond testing for leak-proofing, protection until tiling, and making good.

Location: Maids Bathroom (3a - 017)'),
('d74d6914-f9f5-4a9d-8eea-a88bfe7d2948', 'Supply and application of approved waterproofing system to terrace flooring and walls up to 30 cm height, including surface preparation, primer, two-coat membrane, sealing around drains and penetrations, pond testing, and making surfaces ready for final finishes.

Location: Terrace Area'),
('baa019a2-390a-49a6-b46b-ec79b3950ff6', 'Supply and application of approved waterproofing system to wet floor areas and walls up to 300 mm height, including surface preparation, primer, two-coat waterproofing membrane, sealing around drains and penetrations, pond testing, and making surfaces ready for tiling.

Location: Kitchen, Staircase Bathroom, Maids Bathroom, Master Bathroom & Bathroom 02'),
('c7112773-6658-40ce-ab4d-6e22142bc9a8', 'Supply and application of complete roof insulation and waterproofing system on the villa rooftop, including removal, disposal of existing debris from the villa roof, surface preparation, cleaning, priming, and installation of bituminous waterproofing membrane (minimum 4mm thick, SBS modified, torch-applied type) over a suitable protection screed. Works to include sealing of all joints, edges, and upturns, ensuring a fully watertight system as per manufacturer’s specifications and site conditions.



- site inspection of the roof
- cleaning of the surface to remove dust, debris, loose concrete, and contaminants
- repair of cracks, defective areas if any.
- application of one coat of bituminous primer to ensure proper membrane adhesion.
- Supply and installation of torch-applied modified bituminous waterproofing membrane, minimum 3-4mm thick.
- heat welding and sealing of membrane overlaps to create a continuous and watertight system.
- Proper detailing and upturning of membrane on parapet walls, around drains, pipe penetrations, and roof fixtures.
- Final inspection, water ponding test and handover with workmanshop warranty.'),
('f8e42019-d0cd-4d21-b72b-2cd063dfeb9b', 'Supply and application of high-quality waterproofing paint to wall surfaces, including surface preparation, two coats of approved paint, curing, making good, and protection.

Location: Maids Bathroom (3a - 017)'),
('98a5c17d-6025-4138-8e71-ccd629bfc9e4', 'Supply and application of two-component epoxy waterproof paint over existing bathroom wall tiles, including surface preparation (cleaning and degreasing), sealing of grout joints, application of primer coat, and two coats of epoxy waterproof paint using brush/roller. Works to include protection of adjacent surfaces, touch-ups, and final cleaning — complete in all respects as per manufacturer’s specifications and approved sample.

Type: Epoxy Waterproof Paint
Location: Bathrooms Walls except shower areas and service bathroom'),
('ef53d7e7-4b64-417a-8b1c-2a9fd28a8c3b', 'Supply and install engineered marble tiles on walls, including approved waterproofing membrane application, surface preparation, adhesive bedding, precise setting out, mechanical cutting for openings, 3 mm joint spacing, polymer-modified grouting, matching skirting, perimeter/movement joints as required, surface cleaning, protection, and final handover — complete in all respects

Drawing Code: M011
Type: Equivalent as per 3D design
Supplier: Local Market'),
('eba7766f-a9be-49c3-8fab-57b9368a4a6e', 'Wall Waterproofing

Supply and application of Wall waterproofing up to 300-400mm H ready to receive wall finishes.

Location: Sales Gallery and Pre-Function toilets, Pantry, Janitor room, Kitchen'),
('b63a4518-500b-49d8-8b0b-fffb0c15dc9e', 'Wet Area Waterproofing:

Liquid applied Cementous waterproofing on concrete slab of wet areas prior to receive finishes all in accordance with the drawings and specifications.

Location: To Horizontal area'),
('1ad6c52a-be9e-4fe9-95b7-265b87b0fe01', 'Wet Area Waterproofing:

Liquid applied Cementous waterproofing on concrete slab of wet areas prior to receive finishes all in accordance with the drawings and specifications.

Location: To Vertical area');
do $x$ declare r record; other uuid; begin
  for r in select f.id, f.description, i.unit, i.use_count, i.last_used from scheduler.rate_fix_stage f join scheduler.rate_items i on i.id = f.id loop
    select x.id into other from scheduler.rate_items x where x.id <> r.id
      and lower(btrim(x.description)) = lower(btrim(r.description)) and lower(coalesce(x.unit,'')) = lower(coalesce(r.unit,'')) limit 1;
    if other is null then
      update scheduler.rate_items set description = r.description, notes = regexp_replace(coalesce(notes,''), '^clipped · ', '') where id = r.id;
    else
      update scheduler.rate_items set use_count = use_count + r.use_count, last_used = greatest(last_used, r.last_used) where id = other;
      update scheduler.rate_items set is_active = false, notes = coalesce(notes,'') || ' · merged into ' || (select code from scheduler.rate_items where id = other) where id = r.id;
    end if;
  end loop;
end $x$;
update scheduler.rate_items set is_active = false, notes = coalesce(notes,'') || ' · duplicate of a full-text entry' where id in ('02e92461-157b-44a3-abca-d4982d4a4162','2a967390-ecb8-442e-8758-a2b3018af237','7bfe0937-a73f-4a60-a975-7e0132e8c90f','88eed46f-411b-4225-9af1-ef1557f49e06','d773014f-ee8b-492e-8a58-e426e4a71bcb','0a479d6d-d5d4-4a8c-83dc-d06a60b32965','046fe344-88a9-47c4-b514-469ffa0f5680');
drop table scheduler.rate_fix_stage;
select count(*) filter (where description like '%…') as still_clipped, count(*) filter (where not is_active) as retired from scheduler.rate_items;