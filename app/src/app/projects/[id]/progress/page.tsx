import Link from "next/link";
import { notFound } from "next/navigation";
import Shell from "@/components/Shell";
import Failed from "@/components/Failed";
import ProgressSheet from "@/components/ProgressSheet";
import { getProject, getMe } from "@/lib/data";
import { getApprovedItems } from "@/lib/boq";
import { title } from "@/lib/model";

export const dynamic = "force-dynamic";

/** Phone-first: the PM walks the site and sets installed % per item across the approved bill and VOs. */
async function Inner({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const [p, me, a] = await Promise.all([getProject(id), getMe(), getApprovedItems(id)]);
  if (!p) notFound();
  const canProgress = me.canProjects || [p.pm_id, p.pm2_id, p.site_engineer_id].includes(me.id);
  return (
    <Shell>
      <div className="page narrow">
        <div className="crumbs"><Link href="/board">Board</Link> / <Link href={`/projects/${id}`}>{p.enquiry_no ?? title(p.name)}</Link> / <span className="enq">Site progress</span></div>
        <div className="head"><div><h1>{title(p.name)}</h1><div className="client">Installed progress per item · tap a value, type the %, it saves on its own</div></div></div>
        {a.boqs.length === 0 ? <div className="panel"><span className="note">No approved bill on this project yet.</span></div>
          : <ProgressSheet projectId={id} boqs={a.boqs} sections={a.sections} items={a.items} canProgress={canProgress} />}
      </div>
    </Shell>
  );
}
export default async function Page(props: Parameters<typeof Inner>[0]) {
  try { return await Inner(props); }
  catch (e) { if (e && typeof e === "object" && "digest" in e && String((e as { digest?: string }).digest).startsWith("NEXT_")) throw e; return <Shell><Failed what="site progress" error={e} /></Shell>; }
}
