"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { QUOTE_STAGES, WAITING_ON, SOURCE_LABEL, aedS, fmtDShort, title, ini, dueTone, type Project, type QuoteStage } from "@/lib/model";
import { saveWaitingOn, setQuoteStage, markWon, markLost, qualify, passEnquiry } from "@/app/actions";

type PersonLite = { id: string; name: string };

/** The tender pipeline (db/017). Qualifying → Queued → Being priced → Waiting on info → Submitted.
 *  canQualify = management: proceed / decline on the first column. canEdit = estimation rights (the QS). */
export default function EstimationBoard({ projects, people, canEdit, canQualify, myId }: { projects: Project[]; people: PersonLite[]; canEdit: boolean; canQualify: boolean; myId: string | null }) {
  const router = useRouter();
  const [rows, setRows] = useState(projects);
  const [dragId, setDragId] = useState<string | null>(null);
  const [over, setOver] = useState<QuoteStage | null>(null);
  const [pending, start] = useTransition();
  const [err, setErr] = useState<string | null>(null);
  const [passing, setPassing] = useState<string | null>(null); // card showing the pass picker

  function run(prev: Project[], fn: () => Promise<{ error?: string } | undefined | null>) {
    start(async () => {
      const res = await fn();
      if (res?.error) { setRows(prev); setErr(res.error); } else { setErr(null); router.refresh(); }
    });
  }
  function drop(stage: QuoteStage) {
    if (!dragId || !canEdit) return;
    const p = rows.find((r) => r.id === dragId);
    setOver(null); setDragId(null);
    if (!p || p.quote_stage === stage) return;
    if (p.quote_stage === "QUALIFYING" && !canQualify) { setErr("Management proceed or decline an enquiry before it can be priced."); return; }
    if (stage === "QUALIFYING") { setErr("Once an enquiry has been approved it doesn't go back to Qualifying."); return; }
    const prev = rows;
    setRows(rows.map((r) => (r.id === dragId ? { ...r, quote_stage: stage } : r)));
    run(prev, () => setQuoteStage(p.id, stage));
  }
  function decide(p: Project, won: boolean) {
    const reason = prompt(won ? `Won — any note on why? (optional)` : `Lost — why? (goes on the record)`);
    if (reason === null) return;
    const prev = rows;
    setRows(rows.filter((r) => r.id !== p.id));
    run(prev, () => won ? markWon(p.id, reason || null) : markLost(p.id, reason || null));
  }
  function qualifyCard(p: Project, proceed: boolean) {
    const reason = proceed ? null : prompt("Decline — why? (goes on the record)");
    if (!proceed && reason === null) return;
    const prev = rows;
    setRows(proceed ? rows.map((r) => (r.id === p.id ? { ...r, quote_stage: "QUEUED", ball_with: p.estimator_id, ball_with_name: p.estimator } : r)) : rows.filter((r) => r.id !== p.id));
    run(prev, () => qualify(p.id, proceed, reason || null));
  }
  function pass(p: Project, to: string) {
    const who = people.find((x) => x.id === to);
    const note = prompt(`Pass to ${title(who?.name)} — what do you need from them? (optional)`);
    if (note === null) return;
    setPassing(null);
    const prev = rows;
    setRows(rows.map((r) => (r.id === p.id ? { ...r, ball_with: to || null, ball_with_name: who?.name ?? null } : r)));
    run(prev, () => passEnquiry(p.id, to || null, note || null));
  }

  return (
    <>
      {err && <div className="msg err" style={{ padding: "0 24px" }}>Couldn’t save that change: {err}</div>}
      <div className="board" aria-busy={pending}>
        {QUOTE_STAGES.map(([k, l]) => {
          const items = rows.filter((p) => p.quote_stage === k).sort((a, b) => (b.days_since_enquiry ?? 0) - (a.days_since_enquiry ?? 0));
          return (
            <section key={k} className={`col${over === k ? " over" : ""}`}
              onDragOver={(e) => { e.preventDefault(); if (over !== k) setOver(k); }} onDragLeave={() => setOver(null)} onDrop={() => drop(k)}>
              <header><h2>{l}</h2><span className="count">{items.length}</span></header>
              <div className="cards">
                {items.length === 0 && <div className="empty">{k === "QUALIFYING" ? "Nothing waiting for a decision" : canEdit ? "Drop an enquiry here" : "Nothing here"}</div>}
                {items.map((p) => {
                  const age = p.days_since_enquiry ?? 0;
                  const t = k === "SUBMITTED" ? "done" : k === "QUALIFYING" ? (age > 3 ? "warn" : "ok") : age > 21 ? "crit" : age > 10 ? "warn" : "ok";
                  const dd = dueTone(p.quote_due_date); const due = dd?.d ?? null;
                  const mine = !!myId && p.ball_with === myId;
                  const vis = p.site_visit_date ? dueTone(p.site_visit_date) : null;
                  return (
                    <article key={p.id} className={`card ${t}${dragId === p.id ? " dragging" : ""}${mine ? " mine" : ""}`} draggable={canEdit && k !== "QUALIFYING"}
                      onDragStart={() => setDragId(p.id)} onDragEnd={() => { setDragId(null); setOver(null); }}
                      tabIndex={0} role="link" onClick={() => router.push(`/projects/${p.id}`)} onKeyDown={(e) => e.key === "Enter" && router.push(`/projects/${p.id}`)}>
                      <div className="card-top"><span className="enq">{p.enquiry_no ?? "—"}</span>
                        <span className={`pill ${t}`}>{k === "SUBMITTED" ? `Sent ${fmtDShort(p.quote_submitted_date)}` : `${age}d in`}</span></div>
                      <h3>{title(p.name)}{p.quote_type && <span className="qtype">{p.quote_type}</span>}{p.parent_project_id && <span className="qtype vo">VO on {p.parent_enquiry_no ?? title(p.parent_name)}</span>}</h3>
                      <div className="client">{title(p.client)}{p.project_type ? ` · ${p.project_type}` : ""}{p.contractor ? ` · ${p.contractor}` : ""}</div>
                      {(p.source || p.consultant) && <div className="meta">{p.source ? `${SOURCE_LABEL[p.source] ?? p.source}${p.source_name ? ` · ${p.source_name}` : ""}` : ""}{p.source && p.consultant ? " · " : ""}{p.consultant ? `via ${p.consultant}` : ""}</div>}
                      <div className="card-foot">
                        <span className="who" title={p.ball_with_name ? `Ball with ${title(p.ball_with_name)}${p.ball_note ? ` — ${p.ball_note}` : ""}` : "Nobody holds the ball"}><b className={"av" + (mine ? " mine" : "")}>{ini(p.ball_with_name ?? p.estimator)}</b>{p.ball_with_name ? `${title(p.ball_with_name)}${mine ? " (you)" : ""}` : p.estimator ? `${title(p.estimator)} (QS)` : "No QS"}</span>
                        <span className="val">{p.quoted_value ? aedS(p.quoted_value) : "—"}{p.boq_margin_pct != null && <small className="margin"> · {p.boq_margin_pct}%</small>}</span>
                      </div>
                      <div className="dates"><span>{vis ? <span className={`due ${vis.d < 0 ? "ok" : vis.tone}`}>Site visit {fmtDShort(p.site_visit_date)}{p.site_visit_by_name ? ` · ${title(p.site_visit_by_name)}` : ""}</span> : p.received_date ? `Received ${fmtDShort(p.received_date)}` : p.raised_by ? `From ${title(p.raised_by)}` : ""}</span>
                        <span className={dd ? `due ${dd.tone}` : ""}>{due == null ? (k === "SUBMITTED" ? "" : "No deadline") : due < 0 ? `Due ${-due}d ago` : due === 0 ? "Due today" : `Due in ${due}d`}</span></div>
                      {k === "AWAITING_SUPPLIER" && (canEdit
                        ? <select className="waiting" value={p.waiting_on ?? ""} onClick={(e) => e.stopPropagation()} onChange={(e) => { const w = e.target.value || null; setRows((rs) => rs.map((r) => r.id === p.id ? { ...r, waiting_on: w } : r)); start(async () => { await saveWaitingOn(p.id, w); }); }}>
                            <option value="">Waiting on…</option>{WAITING_ON.map((w) => <option key={w} value={w}>{w}</option>)}</select>
                        : <div className="waiting-ro">{p.waiting_on ? `Waiting on ${p.waiting_on.toLowerCase()}` : "Waiting on…"}</div>)}
                      {k === "QUALIFYING" && canQualify && (
                        <div className="decide" onClick={(e) => e.stopPropagation()}>
                          <button className="btn sm" onClick={() => qualifyCard(p, true)}>Proceed → price it</button>
                          <button className="btn sm danger" onClick={() => qualifyCard(p, false)}>Decline</button>
                        </div>
                      )}
                      {k === "SUBMITTED" && canEdit && (
                        <div className="decide" onClick={(e) => e.stopPropagation()}>
                          <button className="btn sm" onClick={() => decide(p, true)}>{p.parent_project_id ? "Won → VO" : "Won"}</button>
                          <button className="btn sm danger" onClick={() => decide(p, false)}>Lost</button>
                        </div>
                      )}
                      {(canEdit || canQualify || mine) && k !== "QUALIFYING" && (
                        <div className="passrow" onClick={(e) => e.stopPropagation()}>
                          {passing === p.id
                            ? <select className="waiting" autoFocus defaultValue="" onBlur={() => setPassing(null)} onChange={(e) => e.target.value && pass(p, e.target.value)}>
                                <option value="">Pass to…</option>{people.filter((x) => x.id !== p.ball_with).map((x) => <option key={x.id} value={x.id}>{title(x.name)}</option>)}</select>
                            : <button className="link" onClick={() => setPassing(p.id)}>Pass to…</button>}
                        </div>
                      )}
                    </article>
                  );
                })}
              </div>
            </section>
          );
        })}
      </div>
    </>
  );
}
