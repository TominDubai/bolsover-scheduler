import Link from "next/link";
import { notFound } from "next/navigation";
import { getProject, getMe } from "@/lib/data";
import { getValuations, getApprovedItems, aed2 } from "@/lib/boq";
import { fmtD } from "@/lib/model";
import PrintButton from "@/components/PrintButton";
import ValuationStatus from "@/components/ValuationStatus";

export const dynamic = "force-dynamic";

/** Progress Billing Report — Pao's layout: every item with BOQ amount, this period %, cumulative, balance; then the statement of account. */
export default async function Page({ params }: { params: Promise<{ id: string; valId: string }> }) {
  const { id, valId } = await params;
  const [p, me, vals, a] = await Promise.all([getProject(id), getMe(), getValuations(id), getApprovedItems(id)]);
  const v = vals.find((x) => x.id === valId);
  if (!p || !v) notFound();
  const prev = vals.find((x) => x.no === v.no - 1);
  const snap = new Map((v.snapshot?.items ?? []).map((i) => [i.id, i]));
  const prevSnap = new Map((prev?.snapshot?.items ?? []).map((i) => [i.id, i]));
  const vat = 1 + v.vat_pct / 100;
  const grand = v.contract_value * vat;
  const thisPeriod = (v.installed_value - v.prev_installed) * vat;
  const adj = v.snapshot?.adjustments ?? [];
  return (
    <div className="print">
      <PrintButton />
      <div className="noprint" style={{ display: "flex", gap: 8, alignItems: "center", marginBottom: 12 }}>
        <Link href={`/projects/${id}/valuations`} className="btn sm ghost">← Valuations</Link>
        {me.canProjects && <ValuationStatus projectId={id} v={v} />}
      </div>
      <header className="ph">
        <div className="brand"><span className="mark">B</span><span><b>Bolsover</b><small>BUILDING CONTRACTING LLC</small></span></div>
        <div className="meta"><div><span>Date</span><b>{fmtD(v.issued_date ?? v.period_to)}</b></div><div><span>Billing period</span><b>{v.period_from ? fmtD(v.period_from) + " – " : ""}{fmtD(v.period_to)}</b></div></div>
      </header>
      <h1>Progress Billing Report no. {v.no}</h1>
      <div className="pmeta"><div><span>Project</span>{p.name}</div><div><span>Address</span>{p.location ?? "—"}</div><div><span>Bill to</span>{p.client ?? "—"}</div></div>

      <h2>Statement of account</h2>
      <table className="pt soa"><tbody>
        <tr><td>Contract sub-total (ex VAT)</td><td className="n">{aed2(v.contract_value)}</td></tr>
        <tr><td>VAT ({v.vat_pct}%)</td><td className="n">{aed2(v.contract_value * (vat - 1))}</td></tr>
        <tr className="tot"><td>Contract grand total</td><td className="n">{aed2(grand)}</td></tr>
        <tr><td>Advance received to date</td><td className="n">{aed2(v.deposit_received)}</td></tr>
        <tr><td>Work installed to date ({(v.installed_value / v.contract_value * 100).toFixed(2)}%) inc VAT</td><td className="n">{aed2(v.installed_value * vat)}</td></tr>
        <tr><td>Previously billed (progress)</td><td className="n">{aed2(v.prev_installed * vat)}</td></tr>
        <tr><td>Progress this period inc VAT</td><td className="n">{aed2(thisPeriod)}</td></tr>
        {adj.map((x, i) => <tr key={i}><td>{x.label}</td><td className="n">{aed2(x.amount)}</td></tr>)}
        <tr><td>Less: pro-rata recovery of advance ({v.contract_value ? ((v.installed_value - v.prev_installed) / v.contract_value * 100).toFixed(2) : 0}%)</td><td className="n">({aed2(v.deposit_recovery)})</td></tr>
        <tr className="grand"><td>Amount due this report</td><td className="n">{aed2(v.amount_due)}</td></tr>
        <tr><td>Balance of contract after this report (inc VAT)</td><td className="n">{aed2(grand - v.installed_value * vat)}</td></tr>
      </tbody></table>

      <h2>Summary of billing</h2>
      <table className="pt">
        <thead><tr><th className="ref" /><th>Description</th><th className="n">BOQ amount</th><th className="n">This report %</th><th className="n">This report</th><th className="n">Cumulative %</th><th className="n">Cumulative</th><th className="n">Balance</th></tr></thead>
        {a.boqs.map((b) => a.sections.filter((s) => s.boq_id === b.id).map((s) => {
          const its = a.items.filter((i) => i.section_id === s.id && !i.is_note && !i.excluded);
          if (!its.length) return null;
          return (
            <tbody key={s.id}>
              <tr className="sec"><td colSpan={8}>{b.kind === "VARIATION" ? `VO${b.vo_no ?? ""} · ` : ""}{s.code}. {s.title}</td></tr>
              {its.map((i) => {
                const cur = snap.get(i.id)?.pct ?? 0; const was = prevSnap.get(i.id)?.pct ?? 0; const amt = snap.get(i.id)?.amount ?? i.amount;
                return (
                  <tr key={i.id}><td className="ref">{i.ref}</td><td className="d">{i.description.split("\n")[0]}</td><td className="n">{aed2(amt)}</td>
                    <td className="n">{cur - was ? `${Math.round(cur - was)}%` : ""}</td><td className="n">{cur - was ? aed2(amt * (cur - was) / 100) : ""}</td>
                    <td className="n">{cur ? `${Math.round(cur)}%` : ""}</td><td className="n">{cur ? aed2(amt * cur / 100) : ""}</td><td className="n">{aed2(amt * (100 - cur) / 100)}</td></tr>
                );
              })}
            </tbody>
          );
        }))}
        <tfoot>
          <tr className="grand"><td /><td>Total (ex VAT)</td><td className="n">{aed2(v.contract_value)}</td><td /><td className="n">{aed2(v.installed_value - v.prev_installed)}</td><td className="n">{(v.installed_value / v.contract_value * 100).toFixed(2)}%</td><td className="n">{aed2(v.installed_value)}</td><td className="n">{aed2(v.contract_value - v.installed_value)}</td></tr>
        </tfoot>
      </table>
      {v.notes && <p className="note">{v.notes}</p>}
    </div>
  );
}
