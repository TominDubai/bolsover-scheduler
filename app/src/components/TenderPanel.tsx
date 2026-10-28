"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { aed, fmtD, title, QUOTE_LABEL, SOURCE_LABEL, dueTone, type Project, type EnquiryPass } from "@/lib/model";
import { passEnquiry } from "@/app/actions";

type PersonLite = { id: string; name: string };

/** The quote side of a project page: tender details, who holds the ball, and the pass log (db/017). */
export default function TenderPanel({ p, passes, people, canPass }: { p: Project; passes: EnquiryPass[]; people: PersonLite[]; canPass: boolean }) {
  const router = useRouter();
  const [to, setTo] = useState("");
  const [note, setNote] = useState("");
  const [err, setErr] = useState<string | null>(null);
  const [pending, start] = useTransition();
  const dd = dueTone(p.quote_due_date);
  const fmtWhen = (iso: string) => new Date(iso).toLocaleString("en-GB", { timeZone: "Asia/Dubai", day: "numeric", month: "short", hour: "2-digit", minute: "2-digit" });
  const submit = () => start(async () => {
    const r = await passEnquiry(p.id, to || null, note || null);
    if (r?.error) setErr(r.error); else { setErr(null); setTo(""); setNote(""); router.refresh(); }
  });
  return (
    <div className="panel">
      <h2>Tender</h2>
      <dl>
        <dt>Stage</dt><dd>{QUOTE_LABEL[p.quote_stage]}{p.qualified_at && <small> · approved to price {fmtD(p.qualified_at)}</small>}</dd>
        <dt>Ball with</dt><dd>{p.ball_with_name ? <>{title(p.ball_with_name)}{p.ball_since && <small> · since {fmtD(p.ball_since)}</small>}{p.ball_note && <div className="note">{p.ball_note}</div>}</> : <i style={{ color: "var(--fg3)" }}>nobody — pass it to someone</i>}</dd>
        <dt>QS</dt><dd>{p.estimator ? title(p.estimator) : "—"}</dd>
        <dt>Quote deadline</dt><dd>{fmtD(p.quote_due_date)}{dd && p.quote_stage !== "SUBMITTED" && <span className={`pill ${dd.tone}`}>{dd.d < 0 ? `${-dd.d}d overdue` : dd.d === 0 ? "today" : `${dd.d}d left`}</span>}</dd>
        <dt>Quoted value</dt><dd>{aed(p.quoted_value)}{p.boq_margin_pct != null && <small> · {p.boq_margin_pct}% margin on the bill</small>}</dd>
        <dt>Site visit</dt><dd>{p.site_visit_date ? `${fmtD(p.site_visit_date)}${p.site_visit_by_name ? ` · ${title(p.site_visit_by_name)}` : ""}` : "—"}</dd>
        <dt>Submit by</dt><dd>{p.submit_via ?? "—"}{p.quote_submitted_date && <small> · sent {fmtD(p.quote_submitted_date)}</small>}</dd>
        <dt>Type</dt><dd>{p.project_type ?? "—"}{p.scope ? <small> · {p.scope}</small> : null}</dd>
        <dt>Client address</dt><dd>{p.client_address ?? "—"}</dd>
        <dt>Consultant</dt><dd>{p.consultant ?? "—"}</dd>
        <dt>Source</dt><dd>{p.source ? `${SOURCE_LABEL[p.source] ?? p.source}${p.source_name ? ` · ${p.source_name}` : ""}` : "—"}</dd>
        {p.parent_project_id && <><dt>VO on</dt><dd>{p.parent_enquiry_no ?? ""} {title(p.parent_name)}</dd></>}
        {p.outcome_reason && <><dt>Outcome</dt><dd>{p.outcome_reason}</dd></>}
      </dl>
      {canPass && (
        <div className="passform">
          <select value={to} onChange={(e) => setTo(e.target.value)} aria-label="Pass to"><option value="">Pass to…</option>{people.filter((x) => x.id !== p.ball_with).map((x) => <option key={x.id} value={x.id}>{title(x.name)}</option>)}</select>
          <input value={note} onChange={(e) => setNote(e.target.value)} placeholder="what you need from them" aria-label="Pass note" />
          <button className="btn sm" disabled={!to || pending} onClick={submit}>{pending ? "Passing…" : "Pass"}</button>
        </div>
      )}
      {err && <span className="msg err">{err}</span>}
      {passes.length > 0 && (
        <ul className="hist">
          {passes.map((x) => (
            <li key={x.id}><time>{fmtWhen(x.passed_at)}</time>
              <span className="by">{x.from?.name ? title(x.from.name) : "—"} → {x.to?.name ? title(x.to.name) : "nobody"}{x.note ? ` — ${x.note}` : ""}</span></li>
          ))}
        </ul>
      )}
    </div>
  );
}
