#!/usr/bin/env python3
"""Turn parsed BOQ Excel files into SQL (one plpgsql DO block per BOQ) for scheduler.boqs / boq_sections / boq_items.

Usage:
  python3 -I boq_to_sql.py --project <project uuid> --outdir DIR \
      QUOTE:0:SUPERSEDED:path/rev00.xlsx  QUOTE:3:APPROVED:path/rev03.xlsx  VO:1:APPROVED:path/vo1.xlsx ...

Spec = KIND:NO:STATUS:PATH[#SHEET] (KIND = QUOTE | VO; SHEET defaults to FINAL). For VO, NO is the variation number (a scheduler.variations
row is created if missing); for QUOTE it is the rev number. Re-runnable: an existing BOQ for the project
with the same source file name is replaced. Writes DIR/boq_<n>_<file>.sql, one per spec.
"""
import sys, os, re, argparse
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from boq_excel import parse


def q(v):
    if v is None: return "null"
    if isinstance(v, bool): return "true" if v else "false"
    if isinstance(v, (int, float)): return repr(round(v, 4))
    return "'" + str(v).replace("'", "''") + "'"


def block(project, kind, no, status, path):
    path, _, sheet = path.partition("#")
    d = parse(path, sheet or None); m = d["meta"]; src = os.path.basename(path); P = q(project)
    L = ["set search_path = scheduler, public;", "do $x$ declare b uuid; s uuid; v uuid; begin"]
    L.append(f"delete from boqs where project_id = {P} and source_file = {q(src)};")
    if kind == "VO":
        # the sheet's PROJECT NAME is the parent job; name the VO after its file so it's traceable
        m["title"] = re.sub(r"^BOQ\s*-\s*", "", os.path.splitext(src)[0]).strip()
        L.append(f"insert into variations(project_id, vo_no, description, value) values ({P}, {int(no)}, {q(m['title'])}, 0) on conflict (project_id, vo_no) do nothing;")
        L.append(f"select id into v from variations where project_id = {P} and vo_no = {int(no)};")
        rev, bkind = 0, "VARIATION"
    else:
        L.append("v := null;"); rev, bkind = int(no), "QUOTE"
    terms = "array[" + ",".join(q(t) for t in m["terms"]) + "]::text[]" if m.get("terms") else "null"
    L.append("insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ("
             f"{P}, '{bkind}', {rev}, v, {q(m.get('title'))}, {q(m.get('quote_ref'))}, 'DRAFT', {q(m.get('date'))}, {q(m.get('working_days'))}, {terms}, {q(src)}, '30% advance, 70% on progress') returning id into b;")
    if m['summary'].get('Discount'):
        L.append(f"update boqs set discount = {q(round(m['summary']['Discount'], 2))} where id = b;")
    for si, sec in enumerate(s for s in d["sections"] if s["items"]):
        L.append(f"insert into boq_sections(boq_id, sort, code, title) values (b, {si}, {q(sec['code'])}, {q(sec['title'])}) returning id into s;")
        for ii, it in enumerate(sec["items"]):
            L.append("insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values ("
                     f"b, s, {ii}, {q(it.get('ref'))}, {q(it.get('subheading'))}, {q(it['description'])}, {q(it.get('qty'))}, {q(it.get('unit'))}, {q(it.get('rate'))}, {q(it.get('cost_rate'))}, {q(it.get('markup_pct'))}, {q(it.get('is_note', False))}, {q(it.get('excluded', False))});")
    if status != "DRAFT":
        L.append(f"update boqs set status = '{status}' where id = b;")
    L.append("end $x$;")
    info = f"{src}: {len(d['sections'])} sections, {sum(len(s['items']) for s in d['sections'])} rows, sheet total {m['summary'].get('Total')}" + (" discount %s" % m['summary']['Discount'] if m['summary'].get('Discount') else '') + ''.join('\n    - ' + n for n in m.get('reconciled', []))
    return "\n".join(L) + "\n", info


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("--project", required=True); ap.add_argument("--outdir", required=True); ap.add_argument("specs", nargs="+")
    a = ap.parse_args(); os.makedirs(a.outdir, exist_ok=True)
    for n, spec in enumerate(a.specs):
        kind, no, status, path = spec.split(":", 3)  # PATH may end in #SHEET
        sql, info = block(a.project, kind, no, status, path)
        out = os.path.join(a.outdir, f"boq_{n}_{os.path.splitext(os.path.basename(path.partition("#")[0]))[0]}.sql")
        open(out, "w").write(sql); print(info, "->", out, len(sql), "bytes", file=sys.stderr)


if __name__ == "__main__":
    main()
