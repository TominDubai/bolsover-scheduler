import Link from "next/link";
import { hm, fmtDay, title, todayDubai, LOCATION_LABEL, type Meeting } from "@/lib/model";

/** Meetings tagged to this project (db/018): upcoming first, then the recent past. */
export default function ProjectMeetings({ meetings, projectId }: { meetings: Meeting[]; projectId: string }) {
  const today = todayDubai();
  const upcoming = meetings.filter((m) => m.meeting_date >= today).sort((a, b) => a.meeting_date.localeCompare(b.meeting_date) || a.start_time.localeCompare(b.start_time));
  const past = meetings.filter((m) => m.meeting_date < today).slice(0, 6);
  void projectId;
  return (
    <div className="panel">
      <h2>Meetings <Link href="/meetings" className="btn sm ghost" style={{ marginLeft: "auto" }}>Open the diary</Link></h2>
      {meetings.length === 0 ? <span style={{ color: "var(--fg3)" }}>None diarised. Book one from the Meetings tab and tag this project.</span> : (
        <ul className="hist">
          {upcoming.map((m) => <Row key={m.id} m={m} />)}
          {past.length > 0 && upcoming.length > 0 && <li className="sep-row"><small>earlier</small></li>}
          {past.map((m) => <Row key={m.id} m={m} />)}
        </ul>
      )}
    </div>
  );
}

function Row({ m }: { m: Meeting }) {
  return (
    <li><time><Link href={`/meetings?w=${m.meeting_date}`}>{fmtDay(m.meeting_date)}</Link> {hm(m.start_time)}–{hm(m.end_time)}</time>
      <span className={`mdot ${m.location.toLowerCase()}`} />
      <span className="by"><b>{m.title}</b> · {LOCATION_LABEL[m.location]}{m.attendees.length ? ` · ${m.attendees.map(title).join(", ")}` : ""}</span></li>
  );
}
