"use client";
import { useActionState, useEffect, useState, useTransition } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { createPackage, savePackage, setMilestone, cancelPackage, createSupplier } from "@/app/actions";
import { aed, fmtDShort, title, MILESTONES, AUTHORITIES, type Package, type PackageTrade, type Supplier, type Person } from "@/lib/model";
import MilestoneStrip, { PackageChip, PackageFlags, PackageProgress } from "@/components/MilestoneStrip";

type Props = { projectId: string; packages: Package[]; trades: PackageTrade[]; suppliers: Supplier[]; people: Person[]; canEdit: boolean; showValue: boolean };

/** The work packages on one project — one per trade, with the subcontractor, value, dates and milestones.
 *  These are the same rows as the Programme panel below (db/019): progress % and the P6 activities live there. */
export default function PackagesPanel({ projectId, packages, trades, suppliers, people, canEdit, showValue }: Props) {
  const router = useRouter();
  const sp = useSearchParams();
  const [open, setOpen] = useState<string | null>(sp.get("pkg"));
  const [adding, setAdding] = useState(false);
  const [showCancelled, setShowCancelled] = useState(false);
  const [, start] = useTransition();
  useEffect(() => { setOpen(sp.get("pkg")); }, [sp]);
  const openPkg = (id: string | null) => {
    setOpen(id);
    const q = new URLSearchParams(sp.toString());
    if (id) q.set("pkg", id); else q.delete("pkg");
    router.replace("?" + q.toString(), { scroll: false });
  };
  const live = packages.filter((k) => !k.cancelled);
  const cancelled = packages.filter((k) => k.cancelled);
  const rows = showCancelled ? packages : live;
  const n = {
    total: live.length, awarded: live.filter((k) => k.status !== "NOT_AWARDED").length, site: live.filter((k) => k.status === "ON_SITE").length,
    done: live.filter((k) => k.status === "COMPLETE" || k.status === "SNAGGED").length, slipping: live.filter((k) => k.slipping || k.forecast_late).length,
  };
  const value = live.filter((k) => k.status !== "NOT_AWARDED").reduce((s, k) => s + (k.value ?? 0), 0);
  const current = open ? packages.find((k) => k.id === open) ?? null : null;
  const tap = (k: Package) => (m: string, d: string | null) => start(async () => { const r = await setMilestone(projectId, k.id, m, d); if (!r?.error) router.refresh(); });
  const owners = people.filter((p) => p.role === "PM" || p.role === "SITE" || p.role === "QS" || p.role === "MANAGEMENT");

  return (
    <div className="panel items" id="packages">
      <div className="items-head">
        <h2>Packages <small>{n.total === 0 ? "" : `· ${n.total}`}</small></h2>
        {n.total > 0 && (
          <div className="items-stats">
            <span><b>{n.awarded}</b> awarded</span><span><b>{n.site}</b> on site</span><span><b>{n.done}</b> complete</span>
            {showValue && value > 0 && <span><b>{aed(value)}</b> awarded value</span>}
            {n.slipping > 0 && <span className="crit"><b>{n.slipping}</b> slipping</span>}
          </div>
        )}
        {canEdit && <button type="button" className="btn sm bronze" onClick={() => setAdding((a) => !a)}>{adding ? "Close" : "+ Package"}</button>}
      </div>
      {n.total > 0 && <PackageProgress complete={n.done} onSite={n.site} awarded={n.awarded} total={n.total} title={`${n.done} complete · ${n.site} on site · ${n.awarded - n.site - n.done} awarded · ${n.total - n.awarded} not awarded`} />}
      {adding && <AddPackage projectId={projectId} trades={trades} suppliers={suppliers} owners={owners} showValue={showValue} onDone={(id) => { setAdding(false); router.refresh(); if (id) openPkg(id); }} />}
      {rows.length === 0 ? (
        <p className="empty-items">{canEdit ? "No packages yet. Add one per trade — demolition, MEP, joinery, stone, paint… — with the subcontractor and dates. If there's a P6 programme, load it and the packages come from it." : "No packages on this project yet."}</p>
      ) : (
        <div className="tablewrap items-table">
          <table>
            <thead><tr><th>Code</th><th>Package</th><th>Trade</th><th>Subcontractor</th>{showValue && <th className="num">Value</th>}<th>Owner</th><th>Planned</th><th>Milestones</th><th>Status</th><th></th></tr></thead>
            <tbody>
              {rows.map((k) => (
                <tr key={k.id} className={`row${k.cancelled ? " off" : ""}${open === k.id ? " open" : ""}`} onClick={() => openPkg(k.id)}>
                  <td className="enq code">{k.code ?? "—"}</td>
                  <td className="name">{title(k.name).replace(/\bMep\b/, "MEP").replace(/\bHvac\b/, "HVAC")}{k.cancelled && <span className="pill none" style={{ marginLeft: 8 }}>cancelled</span>}</td>
                  <td>{k.trade ?? <i>—</i>}</td>
                  <td>{k.supplier ?? <i>none</i>}</td>
                  {showValue && <td className="num">{k.value ? aed(k.value) : "—"}</td>}
                  <td>{k.owner ? title(k.owner) : <i>—</i>}</td>
                  <td className="num"><span className={k.slipping ? "due crit" : ""}>{fmtDShort(k.planned_start)} → {fmtDShort(k.planned_finish)}</span></td>
                  <td><MilestoneStrip k={k} onTap={canEdit && !k.cancelled ? tap(k) : undefined} /></td>
                  <td><PackageChip k={k} /></td>
                  <td className="flags"><PackageFlags k={k} /></td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
      {cancelled.length > 0 && <button type="button" className="linkbtn" onClick={() => setShowCancelled((s) => !s)}>{showCancelled ? "Hide" : "Show"} {cancelled.length} cancelled package{cancelled.length === 1 ? "" : "s"}</button>}
      {current && <PackageDrawer key={current.id + current.updated_at} projectId={projectId} k={current} trades={trades} suppliers={suppliers} owners={owners} canEdit={canEdit} showValue={showValue} onClose={() => openPkg(null)} />}
    </div>
  );
}

function SupplierPicker({ suppliers, tradeId, defaultId }: { suppliers: Supplier[]; tradeId: string | null; defaultId: string | null }) {
  const [list, setList] = useState(suppliers);
  const [sel, setSel] = useState(defaultId ?? "");
  const [adding, setAdding] = useState(false);
  const [name, setName] = useState("");
  const [busy, start] = useTransition();
  const sorted = [...list].sort((a, b) => Number(b.trade_id === tradeId) - Number(a.trade_id === tradeId) || a.name.localeCompare(b.name));
  return (
    <div className="field">
      <label htmlFor="pk-sup">Subcontractor / supplier</label>
      {adding ? (
        <div style={{ display: "flex", gap: 6 }}>
          <input value={name} onChange={(e) => setName(e.target.value)} placeholder="Company name" autoFocus onKeyDown={(e) => { if (e.key === "Enter") { e.preventDefault(); (e.currentTarget.nextSibling as HTMLButtonElement).click(); } }} />
          <button type="button" className="btn sm" disabled={busy || !name.trim()} onClick={() => start(async () => { const r = await createSupplier(name, tradeId); if (r.id) { setList((l) => l.some((s) => s.id === r.id) ? l : [...l, { id: r.id!, name: name.trim(), trade_id: tradeId, contact: null, phone: null, email: null, notes: null, is_active: true }]); setSel(r.id); setAdding(false); } })}>{busy ? "…" : "Add"}</button>
          <button type="button" className="btn sm ghost" onClick={() => setAdding(false)}>Cancel</button>
        </div>
      ) : (
        <div style={{ display: "flex", gap: 6 }}>
          <select id="pk-sup" name="supplier_id" value={sel} onChange={(e) => setSel(e.target.value)} style={{ flex: 1 }}><option value="">— not yet appointed —</option>{sorted.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}</select>
          <button type="button" className="btn sm ghost" onClick={() => setAdding(true)} title="Add a new subcontractor">+</button>
        </div>
      )}
    </div>
  );
}

function AddPackage({ projectId, trades, suppliers, owners, showValue, onDone }: { projectId: string; trades: PackageTrade[]; suppliers: Supplier[]; owners: Person[]; showValue: boolean; onDone: (id?: string) => void }) {
  const [state, action, pending] = useActionState(createPackage.bind(null, projectId), null as { error?: string; ok?: boolean; at?: string; id?: string } | null);
  const [tradeId, setTradeId] = useState<string>("");
  useEffect(() => { if (state?.ok) onDone(state.id); }, [state?.at]); // eslint-disable-line react-hooks/exhaustive-deps
  const tradeName = trades.find((t) => t.id === tradeId)?.name ?? "";
  return (
    <form action={action} className="form additem">
      <div className="field"><label htmlFor="pk-trade">Trade</label>
        <select id="pk-trade" name="trade_id" value={tradeId} onChange={(e) => setTradeId(e.target.value)} required><option value="">— pick —</option>{trades.map((t) => <option key={t.id} value={t.id}>{t.name}</option>)}</select></div>
      <div className="field wide"><label htmlFor="pk-name">Package</label><input id="pk-name" name="name" required placeholder={tradeName ? `e.g. ${tradeName} — ground floor` : "e.g. MEP works, Joinery — kitchens & wardrobes"} /></div>
      <SupplierPicker suppliers={suppliers} tradeId={tradeId || null} defaultId={null} />
      {showValue && <div className="field"><label htmlFor="pk-value">Order value (AED, ex VAT)</label><input id="pk-value" name="value" inputMode="decimal" placeholder="0" /></div>}
      <div className="field"><label htmlFor="pk-owner">Owner</label><select id="pk-owner" name="owner_id" defaultValue=""><option value="">— project PM —</option>{owners.map((p) => <option key={p.id} value={p.id}>{title(p.name)}</option>)}</select></div>
      <div className="field"><label htmlFor="pk-ps">Planned start</label><input id="pk-ps" name="planned_start" type="date" /></div>
      <div className="field"><label htmlFor="pk-pf">Planned finish</label><input id="pk-pf" name="planned_finish" type="date" /></div>
      <label className="field check" style={{ alignSelf: "end" }}><input type="checkbox" name="awarded" /> <span>Already awarded</span></label>
      <div className="actions"><button className="btn" disabled={pending}>{pending ? "Adding…" : "Add package"}</button><span className="note">The code is assigned from the trade — the next free number on this project.</span>{state?.error && <span className="msg err">{state.error}</span>}</div>
    </form>
  );
}

function PackageDrawer({ projectId, k, trades, suppliers, owners, canEdit, showValue, onClose }: { projectId: string; k: Package; trades: PackageTrade[]; suppliers: Supplier[]; owners: Person[]; canEdit: boolean; showValue: boolean; onClose: () => void }) {
  const router = useRouter();
  const [state, action, pending] = useActionState(savePackage.bind(null, projectId, k.id), null as { error?: string; ok?: boolean; at?: string } | null);
  const [, start] = useTransition();
  useEffect(() => { if (state?.ok) router.refresh(); }, [state?.at]); // eslint-disable-line react-hooks/exhaustive-deps
  useEffect(() => { const h = (e: KeyboardEvent) => { if (e.key === "Escape") onClose(); }; window.addEventListener("keydown", h); return () => window.removeEventListener("keydown", h); }, [onClose]);
  const ro = !canEdit;
  return (
    <div className="ddim" onClick={onClose}>
      <aside className="drawer" onClick={(e) => e.stopPropagation()} role="dialog" aria-label={`Package ${k.code ?? ""}`}>
        <div className="drawer-head">
          <div><div className="code-big">{k.code ?? "—"}{k.trade ? <span className="rev-big"> · {k.trade}</span> : null}</div><h2>{title(k.name).replace(/\bMep\b/, "MEP").replace(/\bHvac\b/, "HVAC")}</h2></div>
          <div className="drawer-tools"><PackageChip k={k} /><button type="button" className="x" aria-label="Close" onClick={onClose}>×</button></div>
        </div>
        <div className="drawer-flags"><PackageFlags k={k} max={4} /></div>
        <form action={action} className="form" style={{ gap: 14 }}>
          <div className="dsec">
            <h3>Package</h3>
            <div className="form" style={{ gridTemplateColumns: "1fr 1fr" }}>
              <div className="field wide"><label htmlFor="pd-name">Name</label><input id="pd-name" name="name" defaultValue={k.name} readOnly={ro} /></div>
              <div className="field"><label htmlFor="pd-trade">Trade</label><select id="pd-trade" name="trade_id" defaultValue={k.trade_id ?? ""} disabled={ro}><option value="">—</option>{trades.map((t) => <option key={t.id} value={t.id}>{t.name}</option>)}</select></div>
              {ro ? <div className="field"><label>Subcontractor</label><div>{k.supplier ?? "—"}</div></div> : <SupplierPicker suppliers={suppliers} tradeId={k.trade_id} defaultId={k.supplier_id} />}
              {showValue && <div className="field"><label htmlFor="pd-value">Order value (AED, ex VAT)</label><input id="pd-value" name="value" inputMode="decimal" defaultValue={k.value ?? ""} readOnly={ro} /></div>}
              <div className="field"><label htmlFor="pd-owner">Owner</label><select id="pd-owner" name="owner_id" defaultValue={k.owner_id ?? ""} disabled={ro}><option value="">—</option>{owners.map((p) => <option key={p.id} value={p.id}>{title(p.name)}</option>)}</select></div>
            </div>
          </div>
          <div className="dsec">
            <h3>Dates</h3>
            <div className="form" style={{ gridTemplateColumns: "1fr 1fr 1fr" }}>
              <div className="field"><label htmlFor="pd-ps">Planned start</label><input id="pd-ps" name="planned_start" type="date" defaultValue={k.planned_start ?? ""} readOnly={ro} /></div>
              <div className="field"><label htmlFor="pd-pf">Planned finish</label><input id="pd-pf" name="planned_finish" type="date" defaultValue={k.planned_finish ?? ""} readOnly={ro} /></div>
              <div className="field"><label htmlFor="pd-ff">Forecast finish</label><input id="pd-ff" name="forecast_finish" type="date" defaultValue={k.forecast_finish ?? ""} readOnly={ro} /></div>
              <div className="field"><label htmlFor="pd-pct">Progress %</label><input id="pd-pct" name="pct_complete" type="number" min={0} max={100} defaultValue={k.pct_complete} readOnly={ro} /></div>
              <p className="note" style={{ gridColumn: "span 2", margin: 0 }}>Planned dates come from the P6 programme when one is loaded ({k.planned_days ?? "—"} days). On site = actual start, Complete = actual finish — one set of dates, seen from both sides.</p>
            </div>
          </div>
          <div className="dsec">
            <h3>Milestones</h3>
            <div className="form" style={{ gridTemplateColumns: "repeat(5, 1fr)" }}>
              {MILESTONES.map(([m, label]) => <div className="field" key={m}><label htmlFor={`pd-${m}`}>{label}</label><input id={`pd-${m}`} name={m} type="date" defaultValue={(k[m] as string | null) ?? ""} readOnly={ro} /></div>)}
            </div>
            <p className="note" style={{ margin: 0 }}>Setting a later milestone fills in the earlier ones. The status pill follows the latest milestone.</p>
          </div>
          <div className="dsec">
            <h3>Authority approval</h3>
            <div className="form" style={{ gridTemplateColumns: "1fr 1fr 1fr" }}>
              <div className="field"><label htmlFor="pd-auth">Authority</label><select id="pd-auth" name="approval_authority" defaultValue={k.approval_authority ?? ""} disabled={ro}><option value="">— none needed —</option>{AUTHORITIES.map((a) => <option key={a} value={a}>{a}</option>)}{k.approval_authority && !AUTHORITIES.includes(k.approval_authority) && <option value={k.approval_authority}>{k.approval_authority}</option>}</select></div>
              <div className="field"><label htmlFor="pd-as">Submitted</label><input id="pd-as" name="approval_submitted" type="date" defaultValue={k.approval_submitted ?? ""} readOnly={ro} /></div>
              <div className="field"><label htmlFor="pd-ar">Approved</label><input id="pd-ar" name="approval_received" type="date" defaultValue={k.approval_received ?? ""} readOnly={ro} /></div>
              <div className="field wide" style={{ gridColumn: "1 / -1" }}><label htmlFor="pd-an">Approval note</label><input id="pd-an" name="approval_note" defaultValue={k.approval_note ?? ""} placeholder="NOC ref, who it's with, what they asked for" readOnly={ro} /></div>
            </div>
          </div>
          <div className="field"><label htmlFor="pd-note">Note</label><input id="pd-note" name="note" defaultValue={k.note ?? ""} placeholder="What's holding it up, what changed" readOnly={ro} /></div>
          {canEdit && (
            <div className="actions">
              <button className="btn" disabled={pending}>{pending ? "Saving…" : "Save package"}</button>
              {state?.error && <span className="msg err">{state.error}</span>}
              {state?.ok && <span className="msg">Saved</span>}
              <button type="button" className="btn sm ghost" style={{ marginLeft: "auto" }} onClick={() => start(async () => { await cancelPackage(projectId, k.id, !k.cancelled); router.refresh(); })}>{k.cancelled ? "Restore package" : "Cancel package"}</button>
            </div>
          )}
        </form>
        <p className="note" style={{ margin: 0 }}>Updated {fmtDShort(k.updated_at)}{k.supplier ? ` · ${k.supplier}` : ""}</p>
      </aside>
    </div>
  );
}
