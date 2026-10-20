import Link from "next/link";
import { notFound } from "next/navigation";
import Shell from "@/components/Shell";
import Failed from "@/components/Failed";
import SiteReportForm from "@/components/SiteReportForm";
import { getMe } from "@/lib/data";
import { getProjectDay, formatProjectReport, todayDubai } from "@/lib/report";
import PhotoStrip from "@/components/PhotoStrip";
import { getDayPhotos, photoUrl, thumbUrl } from "@/lib/photos";
import { APP_URL } from "@/lib/notify";
import { title } from "@/lib/model";

export const dynamic = "force-dynamic";

/** Phone-first: the PM reads what the app already knows, adds three lines, and sends it to the project WhatsApp group. */
async function Inner({ params, searchParams }: { params: Promise<{ id: string }>; searchParams: Promise<{ day?: string }> }) {
  const { id } = await params;
  const { day: q } = await searchParams;
  const day = q && /^\d{4}-\d{2}-\d{2}$/.test(q) ? q : todayDubai();
  const [me, d, photos] = await Promise.all([getMe(), getProjectDay(id, day), getDayPhotos(id, day)]);
  if (!d) notFound();
  const urls = Object.fromEntries(photos.map((p) => [p.id, { full: photoUrl(p.path), thumb: thumbUrl(p.path) }]));
  const galleryUrl = `${APP_URL}/p/${id}/${day}`;
  const p = d.project;
  const canWrite = me.canProjects || [p.pm_id, p.pm2_id, p.site_engineer_id].includes(me.id);
  const text = formatProjectReport(d, me.name ? title(me.name) : "");
  const prev = new Date(new Date(`${day}T12:00:00+04:00`).getTime() - 86400000).toISOString().slice(0, 10);
  const next = new Date(new Date(`${day}T12:00:00+04:00`).getTime() + 86400000).toISOString().slice(0, 10);
  return (
    <Shell>
      <div className="page narrow">
        <div className="crumbs"><Link href="/board">Board</Link> / <Link href={`/projects/${id}`}>{p.enquiry_no ?? title(p.name)}</Link> / <span className="enq">Daily report</span></div>
        <div className="head"><div><h1>{title(p.name)}</h1><div className="client">Daily site report · progress is filled in from what was logged today; add your notes and send</div></div></div>
        <div className="daynav">
          <Link className="btn sm ghost" href={`?day=${prev}`}>‹ {prev}</Link>
          <b>{day === todayDubai() ? "Today" : day}</b>
          {day < todayDubai() ? <Link className="btn sm ghost" href={`?day=${next}`}>{next} ›</Link> : <span />}
        </div>
        <PhotoStrip projectId={id} day={day} photos={photos} urls={urls} canWrite={canWrite} galleryUrl={galleryUrl} />
        <SiteReportForm projectId={id} day={day} report={d.report} text={text} canWrite={canWrite} hasBill={d.hasBill} />
      </div>
    </Shell>
  );
}
export default async function Page(props: Parameters<typeof Inner>[0]) {
  try { return await Inner(props); }
  catch (e) { if (e && typeof e === "object" && "digest" in e && String((e as { digest?: string }).digest).startsWith("NEXT_")) throw e; return <Shell><Failed what="daily report" error={e} /></Shell>; }
}
