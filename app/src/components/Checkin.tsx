"use client";
import { useActionState } from "react";
import { CHECKIN_LABEL, title, type Checkin, type CheckinStatus, type Project } from "@/lib/model";
import { addCheckin } from "@/app/actions";

const fmt = (iso: string) => new Date(iso).toLocaleString("en-GB", { timeZone: "Asia/Dubai", day: "numeric", month: "short", hour: "2-digit", minute: "2-digit" });
const TONE: Record<CheckinStatus, string> = { ON_TRACK: "ok", SLIPPING: "warn", BLOCKED: "crit" };

/** Weekly PM check-in: three buttons and a line of notes. The PM, second PM or site engineer can post; so can anyone who edits projects. */
export default function Checkin({ p, checkins, canPost, myId }: { p: Project; checkins: Checkin[]; canPost: boolean; myId: string | null }) {
  const [state, action, pending] = useActionState(addCheckin.bind(null, p.id), null as { error?: string; ok?: boolean } | null);
  const weekStart = (() => { const d = new Date(new Date().toLocaleString("en-US", { timeZone: "Asia/Dubai" })); const day = (d.getDay() + 6) % 7; d.setDate(d.getDate() - day); return d.toISOString().slice(0, 10); })();
  const thisWeek = checkins.find((c) => c.week_start === weekStart);
  return (
    <div className="panel" id="checkin">
      <div className="prog-head"><h2>Weekly check-in</h2>
        <span className="note">{thisWeek ? <>This week: <b className={TONE[thisWeek.status]}>{CHECKIN_LABEL[thisWeek.status]}</b> — {thisWeek.who?.name ? title(thisWeek.who.name) : "someone"}, {fmt(thisWeek.created_at)}</> : <b style={{ color: "var(--warn)" }}>No check-in yet this week</b>}</span>
      </div>
      {canPost ? (
        <form action={action} className="checkin-form">
          <div className="checkin-btns">
            {(["ON_TRACK", "SLIPPING", "BLOCKED"] as CheckinStatus[]).map((s) => (
              <button key={s} name="status" value={s} className={`btn ${TONE[s]}`} disabled={pending}>{CHECKIN_LABEL[s]}</button>
            ))}
          </div>
          <input name="note" placeholder={myId && p.pm_id === myId ? "One line: what moved, what's stuck, what you need" : "Note (optional)"} />
          {state?.error && <span className="msg err">{state.error}</span>}
          {state?.ok && <span className="msg">Logged — thanks</span>}
        </form>
      ) : <p className="note">The PM, second PM or site engineer posts this each week; management is alerted on Slipping / Blocked.</p>}
      {checkins.length > 0 && (
        <ul className="checkins">
          {checkins.slice(0, 8).map((c) => <li key={c.id}><span className={`pill ${TONE[c.status]}`}>{CHECKIN_LABEL[c.status]}</span><span>{c.note ?? <i>no note</i>}</span><small>{c.who?.name ? title(c.who.name) : "—"} · {fmt(c.created_at)}</small></li>)}
        </ul>
      )}
    </div>
  );
}
