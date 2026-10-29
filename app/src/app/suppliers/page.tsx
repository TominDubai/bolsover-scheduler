import Shell from "@/components/Shell";
import Failed from "@/components/Failed";
import SuppliersTable, { type SupplierJobs } from "@/components/SuppliersTable";
import { getAllSuppliers, getAllPackages, getTrades, getMe } from "@/lib/data";

export const dynamic = "force-dynamic";

/** Subcontractors and suppliers — who they are, how to reach them, and which live packages they're on.
 *  Companies are data (db/019 `suppliers`): the package drawer's inline "+" adds here too. */
async function Inner_SuppliersPage() {
  const [me, suppliers, trades, packages] = await Promise.all([getMe(), getAllSuppliers(), getTrades(), getAllPackages()]);
  const live = packages.filter((k) => !k.cancelled && k.supplier_id && k.project_status !== "COMPLETED");
  const jobs: SupplierJobs = {};
  for (const k of live) (jobs[k.supplier_id!] ??= []).push({ id: k.id, project_id: k.project_id, project_name: k.project_name, enquiry_no: k.enquiry_no, code: k.code, name: k.name, status: k.status, slipping: k.slipping, forecast_late: k.forecast_late });
  const active = suppliers.filter((s) => s.is_active);
  const onSite = new Set(live.filter((k) => k.status === "ON_SITE").map((k) => k.supplier_id)).size;
  const noContact = active.filter((s) => !s.phone && !s.email).length;
  const canEdit = me.canProjects || me.canEstimation;
  return (
    <Shell active="suppliers">
      <section className="summary">
        <div className="stats">
          <div className="stat"><b>{active.length}</b><span>subcontractors & suppliers</span></div>
          <div className="stat"><b>{Object.keys(jobs).length}</b><span>on a live package</span></div>
          <div className="stat"><b>{onSite}</b><span>on site now</span></div>
          <div className={`stat${noContact ? " crit" : ""}`}><b>{noContact}</b><span>with no phone or email</span></div>
        </div>
        <p className="note teamnote">One row per company. The usual trade puts them at the top of the picker when a package of that trade is being appointed. Anyone with the Projects or Quotes permission can add and edit; retire a company rather than deleting it so old packages keep their name.</p>
      </section>
      <main><SuppliersTable suppliers={suppliers} trades={trades} jobs={jobs} canEdit={canEdit} /></main>
    </Shell>
  );
}

export default async function SuppliersPage() {
  try { return await Inner_SuppliersPage(); }
  catch (e) {
    if (e && typeof e === "object" && "digest" in e && String((e as { digest?: string }).digest).startsWith("NEXT_")) throw e;
    return <Shell><Failed what="suppliers" error={e} /></Shell>;
  }
}
