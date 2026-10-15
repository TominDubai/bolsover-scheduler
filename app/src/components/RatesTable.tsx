"use client";
import { Fragment, useActionState, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { aed2 } from "@/lib/boq-model";
import { saveRate, setRateActive } from "@/app/actions";
import type { RateRow } from "@/app/rates/page";

type State = { error?: string; ok?: boolean } | null;

export default function RatesTable({ rows, canEdit, showCost, q }: { rows: RateRow[]; canEdit: boolean; showCost: boolean; q: string }) {
  const router = useRouter();
  const [editing, setEditing] = useState<string | null>(null);
  const [adding, setAdding] = useState(false);
  const [showOff, setShowOff] = useState(false);
  const [text, setText] = useState(q);
  const cats = [...new Set(rows.map((r) => r.category))];
  const cols = 6 + (showCost ? 2 : 0) + (canEdit ? 1 : 0);
  return (
    <div className="boq">
      <form className="rates-tools" action="/rates" method="get">
        <input name="q" value={text} onChange={(e) => setText(e.target.value)} placeholder="Search rates — demolition, wardrobe, 600x600, DAW-003…" aria-label="Search" />
        <button className="btn sm">Search</button>
        {q && <button type="button" className="btn sm ghost" onClick={() => { setText(""); router.push("/rates"); }}>Clear</button>}
        <label className="chk"><input type="checkbox" checked={showOff} onChange={(e) => setShowOff(e.target.checked)} /> Show retired</label>
        {canEdit && !adding && <button type="button" className="btn sm bronze" onClick={() => setAdding(true)}>+ Rate</button>}
      </form>
      {adding && <RateForm row={null} showCost={showCost} onDone={() => { setAdding(false); router.refresh(); }} />}
      <table className="ratest">
        <thead><tr><th>Code</th><th>Description</th><th className="u">Unit</th><th className="n">Rate</th>{showCost && <><th className="n cost">Cost</th><th className="n cost">Markup</th></>}<th className="n">Used</th><th>Source</th>{canEdit && <th />}</tr></thead>
        {cats.map((c) => {
          const rs = rows.filter((r) => r.category === c && (showOff || r.is_active));
          if (!rs.length) return null;
          return (
            <tbody key={c}>
              <tr className="cat"><td colSpan={cols}>{c} <small style={{ opacity: .7, fontWeight: 400 }}>· {rs.length}</small></td></tr>
              {rs.map((r) => (
                <Fragment key={r.id}>
                  {editing === r.id ? (
                    <tr><td colSpan={cols}><RateForm row={r} showCost={showCost} onDone={() => { setEditing(null); router.refresh(); }} /></td></tr>
                  ) : (
                    <tr className={r.is_active ? "" : "off"}>
                      <td className="rc">{r.code}</td>
                      <td className="d">{r.description}{r.notes && <small className="in" style={{ display: "block", color: "var(--fg3)", fontSize: 11 }}>{r.notes}</small>}</td>
                      <td className="u">{r.unit}</td>
                      <td className="n"><b>{aed2(r.sell_rate)}</b></td>
                      {showCost && <><td className="n cost">{aed2(r.cost_rate)}</td><td className={`n cost ${r.markup_pct != null && r.markup_pct < 25 ? "low" : ""}`}>{r.markup_pct != null ? `${Math.round(r.markup_pct)}%` : "—"}</td></>}
                      <td className="n">{r.use_count}×{r.last_used && <small style={{ display: "block", fontWeight: 400, color: "var(--fg3)" }}>{r.last_used}</small>}</td>
                      <td>{r.source_project ?? ""}</td>
                      {canEdit && <td className="act"><button className="x" onClick={() => setEditing(r.id)} aria-label="Edit">✎</button></td>}
                    </tr>
                  )}
                </Fragment>
              ))}
            </tbody>
          );
        })}
      </table>
      {!rows.length && <p className="note">Nothing matches "{q}".</p>}
    </div>
  );
}

function RateForm({ row, showCost, onDone }: { row: RateRow | null; showCost: boolean; onDone: () => void }) {
  const [state, action, pending] = useActionState(async (prev: unknown, fd: FormData) => { const r = await saveRate(row?.id ?? null, prev, fd); if (r.ok) onDone(); return r; }, null as State);
  const [, start] = useTransition();
  const [desc, setDesc] = useState(row?.description ?? "");
  return (
    <form action={action} className="rform">
      <input name="code" defaultValue={row?.code ?? ""} placeholder="Code (auto)" aria-label="Code" readOnly={!!row} />
      <input name="category" defaultValue={row?.category ?? ""} placeholder="Trade (Joinery…)" aria-label="Trade" list="trades" required />
      <input name="unit" defaultValue={row?.unit ?? ""} placeholder="Unit" aria-label="Unit" list="units" required />
      <input name="sell_rate" inputMode="decimal" defaultValue={row?.sell_rate ?? ""} placeholder="Rate ex VAT" aria-label="Rate" required />
      {showCost ? <input name="cost_rate" inputMode="decimal" defaultValue={row?.cost_rate ?? ""} placeholder="Supplier cost" aria-label="Cost" className="cost" /> : <span />}
      <input name="notes" defaultValue={row?.notes ?? ""} placeholder="Notes / provenance" aria-label="Notes" />
      <span style={{ display: "flex", gap: 6, alignItems: "center" }}>
        <button className="btn sm" disabled={pending}>{row ? "Save" : "Add"}</button>
        <button type="button" className="btn sm ghost" onClick={onDone}>Cancel</button>
        {row && <button type="button" className="btn sm danger" onClick={() => start(async () => { await setRateActive(row.id, !row.is_active); onDone(); })}>{row.is_active ? "Retire" : "Restore"}</button>}
      </span>
      <textarea name="description" value={desc} onChange={(e) => setDesc(e.target.value.replace(/…$/, ""))} placeholder="Description" rows={3} required aria-label="Description" />
      {desc.endsWith("…") && <span className="msg err" style={{ gridColumn: "1 / -1" }}>Clipped on import — finish the sentence and the … will go.</span>}
      {state?.error && <span className="msg err" style={{ gridColumn: "1 / -1" }}>{state.error}</span>}
      <datalist id="trades">{["Preliminaries", "Demolition & Site Works", "Concrete & Masonry", "Waterproofing & Insulation", "Metal Works", "Doors & Windows", "Glass & Glazing", "Flooring", "Wall Finishes", "Ceilings", "Joinery", "Furniture", "Sanitary & Plumbing", "Electrical & Lighting", "HVAC & MEP", "Landscaping & Outdoor", "Misc"].map((t) => <option key={t} value={t} />)}</datalist>
      <datalist id="units"><option value="sqm" /><option value="LM" /><option value="Nos" /><option value="LS" /><option value="item" /><option value="m³" /><option value="set" /></datalist>
    </form>
  );
}
