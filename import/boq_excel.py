#!/usr/bin/env python3
"""Parse a Bolsover BOQ Excel (Pao's template, sheet FINAL) into sections + items.

Usage: python3 -I boq_excel.py FILE.xlsx            -> prints a summary
       python3 -I boq_excel.py FILE.xlsx --json     -> prints JSON {meta, sections:[{code,title,items:[...]}]}

Layout (rows 24+): col A = ref / section heading, C = description, F = qty, G = unit,
H = client unit price (ex VAT despite the header), I = amount, J = supplier unit price, L = markup (0.3).
Section headings look like "II. Site Works"; sub-headings are text in col A with nothing else on the row;
"Total of ..." / "Sub-total ..." rows close a section; "Summary" ends the bill.
"""
import sys, re, json, datetime, warnings
warnings.filterwarnings("ignore")
import openpyxl

SECTION_RE = re.compile(r"^\s*([IVXLC]+|[A-Z])\.\s*(.+?)\s*$", re.S)  # "II. Site Works" or "A. Preliminaries"
TOTAL_RE = re.compile(r"^\s*(sub-?total|total)\b", re.I)


def cell(ws, r, c):
    v = ws.cell(r, c).value
    if isinstance(v, str):
        v = v.strip()
        return v or None
    return v


def num(v):
    return float(v) if isinstance(v, (int, float)) else None


def parse(path, sheet=None):
    wb = openpyxl.load_workbook(path, data_only=True)
    ws = wb[sheet] if sheet else (wb["FINAL"] if "FINAL" in wb.sheetnames else wb.worksheets[0])
    meta = {"file": path}
    for r in range(1, 24):
        a = cell(ws, r, 1)
        if isinstance(a, str):
            if a.upper().startswith("PROJECT NAME:"):
                meta["title"] = a.split(":", 1)[1].strip()
            elif a.upper().startswith("PROJECT ADDRESS:"):
                meta["address"] = a.split(":", 1)[1].strip()
            elif a.upper().startswith("CUSTOMER NAME:"):
                meta["client"] = a.split(":", 1)[1].strip()
        g = cell(ws, r, 7)
        if isinstance(g, str):
            if g.startswith("Date:"):
                d = cell(ws, r, 9)
                meta["date"] = d.date().isoformat() if isinstance(d, datetime.datetime) else (str(d) if d else None)
            elif g.startswith("Quote:"):
                q = cell(ws, r, 9)
                meta["quote_ref"] = str(q).strip() if q else None
            elif g.startswith("Total Working Days"):
                m = re.search(r"(\d+)\s*Working Days", g)
                meta["working_days"] = int(m.group(1)) if m else None

    # cost / markup columns move between templates (Meadows 5 has an empty column J): find them from the header rows
    cost_col, mk_col = 10, 12
    for r in range(20, 25):
        for c in range(9, 16):
            h = cell(ws, r, c)
            if isinstance(h, str):
                if h.lower().startswith("supplier unit price"):
                    cost_col = c
                elif h.lower().startswith("markup %"):
                    mk_col = c
    sections, cur, sub = [], None, None
    terms, in_terms, done = [], False, False
    summary = {}
    for r in range(25, ws.max_row + 1):
        a, d = cell(ws, r, 1), cell(ws, r, 3)
        q, u, rate, amt, cost, mk = (cell(ws, r, c) for c in (6, 7, 8, 9, cost_col, mk_col))
        if done:
            if isinstance(a, str):
                if a.startswith("General Terms"):
                    in_terms = True
                    continue
                if in_terms:
                    t = a if a else None
                    b = cell(ws, r, 2)
                    t = t or b
                    if t:
                        terms.append(t)
                    continue
                if a in ("Total", "VAT (5%)", "Grand Total", "Discount", "Discounted Total"):
                    summary[a] = num(cell(ws, r, 9))
            continue
        if isinstance(a, str) and (a == "Summary" or a.startswith("Floor-Wise Breakdown")):
            done = True
            continue
        if isinstance(a, str) and a in ("Total", "Discount") and cur is not None and d is None and cell(ws, r, 9) is not None:
            # no Summary block (Villa 45 rev08): the bare Total row ends the bill
            done = True
            summary[a] = num(cell(ws, r, 9))
            continue
        m = SECTION_RE.match(a) if isinstance(a, str) and d is None else None
        if m and not TOTAL_RE.match(a):
            # "I." alone (a stray repeated numeral) — skip
            if not m.group(2):
                continue
            cur = {"code": m.group(1), "title": m.group(2).split("\n")[0].strip(" .:"), "items": [], "total_row": None}
            sections.append(cur)
            sub = None
            continue
        if isinstance(a, str) and TOTAL_RE.match(a) and cur is not None:
            cur["total_row"] = num(cell(ws, r, 9))
            continue
        if isinstance(a, str) and a.lower().startswith("net variance") and cur is not None:
            # VO add/omit pair: the preceding B-item is the original scope being omitted → negative qty
            for it in reversed(cur["items"]):
                if it.get("omit") is not None:
                    break
                if it["ref"] and re.match(r"^B\d*\.?$", it["ref"]) and not it["is_note"]:
                    it["omit"] = True
                    it["qty"] = -(it["qty"] or 0)
                    it["amount"] = -(it["amount"] or 0)
                    it["description"] = "OMIT: " + it["description"]
                    break
            for it in cur["items"]:
                it.setdefault("omit", False)
            continue
        if cur is None:
            continue
        if d is None and isinstance(a, str) and q is None and rate is None:
            # sub-heading or a free-text note line
            if len(a) <= 40 and not a.endswith("."):
                sub = a
            else:
                cur["items"].append({"ref": None, "subheading": sub, "description": a, "is_note": True})
            continue
        if d is None:
            continue
        item = {
            "ref": str(a).strip() if a is not None else None,
            "subheading": sub,
            "description": str(d).strip(),
            "qty": num(q),
            "unit": str(u).strip() if u else None,
            "rate": num(rate),
            "amount": num(amt),
            "cost_rate": num(cost) if num(cost) else None,
            "markup_pct": round(num(mk) * 100, 2) if num(mk) is not None and 0 <= num(mk) <= 5 else None,
            "is_note": False,
        }
        if item["qty"] is None and item["rate"] is None:
            item["is_note"] = True
            if isinstance(rate, str):
                item["description"] += f" — {rate}"
        elif isinstance(rate, str):  # e.g. "By Client"
            item["is_note"] = True
            item["description"] += f" — {rate}"
            item["rate"] = None
        elif isinstance(amt, str) and item["rate"] is not None:  # priced row dropped from the total, e.g. "Removed: To be done by Mandy"
            item["excluded"] = True
            item["description"] += f" — {amt.strip()}"
        cur["items"].append(item)
    meta["terms"] = terms
    meta["summary"] = summary
    meta["reconciled"] = reconcile(sections)
    return {"meta": meta, "sections": sections}


DEDUCT_RE = re.compile(r"\b(deduction|omission|omit|less)\b", re.I)


def live_amount(it):
    return 0 if it["is_note"] or it.get("excluded") else (it.get("amount") or 0)


def reconcile(sections):
    """Make each section add up to its sheet sub-total. Returns a list of notes describing what was changed.
    Rules, in order: a section titled Deduction/Omission is all negative; a lone 'Less …' line is negative;
    one row whose sign flip closes the gap; one or two rows the sheet silently left out of its sub-total."""
    notes = []
    for sec in sections:
        for it in sec["items"]:
            if not it["is_note"] and (it.get("amount") or 0) < 0 and (it.get("qty") or 0) > 0 and (it.get("rate") or 0) > 0:
                it["qty"] = -it["qty"]
                notes.append(f"{sec['code']}: '{it['description'][:50]}' is negative on the sheet, quantity negated")
        if DEDUCT_RE.search(sec["title"]):
            for it in sec["items"]:
                if not it["is_note"] and (it.get("qty") or 0) > 0:
                    it["qty"] = -it["qty"]; it["amount"] = -(it.get("amount") or 0)
            notes.append(f"{sec['code']}. {sec['title']}: deduction section, quantities negated")
        for it in sec["items"]:
            if not it["is_note"] and it.get("ref") is None and DEDUCT_RE.search(it["description"]) and (it.get("qty") or 0) > 0:
                it["qty"] = -it["qty"]; it["amount"] = -(it.get("amount") or 0)
                notes.append(f"{sec['code']}: '{it['description'][:50]}' taken as a deduction")
        tgt = sec.get("total_row")
        if tgt is None or not sec["items"]:
            continue
        if DEDUCT_RE.search(sec["title"]) and tgt > 0:
            tgt = -tgt
        gap = round(sum(live_amount(i) for i in sec["items"]) - tgt, 2)
        if abs(gap) < 0.05:
            continue
        live = [i for i in sec["items"] if not i["is_note"] and not i.get("excluded") and (i.get("amount") or 0)]
        hit = [i for i in live if abs(2 * i["amount"] - gap) < 0.05]
        if len(hit) == 1:
            it = hit[0]; it["qty"] = -it["qty"]; it["amount"] = -it["amount"]
            notes.append(f"{sec['code']}: '{it['description'][:50]}' sign flipped to match the sub-total")
            continue
        hit = [i for i in live if abs(i["amount"] - gap) < 0.05]
        if len(hit) == 1:
            it = hit[0]; it["excluded"] = True
            notes.append(f"{sec['code']}: '{it['description'][:50]}' ({it['amount']:,.2f}) not in the sheet sub-total, marked excluded")
            continue
        pairs = [(a, b) for k, a in enumerate(live) for b in live[k + 1:] if abs(a["amount"] + b["amount"] - gap) < 0.05]
        if len(pairs) == 1:
            for it in pairs[0]:
                it["excluded"] = True
                notes.append(f"{sec['code']}: '{it['description'][:50]}' ({it['amount']:,.2f}) not in the sheet sub-total, marked excluded")
            continue
        notes.append(f"{sec['code']}. {sec['title']}: UNRESOLVED gap {gap:,.2f} vs sheet sub-total {tgt:,.2f}")
    return notes


if __name__ == "__main__":
    sheet = sys.argv[sys.argv.index("--sheet") + 1] if "--sheet" in sys.argv else None
    out = parse(sys.argv[1], sheet)
    if "--json" in sys.argv:
        print(json.dumps(out, indent=1, default=str))
    else:
        m = out["meta"]
        print(m.get("title"), "|", m.get("quote_ref"), "|", m.get("date"), "| client:", m.get("client"))
        tot = 0
        for s in out["sections"]:
            st = sum((i.get("amount") or 0) for i in s["items"] if not i["is_note"] and not i.get("excluded"))
            tot += st
            flag = "" if s["total_row"] is None or abs(st - s["total_row"]) < 0.01 else f"  !! sheet says {s['total_row']}"
            print(f"  {s['code']:>4}. {s['title']:<40} {len(s['items']):3} items  {st:>14,.2f}{flag}")
        print(f"  computed total {tot:,.2f}  sheet summary {m['summary']}")
