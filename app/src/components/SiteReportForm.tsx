"use client";
import { useActionState, useState } from "react";
import { useRouter } from "next/navigation";
import { saveSiteReport, markReportSent } from "@/app/actions";
import type { SiteReport } from "@/lib/report";

type State = { error?: string; ok?: boolean; at?: string } | null;

/** Three note boxes + the assembled message + Open in WhatsApp. The PM picks the group in WhatsApp itself (wa.me with the text prefilled). */
export default function SiteReportForm({ projectId, day, report, text, canWrite, hasBill }: { projectId: string; day: string; report: SiteReport | null; text: string; canWrite: boolean; hasBill: boolean }) {
  const router = useRouter();
  const [state, action, pending] = useActionState(async (prev: unknown, fd: FormData) => { const r = await saveSiteReport(projectId, day, prev, fd); if (r.ok) router.refresh(); return r; }, null as State);
  const [copied, setCopied] = useState(false);
  const wa = `https://wa.me/?text=${encodeURIComponent(text)}`;
  const send = () => { markReportSent(projectId, day); };
  const copy = async () => { try { await navigator.clipboard.writeText(text); setCopied(true); setTimeout(() => setCopied(false), 1500); } catch { /* clipboard blocked — the textarea is selectable */ } };
  return (
    <div className="sreport">
      {!hasBill && <div className="panel"><span className="note">No approved bill on this project yet, so there's no installed % to report — the notes below still go out.</span></div>}
      {canWrite ? (
        <form action={action} className="panel sform">
          <label>On site today<textarea name="done" rows={3} defaultValue={report?.done ?? ""} placeholder="What got done, who was on site, deliveries…" /></label>
          <label>Tomorrow<textarea name="tomorrow" rows={2} defaultValue={report?.tomorrow ?? ""} placeholder="Plan for tomorrow" /></label>
          <label>Issues / needs<textarea name="issues" rows={2} defaultValue={report?.issues ?? ""} placeholder="Blockers, client decisions needed, materials short…" /></label>
          <div className="srow"><button className="btn sm" disabled={pending}>{pending ? "Saving…" : "Save notes"}</button>{state?.ok && <span className="msg">Saved — message updated below</span>}{state?.error && <span className="msg err">{state.error}</span>}</div>
        </form>
      ) : <div className="panel"><span className="note">Only the PM or site engineer on this project writes the notes. You can still send the message.</span></div>}
      <div className="panel">
        <div className="srow"><b>Message</b>{report?.sent_at && <small className="sent">sent {new Date(report.sent_at).toLocaleString("en-GB", { day: "numeric", month: "short", hour: "2-digit", minute: "2-digit" })}</small>}</div>
        <textarea className="smsg" readOnly value={text} rows={Math.min(28, text.split("\n").length + 1)} aria-label="Report message" />
        <div className="srow">
          <a className="btn wa" href={wa} target="_blank" rel="noopener" onClick={send}>Open in WhatsApp</a>
          <button type="button" className="btn ghost" onClick={copy}>{copied ? "Copied" : "Copy text"}</button>
        </div>
        <small className="note">WhatsApp opens with the message ready — pick the project group and send. Save your notes first so they're included.</small>
      </div>
    </div>
  );
}
