"use client";
import { useActionState, useState } from "react";
import { ALL, QUOTE_STAGES, WAITING_ON, SCOPES, title, fmtD, type Project, type Person, type Contractor } from "@/lib/model";
import { saveProject, createProject } from "@/app/actions";

type Props = { project?: Project | null; people: Person[]; contractors: Contractor[]; estimationOnly?: boolean; watchers?: string[] };

export default function ProjectForm({ project, people, contractors, estimationOnly = false, watchers = [] }: Props) {
  const lock = estimationOnly; // estimators: pricing fields only
  const action = project ? saveProject.bind(null, project.id) : createProject;
  const [state, formAction, pending] = useActionState(action, null as { error?: string; ok?: boolean; at?: string } | null);
  const pms = people.filter((p) => p.role === "PM" || p.role === "MANAGEMENT");
  const siteEngs = people.filter((p) => p.role === "SITE" || p.role === "PM");
  const estimators = people.filter((p) => p.role === "QS" || p.role === "ADMIN" || p.role === "MANAGEMENT");
  const v = (k: keyof Project) => (project?.[k] ?? "") as string;
  const [target, setTarget] = useState(v("target_date"));
  const [tagged, setTagged] = useState<Set<string>>(new Set(watchers));
  const targetChanged = !!project && target !== v("target_date");
  const nextRev = (project?.target_rev ?? -1) + 1;
  return (
    <form action={formAction} className="form">
      <div className="field wide"><label htmlFor="name">Project name</label><input id="name" name="name" required defaultValue={v("name")} placeholder="e.g. MEADOWS 5, ST3, V1" /></div>
      <div className="field"><label htmlFor="enquiry_no">Enquiry no.</label><input id="enquiry_no" name="enquiry_no" defaultValue={v("enquiry_no")} placeholder="BBC/102026/00113" /></div>
      <div className="field"><label htmlFor="client">Client</label><input id="client" name="client" defaultValue={v("client")} /></div>
      <div className="field"><label htmlFor="contractor_id">Main contractor</label>
        <select id="contractor_id" name="contractor_id" defaultValue={v("contractor_id")}><option value="">—</option>{contractors.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}</select></div>
      <div className="field"><label htmlFor="status">Status</label>
        <select id="status" name="status" disabled={lock} defaultValue={project?.status ?? "PENDING"}>{ALL.map(([k, l]) => <option key={k} value={k}>{l}</option>)}</select></div>
      <div className="field"><label htmlFor="pm_id">Project manager</label>
        <select id="pm_id" name="pm_id" disabled={lock} defaultValue={v("pm_id")}><option value="">Unassigned</option>{pms.map((p) => <option key={p.id} value={p.id}>{title(p.name)}</option>)}</select></div>
      <div className="field"><label htmlFor="pm2_id">Second PM (optional)</label>
        <select id="pm2_id" name="pm2_id" disabled={lock} defaultValue={v("pm2_id")}><option value="">—</option>{pms.map((p) => <option key={p.id} value={p.id}>{title(p.name)}</option>)}</select></div>
      <div className="field"><label htmlFor="site_engineer_id">Site engineer</label>
        <select id="site_engineer_id" name="site_engineer_id" disabled={lock} defaultValue={v("site_engineer_id")}><option value="">—</option>{siteEngs.map((p) => <option key={p.id} value={p.id}>{title(p.name)}</option>)}</select></div>
      {!lock && (
        <div className="field wide tagged">
          <label>Also keep updated <small>(anyone else who should get this project’s update emails)</small></label>
          <input type="hidden" name="watchers_present" value="1" />
          <div className="chips">
            {people.filter((p) => p.is_active && p.email).map((p) => (
              <label key={p.id} className={"chip" + (tagged.has(p.id) ? " on" : "")}>
                <input type="checkbox" name="watchers" value={p.id} checked={tagged.has(p.id)}
                  onChange={(e) => setTagged((s2) => { const n = new Set(s2); if (e.target.checked) n.add(p.id); else n.delete(p.id); return n; })} />
                {title(p.name)}
              </label>
            ))}
          </div>
          <small className="note">The PM, second PM and site engineer are always included — no need to tag them.</small>
        </div>
      )}
      <div className="field"><label htmlFor="signed_quote">Signed quote (AED inc. VAT)</label><input id="signed_quote" name="signed_quote" disabled={lock} inputMode="decimal" defaultValue={project?.signed_quote ?? ""} /></div>
      <div className="field"><label htmlFor="received_date">Enquiry received</label><input id="received_date" name="received_date" type="date" defaultValue={v("received_date")} /></div>
      <div className="field"><label htmlFor="start_date">Project start <small>(date payment received)</small></label><input id="start_date" name="start_date" disabled={lock} type="date" defaultValue={v("start_date")} /></div>
      <div className="field"><label htmlFor="target_date">Target completion <small>(from the programme)</small></label><input id="target_date" name="target_date" disabled={lock} type="date" value={target} onChange={(e) => setTarget(e.target.value)} />
        {project?.target_rev != null && project.target_rev > 0 && !targetChanged && <small className="revnote">Rev {project.target_rev} · originally {fmtD(project.target_rev0_date)}</small>}</div>
      {targetChanged && (
        <div className="field wide revreason"><label htmlFor="target_change_reason">Why is the target changing? <small>(becomes Rev {nextRev})</small></label>
          <input id="target_change_reason" name="target_change_reason" placeholder="e.g. client added the garden works, NOC delayed six weeks" /></div>
      )}
      <div className="field"><label htmlFor="completed_date">Date completed</label><input id="completed_date" name="completed_date" disabled={lock} type="date" defaultValue={v("completed_date")} /></div>
      <div className="field wide sep"><span className="sectionlabel">Pricing</span></div>
      <div className="field"><label htmlFor="quote_stage">Pricing stage</label>
        <select id="quote_stage" name="quote_stage" defaultValue={project?.quote_stage ?? "QUEUED"}>{QUOTE_STAGES.map(([k, l]) => <option key={k} value={k}>{l}</option>)}</select></div>
      <div className="field"><label htmlFor="estimator_id">QS</label>
        <select id="estimator_id" name="estimator_id" defaultValue={v("estimator_id")}><option value="">—</option>{estimators.map((p) => <option key={p.id} value={p.id}>{title(p.name)}</option>)}</select></div>
      <div className="field"><label htmlFor="quote_type">Quote type</label><input id="quote_type" name="quote_type" defaultValue={v("quote_type")} placeholder="FULL QUOTE / VARIATION / OPTION …" /></div>
      <div className="field"><label>Scope</label><div className="checks">{SCOPES.map((s) => <label key={s}><input type="checkbox" name="scope" value={s} defaultChecked={(project?.scope ?? "").split(", ").includes(s)} /> {s}</label>)}</div></div>
      <div className="field"><label htmlFor="waiting_on">Waiting on</label>
        <select id="waiting_on" name="waiting_on" defaultValue={v("waiting_on")}><option value="">—</option>{WAITING_ON.map((w) => <option key={w} value={w}>{w}</option>)}</select></div>
      <div className="field"><label htmlFor="raised_by">Raised by <small>(who sent it in)</small></label><input id="raised_by" name="raised_by" defaultValue={v("raised_by")} /></div>
      <div className="field"><label htmlFor="quoted_value">Quoted value (AED inc. VAT)</label><input id="quoted_value" name="quoted_value" inputMode="decimal" defaultValue={project?.quoted_value ?? ""} /></div>
      <div className="field"><label htmlFor="quote_due_date">Quote due</label><input id="quote_due_date" name="quote_due_date" type="date" defaultValue={v("quote_due_date")} /></div>
      <div className="field"><label htmlFor="quote_submitted_date">Quote submitted</label><input id="quote_submitted_date" name="quote_submitted_date" type="date" defaultValue={v("quote_submitted_date")} /></div>
      <div className="field"><label htmlFor="folder_path">Folder on the U: drive</label><input id="folder_path" name="folder_path" defaultValue={v("folder_path")} /></div>
      <div className="field wide"><label htmlFor="notes">Notes</label><textarea id="notes" name="notes" rows={3} defaultValue={v("notes")} /></div>
      <div className="actions">
        <button className="btn" disabled={pending}>{pending ? "Saving…" : project ? "Save changes" : "Create project"}</button>
        {state?.error && <span className="msg err">{state.error}</span>}
        {state?.ok && <span className="msg">Saved</span>}
      </div>
    </form>
  );
}
