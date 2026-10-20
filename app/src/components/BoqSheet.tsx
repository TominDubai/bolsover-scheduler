"use client";
import { useActionState, useEffect, useRef, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { aed2, pct, type Boq, type BoqItem, type BoqSection } from "@/lib/boq-model";
import { addSection, saveItem, deleteItem, setInstalled, setBoqDiscount, searchRates, type RateHit } from "@/app/actions";

type Props = { projectId: string; boq: Boq; sections: BoqSection[]; items: BoqItem[]; canEdit: boolean; canProgress: boolean; showCost: boolean };

/** The bill itself: sections → items, with sell / cost / margin and installed % per item. */
export default function BoqSheet({ projectId, boq, sections, items, canEdit, canProgress, showCost }: Props) {
  const [editing, setEditing] = useState<string | null>(null);     // item id, or "new:<sectionId>"
  const [addingSection, setAddingSection] = useState(false);
  const live = items.filter((i) => !i.is_note && !i.excluded);
  const gross = live.reduce((s, i) => s + i.amount, 0);
  const discount = boq.discount || 0;
  const total = gross - discount;                                   // the contract value: items less any lump-sum discount
  const cost = live.reduce((s, i) => s + i.cost_amount, 0);
  const installed = live.reduce((s, i) => s + i.amount * i.installed_pct / 100, 0) * (gross ? total / gross : 1);
  const vat = total * boq.vat_pct / 100;
  const approved = boq.status === "APPROVED";
  const cols = 6 + (showCost ? 3 : 0) + (approved ? 1 : 0) + (canEdit ? 1 : 0);
  return (
    <div className="boq">
      <table className="boqt">
        <thead>
          <tr>
            <th className="ref">Ref</th><th>Description</th><th className="n">Qty</th><th className="u">Unit</th><th className="n">Rate</th><th className="n">Amount</th>
            {showCost && <><th className="n cost">Cost rate</th><th className="n cost">Cost</th><th className="n cost">Margin</th></>}
            {approved && <th className="n">Installed</th>}
            {canEdit && <th />}
          </tr>
        </thead>
        {sections.map((s) => {
          const its = items.filter((i) => i.section_id === s.id);
          const st = its.filter((i) => !i.is_note && !i.excluded).reduce((a, i) => a + i.amount, 0);
          const sc = its.filter((i) => !i.is_note && !i.excluded).reduce((a, i) => a + i.cost_amount, 0);
          let lastSub: string | null = null;
          return (
            <tbody key={s.id}>
              <tr className="sec"><td colSpan={cols}><b>{s.code}.</b> {s.title}</td></tr>
              {its.map((i) => {
                const rows = [] as React.ReactNode[];
                if (i.subheading && i.subheading !== lastSub) { rows.push(<tr key={`${i.id}-sub`} className="sub"><td colSpan={cols}>{i.subheading}</td></tr>); lastSub = i.subheading; }
                if (editing === i.id) {
                  rows.push(<ItemForm key={i.id} projectId={projectId} boqId={boq.id} item={i} sectionId={s.id} showCost={showCost} cols={cols} onDone={() => setEditing(null)} />);
                } else {
                  const m = i.cost_amount > 0 ? (i.amount - i.cost_amount) / i.amount * 100 : null;
                  rows.push(
                    <tr key={i.id} className={i.is_note ? "note" : i.excluded ? "excl" : i.qty != null && i.qty < 0 ? "omit" : ""}>
                      <td className="ref">{i.ref}</td>
                      <td className="d">{i.description.split("\n").map((l, k) => <span key={k}>{l}<br /></span>)}{i.notes && <small className="in">{i.notes}</small>}</td>
                      {i.is_note ? <td colSpan={cols - 2} /> : (
                        <>
                          <td className="n">{i.qty ?? ""}</td><td className="u">{i.unit}</td><td className="n">{i.rate != null ? aed2(i.rate) : ""}</td><td className="n amt">{i.excluded ? <s>{aed2((i.qty ?? 0) * (i.rate ?? 0))}</s> : aed2(i.amount)}</td>
                          {showCost && <><td className="n cost">{i.cost_rate != null ? aed2(i.cost_rate) : ""}</td><td className="n cost">{i.cost_amount ? aed2(i.cost_amount) : ""}</td><td className={`n cost ${m != null && m < 15 ? "low" : ""}`}>{m != null ? `${Math.round(m)}%` : i.cost_rate == null && i.rate ? <i title="no supplier cost recorded">—</i> : ""}</td></>}
                          {approved && <td className="n"><Installed projectId={projectId} item={i} canProgress={canProgress && !i.excluded} /></td>}
                          {canEdit && <td className="act"><button className="x" onClick={() => setEditing(i.id)} aria-label="Edit">✎</button></td>}
                        </>
                      )}
                      {i.is_note && approved && null}
                    </tr>
                  );
                }
                return rows;
              })}
              {editing === `new:${s.id}` && <ItemForm projectId={projectId} boqId={boq.id} item={null} sectionId={s.id} showCost={showCost} cols={cols} onDone={() => setEditing(null)} />}
              <tr className="tot">
                <td /><td>{canEdit && editing !== `new:${s.id}` ? <button className="btn sm ghost" onClick={() => setEditing(`new:${s.id}`)}>+ item</button> : <span />} <span className="tl">Total of {s.title}</span></td>
                <td colSpan={3} /><td className="n amt">{aed2(st)}</td>
                {showCost && <><td /><td className="n cost">{sc ? aed2(sc) : ""}</td><td className={`n cost ${sc && (st - sc) / st < 0.15 ? "low" : ""}`}>{sc ? `${Math.round((st - sc) / st * 100)}%` : ""}</td></>}
                {approved && <td className="n">{st ? pct(its.filter((i) => !i.is_note && !i.excluded).reduce((a, i) => a + i.amount * i.installed_pct / 100, 0) / st * 100) : ""}</td>}
                {canEdit && <td />}
              </tr>
            </tbody>
          );
        })}
        <tfoot>
          {canEdit && (
            <tr><td colSpan={cols}>
              {addingSection ? <SectionForm projectId={projectId} boqId={boq.id} onDone={() => setAddingSection(false)} /> : <button className="btn sm ghost" onClick={() => setAddingSection(true)}>+ section</button>}
            </td></tr>
          )}
          {(discount > 0 || canEdit) && (
            <tr><td colSpan={5}>Items{discount > 0 ? "" : " (no discount)"}</td><td className="n amt">{aed2(gross)}</td>{showCost && <td colSpan={3} />}{approved && <td />}{canEdit && <td />}</tr>
          )}
          {(discount > 0 || canEdit) && (
            <tr><td colSpan={5}>Discount{canEdit && <DiscountEdit projectId={projectId} boqId={boq.id} value={discount} />}</td><td className="n amt">{discount > 0 ? `− ${aed2(discount)}` : "—"}</td>{showCost && <td colSpan={3} />}{approved && <td />}{canEdit && <td />}</tr>
          )}
          <tr className="grand"><td colSpan={5}>Total (ex VAT)</td><td className="n amt">{aed2(total)}</td>
            {showCost && <><td /><td className="n cost">{aed2(cost)}</td><td className={`n cost ${total && (total - cost) / total < 0.15 ? "low" : ""}`}>{total ? `${Math.round((total - cost) / total * 100)}%` : ""}</td></>}
            {approved && <td className="n">{total ? pct(installed / total * 100) : ""}</td>}{canEdit && <td />}</tr>
          <tr><td colSpan={5}>VAT ({boq.vat_pct}%)</td><td className="n amt">{aed2(vat)}</td>{showCost && <td colSpan={3} />}{approved && <td />}{canEdit && <td />}</tr>
          <tr className="grand"><td colSpan={5}>Grand total</td><td className="n amt">{aed2(total + vat)}</td>
            {showCost && <><td /><td className="n cost">profit {aed2(total - cost)}</td><td /></>}
            {approved && <td className="n">{aed2(installed * (1 + boq.vat_pct / 100))}</td>}{canEdit && <td />}</tr>
        </tfoot>
      </table>
    </div>
  );
}

function Installed({ projectId, item, canProgress }: { projectId: string; item: BoqItem; canProgress: boolean }) {
  const router = useRouter();
  const [pending, start] = useTransition();
  const [val, setVal] = useState(item.installed_pct);
  const [err, setErr] = useState<string | null>(null);
  if (!canProgress) return <span className={`ipct ${item.installed_pct >= 100 ? "done" : item.installed_pct > 0 ? "part" : ""}`}>{pct(item.installed_pct)}</span>;
  const save = (p: number) => start(async () => { const r = await setInstalled(projectId, item.id, p); if (r.error) setErr(r.error); else { setVal(r.pct!); setErr(null); router.refresh(); } });
  return (
    <span className="iedit" title={err ?? undefined}>
      <input type="number" min={0} max={100} step={5} value={val} onChange={(e) => setVal(Number(e.target.value))} onBlur={() => val !== item.installed_pct && save(val)} disabled={pending} aria-label="Installed %" className={err ? "err" : ""} />%
    </span>
  );
}

function ItemForm({ projectId, boqId, item, sectionId, showCost, cols, onDone }: { projectId: string; boqId: string; item: BoqItem | null; sectionId: string; showCost: boolean; cols: number; onDone: () => void }) {
  const router = useRouter();
  const [state, action, pending] = useActionState(async (prev: unknown, fd: FormData) => { const r = await saveItem(projectId, boqId, item?.id ?? null, prev, fd); if (r.ok) { onDone(); router.refresh(); } return r; }, null as { error?: string; ok?: boolean } | null);
  const [, start] = useTransition();
  // Library pick fills the fields below; the fields stay editable, so a picked rate is a starting point not a lock.
  const [picked, setPicked] = useState<RateHit | null>(null);
  const [v, setV] = useState({ description: item?.description ?? "", unit: item?.unit ?? "", rate: item?.rate?.toString() ?? "", cost_rate: item?.cost_rate?.toString() ?? "" });
  const pick = (r: RateHit) => { setPicked(r); setV({ description: r.description, unit: r.unit, rate: r.sell_rate?.toString() ?? "", cost_rate: r.cost_rate?.toString() ?? "" }); };
  return (
    <tr className="iform"><td colSpan={cols}>
      <form action={action}>
        <input type="hidden" name="section_id" value={sectionId} />
        <input type="hidden" name="rate_item_id" value={picked?.id ?? item?.rate_item_id ?? ""} />
        <RatePicker showCost={showCost} onPick={pick} picked={picked} />
        <div className="iform-grid">
          <input name="ref" defaultValue={item?.ref ?? ""} placeholder="Ref (A.)" aria-label="Ref" />
          <input name="subheading" defaultValue={item?.subheading ?? ""} placeholder="Sub-heading (optional)" aria-label="Sub-heading" />
          <textarea name="description" value={v.description} onChange={(e) => setV({ ...v, description: e.target.value })} placeholder="Description" rows={3} required aria-label="Description" />
          <input name="qty" inputMode="decimal" defaultValue={item?.qty ?? ""} placeholder="Qty" aria-label="Qty" />
          <input name="unit" value={v.unit} onChange={(e) => setV({ ...v, unit: e.target.value })} placeholder="Unit" aria-label="Unit" list="units" />
          <input name="rate" inputMode="decimal" value={v.rate} onChange={(e) => setV({ ...v, rate: e.target.value })} placeholder="Rate (ex VAT)" aria-label="Rate" />
          {showCost && <input name="cost_rate" inputMode="decimal" value={v.cost_rate} onChange={(e) => setV({ ...v, cost_rate: e.target.value })} placeholder="Supplier cost rate" aria-label="Cost rate" className="cost" />}
          <label className="chk"><input type="checkbox" name="is_note" defaultChecked={item?.is_note ?? false} /> Text only</label>
          <label className="chk"><input type="checkbox" name="excluded" defaultChecked={item?.excluded ?? false} /> Not in total</label>
          <input name="notes" defaultValue={item?.notes ?? ""} placeholder="Internal note" aria-label="Note" />
          <span className="iform-btns">
            <button className="btn sm" disabled={pending}>{item ? "Save" : "Add"}</button>
            <button type="button" className="btn sm ghost" onClick={onDone}>Cancel</button>
            {item && <button type="button" className="btn sm danger" onClick={() => { if (confirm("Remove this item?")) start(async () => { await deleteItem(projectId, boqId, item.id); onDone(); router.refresh(); }); }}>Remove</button>}
          </span>
        </div>
        <datalist id="units"><option value="sqm" /><option value="LM" /><option value="Nos" /><option value="LS" /><option value="item" /><option value="m³" /><option value="set" /><option value="pkg" /></datalist>
        {state?.error && <span className="msg err">{state.error}</span>}
      </form>
    </td></tr>
  );
}

/** Type-ahead over the rate library. Picking one fills description / unit / rate (and cost for the pricing side). */
export function RatePicker({ showCost, onPick, picked }: { showCost: boolean; onPick: (r: RateHit) => void; picked: RateHit | null }) {
  const [q, setQ] = useState("");
  const [hits, setHits] = useState<RateHit[]>([]);
  const [open, setOpen] = useState(false);
  const t = useRef<ReturnType<typeof setTimeout> | null>(null);
  useEffect(() => {
    if (t.current) clearTimeout(t.current);
    if (q.trim().length < 2) { setHits([]); return; }
    t.current = setTimeout(async () => { setHits(await searchRates(q, showCost)); setOpen(true); }, 180);
    return () => { if (t.current) clearTimeout(t.current); };
  }, [q, showCost]);
  return (
    <div className="rpick">
      <input value={q} onChange={(e) => setQ(e.target.value)} onFocus={() => hits.length && setOpen(true)} onBlur={() => setTimeout(() => setOpen(false), 150)} placeholder="From library — type to search rates (e.g. demolition, wardrobe, tiling)" aria-label="Search rate library" />
      {picked && <span className="rpicked"><b>{picked.code}</b> picked · {picked.unit} · {aed2(picked.sell_rate)}</span>}
      {open && hits.length > 0 && (
        <ul className="rhits" role="listbox">
          {hits.map((r) => (
            <li key={r.id} role="option" aria-selected={picked?.id === r.id} onMouseDown={(e) => { e.preventDefault(); onPick(r); setQ(""); setOpen(false); }}>
              <span className="rc">{r.code}</span>
              <span className="rd">{r.description.length > 110 ? r.description.slice(0, 110) + "…" : r.description}<small>{r.category}{r.use_count > 1 ? ` · used ${r.use_count}×` : ""}</small></span>
              <span className="rn">{aed2(r.sell_rate)} / {r.unit}{showCost && r.cost_rate != null && <small className="cost">cost {aed2(r.cost_rate)}</small>}</span>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

function SectionForm({ projectId, boqId, onDone }: { projectId: string; boqId: string; onDone: () => void }) {
  const router = useRouter();
  const [state, action, pending] = useActionState(async (prev: unknown, fd: FormData) => { const r = await addSection(projectId, boqId, prev, fd); if (r.ok) { onDone(); router.refresh(); } return r; }, null as { error?: string; ok?: boolean } | null);
  return (
    <form action={action} className="vo-form">
      <input name="title" placeholder="Section title (e.g. Joinery Works)" required aria-label="Section title" />
      <input name="code" placeholder="Code (auto)" aria-label="Section code" />
      <span style={{ display: "flex", gap: 6 }}><button className="btn sm" disabled={pending}>Add section</button><button type="button" className="btn sm ghost" onClick={onDone}>Cancel</button></span>
      {state?.error && <span className="msg err">{state.error}</span>}
    </form>
  );
}

/** Inline editor for the lump-sum discount — a small input next to the label, saved on blur / Enter. */
function DiscountEdit({ projectId, boqId, value }: { projectId: string; boqId: string; value: number }) {
  const router = useRouter();
  const [pending, start] = useTransition();
  const [v, setV] = useState(value ? String(value) : "");
  const save = () => {
    const n = v.trim() === "" ? 0 : Number(v.replace(/,/g, ""));
    if (!Number.isFinite(n) || n === value) return;
    start(async () => { const r = await setBoqDiscount(projectId, boqId, n); if (r?.error) alert(r.error); else router.refresh(); });
  };
  return (
    <input className="inp sm disc" type="text" inputMode="decimal" placeholder="0.00" value={v} disabled={pending}
      onChange={(e) => setV(e.target.value)} onBlur={save} onKeyDown={(e) => { if (e.key === "Enter") (e.target as HTMLInputElement).blur(); }} />
  );
}
