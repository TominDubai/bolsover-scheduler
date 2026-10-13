#!/usr/bin/env python3
"""
Bolsover Scheduler — register import, v1 (13 Oct 2026)

Reads `Quotation Register 2025.xlsx` (sheet REG. 2025), cleans it, groups revisions by quote number,
decides a pipeline status for each quote, and writes:
  - import/import.sql         — idempotent SQL to load scheduler.projects / quote_revisions / variations
  - import/Import_Report_v1.md — every cell changed, every decision taken, every row that needs Tom's eye

Usage: python3 import_register.py <register.xlsx>
Re-runnable: the SQL deletes rows with excel_row set before inserting, so re-running replaces the import only.
"""
import sys, re, json, datetime, collections
import openpyxl

SRC = sys.argv[1]
OUT_SQL = "import.sql"
OUT_MD = "Import_Report_v1.md"

# Folder stage on the U: drive decides won-and-beyond. Keyed by quote number (int).
ONGOING = {51: "Meadows 5 — 06_meadows 05, street 3, villa 1", 63: "Sidra 2 — 20_Sidra 2Villa Dubai Hills Renovation Works",
           77: "Sunrise Villa 21 — 34_SunriseVilla 21 - JP - Naiks", 83: "Gym MZ — 38_Archisense - House MZ Gym",
           82: "House MZ — 39_Archisense - House MZ", 87: "Craig Villa 21 other works — 45_Craig's Victory Heights",
           89: "Oro Verde — 51_Oro Verde", 38: "Brow Studio shop front — ongoing/Brow Studio",
           40: "Al Reem 112 — ongoing/Spencer - Al Reem", 27: "Twin Villas District 1 — ongoing/Villa 45 - Mrs. Tazmeen",
           100: "Platinum Tower 2706 — folder is in Upcoming (58_apartment 2706) but the job is live (Jed PM)"}
FINISHED = {86: "Concrete base — Finished/46_Concrete Round Base"}
# 2025 approved jobs with no 2026 folder — assumed finished; Tom to confirm
ASSUMED_COMPLETED = {2, 9, 10, 14, 17, 20, 24, 25, 26, 34, 35, 37, 1, 12}

# quote number → folder under 2026 (by name match, done by hand from the folder list)
FOLDER = {45: "Upcoming/01_Meadows 09, Villa 48", 46: "Upcoming/02_P2387 - ERE HOMES - JOINERY - PALM JUMEIRAH - M56",
          47: "Upcoming/03_Villa 23, Sundial", 49: "Upcoming/04_savannah new", 48: "Upcoming/05_city walk",
          51: "ongoing/06_meadows 05, street 3, villa 1", 50: "Upcoming/08_D130, Palm Jumeirah", 53: "Upcoming/12_Unit No. 3203, Burj Khalifa",
          54: "Upcoming/13_Hattan V6_AR7", 55: "Upcoming/14_Steel Mesh", 56: "Upcoming/15_arabian ranches 2", 57: "Upcoming/16_windows works",
          58: "Upcoming/17_Jasper - Apartment Refurbishment", 59: "Upcoming/18_Al Barari Furniture", 62: "Upcoming/19_Sales Gallery - Abu Dhabi",
          63: "ongoing/20_Sidra 2Villa Dubai Hills Renovation Works", 64: "Upcoming/21_Tribe Planter Box", 65: "Upcoming/22_Villa Al Barari Joinery Works",
          70: "Upcoming/24_Golf Villa", 67: "Upcoming/25_E11", 69: "Upcoming/26_NAO - ABRA - ETIHAD MUSEUM", 68: "Upcoming/27_Kings' School Nad Al Sheba",
          79: "Upcoming/28_House AB Nadd Al Shiba Third, Dubai", 71: "Upcoming/30_Warehouse 173", 73: "Upcoming/31_Fencing Works - Dubai Hills",
          78: "Upcoming/32_AMA Building R01", 74: "Upcoming/33_SI Studio - Kitchen Renovation", 77: "ongoing/34_SunriseVilla 21 - JP - Naiks",
          76: "Upcoming/35_Tribe - Fencing Works", 81: "Upcoming/36_GLO", 80: "Upcoming/37-Joinery Works - Umm Suqeim",
          83: "ongoing/38_Archisense - House MZ Gym", 82: "ongoing/39_Archisense - House MZ", 84: "Upcoming/42_Marina",
          103: "Upcoming/43_2 nos Bathroom works", 85: "Upcoming/44_Villa 804, District 1", 87: "ongoing/45_Craig's Victory Heights",
          86: "Finished/46_Concrete Round Base", 94: "Upcoming/49_Emirates Hills", 93: "Upcoming/50_JGE Jouri Hills", 89: "ongoing/51_Oro Verde",
          90: "Upcoming/53_Box Office Fitout", 92: "Upcoming/55_JGE Door & Window Works", 95: "Upcoming/56_The Hills",
          100: "Upcoming/58_apartment 2706", 99: "Upcoming/59_savannah 15 - glass works", 101: "Upcoming/60_Warehouse 38",
          105: "Upcoming/62_Joinery from Maanas", 109: "Upcoming/63_K69 Brow Studio", 112: "Upcoming/64_anduril project",
          110: "Upcoming/65_Tee Box Golf Lounge FZCO", 38: "ongoing/Brow Studio", 40: "ongoing/Spencer - Al Reem", 27: "ongoing/Villa 45 - Mrs. Tazmeen"}

STATUS_MAP = {"submitted": "QUOTED", "updated": "QUOTED", "approved": "WON", "pending": "PENDING", "at site engr.": "PENDING",
              "hold": "ON_HOLD", "on-hold": "ON_HOLD", "by others": "LOST", "merge with orig. contract": "MERGE"}
QUOTE_STAGE = {"QUOTED": "SUBMITTED", "WON": "SUBMITTED", "PENDING": "PRICING", "ON_HOLD": "SUBMITTED", "LOST": "SUBMITTED"}

# Variation / additional-work quotes become VOs on these parent quotes
VO_PARENT = {10: 2, 14: 2, 17: 2, 18: 2, 20: 2, 24: 2, 25: 2, 28: 2, 42: 2, 43: 2, 60: 2,       # Savannah 15 → 00002
             12: None,                                                                              # E&T Palm Jumeirah variation — parent not in register
             35: 26,                                                                                # Palma 53 add'l 1 → 00026
             44: 37, 52: 37,                                                                        # Villa 54 add'l 1,2 → 00037
             61: 27, 88: 27, 91: 27, 96: 27,                                                        # Twin Villas variations → 00027
             66: 9,                                                                                 # CFR 803 variation → 00009
             72: 63,                                                                                # Sidra 2 add'l → 00063
             75: 51,                                                                                # Meadows 5 add'l → 00051
             97: 89, 98: 89, 104: 89, 106: 89,                                                      # Oro Verde items → 00089
             107: 100}                                                                              # 2706 furnitures → 00100

changes = []     # (row, column, before, after, why)
decisions = []   # free text
review = []      # needs Tom


def chg(row, col, before, after, why):
    if before != after:
        changes.append((row, col, before, after, why))
    return after


def clean(s):
    return s.strip() if isinstance(s, str) else s


wb = openpyxl.load_workbook(SRC)
ws = wb["REG. 2025"]
rows = []
for r in ws.iter_rows(min_row=3):
    v = [c.value for c in r][:17]
    if all(x is None for x in v):
        continue
    rows.append((r[0].row, v))

# ---- pass 1: clean each row ----
recs = []
seen = collections.Counter()
for rn, v in rows:
    sno, qtn, client, project, location, days, status, date, value, _, _, jobref, remarks, order_val, start, end, comp = v
    qtn2 = chg(rn, "Qtn no.", qtn, clean(qtn), "trimmed whitespace")
    m = re.match(r"BBC/(\d{2})(\d{4})/(\d+)_rev(\d+)$", qtn2 or "")
    if not m:
        review.append(f"row {rn}: quote number `{qtn}` not in BBC/MMYYYY/NNNNN_revNN form — skipped"); continue
    mm, yy, num, rev = m.group(1), m.group(2), int(m.group(3)), int(m.group(4))
    # wrong year on the last two Oct-2026 quotes
    if num in (111, 112) and yy == "2025":
        yy = chg(rn, "Qtn no. (year)", "2025", "2026", "quote 111/112 are Oct 2026 quotes coded as Oct 2025")
    if m.group(3) != f"{num:05d}":
        chg(rn, "Qtn no. (padding)", m.group(3), f"{num:05d}", "extra leading zero")
    enquiry_no = f"BBC/{mm}{yy}/{num:05d}"
    client2 = chg(rn, "Client", client, clean(client), "trimmed whitespace")
    project2 = chg(rn, "Project", project, clean(project), "trimmed whitespace")
    location2 = chg(rn, "Location", location, clean(location), "trimmed whitespace")
    st = (status or "").strip().lower()
    if st != (status or ""):
        chg(rn, "status", status, st, "normalised case/whitespace")
    if st not in STATUS_MAP:
        review.append(f"row {rn}: unknown status `{status}` — treated as QUOTED"); st = "submitted"
    if isinstance(value, float) and round(value, 2) != value:
        value = chg(rn, "Quoted Value", value, round(value, 2), "rounded to 2 dp")
    # duplicate quote numbers → option labels
    key = (enquiry_no, rev)
    seen[key] += 1
    label = None
    if seen[key] > 1:
        label = chg(rn, "revision label", None, f"Option {seen[key]}", f"duplicate {enquiry_no}_rev{rev:02d} — kept as a labelled option")
        # first occurrence gets Option 1 later
    recs.append(dict(row=rn, num=num, enquiry_no=enquiry_no, rev=rev, label=label, client=client2, project=project2, location=location2,
                     days=days, st=st, date=date.date() if isinstance(date, datetime.datetime) else None, value=value, jobref=clean(jobref),
                     remarks=clean(remarks)))

# label the first of any duplicated (num, rev) as Option 1
dups = {k for k, c in seen.items() if c > 1}
for r in recs:
    if (r["enquiry_no"], r["rev"]) in dups and r["label"] is None:
        r["label"] = "Option 1"
        chg(r["row"], "revision label", None, "Option 1", "first of a duplicated revision number")

# ---- pass 2: group by quote ----
quotes = collections.OrderedDict()
for r in recs:
    quotes.setdefault(r["num"], []).append(r)

projects, revisions, variations = [], [], []
status_counts = collections.Counter()

for num, rs in quotes.items():
    rs.sort(key=lambda r: (r["rev"], r["row"]))
    first, last = rs[0], rs[-1]
    approved = [r for r in rs if r["st"] == "approved"]
    latest_st = last["st"]
    if approved and latest_st != "approved":
        latest_st = "approved"  # an approved revision beats a later 'updated' row (00040 rev04 is a post-approval update)
        decisions.append(f"{first['enquiry_no']}: has an approved revision, later row is `{last['st']}` — treated as WON")
    name = re.sub(r"\s+", " ", first["project"] or first["client"] or f"Quote {num}")
    if not first["project"]:
        review.append(f"{first['enquiry_no']}: no project name — used client `{first['client']}`")
    client = first["client"]
    if not client:
        review.append(f"{first['enquiry_no']} {name}: no client in the register")
    # VO?
    if num in VO_PARENT:
        parent = VO_PARENT[num]
        if parent is None:
            review.append(f"{first['enquiry_no']} {name}: variation with no parent in the register — imported as its own quote")
        else:
            val = (approved[-1]["value"] if approved else last["value"]) or 0
            appr = approved[-1]["date"] if approved else None
            variations.append(dict(parent=parent, src=first["enquiry_no"], desc=name, value=val, approved_on=appr, row=first["row"]))
            decisions.append(f"{first['enquiry_no']} {name}: → VO on {quotes[parent][0]['enquiry_no']} ({'approved' if appr else 'not approved, value 0 until approved'})")
            continue
    base = STATUS_MAP[latest_st]
    note_bits = []
    if base == "MERGE":
        base = "WON"; note_bits.append("register: merge with original contract")
    status = base
    if base == "WON":
        if num in FINISHED: status = "COMPLETED"; decisions.append(f"{first['enquiry_no']}: in Finished folder → COMPLETED")
        elif num in ONGOING: status = "LIVE"; decisions.append(f"{first['enquiry_no']}: {ONGOING[num]} → LIVE")
        elif num in ASSUMED_COMPLETED:
            status = "COMPLETED"; review.append(f"{first['enquiry_no']} {first['project']}: approved in 2025, no 2026 folder — set COMPLETED, confirm")
        else:
            review.append(f"{first['enquiry_no']} {first['project']}: approved but no folder stage found — left at WON, confirm")
    elif num == 100:
        status = "LIVE"; review.append(f"{first['enquiry_no']} Platinum Tower 2706: register says submitted but the job is live — set LIVE, confirm (and move the folder to ongoing)")
    if num == 111:
        review.append(f"{first['enquiry_no']}: identical to 00019 (Craig, Villa 21, 60,360, 8 Oct) — probable copy-paste; imported but check")
    status_counts[status] += 1
    projects.append(dict(
        num=num, enquiry_no=first["enquiry_no"], name=name, client=client, location=first["location"], status=status,
        quote_stage=QUOTE_STAGE.get(status, "SUBMITTED"),
        received_date=first["date"], quote_submitted_date=last["date"] or first["date"],
        quoted_value=last["value"] if last["value"] is not None else (approved[-1]["value"] if approved else None),
        signed_quote=(approved[-1]["value"] if approved else 0) or 0,
        job_ref=next((r["jobref"] for r in reversed(rs) if r["jobref"]), None),
        working_days=next((r["days"] for r in reversed(rs) if r["days"]), None),
        folder_path=("U:\\Quotations - Pao\\2026\\" + FOLDER[num].replace("/", "\\")) if num in FOLDER else None,
        notes=" | ".join([b for b in note_bits] + [r["remarks"] for r in rs if r["remarks"]]) or None,
        quote_type="Full quote", excel_row=first["row"],
    ))
    for r in rs:
        revisions.append(dict(num=num, rev=r["rev"], label=r["label"], date=r["date"], value=r["value"], days=r["days"], st=r["st"]))

# ---- SQL ----
def q(v):
    if v is None: return "null"
    if isinstance(v, (int, float)): return repr(v)
    if isinstance(v, datetime.date): return f"'{v.isoformat()}'"
    return "'" + str(v).replace("'", "''") + "'"

sql = ["set search_path = scheduler, public;",
       "-- re-runnable: wipe the previous import (rows carrying excel_row), keep anything added in the app",
       "delete from projects where excel_row is not null;",
       "insert into people(name, full_name, role, is_active) values ('PAO','Paolo (QS, left Sept 2026)','QS',false) on conflict (name) do nothing;"]
for p in projects:
    sql.append("insert into projects(enquiry_no,name,client,location,status,quote_stage,received_date,quote_submitted_date,quoted_value,signed_quote,job_ref,working_days,folder_path,notes,quote_type,excel_row,estimator_id) values ("
               + ",".join(q(p[k]) for k in ["enquiry_no", "name", "client", "location", "status", "quote_stage", "received_date", "quote_submitted_date", "quoted_value", "signed_quote", "job_ref", "working_days", "folder_path", "notes", "quote_type", "excel_row"])
               + ", (select id from people where name='PAO'));")
for r in revisions:
    sql.append(f"insert into quote_revisions(project_id,rev_no,label,submitted_date,value,working_days,status_text) select id,{r['rev']},{q(r['label'])},{q(r['date'])},{q(r['value'])},{q(r['days'])},{q(r['st'])} from projects where enquiry_no={q(next(p['enquiry_no'] for p in projects if p['num']==r['num']))};")
vo_no = collections.Counter()
for v in variations:
    parent_no = quotes[v["parent"]][0]["enquiry_no"]
    vo_no[parent_no] += 1
    sql.append(f"insert into variations(project_id,vo_no,description,value,approved_on) select id,{vo_no[parent_no]},{q(v['src'] + ' — ' + v['desc'])},{q(v['value'])},{q(v['approved_on'])} from projects where enquiry_no={q(parent_no)};")
# status history should reflect the import, not 'today': stamp the first history row with the received date
sql.append("update status_history h set changed_at = coalesce(p.received_date, p.created_at::date)::timestamptz, note = 'imported from Quotation Register' from projects p where p.id = h.project_id and p.excel_row is not null and h.from_status is null;")
sql.append("update projects set completed_date = quote_submitted_date where status = 'COMPLETED' and completed_date is null and excel_row is not null;")
open(OUT_SQL, "w").write("\n".join(sql) + "\n")

# ---- report ----
md = [f"# Bolsover Scheduler — Import Report v1", "", f"Source: `Quotation Register 2025.xlsx` → {len(rows)} rows → **{len(projects)} projects**, {len(revisions)} revisions, {len(variations)} variations. Run {datetime.date.today()}.", "",
      "## Status after import", ""] + [f"- **{k}**: {v}" for k, v in sorted(status_counts.items(), key=lambda kv: -kv[1])] + ["",
      "Pipeline mapping: submitted/updated → QUOTED · approved → WON, then LIVE if the folder is in `ongoing`, COMPLETED if in `Finished` or a 2025 job with no 2026 folder · pending / at site engr. → PENDING · hold / on-hold → ON HOLD · by others → LOST · merge with orig. contract → VO on the parent.", "",
      f"## Needs your eye ({len(review)})", ""] + [f"- {x}" for x in review] + ["",
      f"## Decisions ({len(decisions)})", ""] + [f"- {x}" for x in decisions] + ["",
      f"## Cells changed ({len(changes)})", "", "| Row | Column | Before | After | Why |", "|---|---|---|---|---|"] + \
     [f"| {r} | {c} | `{b}` | `{a}` | {w} |" for r, c, b, a, w in changes]
open(OUT_MD, "w").write("\n".join(md) + "\n")
print(f"{len(projects)} projects, {len(revisions)} revisions, {len(variations)} VOs; {len(changes)} cell changes; {len(review)} to review")
print(dict(status_counts))
