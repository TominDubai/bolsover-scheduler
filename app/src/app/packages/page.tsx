import { Suspense } from "react";
import Shell from "@/components/Shell";
import Failed from "@/components/Failed";
import PackagesTable from "@/components/PackagesTable";
import PackagesFilters from "@/components/PackagesFilters";
import { getAllPackages, getMe, getProjects } from "@/lib/data";
import { canSeeCost } from "@/lib/boq";
import { createClient } from "@/lib/supabase/server";
import { packageFlags, byEnq, type Package, type PackageStatus, type Person } from "@/lib/model";

export const dynamic = "force-dynamic";

type SP = { project?: string; trade?: string; supplier?: string; pm?: string; status?: string; q?: string; flag?: string };

function filter(rows: Package[], sp: SP) {
  const q = (sp.q ?? "").toLowerCase().trim();
  return rows.filter((k) =>
    (!sp.project || k.project_id === sp.project) &&
    (!sp.trade || k.trade === sp.trade) &&
    (!sp.supplier || k.supplier === sp.supplier) &&
    (!sp.pm || k.pm === sp.pm) &&
    (!sp.status || k.status === sp.status || (sp.status === "OPEN" && !["COMPLETE", "SNAGGED", "CANCELLED"].includes(k.status))) &&
    (!sp.flag || (sp.flag === "attention" && packageFlags(k).length > 0) || (sp.flag === "unappointed" && !k.supplier_id && k.status !== "CANCELLED")) &&
    (!q || `${k.code ?? ""} ${k.name} ${k.trade ?? ""} ${k.supplier ?? ""} ${k.project_name} ${k.client ?? ""}`.toLowerCase().includes(q)));
}

/** Every package on every live project — who's on which job, what's slipping, who hasn't been appointed. */
async function Inner_PackagesPage({ searchParams }: { searchParams: Promise<SP> }) {
  const sp = await searchParams;
  const supabase = await createClient();
  const [all, me, projects, { data: meRow }] = await Promise.all([getAllPackages(), getMe(), getProjects(), supabase.rpc("me")]);
  const live = all.filter((k) => !k.cancelled && k.project_status !== "COMPLETED");
  const rows = filter(live, sp);
  const count = (f: (k: Package) => boolean) => live.filter(f).length;
  const trades = [...new Set(live.map((k) => k.trade).filter(Boolean) as string[])].sort();
  const supplierNames = [...new Set(live.map((k) => k.supplier).filter(Boolean) as string[])].sort();
  const pms = [...new Set(live.map((k) => k.pm).filter(Boolean) as string[])].sort();
  const projOpts = projects.filter((p) => live.some((k) => k.project_id === p.id)).sort(byEnq).map((p) => ({ id: p.id, name: p.name, enquiry_no: p.enquiry_no }));
  const statuses = [...new Set(live.map((k) => k.status))] as PackageStatus[];
  const noPackages = projects.filter((p) => ["PRE_MOB", "LIVE"].includes(p.status) && !p.archived_at && !live.some((k) => k.project_id === p.id)).sort(byEnq);
  const showValue = canSeeCost(meRow as Person | null);
  return (
    <Shell active="packages" tools={<Suspense><PackagesFilters projects={projOpts} trades={trades} suppliers={supplierNames} pms={pms} statuses={statuses} /></Suspense>}>
      <section className="summary">
        <div className="stats">
          <div className="stat"><b>{live.length}</b><span>packages on live projects</span></div>
          <div className="stat"><b>{count((k) => k.status === "NOT_AWARDED")}</b><span>not awarded</span></div>
          <div className="stat"><b>{count((k) => k.status === "AWARDED" || k.status === "APPROVED")}</b><span>awarded, not on site</span></div>
          <div className="stat"><b>{count((k) => k.status === "ON_SITE")}</b><span>on site</span></div>
          <div className="stat"><b>{count((k) => k.status === "COMPLETE" || k.status === "SNAGGED")}</b><span>complete</span></div>
          <div className={`stat${count((k) => packageFlags(k).length > 0) ? " crit" : ""}`}><b>{count((k) => packageFlags(k).length > 0)}</b><span>need attention</span></div>
        </div>
        {noPackages.length > 0 && <p className="note teamnote"><b>{noPackages.length}</b> live project{noPackages.length === 1 ? " has" : "s have"} no packages yet: {noPackages.slice(0, 6).map((p) => p.enquiry_no ?? p.name).join(", ")}{noPackages.length > 6 ? "…" : ""}. The PM adds them on the project page, or loads the P6 programme.</p>}
      </section>
      <main><PackagesTable rows={rows} total={live.length} showValue={showValue} /></main>
    </Shell>
  );
}

export default async function PackagesPage(props: Parameters<typeof Inner_PackagesPage>[0]) {
  try { return await Inner_PackagesPage(props); }
  catch (e) {
    if (e && typeof e === "object" && "digest" in e && String((e as { digest?: string }).digest).startsWith("NEXT_")) throw e;
    return <Shell><Failed what="the packages list" error={e} /></Shell>;
  }
}
