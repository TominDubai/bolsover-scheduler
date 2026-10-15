import Shell from "@/components/Shell";
import Failed from "@/components/Failed";
import RatesTable from "@/components/RatesTable";
import { getMe } from "@/lib/data";
import { canSeeCost } from "@/lib/boq";
import { createClient } from "@/lib/supabase/server";
import type { Person } from "@/lib/model";
import type { RateHit } from "@/app/actions";

export const dynamic = "force-dynamic";

export type RateRow = RateHit & { notes: string | null; is_active: boolean; source_project: string | null };

async function Inner({ q }: { q: string }) {
  const supabase = await createClient();
  const [me, { data: meRow }] = await Promise.all([getMe(), supabase.rpc("me")]);
  const person = meRow as Person | null;
  const showCost = canSeeCost(person);
  let query = supabase.from("rate_items").select("id, code, category, description, unit, sell_rate, markup_pct, use_count, last_used, notes, is_active, source_project_id, projects(name)" + (showCost ? ", cost_rate" : ""))
    .order("category").order("use_count", { ascending: false }).order("description");
  if (q) { const t = q.replace(/[%,()]/g, " "); query = query.or(`description.ilike.%${t}%,code.ilike.%${t}%,category.ilike.%${t}%`); }
  const { data, error } = await query.limit(2000);
  if (error) throw new Error(`rate_items: ${error.message}`);
  const rows: RateRow[] = ((data ?? []) as unknown as (RateRow & { projects: { name: string } | null })[]).map((r) => ({ ...r, cost_rate: showCost ? r.cost_rate ?? null : null, source_project: r.projects?.name ?? null }));
  const active = rows.filter((r) => r.is_active);
  const clipped = active.filter((r) => r.description.endsWith("…")).length;
  const thin = active.filter((r) => r.markup_pct != null && r.markup_pct < 25).length;
  return (
    <Shell active="rates">
      <section className="summary">
        <div className="stats">
          <div className="stat"><b>{active.length}</b><span>rates in the library</span></div>
          <div className="stat"><b>{new Set(active.map((r) => r.category)).size}</b><span>trades</span></div>
          {showCost && <div className={`stat${thin ? " warn" : ""}`}><b>{thin}</b><span>under 25% markup</span></div>}
          <div className={`stat${clipped ? " warn" : ""}`}><b>{clipped}</b><span>descriptions to complete</span></div>
        </div>
        <p className="note teamnote">Every rate here was charged on a real Bolsover quote; the code is the handle, the notes say where it came from. Pick from this list when adding an item to a bill (type in the "From library" box on the item form). Approving a bill adds its new items here automatically. Descriptions ending in … were clipped by the import — finish them off before using the item on a client copy.</p>
      </section>
      <main><RatesTable rows={rows} canEdit={me.canEstimation} showCost={showCost} q={q} /></main>
    </Shell>
  );
}

export default async function RatesPage({ searchParams }: { searchParams: Promise<{ q?: string }> }) {
  const { q = "" } = await searchParams;
  try { return await Inner({ q }); }
  catch (e) {
    if (e && typeof e === "object" && "digest" in e && String((e as { digest?: string }).digest).startsWith("NEXT_")) throw e;
    return <Shell><Failed what="rates" error={e} /></Shell>;
  }
}
