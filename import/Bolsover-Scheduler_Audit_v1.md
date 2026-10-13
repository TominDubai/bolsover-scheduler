# Bolsover Scheduler — Source Audit v1

**Date:** 13 Oct 2026
**Source:** `U:\Quotations - Pao\Quotation Register 2025.xlsx` (sheet `REG. 2025`), last modified 8 Oct 2026, plus the folder tree under `U:\Quotations - Pao\2026\{Upcoming, ongoing, Finished}`.

## What the source is

One sheet, 195 data rows = 111 unique quotes (BBC/MMYYYY/NNNNN) × revisions. One row per revision, S.NO only on rev00. 17 used columns:

S.NO · Qtn no. · Client · Project · Location · Working Days · status · Date of submission · Quoted Value · Vat amount (formula) · Total Quoted amount (formula) · JOB REF NO · Remarks · Order value · Project Start Date · Project End Date · Project Completion date

Sheets 1–3 are empty apart from one T&C sentence.

## Findings

### Structure
- **Revision rows are flat.** 84 of 195 rows are later revisions with blank S.NO. The register has no "latest revision" concept — pipeline value needs grouping by quote number.
- **Status is per revision, not per quote.** Older revisions stay `submitted` after a later one is `approved`.
- **Columns N–Q (Order value, start/end/completion dates) are effectively unused:** 0, 1, 1, 0 cells filled. Project tracking has never lived here — only quoting.
- **JOB REF NO** filled on 21 rows (approved jobs only). Format `BBC-ARD-2025-01` etc. This is the real project ID once won.
- **Working Days** filled on 82/195, nearly abandoned from quote 67 (Apr 2026) onwards.

### Free-text drift
- **status** has 9 spellings for ~5 meanings: `submitted` 149, `approved` 32, `hold` 3, `on-hold` 1, `pending` 3, `merge with orig. contract` 3, `at site engr.` 2, `updated` 1, `by others` 1.
- **No "lost" or "rejected" exists anywhere.** 67 quotes sit at `submitted` as their latest state — AED 67.5M of "pipeline" that is mostly dead. This is the main thing the app has to fix.
- **Client** blank on 15 rows; same client under multiple names (`Mr. Craig` / `Craig`; `Kaia Studio` as client for Brow Studio and Al Barari). Client column is sometimes the project name instead (`Villa Al Barari`, `Fencing`, `Warehouse 173 `).
- 180 of 195 quote numbers have a **leading space**.
- Trailing spaces in Client / Project / Location on several rows.

### Data errors
- **Duplicate quote numbers:** `00068_rev00` (two options), `00077_rev02` (two different scopes), `00084_rev00` (two options). Options and separate scopes are being squeezed into one number.
- **Wrong year in quote number:** rows 196–197 (`00111`, `00112`) coded `102025` with Oct 2025 dates — these are new Oct 2026 quotes. Row 196 also duplicates quote 00019 (Craig Villa 21) line for line.
- `000104`, `000105`, `000106` have an extra leading zero.
- S.NO 102 missing entirely.
- 00096 is a second "Variation Work no. 3" for Twin Villas (00091 is also no. 3).
- 00093 jumps rev00 → rev02.
- 00032 and 00044 numbered in a month before their submission date (minor).
- 21 rows have no value; 19 no date — mostly `hold` / `pending` / `at site engr.` which is fine, but also 00018, 00028, 00029, 00042, 00043, 00060 (Foulkes additional works approved with no value).

### Folder tree vs register
- Folder numbers (01–66 under 2026) are a **separate sequence** from quote numbers — they index 2026 quotes only. Mapping is by name.
- **Drift:** `58_apartment 2706` is in Upcoming but is live (Platinum Tower 2706). `ongoing` holds unnumbered folders (`Brow Studio`, `Spencer - Al Reem`, `Villa 45 - Mrs. Tazmeen`). `Finished` has one folder (46_Concrete Round Base) despite several completed jobs.
- The folder stage (Upcoming/ongoing/Finished) is the only place "won" is recorded beyond the `approved` status.

## What the import will do
1. Group rows by quote number → one `quote` record with `revisions[]`; latest revision carries the value and status.
2. Normalise status into the pipeline below; everything `submitted` lands in **QUOTED** for manual triage (waiting / rejected / lost).
3. Strip whitespace, fix leading zeros, re-number 00111/00112 to `102026`, split duplicate numbers into `00068A/B` style options (flagged for confirmation).
4. Normalise client names to a `clients` list (link to CRM later).
5. Import report lists every cell changed.

## Proposed status pipeline (for confirmation)

Quote side → Project side:

`PENDING` (being priced) → `QUOTED` (sent, awaiting feedback) → `WON` (approved, no job ref yet) → `LIVE` (on site) → `COMPLETED`

Exits from QUOTED: `LOST` (went elsewhere / by others) · `REJECTED` (client dropped it) · `ON HOLD`

Mapping from current values: `pending`/`at site engr.` → PENDING · `submitted`/`updated` → QUOTED · `approved` → WON (LIVE if in `ongoing` folder) · `hold`/`on-hold` → ON HOLD · `by others` → LOST · `merge with orig. contract` → variation on parent project, not a quote.
