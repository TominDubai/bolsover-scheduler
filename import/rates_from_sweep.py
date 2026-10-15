#!/usr/bin/env python3
"""Seed `scheduler.rate_items` from the vault's observed-rates sweep.

Source: `brain/Bolsover Observed Rates.md` in the LazyBrain vault, section
"Sweep observations (machine-appended)" — one row per priced line on a FINAL sheet
in `U:\\Quotations - (excel files only)`, with quote ref, job, qty, unit, rate, cost.

Rules
- unit rates only (sqm / LM / Nos / m³ / item / set); LS lump sums are project-specific
- cost and sell both present and > 0
- one library entry per (description, unit); newest workbook wins, older refs kept in notes
- descriptions the sweep clipped (~90 chars) are kept as-is, suffixed "…" and noted "clipped"
- rows already in the library (same description + unit) are skipped by the unique index

Usage:  python3 rates_from_sweep.py "<path to Bolsover Observed Rates.md>" > rates_sweep.sql
Output: SQL in ~250-row DO blocks; run each in the Supabase SQL editor (scheduler schema).
"""
import re, sys, json, collections

UNIT = {"sqm": "sqm", "sqm.": "sqm", "sq.m": "sqm", "m2": "sqm", "lm": "LM", "rm": "LM", "rmt": "LM", "m": "LM",
        "nos": "Nos", "nos.": "Nos", "no": "Nos", "no.": "Nos", "pc": "Nos", "pcs": "Nos", "each": "Nos", "ea": "Nos",
        "m3": "m³", "m³": "m³", "cum": "m³", "item": "item", "set": "set", "sets": "set"}

def num(s):
    s = s.replace(",", "").strip()
    try: return float(s)
    except ValueError: return None

def parse(path):
    src = open(path, encoding="utf-8").read()
    sweep = src[src.index("## Sweep observations"):]
    rows, hdr = [], None
    for line in sweep.splitlines():
        m = re.match(r"\*\*(.+?)\*\* — `(.+?)` · file `(.+?)` \(modified (\d{4}-\d\d-\d\d)\)", line)
        if m: hdr = m.groups(); continue
        if hdr and line.startswith("| ") and not line.startswith("| Section") and not line.startswith("|---"):
            c = [x.strip() for x in line.strip().strip("|").split("|")]
            if len(c) < 8: continue
            sec, desc, qty, unit, rate, cost, n, flag = c[:8]
            rows.append(dict(job=hdr[0], ref=hdr[1], file=hdr[2], date=hdr[3], section=sec, desc=desc,
                             qty=num(qty), unit=unit, rate=num(rate), cost=num(cost), flag=flag))
    return rows

# Sweep sections are often locations ("Ground Floor", "Master Bathroom"), not trades. File by trade instead:
# keywords are tried against the section title first, then the description. First hit wins, order matters.
TRADES = [
    ("Preliminaries", r"prelim|mobili[sz]ation|insurance|site supervision|site management|scaffold|hoarding|temporary"),
    ("Demolition & Site Works", r"demoli|dismantl|removal of|remove existing|strip(ping)? out|debris|disposal|site clearance|excavat|hacking"),
    ("Concrete & Masonry", r"concrete|rcc|slab|screed|block ?work|blockwork|masonry|brick|partition wall|plaster(?!board)|render|lintel|foundation|footing"),
    ("Waterproofing & Insulation", r"waterproof|membrane|insulation|thermal|damp"),
    ("Metal Works", r"metal work|steel|railing|handrail|balustrade|mild steel|ms |stainless|iron ?work|canopy|pergola"),
    ("Doors & Windows", r"\bdoors?\b|window|frame|ironmongery|shutter|louv|pivot|sliding|bi-?fold|schüco|schuco"),
    ("Glass & Glazing", r"glass|glazing|mirror|curtain wall|skylight"),
    ("Flooring", r"floor(ing)?|tile|tiling|marble|porcelain|ceramic|parquet|laminate|vinyl|spc|wood ?deck|decking|epoxy|terrazzo|carpet|skirting|threshold"),
    ("Wall Finishes", r"wall finish|paint|emulsion|wallpaper|cladding|microcement|stucco|venetian|wall panel|fluted|texture"),
    ("Ceilings", r"ceiling|gypsum|cornice|cove|bulkhead|false ceil"),
    ("Joinery", r"joiner|wardrobe|cabinet|vanity|kitchen|cupboard|shelv|shelf|drawer|tv unit|tv wall|headboard|wood ?work|veneer|mdf|plywood|study|dresser|console|closet|counter|bookcase|bar unit|wall unit|panel(l)?ing|skirting"),
    ("Furniture", r"furniture|sofa|chair|table|bed\b|stool|bench|ottoman|loose"),
    ("Sanitary & Plumbing", r"sanitar|plumb|bathroom|wc\b|basin|shower|bathtub|tap|mixer|drain|water heater|faucet|toilet|bidet"),
    ("Electrical & Lighting", r"electric|lighting|light fitting|downlight|switch|socket|db\b|wiring|cable|chandelier|led|spotlight|pendant"),
    ("HVAC & MEP", r"hvac|ac\b|a/c|air ?con|duct|fcu|split unit|vrf|mep|fire|sprinkler|compressor|ventilation|exhaust"),
    ("Landscaping & Outdoor", r"landscap|garden|irrigation|planter|outdoor|exterior|pool|lawn|turf|paving|fence|fencing|gate|bbq|roof"),
]
def category(section, desc=""):
    s = re.sub(r"^[A-Z]{1,3}[\.\)]\s*", "", section).strip().lower()
    for name, pat in TRADES:
        if re.search(pat, s): return name
    d = desc.lower()
    for name, pat in TRADES:
        if re.search(pat, d): return name
    return "Misc"

def q(s):
    return "null" if s is None else "'" + str(s).replace("'", "''") + "'"

def main():
    rows = parse(sys.argv[1])
    keep = []
    for r in rows:
        u = UNIT.get(r["unit"].lower())
        if not u or not r["rate"] or r["rate"] <= 0 or not r["cost"] or r["cost"] <= 0: continue
        r["unit_n"] = u; keep.append(r)
    groups = collections.defaultdict(list)
    for r in keep: groups[(re.sub(r"\s+", " ", r["desc"]).lower().rstrip(". :"), r["unit_n"])].append(r)

    items = []
    for (dk, unit), rs in groups.items():
        rs.sort(key=lambda r: r["date"], reverse=True)
        top = rs[0]
        refs = sorted({r["ref"].split("_")[0] for r in rs})
        clipped = len(top["desc"]) >= 90
        desc = re.sub(r"\s+", " ", top["desc"]).strip() + ("…" if clipped else "")
        # Short notes: "clipped · 3 quotes · last BBC/032026/00062 2026-04-10 · thin margin"
        notes = (["clipped"] if clipped else []) + [f"{len(refs)} quote(s)", f"last {top['ref'].split('_')[0]} {top['date']}"]
        if "thin-margin" in top["flag"]: notes.append("thin margin")
        if "rate_only" in top["flag"]: notes.append("rate-only")
        items.append(dict(category=category(top["section"], top["desc"]), desc=desc, unit=unit, cost=round(top["cost"], 4), sell=round(top["rate"], 4),
                          markup=round((top["rate"] / top["cost"] - 1) * 100, 2), ref=top["ref"].split("_")[0], date=top["date"],
                          n=len(refs), notes=" · ".join(notes)))
    items.sort(key=lambda i: (i["category"], i["desc"]))

    print("-- generated by import/rates_from_sweep.py — %d library entries from %d sweep rows" % (len(items), len(rows)))
    CH = 250
    for b in range(0, len(items), CH):
        print("set search_path = scheduler, public;")
        print("do $x$ declare pfx text; seq int; pid uuid; r record; begin")
        print("for r in select * from (values")
        vals = []
        for i in items[b:b+CH]:
            vals.append(f"({q(i['category'])}, {q(i['desc'])}, {q(i['unit'])}, {i['cost']}, {i['sell']}, {i['markup']}, {q(i['ref'])}, {q(i['date'])}::date, {i['n']}, {q(i['notes'])})")
        print(",\n".join(vals))
        print(") as v(category, description, unit, cost_rate, sell_rate, markup_pct, ref, used_on, n, notes) loop")
        print("  if exists (select 1 from rate_items x where lower(btrim(x.description)) = lower(btrim(r.description)) and lower(coalesce(x.unit,'')) = lower(r.unit)) then continue; end if;")
        print("  pfx := rate_code_prefix(r.category);")
        print("  select coalesce(max(substring(code from '\\d+$')::int), 0) + 1 into seq from rate_items where code like pfx || '-%';")
        print("  select id into pid from projects where enquiry_no = r.ref limit 1;")
        print("  insert into rate_items (code, category, description, unit, cost_rate, sell_rate, markup_pct, source_project_id, last_used, use_count, notes)")
        print("  values (pfx || '-' || lpad(seq::text, 3, '0'), r.category, r.description, r.unit, r.cost_rate, r.sell_rate, r.markup_pct, pid, r.used_on, r.n, r.notes);")
        print("end loop; end $x$;\n")
    json.dump(items, open("rates_sweep_items.json", "w"), indent=0)
    sys.stderr.write(f"{len(items)} items, {sum(1 for i in items if i['desc'].endswith('…'))} clipped, categories: {len(set(i['category'] for i in items))}\n")

if __name__ == "__main__":
    main()
