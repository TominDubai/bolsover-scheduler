import type { Person } from "@/lib/model";

export type BoqKind = "QUOTE" | "VARIATION";
export type BoqStatus = "DRAFT" | "SUBMITTED" | "APPROVED" | "SUPERSEDED" | "REJECTED";
export const BOQ_STATUS_LABEL: Record<BoqStatus, string> = { DRAFT: "Draft", SUBMITTED: "Submitted", APPROVED: "Approved", SUPERSEDED: "Superseded", REJECTED: "Rejected" };
export const BOQ_STATUS_TONE: Record<BoqStatus, string> = { DRAFT: "none", SUBMITTED: "soon", APPROVED: "ok", SUPERSEDED: "done", REJECTED: "crit" };

export type Boq = {
  id: string; project_id: string; kind: BoqKind; rev_no: number; variation_id: string | null;
  title: string; quote_ref: string | null; status: BoqStatus; issue_date: string | null;
  vat_pct: number; default_markup_pct: number; deposit_pct: number; discount: number; working_days: number | null;
  payment_terms: string | null; terms: string[] | null; notes: string | null; source_file: string | null;
  created_at: string; updated_at: string;
};
export type BoqSummary = {
  boq_id: string; project_id: string; kind: BoqKind; rev_no: number; variation_id: string | null; title: string; status: BoqStatus; vat_pct: number;
  item_count: number; total: number; cost_total: number; installed_value: number; installed_pct: number;
  vo_no?: number | null;
};
export type BoqSection = { id: string; boq_id: string; sort: number; code: string | null; title: string; notes: string | null };
export type BoqItem = {
  id: string; boq_id: string; section_id: string; sort: number; ref: string | null; subheading: string | null; description: string;
  qty: number | null; unit: string | null; rate: number | null; cost_rate: number | null; markup_pct: number | null;
  rate_item_id: string | null; is_note: boolean; excluded: boolean; amount: number; cost_amount: number;
  installed_pct: number; installed_at: string | null; installed_by: string | null; notes: string | null;
};
export type ProjectContract = { project_id: string; contract_value: number; cost_value: number; installed_value: number; installed_pct: number; approved_boqs: number };
export type ValuationStatus = "DRAFT" | "ISSUED" | "CERTIFIED" | "PAID";
export type Valuation = {
  id: string; project_id: string; no: number; period_from: string | null; period_to: string; issued_date: string | null; status: ValuationStatus;
  contract_value: number; installed_value: number; prev_installed: number; deposit_received: number; deposit_recovery: number; vat_pct: number;
  amount_due: number; paid_amount: number | null; paid_date: string | null; invoice_no: string | null; notes: string | null;
  snapshot: { items: { id: string; pct: number; amount: number }[]; adjustments?: { label: string; amount: number }[] } | null; created_at: string;
};

/** Cost, markup and margin columns are for the pricing side only. */
export const canSeeCost = (p: Person | null | undefined) => !!p && (p.role === "QS" || p.role === "MANAGEMENT" || p.role === "ADMIN" || p.can_edit_estimation);

export const aed2 = (v: number | null | undefined) => v == null ? "—" : v.toLocaleString("en-GB", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
export const pct = (v: number | null | undefined) => v == null ? "—" : `${Math.round(v * 100) / 100}%`;
