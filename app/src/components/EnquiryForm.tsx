"use client";
import { useActionState, useState } from "react";
import Link from "next/link";
import { title, SCOPES, SOURCES, SOURCE_NAMED, PROJECT_TYPES, SUBMIT_VIA, type Person, type Contractor } from "@/lib/model";
import { createEnquiry } from "@/app/actions";

type ProjectLite = { id: string; name: string; enquiry_no: string | null };

/** New enquiry (Estimation tab). Lands in Qualifying for management to proceed / decline (Tom, 28 Oct 2026).
 *  Tender fields from db/017: source (+ who), consultant, client address, project type, site visit, submit via. */
export default function EnquiryForm({ nextNo, people, contractors, liveProjects }: { nextNo: string; people: Person[]; contractors: Contractor[]; liveProjects: ProjectLite[] }) {
  const [open, setOpen] = useState(false);
  const [seen, setSeen] = useState<string | null>(null); // last success already acknowledged
  const [source, setSource] = useState("");
  const [isVo, setIsVo] = useState(false);
  const [state, formAction, pending] = useActionState(createEnquiry, null as { error?: string; ok?: boolean; enquiry_no?: string; id?: string } | null);
  const estimators = people.filter((p) => p.role === "QS" || p.role === "ADMIN" || p.role === "MANAGEMENT");
  const visitors = people.filter((p) => p.role === "QS" || p.role === "PM" || p.role === "SITE" || p.role === "MANAGEMENT");
  const today = new Date().toISOString().slice(0, 10);
  if (state?.ok && seen !== state.id) {
    return <div className="newenq"><span className="msg">Enquiry <b>{state.enquiry_no}</b> added — it&rsquo;s in Qualifying. <Link href={`/projects/${state.id}`}>Open it</Link> or </span><button className="btn sm bronze" onClick={() => { setSeen(state.id!); setOpen(true); }}>+ Another enquiry</button></div>;
  }
  if (!open) return <div className="newenq"><button className="btn bronze" onClick={() => setOpen(true)}>+ New enquiry</button><span className="hint">Next number: <b>{nextNo}</b></span></div>;
  return (
    <form action={formAction} className="panel enqform">
      <h2>New enquiry</h2>
      <div className="form">
        <div className="field"><label htmlFor="enquiry_no">Enquiry no.</label><input id="enquiry_no" name="enquiry_no" defaultValue={nextNo} /></div>
        <div className="field"><label htmlFor="received_date">Received</label><input id="received_date" name="received_date" type="date" defaultValue={today} /></div>
        <div className="field wide"><label htmlFor="name">Project (location / address)</label><input id="name" name="name" required placeholder="e.g. VILLA 12, JUMEIRAH ISLANDS CLUSTER 4" /></div>
        <div className="field"><label htmlFor="client">Client</label><input id="client" name="client" /></div>
        <div className="field"><label htmlFor="client_address">Client address</label><input id="client_address" name="client_address" placeholder="where the client lives / is based" /></div>
        <div className="field"><label htmlFor="project_type">Type of project</label>
          <select id="project_type" name="project_type" defaultValue=""><option value="">—</option>{PROJECT_TYPES.map((t) => <option key={t} value={t}>{t}</option>)}</select></div>
        <div className="field"><label htmlFor="consultant">Consultant / designer firm</label><input id="consultant" name="consultant" placeholder="if there is one" /></div>
        <div className="field"><label htmlFor="source">How it came in</label>
          <select id="source" name="source" value={source} onChange={(e) => setSource(e.target.value)}><option value="">—</option>{SOURCES.map(([k, l]) => <option key={k} value={k}>{l}</option>)}</select></div>
        <div className="field"><label htmlFor="source_name">{source === "DESIGNER" ? "Which designer" : source === "REFERRAL" ? "Referred by" : "Who / where"}</label>
          <input id="source_name" name="source_name" disabled={!SOURCE_NAMED.has(source)} placeholder={source === "DESIGNER" ? "designer's name" : source === "REFERRAL" ? "who referred them" : "—"} /></div>
        <div className="field"><label htmlFor="contractor_id">Main contractor</label>
          <select id="contractor_id" name="contractor_id" defaultValue=""><option value="">— / Direct</option>{contractors.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}</select></div>
        <div className="field"><label htmlFor="estimator_id">QS</label>
          <select id="estimator_id" name="estimator_id" defaultValue={estimators.find((p) => p.role === "QS")?.id ?? ""}><option value="">—</option>{estimators.map((p) => <option key={p.id} value={p.id}>{title(p.name)}</option>)}</select></div>
        <div className="field"><label htmlFor="quote_type">Quote type</label><input id="quote_type" name="quote_type" list="quote-types" placeholder="FULL QUOTE / VARIATION / OPTION …" /><datalist id="quote-types"><option value="FULL QUOTE" /><option value="VARIATION" /><option value="ADDITIONAL WORK" /><option value="OPTION" /><option value="REVISED" /></datalist></div>
        <div className="field"><label>Scope</label><div className="checks">{SCOPES.map((s) => <label key={s}><input type="checkbox" name="scope" value={s} defaultChecked={s === "Fit-out"} /> {s}</label>)}</div></div>
        <div className="field wide vo-link">
          <label><input type="checkbox" checked={isVo} onChange={(e) => setIsVo(e.target.checked)} /> This is a VO on a live job</label>
          {isVo && <select name="parent_project_id" defaultValue="" required><option value="">Pick the project…</option>{liveProjects.map((p) => <option key={p.id} value={p.id}>{p.enquiry_no ? `${p.enquiry_no} · ` : ""}{title(p.name)}</option>)}</select>}
          {isVo && <small className="hint">When it&rsquo;s won it becomes the next VO on that project instead of a project of its own.</small>}
        </div>
        <div className="field"><label htmlFor="site_visit_date">Site visit</label><input id="site_visit_date" name="site_visit_date" type="date" /></div>
        <div className="field"><label htmlFor="site_visit_by">Site visit by</label>
          <select id="site_visit_by" name="site_visit_by" defaultValue=""><option value="">—</option>{visitors.map((p) => <option key={p.id} value={p.id}>{title(p.name)}</option>)}</select></div>
        <div className="field"><label htmlFor="quote_due_date">Quote deadline</label><input id="quote_due_date" name="quote_due_date" type="date" /></div>
        <div className="field"><label>Submit by</label><div className="checks">{SUBMIT_VIA.map((s) => <label key={s}><input type="checkbox" name="submit_via" value={s} defaultChecked={s === "Email"} /> {s}</label>)}</div></div>
        <div className="field"><label htmlFor="raised_by">Raised by <small>(who sent it in)</small></label><input id="raised_by" name="raised_by" /></div>
        <div className="field wide"><label htmlFor="folder_path">Folder on the U: drive</label><input id="folder_path" name="folder_path" placeholder="U:\Quotations\2026\..." /></div>
        <div className="field wide"><label htmlFor="notes">Notes</label><textarea id="notes" name="notes" rows={2} /></div>
        <div className="actions">
          <button className="btn" disabled={pending}>{pending ? "Adding…" : "Add enquiry"}</button>
          <button type="button" className="btn ghost" onClick={() => setOpen(false)}>Cancel</button>
          {state?.error && <span className="msg err">{state.error}</span>}
        </div>
      </div>
    </form>
  );
}
