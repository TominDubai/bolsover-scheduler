"use client";
import { useRouter, useSearchParams } from "next/navigation";
import { title, PACKAGE_STATUS_LABEL, PACKAGE_STATUS_ORDER, type PackageStatus } from "@/lib/model";

type P = { id: string; name: string; enquiry_no: string | null };
export default function PackagesFilters({ projects, trades, suppliers, pms, statuses }: { projects: P[]; trades: string[]; suppliers: string[]; pms: string[]; statuses: PackageStatus[] }) {
  const router = useRouter();
  const sp = useSearchParams();
  const set = (k: string, v: string) => { const q = new URLSearchParams(sp.toString()); if (v) q.set(k, v); else q.delete(k); router.replace("?" + q.toString()); };
  const sorted = [...statuses].sort((a, b) => PACKAGE_STATUS_ORDER[a] - PACKAGE_STATUS_ORDER[b]);
  return (
    <>
      <select aria-label="Filter by project" value={sp.get("project") ?? ""} onChange={(e) => set("project", e.target.value)}>
        <option value="">All projects</option>{projects.map((p) => <option key={p.id} value={p.id}>{p.enquiry_no ? `${p.enquiry_no} · ` : ""}{title(p.name)}</option>)}
      </select>
      <select aria-label="Filter by trade" value={sp.get("trade") ?? ""} onChange={(e) => set("trade", e.target.value)}>
        <option value="">All trades</option>{trades.map((d) => <option key={d} value={d}>{d}</option>)}
      </select>
      <select aria-label="Filter by subcontractor" value={sp.get("supplier") ?? ""} onChange={(e) => set("supplier", e.target.value)}>
        <option value="">All subcontractors</option>{suppliers.map((d) => <option key={d} value={d}>{d}</option>)}
      </select>
      <select aria-label="Filter by PM" value={sp.get("pm") ?? ""} onChange={(e) => set("pm", e.target.value)}>
        <option value="">All PMs</option>{pms.map((d) => <option key={d} value={d}>{title(d)}</option>)}
      </select>
      <select aria-label="Filter by status" value={sp.get("status") ?? ""} onChange={(e) => set("status", e.target.value)}>
        <option value="">All statuses</option><option value="OPEN">— Still open —</option>
        {sorted.map((s) => <option key={s} value={s}>{PACKAGE_STATUS_LABEL[s]}</option>)}
      </select>
      <select aria-label="Flags" value={sp.get("flag") ?? ""} onChange={(e) => set("flag", e.target.value)}>
        <option value="">Everything</option><option value="attention">Needs attention</option><option value="unappointed">No subcontractor yet</option>
      </select>
      <input type="search" placeholder="Package, trade, subcontractor, project…" aria-label="Search" defaultValue={sp.get("q") ?? ""} onChange={(e) => set("q", e.target.value.trim())} />
    </>
  );
}
