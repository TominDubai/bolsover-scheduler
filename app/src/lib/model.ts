// Bolsover pipeline (agreed 13 Oct 2026):
// PENDING (being priced) → QUOTED (sent, awaiting feedback) → WON → PRE_MOB → LIVE → COMPLETED
// Exits from QUOTED: ON_HOLD, REJECTED (client dropped it), LOST (went elsewhere / by others)
export type Status =
  | "PENDING" | "QUOTED" | "WON" | "PRE_MOB" | "LIVE" | "COMPLETED"
  | "ON_HOLD" | "REJECTED" | "LOST";

export const STAGES: [Status, string][] = [
  ["PENDING", "Pending"], ["QUOTED", "Quoted"], ["WON", "Won"],
  ["PRE_MOB", "Pre-mob"], ["LIVE", "Live"], ["COMPLETED", "Completed"],
];
export const SIDE: [Status, string][] = [["ON_HOLD", "On hold"], ["REJECTED", "Rejected"], ["LOST", "Lost"]];
export const ALL = [...STAGES, ...SIDE];
/** still on the quote side of the pipeline (estimation tab owns it) */
export const isQuote = (s: Status) => s === "PENDING" || s === "QUOTED";
/** out of the pipeline for good */
export const isDead = (s: Status) => s === "LOST" || s === "REJECTED";
export const LABEL: Record<Status, string> = Object.fromEntries(ALL) as Record<Status, string>;
export const ORDER: Record<Status, number> = Object.fromEntries(ALL.map(([k], i) => [k, i])) as Record<Status, number>;

export type QuoteStage = "QUEUED" | "PRICING" | "AWAITING_SUPPLIER" | "SUBMITTED";
export const QUOTE_STAGES: [QuoteStage, string][] = [
  ["QUEUED", "Queued"], ["PRICING", "Being priced"], ["AWAITING_SUPPLIER", "Waiting on info"], ["SUBMITTED", "Submitted"],
];
export const QUOTE_LABEL: Record<QuoteStage, string> = Object.fromEntries(QUOTE_STAGES) as Record<QuoteStage, string>;

export type Project = {
  id: string; enquiry_no: string | null; name: string; client: string | null;
  contractor_id: string | null; pm_id: string | null; pm2_id: string | null; site_engineer_id: string | null; technical_site_engineer_id: string | null;
  status: Status; difficulty: number | null;
  received_date: string | null; start_date: string | null; target_date: string | null; completed_date: string | null;
  signed_quote: number; notes: string | null; updated_at: string;
  quote_stage: QuoteStage; estimator_id: string | null; quoted_value: number | null; quote_submitted_date: string | null; quote_due_date: string | null; folder_path: string | null;
  quote_type: string | null; scope: string | null; waiting_on: string | null; raised_by: string | null;
  // from projects_live
  contractor: string | null; pm: string | null; pm2: string | null; site_engineer: string | null; estimator: string | null; days_since_enquiry: number | null;
  project_value: number; vo_count: number; days_to_completion: number | null; duration_days: number | null; days_delayed: number | null; status_since: string | null;
};
export type Person = { id: string; name: string; full_name: string | null; role: string; email: string | null; whatsapp: string | null; is_active: boolean; can_edit_estimation: boolean; can_edit_projects: boolean; can_manage_team: boolean };
export type Me = { name: string; canEstimation: boolean; canProjects: boolean; canTeam: boolean };
export type Contractor = { id: string; name: string };
export type Variation = { id: string; project_id: string; vo_no: number; description: string | null; value: number; approved_on: string | null };
export type History = { id: string; from_status: Status | null; to_status: Status; changed_at: string; note: string | null; changed_by: string | null; who?: string | null };

export const aed = (v: number | null | undefined) => v ? "AED " + Math.round(v).toLocaleString("en-GB") : "—";
export const aedS = (v: number) => v >= 1e6 ? (v / 1e6).toFixed(2) + "M" : v >= 1e3 ? Math.round(v / 1e3) + "k" : String(Math.round(v));
export const fmtD = (d: string | null | undefined) => d ? new Date(d).toLocaleDateString("en-GB", { day: "numeric", month: "short", year: "2-digit" }) : "—";
export const fmtDShort = (d: string | null | undefined) => d ? new Date(d).toLocaleDateString("en-GB", { day: "numeric", month: "short" }) : "—";
export const title = (s: string | null | undefined) => s ? s.toLowerCase().replace(/\b\w/g, (c) => c.toUpperCase()) : "—";
export const ini = (n: string | null | undefined) => n ? n.split(/[\s/]+/).map((s) => s[0]).join("").slice(0, 2) : "—";

export type Tone = "crit" | "warn" | "soon" | "ok" | "done" | "none";
export function tone(p: Pick<Project, "status" | "days_delayed">): Tone {
  if (p.status === "COMPLETED") return "done";
  if (isDead(p.status) || p.status === "ON_HOLD") return "none";
  if (p.days_delayed == null) return "none";
  if (p.days_delayed > 30) return "crit";
  if (p.days_delayed > 0) return "warn";
  if (p.days_delayed > -14) return "soon";
  return "ok";
}
export function delayText(p: Pick<Project, "status" | "days_delayed">): string {
  const d = p.days_delayed;
  if (p.status === "COMPLETED") return d == null ? "Done" : d > 0 ? `Done ${d}d late` : d < 0 ? `Done ${-d}d early` : "Done on target";
  if (d == null) return "No target";
  if (d > 0) return `${d}d late`;
  if (d === 0) return "Due today";
  return `${-d}d left`;
}

export const WAITING_ON = ["Client info", "Drawings / design info", "Subcon quote", "Supplier quote", "Site survey", "Drawings", "Approvals", "Other"];
export const SCOPES = ["Fit-out", "Renovation", "Joinery", "Landscaping", "MEP", "Furniture", "Other"];
/** days until a quote is due: null = no date; amber within 3 days, red when overdue */
export function dueTone(due: string | null) {
  if (!due) return null;
  const d = Math.round((new Date(due).getTime() - Date.now()) / 86400000);
  return { d, tone: d < 0 ? "crit" : d <= 3 ? "warn" : "ok" } as const;
}
