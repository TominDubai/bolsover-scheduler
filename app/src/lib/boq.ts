import { createClient } from "@/lib/supabase/server";
import type { Boq, BoqSummary, BoqSection, BoqItem, ProjectContract, Valuation } from "@/lib/boq-model";
export * from "@/lib/boq-model";

const n = (v: unknown) => (v == null ? 0 : Number(v));
const numify = <T extends Record<string, unknown>>(row: T, keys: (keyof T)[]) => { const o = { ...row }; for (const k of keys) (o as Record<string, unknown>)[k as string] = row[k] == null ? null : Number(row[k]); return o; };

export async function getBoqSummaries(projectId: string): Promise<BoqSummary[]> {
  const supabase = await createClient();
  const [{ data }, { data: vos }] = await Promise.all([
    supabase.from("boq_summary").select("*").eq("project_id", projectId),
    supabase.from("variations").select("id, vo_no").eq("project_id", projectId),
  ]);
  const voNo = new Map((vos ?? []).map((v: { id: string; vo_no: number }) => [v.id, v.vo_no]));
  return ((data ?? []) as Record<string, unknown>[])
    .map((r) => ({ ...numify(r, ["item_count", "total", "cost_total", "installed_value", "installed_pct", "vat_pct", "rev_no"]), vo_no: r.variation_id ? voNo.get(r.variation_id as string) ?? null : null }) as unknown as BoqSummary)
    .sort((a, b) => (a.kind === b.kind ? (a.kind === "QUOTE" ? b.rev_no - a.rev_no : (a.vo_no ?? 0) - (b.vo_no ?? 0)) : a.kind === "QUOTE" ? -1 : 1));
}

export async function getBoq(id: string): Promise<{ boq: Boq; sections: BoqSection[]; items: BoqItem[] } | null> {
  const supabase = await createClient();
  const { data: boq } = await supabase.from("boqs").select("*").eq("id", id).maybeSingle();
  if (!boq) return null;
  const [{ data: sections }, { data: items }] = await Promise.all([
    supabase.from("boq_sections").select("*").eq("boq_id", id).order("sort"),
    supabase.from("boq_items").select("*").eq("boq_id", id).order("sort"),
  ]);
  return {
    boq: numify(boq as Record<string, unknown>, ["vat_pct", "default_markup_pct", "deposit_pct", "rev_no"]) as unknown as Boq,
    sections: (sections ?? []) as BoqSection[],
    items: ((items ?? []) as Record<string, unknown>[]).map((i) => numify(i, ["qty", "rate", "cost_rate", "markup_pct", "amount", "cost_amount", "installed_pct", "sort"]) as unknown as BoqItem),
  };
}

export async function getContract(projectId: string): Promise<ProjectContract> {
  const supabase = await createClient();
  const { data } = await supabase.from("project_contract").select("*").eq("project_id", projectId).maybeSingle();
  const r = (data ?? {}) as Record<string, unknown>;
  return { project_id: projectId, contract_value: n(r.contract_value), cost_value: n(r.cost_value), installed_value: n(r.installed_value), installed_pct: n(r.installed_pct), approved_boqs: n(r.approved_boqs) };
}

/** Every item on every APPROVED BOQ / VO for a project, grouped for the site progress sheet and valuations. */
export async function getApprovedItems(projectId: string) {
  const supabase = await createClient();
  const { data: boqs } = await supabase.from("boqs").select("*").eq("project_id", projectId).eq("status", "APPROVED").order("kind").order("rev_no");
  const list = (boqs ?? []) as Boq[];
  if (list.length === 0) return { boqs: [], sections: [] as BoqSection[], items: [] as BoqItem[] };
  const ids = list.map((b) => b.id);
  const [{ data: sections }, { data: items }, { data: vos }] = await Promise.all([
    supabase.from("boq_sections").select("*").in("boq_id", ids).order("sort"),
    supabase.from("boq_items").select("*").in("boq_id", ids).order("sort"),
    supabase.from("variations").select("id, vo_no").eq("project_id", projectId),
  ]);
  const voNo = new Map((vos ?? []).map((v: { id: string; vo_no: number }) => [v.id, v.vo_no]));
  // quote first, then VOs by number
  list.sort((a, b) => (a.kind === b.kind ? (voNo.get(a.variation_id ?? "") ?? 0) - (voNo.get(b.variation_id ?? "") ?? 0) : a.kind === "QUOTE" ? -1 : 1));
  return {
    boqs: list.map((b) => ({ ...b, vo_no: b.variation_id ? voNo.get(b.variation_id) ?? null : null })),
    sections: (sections ?? []) as BoqSection[],
    items: ((items ?? []) as Record<string, unknown>[]).map((i) => numify(i, ["qty", "rate", "cost_rate", "markup_pct", "amount", "cost_amount", "installed_pct", "sort"]) as unknown as BoqItem),
  };
}

export async function getValuations(projectId: string): Promise<Valuation[]> {
  const supabase = await createClient();
  const { data } = await supabase.from("valuations").select("*").eq("project_id", projectId).order("no");
  return ((data ?? []) as Record<string, unknown>[]).map((v) => numify(v, ["contract_value", "installed_value", "prev_installed", "deposit_received", "deposit_recovery", "vat_pct", "amount_due", "paid_amount", "no"]) as unknown as Valuation);
}

