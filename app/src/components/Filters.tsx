"use client";
import { useRouter, useSearchParams } from "next/navigation";
import { title } from "@/lib/model";

export default function Filters({ pms, archived }: { pms: { name: string; n: number }[]; archived?: number }) {
  const router = useRouter();
  const sp = useSearchParams();
  const set = (k: string, v: string) => {
    const q = new URLSearchParams(sp.toString());
    if (v) q.set(k, v); else q.delete(k);
    router.replace("?" + q.toString());
  };
  return (
    <>
      <select id="pm" aria-label="Filter by project manager" value={sp.get("pm") ?? ""} onChange={(e) => set("pm", e.target.value)}>
        <option value="">All PMs</option>
        {pms.map((p) => <option key={p.name} value={p.name}>{title(p.name)} ({p.n})</option>)}
      </select>
      <input id="q" type="search" placeholder="Search projects…" aria-label="Search" defaultValue={sp.get("q") ?? ""} onChange={(e) => set("q", e.target.value.trim())} />
      {archived != null && <button type="button" className={`tab${sp.get("show") === "archived" ? " on" : ""}`} onClick={() => set("show", sp.get("show") === "archived" ? "" : "archived")}>Archived ({archived})</button>}
    </>
  );
}
