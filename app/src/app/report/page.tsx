import Link from "next/link";
import Shell from "@/components/Shell";
import Failed from "@/components/Failed";
import DigestView from "@/components/DigestView";
import { formatDigest, todayDubai } from "@/lib/report";
import { title } from "@/lib/model";

export const dynamic = "force-dynamic";

/** All live sites in one message — what moved today, who reported, who didn't. */
async function Inner({ searchParams }: { searchParams: Promise<{ day?: string }> }) {
  const { day: q } = await searchParams;
  const day = q && /^\d{4}-\d{2}-\d{2}$/.test(q) ? q : todayDubai();
  const { text, days } = await formatDigest(day);
  const prev = new Date(new Date(`${day}T12:00:00+04:00`).getTime() - 86400000).toISOString().slice(0, 10);
  const next = new Date(new Date(`${day}T12:00:00+04:00`).getTime() + 86400000).toISOString().slice(0, 10);
  const reported = days.filter((d) => d.report || d.lines.length).length;
  return (
    <Shell active="report">
      <section className="summary">
        <div className="stats">
          <div className="stat"><b>{days.length}</b><span>live sites</span></div>
          <div className={`stat${reported < days.length ? " warn" : ""}`}><b>{reported}</b><span>reported {day === todayDubai() ? "today" : day}</span></div>
          <div className="stat"><b>{days.reduce((s, d) => s + d.lines.length, 0)}</b><span>items moved</span></div>
        </div>
        <p className="note teamnote">Each PM sends their own site report from the project page (Daily report). This is the roll-up: one message for the office group. Sites with nothing logged and no notes show as "no report today".</p>
      </section>
      <main>
        <div className="page narrow" style={{ padding: 0 }}>
          <div className="daynav">
            <Link className="btn sm ghost" href={`?day=${prev}`}>‹ {prev}</Link><b>{day === todayDubai() ? "Today" : day}</b>
            {day < todayDubai() ? <Link className="btn sm ghost" href={`?day=${next}`}>{next} ›</Link> : <span />}
          </div>
          <DigestView text={text} />
          <ul className="dlist">
            {days.map((d) => <li key={d.project.id}><Link href={`/projects/${d.project.id}/report?day=${day}`}>{title(d.project.name)}</Link><span className={d.report || d.lines.length ? "pill ok" : "pill"}>{d.report?.sent_at ? "sent" : d.report || d.lines.length ? "logged" : "nothing yet"}</span></li>)}
          </ul>
        </div>
      </main>
    </Shell>
  );
}
export default async function Page(props: Parameters<typeof Inner>[0]) {
  try { return await Inner(props); }
  catch (e) { if (e && typeof e === "object" && "digest" in e && String((e as { digest?: string }).digest).startsWith("NEXT_")) throw e; return <Shell><Failed what="daily digest" error={e} /></Shell>; }
}
