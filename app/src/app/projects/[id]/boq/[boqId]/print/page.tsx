import { notFound } from "next/navigation";
import { getProject } from "@/lib/data";
import { getBoq, aed2 } from "@/lib/boq";
import { fmtD } from "@/lib/model";
import PrintButton from "@/components/PrintButton";

export const dynamic = "force-dynamic";

/** Client-facing bill in the Bolsover house layout — no cost columns. Browser print → PDF. */
export default async function Print({ params }: { params: Promise<{ id: string; boqId: string }> }) {
  const { id, boqId } = await params;
  const [p, b] = await Promise.all([getProject(id), getBoq(boqId)]);
  if (!p || !b || b.boq.project_id !== id) notFound();
  const live = b.items.filter((i) => !i.is_note && !i.excluded);
  const total = live.reduce((s, i) => s + i.amount, 0);
  const vat = total * b.boq.vat_pct / 100;
  const sectionTotals = b.sections.map((s) => ({ s, t: live.filter((i) => i.section_id === s.id).reduce((a, i) => a + i.amount, 0) }));
  return (
    <div className="print">
      <PrintButton />
      <header className="ph">
        <div className="brand"><span className="mark">B</span><span><b>Bolsover</b><small>BUILDING CONTRACTING LLC</small></span></div>
        <div className="meta">
          <div><span>Date</span><b>{fmtD(b.boq.issue_date)}</b></div>
          <div><span>Quote</span><b>{b.boq.quote_ref ?? "—"}</b></div>
          {b.boq.working_days && <div><span>Working days</span><b>{b.boq.working_days}</b></div>}
        </div>
      </header>
      <h1>Bill of Quantities</h1>
      <div className="pmeta">
        <div><span>Project</span>{b.boq.title}</div>
        <div><span>Address</span>{p.location ?? "—"}</div>
        <div><span>Bill to</span>{p.client ?? "—"}</div>
      </div>
      <table className="pt">
        <thead><tr><th className="ref" /><th>Work description</th><th className="n">Qty</th><th className="u">Unit</th><th className="n">Rate</th><th className="n">Total</th></tr></thead>
        {b.sections.map((s) => {
          const its = b.items.filter((i) => i.section_id === s.id);
          let lastSub: string | null = null;
          return (
            <tbody key={s.id}>
              <tr className="sec"><td colSpan={6}>{s.code}. {s.title}</td></tr>
              {its.flatMap((i) => {
                const rows = [] as React.ReactNode[];
                if (i.subheading && i.subheading !== lastSub) { rows.push(<tr key={i.id + "s"} className="sub"><td colSpan={6}>{i.subheading}</td></tr>); lastSub = i.subheading; }
                rows.push(
                  <tr key={i.id} className={i.is_note ? "note" : ""}>
                    <td className="ref">{i.ref}</td>
                    <td className="d">{i.description.split("\n").map((l, k) => <span key={k}>{l}<br /></span>)}</td>
                    {i.is_note ? <td colSpan={4} /> : i.excluded ? <><td className="n">{i.qty}</td><td className="u">{i.unit}</td><td className="n" colSpan={2}><i>To be confirmed</i></td></> : (
                      <><td className="n">{i.qty}</td><td className="u">{i.unit}</td><td className="n">{aed2(i.rate)}</td><td className="n">{aed2(i.amount)}</td></>
                    )}
                  </tr>
                );
                return rows;
              })}
              <tr className="tot"><td /><td>Total of {s.title}</td><td colSpan={3} /><td className="n">{aed2(sectionTotals.find((x) => x.s.id === s.id)!.t)}</td></tr>
            </tbody>
          );
        })}
      </table>
      <table className="pt summary">
        <thead><tr><th colSpan={2}>Summary</th><th className="n">AED</th></tr></thead>
        <tbody>
          {sectionTotals.map(({ s, t }) => <tr key={s.id}><td className="ref">{s.code}</td><td>{s.title}</td><td className="n">{aed2(t)}</td></tr>)}
          <tr className="tot"><td colSpan={2}>Total</td><td className="n">{aed2(total)}</td></tr>
          <tr><td colSpan={2}>VAT ({b.boq.vat_pct}%)</td><td className="n">{aed2(vat)}</td></tr>
          <tr className="grand"><td colSpan={2}>Grand Total</td><td className="n">{aed2(total + vat)}</td></tr>
        </tbody>
      </table>
      <section className="terms">
        <h2>General Terms and Conditions</h2>
        <p><b>Payment schedule:</b> {b.boq.payment_terms ?? "30% advance, 70% on progress"}</p>
        <ul>{(b.boq.terms ?? []).map((t, i) => <li key={i}>{t}</li>)}</ul>
      </section>
    </div>
  );
}
