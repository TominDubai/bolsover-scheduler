import Shell from "@/components/Shell";
import Failed from "@/components/Failed";
import EstimationBoard from "@/components/EstimationBoard";
import EnquiryForm from "@/components/EnquiryForm";
import { getProjects, getPeople, getContractors, getMe } from "@/lib/data";
import { createClient } from "@/lib/supabase/server";
import { isQuote, isDead, byEnq } from "@/lib/model";

export const dynamic = "force-dynamic";

async function Inner_EstimationPage() {
  const supabase = await createClient();
  const [all, people, contractors, me, { data: nextNo }] = await Promise.all([getProjects(), getPeople(), getContractors(), getMe(), supabase.rpc("next_enquiry_no")]);
  const quotes = all.filter((p) => isQuote(p.status)).sort(byEnq);
  const qualifying = quotes.filter((p) => p.quote_stage === "QUALIFYING");
  const open = quotes.filter((p) => p.quote_stage !== "SUBMITTED" && p.quote_stage !== "QUALIFYING");
  const submitted = quotes.filter((p) => p.quote_stage === "SUBMITTED");
  // live jobs a VO enquiry can belong to
  const liveProjects = all.filter((p) => !isQuote(p.status) && !isDead(p.status) && p.status !== "COMPLETED" && !p.archived_at).sort(byEnq).map((p) => ({ id: p.id, name: p.name, enquiry_no: p.enquiry_no }));
  const canQualify = me.isAdmin || me.role === "MANAGEMENT";
  const oldest = open.reduce((m, p) => Math.max(m, p.days_since_enquiry ?? 0), 0);
  const wonThisYear = all.filter((p) => !isQuote(p.status) && !isDead(p.status) && (p.received_date ?? "") >= `${new Date().getFullYear()}-01-01`).length;
  return (
    <Shell active="estimation">
      <section className="summary">
        <div className="stats">
          <div className={`stat${qualifying.length ? " warn" : ""}`}><b>{qualifying.length}</b><span>waiting for a decision</span></div>
          <div className="stat"><b>{open.length}</b><span>being priced</span></div>
          <div className="stat"><b>{submitted.length}</b><span>submitted, awaiting decision</span></div>
          <div className={`stat${oldest > 21 ? " crit" : ""}`}><b>{oldest}d</b><span>oldest open enquiry</span></div>
          <div className="stat"><b>{wonThisYear}</b><span>won this year</span></div>
        </div>
        {me.canEstimation && <EnquiryForm nextNo={(nextNo as string) ?? ""} people={people} contractors={contractors} liveProjects={liveProjects} />}
      </section>
      <main><EstimationBoard key={all.map((p) => p.updated_at).join()} projects={quotes} people={people.map((p) => ({ id: p.id, name: p.name }))} canEdit={me.canEstimation} canQualify={canQualify} myId={me.id} /></main>
    </Shell>
  );
}

export default async function EstimationPage() {
  try { return await Inner_EstimationPage(); }
  catch (e) {
    if (e && typeof e === "object" && "digest" in e && String((e as { digest?: string }).digest).startsWith("NEXT_")) throw e; // redirects / notFound pass through
    return <Shell><Failed what="estimation" error={e} /></Shell>;
  }
}
