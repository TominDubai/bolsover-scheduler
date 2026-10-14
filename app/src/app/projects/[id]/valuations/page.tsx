import Link from "next/link";
import { notFound } from "next/navigation";
import Shell from "@/components/Shell";
import Failed from "@/components/Failed";
import NewValuation from "@/components/NewValuation";
import { getProject, getMe } from "@/lib/data";
import { getValuations, getContract, aed2, pct } from "@/lib/boq";
import { aed, fmtD, title } from "@/lib/model";

export const dynamic = "force-dynamic";
const TONE: Record<string, string> = { DRAFT: "none", ISSUED: "soon", CERTIFIED: "ok", PAID: "done" };

async function Inner({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const [p, me, vals, c] = await Promise.all([getProject(id), getMe(), getValuations(id), getContract(id)]);
  if (!p) notFound();
  const last = vals[vals.length - 1];
  const vat = 1 + (last?.vat_pct ?? 5) / 100;
  return (
    <Shell>
      <div className="page narrow">
        <div className="crumbs"><Link href="/board">Board</Link> / <Link href={`/projects/${id}`}>{p.enquiry_no ?? title(p.name)}</Link> / <span className="enq">Valuations</span></div>
        <div className="head"><div><h1>{title(p.name)}</h1><div className="client">Progress billing reports · contract {aed(c.contract_value)} ex VAT · {pct(c.installed_pct)} installed</div></div></div>
        <div className="panel">
          <h2>Statement</h2>
          <dl>
            <dt>Contract (inc VAT)</dt><dd>{aed2(c.contract_value * vat)}</dd>
            <dt>Installed to date (inc VAT)</dt><dd>{aed2(c.installed_value * vat)} <small>{pct(c.installed_pct)}</small></dd>
            <dt>Billed to date</dt><dd>{aed2(vals.reduce((s, v) => s + v.amount_due, 0))} <small>{vals.length} report{vals.length === 1 ? "" : "s"}</small></dd>
            <dt>Paid to date</dt><dd>{aed2(vals.reduce((s, v) => s + (v.paid_amount ?? 0), 0) + (last?.deposit_received ?? 0))} <small>incl. advance {aed2(last?.deposit_received ?? 0)}</small></dd>
          </dl>
        </div>
        <div className="panel">
          <h2>Reports</h2>
          {vals.length === 0 ? <span className="note">None yet.</span> : (
            <div className="boqlist">
              {vals.map((v) => (
                <Link key={v.id} href={`/projects/${id}/valuations/${v.id}`} className="boqrow">
                  <b>no. {v.no}</b>
                  <span className="t">{fmtD(v.period_from)} → {fmtD(v.period_to)}<small>installed {aed(v.installed_value)} · this period {aed(v.installed_value - v.prev_installed)} ex VAT</small></span>
                  <span className={`pill ${TONE[v.status]}`}>{v.status.toLowerCase()}</span>
                  <span className="amt">{aed(v.amount_due)}</span>
                </Link>
              ))}
            </div>
          )}
          {me.canProjects && c.approved_boqs > 0 && <NewValuation projectId={id} nextNo={(last?.no ?? 0) + 1} lastDeposit={last?.deposit_received ?? Math.round(c.contract_value * vat * 0.3 * 100) / 100} />}
        </div>
      </div>
    </Shell>
  );
}
export default async function Page(props: Parameters<typeof Inner>[0]) {
  try { return await Inner(props); }
  catch (e) { if (e && typeof e === "object" && "digest" in e && String((e as { digest?: string }).digest).startsWith("NEXT_")) throw e; return <Shell><Failed what="valuations" error={e} /></Shell>; }
}
