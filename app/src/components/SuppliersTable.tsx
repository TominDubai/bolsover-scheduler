"use client";
import { Fragment, useActionState, useState } from "react";
import Link from "next/link";
import { title, type Supplier, type PackageTrade, type Package } from "@/lib/model";
import { saveSupplier, addSupplier } from "@/app/actions";

type State = { error?: string; ok?: boolean; at?: string } | null;
/** The live packages a supplier is on: one chip per package, linking to the drawer on the project page. */
export type SupplierJobs = Record<string, Pick<Package, "id" | "project_id" | "project_name" | "enquiry_no" | "code" | "name" | "status" | "slipping" | "forecast_late">[]>;

const STATUS_SHORT: Record<string, string> = { NOT_AWARDED: "not awarded", AWARDED: "awarded", APPROVED: "approved", ON_SITE: "on site", COMPLETE: "complete", SNAGGED: "snagged", CANCELLED: "cancelled" };

function Jobs({ jobs }: { jobs: SupplierJobs[string] | undefined }) {
  if (!jobs || jobs.length === 0) return <i style={{ color: "var(--fg3)" }}>none</i>;
  const byProject = new Map<string, typeof jobs>();
  for (const j of jobs) byProject.set(j.project_id, [...(byProject.get(j.project_id) ?? []), j]);
  return (
    <div className="sup-jobs">
      {[...byProject.entries()].map(([pid, ks]) => (
        <div key={pid} className="sup-job">
          <Link href={`/projects/${pid}#packages`} className="sup-proj">{title(ks[0].project_name)}</Link>
          {ks.map((k) => (
            <Link key={k.id} href={`/projects/${pid}?pkg=${k.id}#packages`} className={`pill ${k.slipping || k.forecast_late ? "crit" : k.status === "ON_SITE" ? "ok" : k.status === "COMPLETE" || k.status === "SNAGGED" ? "done" : ""}`} title={`${k.name} · ${STATUS_SHORT[k.status] ?? k.status}`}>
              {k.code ?? title(k.name)} · {STATUS_SHORT[k.status] ?? k.status}
            </Link>
          ))}
        </div>
      ))}
    </div>
  );
}

function Row({ s, trades, jobs, canEdit }: { s: Supplier; trades: PackageTrade[]; jobs: SupplierJobs[string] | undefined; canEdit: boolean }) {
  const [state, action, pending] = useActionState(saveSupplier.bind(null, s.id), null as State);
  const [dirty, setDirty] = useState(false);
  const tradeName = trades.find((t) => t.id === s.trade_id)?.name;
  if (!canEdit) return (
    <tr className={s.is_active ? "" : "off"}>
      <td className="name">{s.name}</td><td>{tradeName ?? "—"}</td><td>{s.contact ?? "—"}</td><td>{s.phone ?? "—"}</td><td>{s.email ?? "—"}</td><td className="notes">{s.notes ?? "—"}</td><td><Jobs jobs={jobs} /></td><td>{s.is_active ? "Active" : "Retired"}</td><td />
    </tr>
  );
  const f = `s-${s.id}`;
  const touch = () => setDirty(true);
  return (
    <tr className={s.is_active ? "" : "off"}>
      <td className="name"><input form={f} name="name" defaultValue={s.name} required onChange={touch} /></td>
      <td><select form={f} name="trade_id" defaultValue={s.trade_id ?? ""} onChange={touch}><option value="">—</option>{trades.map((t) => <option key={t.id} value={t.id}>{t.name}</option>)}</select></td>
      <td><input form={f} name="contact" defaultValue={s.contact ?? ""} placeholder="Who you deal with" onChange={touch} /></td>
      <td><input form={f} name="phone" defaultValue={s.phone ?? ""} placeholder="+9715…" onChange={touch} /></td>
      <td><input form={f} name="email" type="email" defaultValue={s.email ?? ""} placeholder="name@company.com" onChange={touch} /></td>
      <td className="notes"><input form={f} name="notes" defaultValue={s.notes ?? ""} placeholder="Terms, strengths, who recommended them" onChange={touch} /></td>
      <td><Jobs jobs={jobs} /></td>
      <td><label className="check"><input form={f} type="checkbox" name="is_active" defaultChecked={s.is_active} onChange={touch} /> Active</label></td>
      <td className="save">
        <form id={f} action={action} onSubmit={() => setDirty(false)}>
          <button className={"btn sm" + (dirty ? " bronze" : " ghost")} disabled={pending}>{pending ? "Saving…" : "Save"}</button>
          {state?.error && <span className="msg err">{state.error}</span>}
          {state?.ok && !dirty && <span className="msg">Saved</span>}
        </form>
      </td>
    </tr>
  );
}

function AddRow({ trades }: { trades: PackageTrade[] }) {
  const [state, action, pending] = useActionState(addSupplier, null as State);
  return (
    <tr className="addrow">
      <td className="name"><input form="s-new" name="name" placeholder="Company name" required /></td>
      <td><select form="s-new" name="trade_id" defaultValue=""><option value="">— usual trade —</option>{trades.map((t) => <option key={t.id} value={t.id}>{t.name}</option>)}</select></td>
      <td><input form="s-new" name="contact" placeholder="Contact" /></td>
      <td><input form="s-new" name="phone" placeholder="+9715…" /></td>
      <td><input form="s-new" name="email" type="email" placeholder="Email" /></td>
      <td className="notes"><input form="s-new" name="notes" placeholder="Notes" /></td>
      <td />
      <td />
      <td className="save">
        <form id="s-new" action={action} key={state?.at}>
          <button className="btn sm" disabled={pending}>{pending ? "Adding…" : "+ Add"}</button>
          {state?.error && <span className="msg err">{state.error}</span>}
          {state?.ok && <span className="msg">Added</span>}
        </form>
      </td>
    </tr>
  );
}

/** Suppliers and subcontractors, grouped by their usual trade, with the live packages each one is on.
 *  Editable by anyone with the Projects or Quotes permission (RLS `write_projects` on `suppliers`, db/019). */
export default function SuppliersTable({ suppliers, trades, jobs, canEdit }: { suppliers: Supplier[]; trades: PackageTrade[]; jobs: SupplierJobs; canEdit: boolean }) {
  const [showRetired, setShowRetired] = useState(false);
  const rows = showRetired ? suppliers : suppliers.filter((s) => s.is_active);
  const retired = suppliers.length - suppliers.filter((s) => s.is_active).length;
  const sortRows = (a: Supplier, b: Supplier) => Number(b.is_active) - Number(a.is_active) || a.name.localeCompare(b.name);
  const groups = [...trades.map((t) => [t.name, rows.filter((s) => s.trade_id === t.id).sort(sortRows)] as const), ["No usual trade", rows.filter((s) => !s.trade_id || !trades.some((t) => t.id === s.trade_id)).sort(sortRows)] as const].filter(([, ss]) => ss.length);
  return (
    <div className="listview">
      <div className="tablewrap team suppliers">
        <table>
          <thead><tr><th>Supplier</th><th>Usual trade</th><th>Contact</th><th>Phone</th><th>Email</th><th>Notes</th><th>Live packages</th><th>Status</th><th /></tr></thead>
          <tbody>
            {groups.map(([trade, ss]) => (
              <Fragment key={trade}>
                <tr className="group"><td colSpan={9}>{trade}</td></tr>
                {ss.map((s) => <Row key={s.id} s={s} trades={trades} jobs={jobs[s.id]} canEdit={canEdit} />)}
              </Fragment>
            ))}
            {canEdit && <AddRow trades={trades} />}
          </tbody>
        </table>
      </div>
      {retired > 0 && <button type="button" className="linkbtn" onClick={() => setShowRetired((s) => !s)}>{showRetired ? "Hide" : "Show"} {retired} retired supplier{retired === 1 ? "" : "s"}</button>}
    </div>
  );
}
