import Link from "next/link";
import { notFound } from "next/navigation";
import Shell from "@/components/Shell";
import Failed from "@/components/Failed";
import BoqSheet from "@/components/BoqSheet";
import BoqStatus from "@/components/BoqStatus";
import { getProject, getMe } from "@/lib/data";
import { getBoq, canSeeCost, BOQ_STATUS_LABEL, BOQ_STATUS_TONE } from "@/lib/boq";
import { createClient } from "@/lib/supabase/server";
import { fmtD, isQuote, title, type Person } from "@/lib/model";

export const dynamic = "force-dynamic";

async function Inner({ params }: { params: Promise<{ id: string; boqId: string }> }) {
  const { id, boqId } = await params;
  const supabase = await createClient();
  const [p, me, b, { data: meRow }] = await Promise.all([getProject(id), getMe(), getBoq(boqId), supabase.rpc("me")]);
  if (!p || !b || b.boq.project_id !== id) notFound();
  const person = meRow as Person | null;
  const canEdit = (me.canProjects || (me.canEstimation && (isQuote(p.status) || b.boq.kind === "VARIATION"))) && b.boq.status !== "SUPERSEDED";
  const canProgress = b.boq.status === "APPROVED" && (me.canProjects || [p.pm_id, p.pm2_id, p.site_engineer_id].includes(me.id));
  const label = b.boq.kind === "QUOTE" ? `Quote rev${String(b.boq.rev_no).padStart(2, "0")}` : "Variation";
  return (
    <Shell>
      <div className="page wide">
        <div className="crumbs"><Link href="/board">Board</Link> / <Link href={`/projects/${id}`}>{p.enquiry_no ?? title(p.name)}</Link> / <span className="enq">{label}</span></div>
        <div className="head">
          <div><h1>{b.boq.title}</h1><div className="client">{title(p.client)} · {b.boq.quote_ref ?? "no quote ref"} · {fmtD(b.boq.issue_date)}{b.boq.source_file ? ` · imported from ${b.boq.source_file}` : ""}</div></div>
          <div style={{ display: "flex", gap: 8, alignItems: "center", flexWrap: "wrap" }}>
            <span className={`pill ${BOQ_STATUS_TONE[b.boq.status]}`}>{BOQ_STATUS_LABEL[b.boq.status]}</span>
            <Link href={`/projects/${id}/boq/${boqId}/print`} className="btn sm ghost" target="_blank">Client copy (PDF)</Link>
            {(me.canProjects || me.canEstimation) && <BoqStatus projectId={id} boq={b.boq} />}
          </div>
        </div>
        <BoqSheet projectId={id} boq={b.boq} sections={b.sections} items={b.items} canEdit={canEdit} canProgress={canProgress} showCost={canSeeCost(person)} />
        {b.boq.terms && b.boq.terms.length > 0 && (
          <div className="panel"><h2>Terms</h2><p className="note">Payment: {b.boq.payment_terms}</p><ul className="terms">{b.boq.terms.map((t, i) => <li key={i}>{t}</li>)}</ul></div>
        )}
      </div>
    </Shell>
  );
}
export default async function Page(props: Parameters<typeof Inner>[0]) {
  try { return await Inner(props); }
  catch (e) { if (e && typeof e === "object" && "digest" in e && String((e as { digest?: string }).digest).startsWith("NEXT_")) throw e; return <Shell><Failed what="this bill" error={e} /></Shell>; }
}
