"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { aed } from "@/lib/model";
import { pct, type Boq, type BoqItem, type BoqSection } from "@/lib/boq-model";
import { setInstalled } from "@/app/actions";

type Props = { projectId: string; boqs: (Boq & { vo_no?: number | null })[]; sections: BoqSection[]; items: BoqItem[]; canProgress: boolean };
const STEPS = [0, 25, 50, 75, 100];

export default function ProgressSheet({ projectId, boqs, sections, items, canProgress }: Props) {
  const [vals, setVals] = useState<Record<string, number>>(Object.fromEntries(items.map((i) => [i.id, i.installed_pct])));
  const [open, setOpen] = useState<string | null>(null);
  const live = items.filter((i) => !i.is_note && !i.excluded);
  const total = live.reduce((s, i) => s + i.amount, 0);
  const installed = live.reduce((s, i) => s + i.amount * (vals[i.id] ?? 0) / 100, 0);
  return (
    <div className="psheet">
      <div className="panel pstat">
        <div className="stat"><b>{total ? Math.round(installed / total * 100) : 0}%</b><span>installed by value</span></div>
        <div className="stat"><b>{aed(installed)}</b><span>of {aed(total)} ex VAT</span></div>
        <div className="stat"><b>{live.filter((i) => (vals[i.id] ?? 0) >= 100).length}/{live.length}</b><span>items complete</span></div>
      </div>
      {boqs.map((b) => (
        <div key={b.id} className="panel">
          <h2>{b.kind === "QUOTE" ? "Main contract" : `VO${b.vo_no ?? ""} — ${b.title}`}</h2>
          {sections.filter((s) => s.boq_id === b.id).map((s) => {
            const its = live.filter((i) => i.section_id === s.id);
            if (its.length === 0) return null;
            const st = its.reduce((a, i) => a + i.amount, 0);
            const si = its.reduce((a, i) => a + i.amount * (vals[i.id] ?? 0) / 100, 0);
            const isOpen = open === s.id;
            return (
              <div key={s.id} className={`psec ${isOpen ? "open" : ""}`}>
                <button type="button" className="prow phead" onClick={() => setOpen(isOpen ? null : s.id)} aria-expanded={isOpen}>
                  <span className="pname"><b>{s.code}. {s.title}</b><small>{its.length} items · {aed(st)}</small></span>
                  <span className="bar"><span style={{ width: `${st ? si / st * 100 : 0}%` }} className={si >= st ? "done" : "ok"} /><small>{st ? Math.round(si / st * 100) : 0}%</small></span>
                </button>
                {isOpen && its.map((i) => <Row key={i.id} projectId={projectId} item={i} val={vals[i.id] ?? 0} canProgress={canProgress} onChange={(v) => setVals((x) => ({ ...x, [i.id]: v }))} />)}
              </div>
            );
          })}
        </div>
      ))}
    </div>
  );
}

function Row({ projectId, item, val, canProgress, onChange }: { projectId: string; item: BoqItem; val: number; canProgress: boolean; onChange: (v: number) => void }) {
  const router = useRouter();
  const [pending, start] = useTransition();
  const [err, setErr] = useState<string | null>(null);
  const save = (p: number) => { onChange(p); start(async () => { const r = await setInstalled(projectId, item.id, p); if (r.error) setErr(r.error); else { setErr(null); router.refresh(); } }); };
  return (
    <div className={`prow pitem ${val >= 100 ? "complete" : ""} ${pending ? "saving" : ""}`}>
      <span className="pname"><b>{item.ref} {item.description.split("\n")[0]}</b><small>{item.qty} {item.unit} · {aed(item.amount)}{item.installed_at ? ` · last ${new Date(item.installed_at).toLocaleDateString("en-GB", { day: "numeric", month: "short" })}` : ""}</small></span>
      {canProgress ? (
        <span className="psteps">
          {STEPS.map((s) => <button key={s} type="button" className={val === s ? "on" : ""} onClick={() => save(s)} disabled={pending}>{s}</button>)}
          <input type="number" min={0} max={100} step={5} value={val} onChange={(e) => onChange(Number(e.target.value))} onBlur={(e) => Number(e.target.value) !== item.installed_pct && save(Number(e.target.value))} aria-label="Installed %" />
        </span>
      ) : <span className="ipct">{pct(val)}</span>}
      {err && <span className="msg err">{err}</span>}
    </div>
  );
}
