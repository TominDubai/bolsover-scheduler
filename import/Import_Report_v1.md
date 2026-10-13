# Bolsover Scheduler — Import Report v1

Source: `Quotation Register 2025.xlsx` → 195 rows → **85 projects**, 161 revisions, 26 variations. Run 2026-10-13.

## Status after import

- **QUOTED**: 59
- **LIVE**: 10
- **COMPLETED**: 8
- **ON_HOLD**: 4
- **PENDING**: 3
- **LOST**: 1

Pipeline mapping: submitted/updated → QUOTED · approved → WON, then LIVE if the folder is in `ongoing`, COMPLETED if in `Finished` or a 2025 job with no 2026 folder · pending / at site engr. → PENDING · hold / on-hold → ON HOLD · by others → LOST · merge with orig. contract → VO on the parent.

## Needs your eye (23)

- BBC/072025/00001 Table Painting: approved in 2025, no 2026 folder — set COMPLETED, confirm
- BBC/072025/00002 AR_Savannah_15: approved in 2025, no 2026 folder — set COMPLETED, confirm
- BBC/072025/00009 Unit 803, Canal Front Residence Renovation Works: approved in 2025, no 2026 folder — set COMPLETED, confirm
- BBC/082025/00012 E&T Palm Jumeirah Variation Works No.1: variation with no parent in the register — imported as its own quote
- BBC/082025/00012 E&T Palm Jumeirah Variation Works No.1: approved in 2025, no 2026 folder — set COMPLETED, confirm
- BBC/092025/00013 Night Club Wall & Ceiling Works: no client in the register
- BBC/092025/00016 Palm Jumeirah Fitout Works: no client in the register
- BBC/102025/00018 Pergola Wooden Panels Works: no client in the register
- BBC/102025/00026 Villa 53, Palma Residences Interior Works: approved in 2025, no 2026 folder — set COMPLETED, confirm
- BBC/112025/00029 Joinery works from mye: no client in the register
- BBC/112025/00030 Store: no client in the register
- BBC/112025/00031 Shoreline: no client in the register
- BBC/112025/00034 Furniture & Joinery Works: approved in 2025, no 2026 folder — set COMPLETED, confirm
- BBC/112025/00037 Villa 54, F102, District 1 Interior & Outdoor Works: approved in 2025, no 2026 folder — set COMPLETED, confirm
- BBC/122025/00039 Villa 03VL-47, Jumeirah Park 4 & 4A Interior & Extension Works: no client in the register
- BBC/122025/00041 Al Reem 109 Refurbishment Works: no client in the register
- BBC/062026/00084 Marina, Princess Tower (Option 1): no client in the register
- BBC/062026/00085 Villa 804, District 1, Landscaping Works: no client in the register
- BBC/062026/00086 Concrete Base Platform Works: no client in the register
- BBC/092026/00100 Platinum Tower 2706: register says submitted but the job is live — set LIVE, confirm (and move the folder to ongoing)
- BBC/092026/00101: no project name — used client `Warehouse 38`
- BBC/092026/00103 Bathroom Civil & Sanitary Fixture Works: no client in the register
- BBC/102026/00111: identical to 00019 (Craig, Villa 21, 60,360, 8 Oct) — probable copy-paste; imported but check

## Decisions (37)

- BBC/072025/00010 AR_Savannah_15 - Pergola & Landscaping Works: → VO on BBC/072025/00002 (approved)
- BBC/092025/00014 AR_Savannah_15 - Exterior Painting Works: → VO on BBC/072025/00002 (approved)
- BBC/092025/00017 AR_Savannah_15 - Additional Work No. 3: → VO on BBC/072025/00002 (approved)
- BBC/102025/00018 Pergola Wooden Panels Works: → VO on BBC/072025/00002 (not approved, value 0 until approved)
- BBC/102025/00020 AR_Savannah_15 - Additional Work No. 4: → VO on BBC/072025/00002 (approved)
- BBC/102025/00024 AR_Savannah_15 - Additional Work No. 5: → VO on BBC/072025/00002 (approved)
- BBC/102025/00025 AR_Savannah_15 - Additional Work No. 6: → VO on BBC/072025/00002 (approved)
- BBC/112025/00027: Twin Villas District 1 — ongoing/Villa 45 - Mrs. Tazmeen → LIVE
- BBC/112025/00028 AR_Savannah_15 - Additional Work No. 7: → VO on BBC/072025/00002 (not approved, value 0 until approved)
- BBC/112025/00035 Villa 53, Palma Residences Additional Work No. 1: → VO on BBC/102025/00026 (approved)
- BBC/112025/00038: Brow Studio shop front — ongoing/Brow Studio → LIVE
- BBC/122025/00040: has an approved revision, later row is `updated` — treated as WON
- BBC/122025/00040: Al Reem 112 — ongoing/Spencer - Al Reem → LIVE
- BBC/122025/00042 AR_Savannah_15 - Additional Work No. 8: → VO on BBC/072025/00002 (not approved, value 0 until approved)
- BBC/122025/00043 AR_Savannah_15 - Additional Work No. 9: → VO on BBC/072025/00002 (not approved, value 0 until approved)
- BBC/122025/00044 Villa 54, F102, District 1 Additional Work no. 1: → VO on BBC/112025/00037 (approved)
- BBC/012026/00051: Meadows 5 — 06_meadows 05, street 3, villa 1 → LIVE
- BBC/012026/00052 Villa 54, F102, District 1 Additional Work no. 2: → VO on BBC/112025/00037 (not approved, value 0 until approved)
- BBC/032026/00060 AR_Savannah_15 - Additional Work No. 10: → VO on BBC/072025/00002 (not approved, value 0 until approved)
- BBC/032026/00061 Twin Villas, District 1 Variation Work no. 1: → VO on BBC/112025/00027 (approved)
- BBC/032026/00063: Sidra 2 — 20_Sidra 2Villa Dubai Hills Renovation Works → LIVE
- BBC/032026/00066 Unit 803, CFR 6 Variation Work no. 1: → VO on BBC/072025/00009 (approved)
- BBC/042026/00072 Villa 170, Sidra 2, Dubai Hills Additional Work no. 1: → VO on BBC/032026/00063 (not approved, value 0 until approved)
- BBC/042026/00075 The Meadows 5 , Villa 1 Additional Work No. 1: → VO on BBC/012026/00051 (not approved, value 0 until approved)
- BBC/052026/00077: Sunrise Villa 21 — 34_SunriseVilla 21 - JP - Naiks → LIVE
- BBC/062026/00082: House MZ — 39_Archisense - House MZ → LIVE
- BBC/062026/00086: in Finished folder → COMPLETED
- BBC/072026/00087: Craig Villa 21 other works — 45_Craig's Victory Heights → LIVE
- BBC/072026/00088 Twin Villas, District 1 Variation Work no. 2: → VO on BBC/112025/00027 (not approved, value 0 until approved)
- BBC/072026/00089: Oro Verde — 51_Oro Verde → LIVE
- BBC/072026/00091 Twin Villas, District 1 Variation Work no. 3: → VO on BBC/112025/00027 (not approved, value 0 until approved)
- BBC/072026/00096 Twin Villas, District 1 Variation Work no. 3: → VO on BBC/112025/00027 (not approved, value 0 until approved)
- BBC/072026/00097 Oro Verde - Terracotta Blocks: → VO on BBC/072026/00089 (approved)
- BBC/072026/00098 Oro Verde - Planter Box: → VO on BBC/072026/00089 (approved)
- BBC/092026/00104 Oro Verde - Skirting Works: → VO on BBC/072026/00089 (not approved, value 0 until approved)
- BBC/092026/00106 Oro Verde - Wall Cladding Works: → VO on BBC/072026/00089 (not approved, value 0 until approved)
- BBC/092026/00107 Unit 2706, Platinum Tower Furnitures: → VO on BBC/092026/00100 (not approved, value 0 until approved)

## Cells changed (213)

| Row | Column | Before | After | Why |
|---|---|---|---|---|
| 3 | Qtn no. | ` BBC/072025/00001_rev00` | `BBC/072025/00001_rev00` | trimmed whitespace |
| 4 | Qtn no. | ` BBC/072025/00002_rev00` | `BBC/072025/00002_rev00` | trimmed whitespace |
| 5 | Qtn no. | ` BBC/072025/00002_rev01` | `BBC/072025/00002_rev01` | trimmed whitespace |
| 8 | Qtn no. | ` BBC/072025/00004_rev00` | `BBC/072025/00004_rev00` | trimmed whitespace |
| 9 | Qtn no. | ` BBC/072025/00005_rev00` | `BBC/072025/00005_rev00` | trimmed whitespace |
| 9 | Client | ` Villa D76, Flame Tree, Jumeirah Golf Estates` | `Villa D76, Flame Tree, Jumeirah Golf Estates` | trimmed whitespace |
| 23 | Qtn no. | ` BBC/072025/00010_rev00` | `BBC/072025/00010_rev00` | trimmed whitespace |
| 23 | Quoted Value | `201421.03425` | `201421.03` | rounded to 2 dp |
| 24 | Qtn no. | ` BBC/072025/00010_rev01` | `BBC/072025/00010_rev01` | trimmed whitespace |
| 25 | Qtn no. | ` BBC/072025/00010_rev02` | `BBC/072025/00010_rev02` | trimmed whitespace |
| 26 | Qtn no. | ` BBC/082025/00011_rev00` | `BBC/082025/00011_rev00` | trimmed whitespace |
| 27 | Qtn no. | ` BBC/082025/00012_rev00` | `BBC/082025/00012_rev00` | trimmed whitespace |
| 28 | Qtn no. | ` BBC/092025/00013_rev00` | `BBC/092025/00013_rev00` | trimmed whitespace |
| 29 | Qtn no. | ` BBC/092025/00014_rev00` | `BBC/092025/00014_rev00` | trimmed whitespace |
| 30 | Qtn no. | ` BBC/092025/00014_rev01` | `BBC/092025/00014_rev01` | trimmed whitespace |
| 31 | Qtn no. | ` BBC/092025/00015_rev00` | `BBC/092025/00015_rev00` | trimmed whitespace |
| 32 | Qtn no. | ` BBC/092025/00015_rev01` | `BBC/092025/00015_rev01` | trimmed whitespace |
| 33 | Qtn no. | ` BBC/092025/00015_rev02` | `BBC/092025/00015_rev02` | trimmed whitespace |
| 34 | Qtn no. | ` BBC/092025/00016_rev00` | `BBC/092025/00016_rev00` | trimmed whitespace |
| 34 | status | `Hold` | `hold` | normalised case/whitespace |
| 35 | Qtn no. | ` BBC/092025/00017_rev00` | `BBC/092025/00017_rev00` | trimmed whitespace |
| 36 | Qtn no. | ` BBC/102025/00018_rev00` | `BBC/102025/00018_rev00` | trimmed whitespace |
| 37 | Qtn no. | ` BBC/102025/00019_rev00` | `BBC/102025/00019_rev00` | trimmed whitespace |
| 38 | Qtn no. | ` BBC/102025/00019_rev01` | `BBC/102025/00019_rev01` | trimmed whitespace |
| 39 | Qtn no. | ` BBC/102025/00020_rev00` | `BBC/102025/00020_rev00` | trimmed whitespace |
| 40 | Qtn no. | ` BBC/102025/00021_rev00` | `BBC/102025/00021_rev00` | trimmed whitespace |
| 40 | Client | `Ms.Irene Santos ` | `Ms.Irene Santos` | trimmed whitespace |
| 41 | Qtn no. | ` BBC/102025/00021_rev01` | `BBC/102025/00021_rev01` | trimmed whitespace |
| 41 | Client | `Ms.Irene Santos ` | `Ms.Irene Santos` | trimmed whitespace |
| 42 | Qtn no. | ` BBC/102025/00022_rev00` | `BBC/102025/00022_rev00` | trimmed whitespace |
| 43 | Qtn no. | ` BBC/102025/00023_rev00` | `BBC/102025/00023_rev00` | trimmed whitespace |
| 44 | Qtn no. | ` BBC/102025/00023_rev01` | `BBC/102025/00023_rev01` | trimmed whitespace |
| 45 | Qtn no. | ` BBC/102025/00024_rev00` | `BBC/102025/00024_rev00` | trimmed whitespace |
| 46 | Qtn no. | ` BBC/102025/00025_rev00` | `BBC/102025/00025_rev00` | trimmed whitespace |
| 47 | Qtn no. | ` BBC/102025/00025_rev01` | `BBC/102025/00025_rev01` | trimmed whitespace |
| 48 | Qtn no. | ` BBC/102025/00026_rev00` | `BBC/102025/00026_rev00` | trimmed whitespace |
| 48 | Location | `Villa 53, Palma Residences ` | `Villa 53, Palma Residences` | trimmed whitespace |
| 49 | Qtn no. | ` BBC/102025/00026_rev01` | `BBC/102025/00026_rev01` | trimmed whitespace |
| 49 | Location | `Villa 53, Palma Residences ` | `Villa 53, Palma Residences` | trimmed whitespace |
| 50 | Qtn no. | ` BBC/102025/00026_rev02` | `BBC/102025/00026_rev02` | trimmed whitespace |
| 50 | Location | `Villa 53, Palma Residences ` | `Villa 53, Palma Residences` | trimmed whitespace |
| 51 | Qtn no. | ` BBC/102025/00026_rev03` | `BBC/102025/00026_rev03` | trimmed whitespace |
| 51 | Location | `Villa 53, Palma Residences ` | `Villa 53, Palma Residences` | trimmed whitespace |
| 52 | Qtn no. | ` BBC/112025/00027_rev00` | `BBC/112025/00027_rev00` | trimmed whitespace |
| 53 | Qtn no. | ` BBC/112025/00027_rev01` | `BBC/112025/00027_rev01` | trimmed whitespace |
| 54 | Qtn no. | ` BBC/112025/00027_rev02` | `BBC/112025/00027_rev02` | trimmed whitespace |
| 55 | Qtn no. | ` BBC/112025/00027_rev03` | `BBC/112025/00027_rev03` | trimmed whitespace |
| 56 | Qtn no. | ` BBC/112025/00028_rev00` | `BBC/112025/00028_rev00` | trimmed whitespace |
| 57 | Qtn no. | ` BBC/112025/00029_rev00` | `BBC/112025/00029_rev00` | trimmed whitespace |
| 58 | Qtn no. | ` BBC/112025/00030_rev00` | `BBC/112025/00030_rev00` | trimmed whitespace |
| 58 | status | `Hold` | `hold` | normalised case/whitespace |
| 59 | Qtn no. | ` BBC/112025/00031_rev00` | `BBC/112025/00031_rev00` | trimmed whitespace |
| 59 | status | `Hold` | `hold` | normalised case/whitespace |
| 60 | Qtn no. | ` BBC/112025/00032_rev00` | `BBC/112025/00032_rev00` | trimmed whitespace |
| 61 | Qtn no. | ` BBC/112025/00033_rev00` | `BBC/112025/00033_rev00` | trimmed whitespace |
| 62 | Qtn no. | ` BBC/112025/00034_rev00` | `BBC/112025/00034_rev00` | trimmed whitespace |
| 63 | Qtn no. | ` BBC/112025/00034_rev01` | `BBC/112025/00034_rev01` | trimmed whitespace |
| 64 | Qtn no. | ` BBC/112025/00035_rev00` | `BBC/112025/00035_rev00` | trimmed whitespace |
| 64 | Location | `Villa 53, Palma Residences ` | `Villa 53, Palma Residences` | trimmed whitespace |
| 65 | Qtn no. | ` BBC/112025/00036_rev00` | `BBC/112025/00036_rev00` | trimmed whitespace |
| 66 | Qtn no. | ` BBC/112025/00037_rev00` | `BBC/112025/00037_rev00` | trimmed whitespace |
| 67 | Qtn no. | ` BBC/112025/00037_rev01` | `BBC/112025/00037_rev01` | trimmed whitespace |
| 68 | Qtn no. | ` BBC/112025/00037_rev02` | `BBC/112025/00037_rev02` | trimmed whitespace |
| 69 | Qtn no. | ` BBC/112025/00037_rev03` | `BBC/112025/00037_rev03` | trimmed whitespace |
| 70 | Qtn no. | ` BBC/112025/00037_rev04` | `BBC/112025/00037_rev04` | trimmed whitespace |
| 71 | Qtn no. | ` BBC/112025/00037_rev05` | `BBC/112025/00037_rev05` | trimmed whitespace |
| 71 | Quoted Value | `377732.10307500005` | `377732.1` | rounded to 2 dp |
| 72 | Qtn no. | ` BBC/112025/00037_rev06` | `BBC/112025/00037_rev06` | trimmed whitespace |
| 73 | Qtn no. | ` BBC/112025/00038_rev00` | `BBC/112025/00038_rev00` | trimmed whitespace |
| 74 | Qtn no. | ` BBC/112025/00038_rev01` | `BBC/112025/00038_rev01` | trimmed whitespace |
| 75 | Qtn no. | ` BBC/112025/00038_rev02` | `BBC/112025/00038_rev02` | trimmed whitespace |
| 76 | Qtn no. | ` BBC/112025/00038_rev03` | `BBC/112025/00038_rev03` | trimmed whitespace |
| 77 | Qtn no. | ` BBC/112025/00038_rev04` | `BBC/112025/00038_rev04` | trimmed whitespace |
| 78 | Qtn no. | ` BBC/122025/00039_rev00` | `BBC/122025/00039_rev00` | trimmed whitespace |
| 79 | Qtn no. | ` BBC/122025/00040_rev00` | `BBC/122025/00040_rev00` | trimmed whitespace |
| 80 | Qtn no. | ` BBC/122025/00040_rev01` | `BBC/122025/00040_rev01` | trimmed whitespace |
| 81 | Qtn no. | ` BBC/122025/00040_rev02` | `BBC/122025/00040_rev02` | trimmed whitespace |
| 81 | Quoted Value | `137749.128` | `137749.13` | rounded to 2 dp |
| 82 | Qtn no. | ` BBC/122025/00040_rev03` | `BBC/122025/00040_rev03` | trimmed whitespace |
| 83 | Qtn no. | ` BBC/122025/00040_rev04` | `BBC/122025/00040_rev04` | trimmed whitespace |
| 84 | Qtn no. | ` BBC/122025/00041_rev00` | `BBC/122025/00041_rev00` | trimmed whitespace |
| 85 | Qtn no. | ` BBC/122025/00042_rev00` | `BBC/122025/00042_rev00` | trimmed whitespace |
| 86 | Qtn no. | ` BBC/122025/00043_rev00` | `BBC/122025/00043_rev00` | trimmed whitespace |
| 87 | Qtn no. | ` BBC/122025/00044_rev00` | `BBC/122025/00044_rev00` | trimmed whitespace |
| 88 | Qtn no. | ` BBC/122025/00044_rev01` | `BBC/122025/00044_rev01` | trimmed whitespace |
| 89 | Qtn no. | ` BBC/122025/00044_rev02` | `BBC/122025/00044_rev02` | trimmed whitespace |
| 90 | Qtn no. | ` BBC/122025/00044_rev03` | `BBC/122025/00044_rev03` | trimmed whitespace |
| 91 | Qtn no. | ` BBC/122025/00044_rev04` | `BBC/122025/00044_rev04` | trimmed whitespace |
| 92 | Qtn no. | ` BBC/012026/00045_rev00` | `BBC/012026/00045_rev00` | trimmed whitespace |
| 93 | Qtn no. | ` BBC/012026/00046_rev00` | `BBC/012026/00046_rev00` | trimmed whitespace |
| 94 | Qtn no. | ` BBC/012026/00047_rev00` | `BBC/012026/00047_rev00` | trimmed whitespace |
| 94 | Client | `Sundial, JGE ` | `Sundial, JGE` | trimmed whitespace |
| 94 | status | `On-Hold` | `on-hold` | normalised case/whitespace |
| 95 | Qtn no. | ` BBC/012026/00048_rev00` | `BBC/012026/00048_rev00` | trimmed whitespace |
| 96 | Qtn no. | ` BBC/012026/00049_rev00` | `BBC/012026/00049_rev00` | trimmed whitespace |
| 97 | Qtn no. | ` BBC/012026/00050_rev00` | `BBC/012026/00050_rev00` | trimmed whitespace |
| 98 | Qtn no. | ` BBC/012026/00051_rev00` | `BBC/012026/00051_rev00` | trimmed whitespace |
| 99 | Qtn no. | ` BBC/012026/00051_rev01` | `BBC/012026/00051_rev01` | trimmed whitespace |
| 100 | Qtn no. | ` BBC/012026/00051_rev02` | `BBC/012026/00051_rev02` | trimmed whitespace |
| 101 | Qtn no. | ` BBC/012026/00052_rev00` | `BBC/012026/00052_rev00` | trimmed whitespace |
| 102 | Qtn no. | ` BBC/012026/00053_rev00` | `BBC/012026/00053_rev00` | trimmed whitespace |
| 103 | Qtn no. | ` BBC/012026/00054_rev00` | `BBC/012026/00054_rev00` | trimmed whitespace |
| 104 | Qtn no. | ` BBC/012026/00055_rev00` | `BBC/012026/00055_rev00` | trimmed whitespace |
| 104 | Location | ` Concord Tower, Office 2005, Media City - Dubai` | `Concord Tower, Office 2005, Media City - Dubai` | trimmed whitespace |
| 105 | Qtn no. | ` BBC/012026/00056_rev00` | `BBC/012026/00056_rev00` | trimmed whitespace |
| 106 | Qtn no. | ` BBC/012026/00056_rev01` | `BBC/012026/00056_rev01` | trimmed whitespace |
| 107 | Qtn no. | ` BBC/012026/00057_rev00` | `BBC/012026/00057_rev00` | trimmed whitespace |
| 108 | Qtn no. | ` BBC/022026/00058_rev00` | `BBC/022026/00058_rev00` | trimmed whitespace |
| 109 | Qtn no. | ` BBC/022026/00058_rev01` | `BBC/022026/00058_rev01` | trimmed whitespace |
| 110 | Qtn no. | ` BBC/022026/00059_rev00` | `BBC/022026/00059_rev00` | trimmed whitespace |
| 111 | Qtn no. | ` BBC/032026/00060_rev00` | `BBC/032026/00060_rev00` | trimmed whitespace |
| 112 | Qtn no. | ` BBC/032026/00061_rev00` | `BBC/032026/00061_rev00` | trimmed whitespace |
| 113 | Qtn no. | ` BBC/032026/00062_rev00` | `BBC/032026/00062_rev00` | trimmed whitespace |
| 114 | Qtn no. | ` BBC/032026/00063_rev00` | `BBC/032026/00063_rev00` | trimmed whitespace |
| 115 | Qtn no. | ` BBC/032026/00064_rev00` | `BBC/032026/00064_rev00` | trimmed whitespace |
| 116 | Qtn no. | ` BBC/032026/00065_rev00` | `BBC/032026/00065_rev00` | trimmed whitespace |
| 117 | Qtn no. | ` BBC/032026/00066_rev00` | `BBC/032026/00066_rev00` | trimmed whitespace |
| 118 | Qtn no. | ` BBC/042026/00067_rev00` | `BBC/042026/00067_rev00` | trimmed whitespace |
| 119 | Qtn no. | ` BBC/042026/00068_rev00` | `BBC/042026/00068_rev00` | trimmed whitespace |
| 120 | Qtn no. | ` BBC/042026/00068_rev00` | `BBC/042026/00068_rev00` | trimmed whitespace |
| 120 | revision label | `None` | `Option 2` | duplicate BBC/042026/00068_rev00 — kept as a labelled option |
| 121 | Qtn no. | ` BBC/042026/00068_rev01` | `BBC/042026/00068_rev01` | trimmed whitespace |
| 122 | Qtn no. | ` BBC/042026/00068_rev02` | `BBC/042026/00068_rev02` | trimmed whitespace |
| 123 | Qtn no. | ` BBC/042026/00069_rev00` | `BBC/042026/00069_rev00` | trimmed whitespace |
| 124 | Qtn no. | ` BBC/042026/00069_rev01` | `BBC/042026/00069_rev01` | trimmed whitespace |
| 125 | Qtn no. | ` BBC/042026/00070_rev00` | `BBC/042026/00070_rev00` | trimmed whitespace |
| 126 | Qtn no. | ` BBC/042026/00071_rev00` | `BBC/042026/00071_rev00` | trimmed whitespace |
| 126 | Client | `Warehouse 173 ` | `Warehouse 173` | trimmed whitespace |
| 127 | Qtn no. | ` BBC/042026/00071_rev01` | `BBC/042026/00071_rev01` | trimmed whitespace |
| 127 | Client | `Warehouse 173 ` | `Warehouse 173` | trimmed whitespace |
| 128 | Qtn no. | ` BBC/042026/00071_rev02` | `BBC/042026/00071_rev02` | trimmed whitespace |
| 128 | Client | `Warehouse 173 ` | `Warehouse 173` | trimmed whitespace |
| 129 | Qtn no. | ` BBC/042026/00072_rev00` | `BBC/042026/00072_rev00` | trimmed whitespace |
| 130 | Qtn no. | ` BBC/042026/00073_rev00` | `BBC/042026/00073_rev00` | trimmed whitespace |
| 131 | Qtn no. | ` BBC/042026/00074_rev00` | `BBC/042026/00074_rev00` | trimmed whitespace |
| 132 | Qtn no. | ` BBC/042026/00074_rev01` | `BBC/042026/00074_rev01` | trimmed whitespace |
| 133 | Qtn no. | ` BBC/042026/00075_rev00` | `BBC/042026/00075_rev00` | trimmed whitespace |
| 134 | Qtn no. | ` BBC/052026/00076_rev00` | `BBC/052026/00076_rev00` | trimmed whitespace |
| 135 | Qtn no. | ` BBC/052026/00077_rev00` | `BBC/052026/00077_rev00` | trimmed whitespace |
| 136 | Qtn no. | ` BBC/052026/00077_rev01` | `BBC/052026/00077_rev01` | trimmed whitespace |
| 137 | Qtn no. | ` BBC/052026/00077_rev02` | `BBC/052026/00077_rev02` | trimmed whitespace |
| 138 | Qtn no. | ` BBC/052026/00077_rev03` | `BBC/052026/00077_rev03` | trimmed whitespace |
| 139 | Qtn no. | ` BBC/052026/00077_rev04` | `BBC/052026/00077_rev04` | trimmed whitespace |
| 140 | Qtn no. | ` BBC/052026/00077_rev05` | `BBC/052026/00077_rev05` | trimmed whitespace |
| 141 | Qtn no. | ` BBC/052026/00077_rev06` | `BBC/052026/00077_rev06` | trimmed whitespace |
| 142 | Qtn no. | ` BBC/052026/00077_rev02` | `BBC/052026/00077_rev02` | trimmed whitespace |
| 142 | revision label | `None` | `Option 2` | duplicate BBC/052026/00077_rev02 — kept as a labelled option |
| 143 | Qtn no. | ` BBC/052026/00078_rev00` | `BBC/052026/00078_rev00` | trimmed whitespace |
| 144 | Qtn no. | ` BBC/052026/00079_rev00` | `BBC/052026/00079_rev00` | trimmed whitespace |
| 145 | Qtn no. | ` BBC/052026/00080_rev00` | `BBC/052026/00080_rev00` | trimmed whitespace |
| 146 | Qtn no. | ` BBC/052026/00081_rev00` | `BBC/052026/00081_rev00` | trimmed whitespace |
| 147 | Qtn no. | ` BBC/062026/00082_rev00` | `BBC/062026/00082_rev00` | trimmed whitespace |
| 148 | Qtn no. | ` BBC/062026/00082_rev01` | `BBC/062026/00082_rev01` | trimmed whitespace |
| 149 | Qtn no. | ` BBC/062026/00082_rev02` | `BBC/062026/00082_rev02` | trimmed whitespace |
| 150 | Qtn no. | ` BBC/062026/00082_rev03` | `BBC/062026/00082_rev03` | trimmed whitespace |
| 151 | Qtn no. | ` BBC/062026/00082_rev04` | `BBC/062026/00082_rev04` | trimmed whitespace |
| 152 | Qtn no. | ` BBC/062026/00082_rev05` | `BBC/062026/00082_rev05` | trimmed whitespace |
| 153 | Qtn no. | ` BBC/062026/00083_rev00` | `BBC/062026/00083_rev00` | trimmed whitespace |
| 154 | Qtn no. | ` BBC/062026/00083_rev01` | `BBC/062026/00083_rev01` | trimmed whitespace |
| 155 | Qtn no. | ` BBC/062026/00083_rev02` | `BBC/062026/00083_rev02` | trimmed whitespace |
| 156 | Qtn no. | ` BBC/062026/00083_rev03` | `BBC/062026/00083_rev03` | trimmed whitespace |
| 157 | Qtn no. | ` BBC/062026/00084_rev00` | `BBC/062026/00084_rev00` | trimmed whitespace |
| 158 | Qtn no. | ` BBC/062026/00084_rev00` | `BBC/062026/00084_rev00` | trimmed whitespace |
| 158 | revision label | `None` | `Option 2` | duplicate BBC/062026/00084_rev00 — kept as a labelled option |
| 159 | Qtn no. | ` BBC/062026/00085_rev00` | `BBC/062026/00085_rev00` | trimmed whitespace |
| 160 | Qtn no. | ` BBC/062026/00086_rev00` | `BBC/062026/00086_rev00` | trimmed whitespace |
| 161 | Qtn no. | ` BBC/062026/00086_rev01` | `BBC/062026/00086_rev01` | trimmed whitespace |
| 162 | Qtn no. | ` BBC/072026/00087_rev00` | `BBC/072026/00087_rev00` | trimmed whitespace |
| 163 | Qtn no. | ` BBC/072026/00087_rev01` | `BBC/072026/00087_rev01` | trimmed whitespace |
| 164 | Qtn no. | ` BBC/072026/00087_rev02` | `BBC/072026/00087_rev02` | trimmed whitespace |
| 165 | Qtn no. | ` BBC/072026/00088_rev00` | `BBC/072026/00088_rev00` | trimmed whitespace |
| 166 | Qtn no. | ` BBC/072026/00089_rev00` | `BBC/072026/00089_rev00` | trimmed whitespace |
| 167 | Qtn no. | ` BBC/072026/00089_rev01` | `BBC/072026/00089_rev01` | trimmed whitespace |
| 168 | Qtn no. | ` BBC/072026/00089_rev02` | `BBC/072026/00089_rev02` | trimmed whitespace |
| 169 | Qtn no. | ` BBC/072026/00090_rev00` | `BBC/072026/00090_rev00` | trimmed whitespace |
| 170 | Qtn no. | ` BBC/072026/00090_rev01` | `BBC/072026/00090_rev01` | trimmed whitespace |
| 171 | Qtn no. | ` BBC/072026/00091_rev00` | `BBC/072026/00091_rev00` | trimmed whitespace |
| 172 | Qtn no. | ` BBC/072026/00092_rev00` | `BBC/072026/00092_rev00` | trimmed whitespace |
| 173 | Qtn no. | ` BBC/072026/00093_rev00` | `BBC/072026/00093_rev00` | trimmed whitespace |
| 174 | Qtn no. | ` BBC/072026/00093_rev02` | `BBC/072026/00093_rev02` | trimmed whitespace |
| 175 | Qtn no. | ` BBC/072026/00094_rev00` | `BBC/072026/00094_rev00` | trimmed whitespace |
| 176 | Qtn no. | ` BBC/072026/00094_rev01` | `BBC/072026/00094_rev01` | trimmed whitespace |
| 177 | Qtn no. | ` BBC/072026/00094_rev02` | `BBC/072026/00094_rev02` | trimmed whitespace |
| 178 | Qtn no. | ` BBC/072026/00094_rev03` | `BBC/072026/00094_rev03` | trimmed whitespace |
| 179 | Qtn no. | ` BBC/072026/00095_rev00` | `BBC/072026/00095_rev00` | trimmed whitespace |
| 180 | Qtn no. | ` BBC/072026/00096_rev00` | `BBC/072026/00096_rev00` | trimmed whitespace |
| 181 | Qtn no. | ` BBC/072026/00097_rev00` | `BBC/072026/00097_rev00` | trimmed whitespace |
| 182 | Qtn no. | ` BBC/072026/00098_rev00` | `BBC/072026/00098_rev00` | trimmed whitespace |
| 183 | Qtn no. | ` BBC/092026/00099_rev00` | `BBC/092026/00099_rev00` | trimmed whitespace |
| 184 | Qtn no. | ` BBC/092026/00100_rev00` | `BBC/092026/00100_rev00` | trimmed whitespace |
| 185 | Qtn no. | ` BBC/092026/00100_rev01` | `BBC/092026/00100_rev01` | trimmed whitespace |
| 186 | Qtn no. | ` BBC/092026/00101_rev00` | `BBC/092026/00101_rev00` | trimmed whitespace |
| 187 | Qtn no. | ` BBC/092026/00103_rev00` | `BBC/092026/00103_rev00` | trimmed whitespace |
| 187 | Project | `Bathroom Civil & Sanitary Fixture Works ` | `Bathroom Civil & Sanitary Fixture Works` | trimmed whitespace |
| 188 | Qtn no. | ` BBC/092026/00103_rev01` | `BBC/092026/00103_rev01` | trimmed whitespace |
| 188 | Project | `Bathroom Civil & Sanitary Fixture Works ` | `Bathroom Civil & Sanitary Fixture Works` | trimmed whitespace |
| 189 | Qtn no. | ` BBC/092026/000104_rev00` | `BBC/092026/000104_rev00` | trimmed whitespace |
| 189 | Qtn no. (padding) | `000104` | `00104` | extra leading zero |
| 190 | Qtn no. | ` BBC/092026/000105_rev00` | `BBC/092026/000105_rev00` | trimmed whitespace |
| 190 | Qtn no. (padding) | `000105` | `00105` | extra leading zero |
| 191 | Qtn no. | ` BBC/092026/000106_rev00` | `BBC/092026/000106_rev00` | trimmed whitespace |
| 191 | Qtn no. (padding) | `000106` | `00106` | extra leading zero |
| 192 | Qtn no. | ` BBC/092026/00107_rev00` | `BBC/092026/00107_rev00` | trimmed whitespace |
| 193 | Qtn no. | ` BBC/092026/00108_rev00` | `BBC/092026/00108_rev00` | trimmed whitespace |
| 194 | Qtn no. | ` BBC/102026/00109_rev00` | `BBC/102026/00109_rev00` | trimmed whitespace |
| 195 | Qtn no. | ` BBC/102026/00110_rev00` | `BBC/102026/00110_rev00` | trimmed whitespace |
| 196 | Qtn no. | ` BBC/102025/00111_rev00` | `BBC/102025/00111_rev00` | trimmed whitespace |
| 196 | Qtn no. (year) | `2025` | `2026` | quote 111/112 are Oct 2026 quotes coded as Oct 2025 |
| 197 | Qtn no. | ` BBC/102025/00112_rev00` | `BBC/102025/00112_rev00` | trimmed whitespace |
| 197 | Qtn no. (year) | `2025` | `2026` | quote 111/112 are Oct 2026 quotes coded as Oct 2025 |
| 119 | revision label | `None` | `Option 1` | first of a duplicated revision number |
| 137 | revision label | `None` | `Option 1` | first of a duplicated revision number |
| 157 | revision label | `None` | `Option 1` | first of a duplicated revision number |
