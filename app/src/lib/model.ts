// Bolsover pipeline (agreed 13 Oct 2026):
// PENDING (being priced) → QUOTED (sent, awaiting feedback) → WON → PRE_MOB → LIVE → COMPLETED
// Exits from QUOTED: ON_HOLD, REJECTED (client dropped it), LOST (went elsewhere / by others)
// MERGED (db/017): a VO enquiry that was won and became a VO line on its parent project — off every board.
export type Status =
  | "PENDING" | "QUOTED" | "WON" | "PRE_MOB" | "LIVE" | "COMPLETED"
  | "ON_HOLD" | "REJECTED" | "LOST" | "MERGED";

export const STAGES: [Status, string][] = [
  ["PENDING", "Pending"], ["QUOTED", "Quoted"], ["WON", "Won"],
  ["PRE_MOB", "Pre-mob"], ["LIVE", "Live"], ["COMPLETED", "Completed"],
];
export const SIDE: [Status, string][] = [["ON_HOLD", "On hold"], ["REJECTED", "Rejected"], ["LOST", "Lost"]];
/** MERGED never gets a column: the enquiry lives on as a VO line on its parent */
export const ALL: [Status, string][] = [...STAGES, ...SIDE, ["MERGED", "Merged into parent"]];
/** still on the quote side of the pipeline (estimation tab owns it) */
export const isQuote = (s: Status) => s === "PENDING" || s === "QUOTED";
/** out of the pipeline for good */
export const isDead = (s: Status) => s === "LOST" || s === "REJECTED" || s === "MERGED";
export const LABEL: Record<Status, string> = Object.fromEntries(ALL) as Record<Status, string>;
export const ORDER: Record<Status, number> = Object.fromEntries(ALL.map(([k], i) => [k, i])) as Record<Status, number>;

// QUALIFYING (db/017, Tom 28 Oct): every new enquiry lands here; management proceed (→ Queued) or decline (→ Rejected)
// before the QS prices it. SUBMITTED = the quote is with the client (status QUOTED).
export type QuoteStage = "QUALIFYING" | "QUEUED" | "PRICING" | "AWAITING_SUPPLIER" | "SUBMITTED";
export const QUOTE_STAGES: [QuoteStage, string][] = [
  ["QUALIFYING", "Qualifying"], ["QUEUED", "Queued"], ["PRICING", "Being priced"], ["AWAITING_SUPPLIER", "Waiting on info"], ["SUBMITTED", "Submitted"],
];
export const SOURCES: [string, string][] = [["WORD_OF_MOUTH", "Word of mouth"], ["INSTAGRAM", "Instagram"], ["REFERRAL", "Referral"], ["DESIGNER", "Designer"], ["REPEAT_CLIENT", "Repeat client"], ["OTHER", "Other"]];
export const SOURCE_LABEL: Record<string, string> = Object.fromEntries(SOURCES);
/** sources that name a person: the form asks "who?" */
export const SOURCE_NAMED = new Set(["REFERRAL", "DESIGNER", "OTHER"]);
export const PROJECT_TYPES = ["Villa fit-out", "Apartment fit-out", "Office", "Retail / F&B", "Renovation", "Landscaping", "Furniture / joinery", "Variation", "Other"];
export const SUBMIT_VIA = ["Email", "WhatsApp"];
export const QUOTE_LABEL: Record<QuoteStage, string> = Object.fromEntries(QUOTE_STAGES) as Record<QuoteStage, string>;

export type Project = {
  id: string; enquiry_no: string | null; name: string; client: string | null;
  contractor_id: string | null; pm_id: string | null; pm2_id: string | null; site_engineer_id: string | null;
  status: Status; difficulty: number | null;
  received_date: string | null; start_date: string | null; target_date: string | null; completed_date: string | null;
  signed_quote: number; notes: string | null; updated_at: string; location: string | null; job_ref: string | null; archived_at: string | null;
  quote_stage: QuoteStage; estimator_id: string | null; quoted_value: number | null; quote_submitted_date: string | null; quote_due_date: string | null; folder_path: string | null;
  quote_type: string | null; scope: string | null; waiting_on: string | null; raised_by: string | null;
  // tender fields (db/017)
  source: string | null; source_name: string | null; consultant: string | null; client_address: string | null; project_type: string | null;
  site_visit_date: string | null; site_visit_by: string | null; submit_via: string | null; outcome_reason: string | null;
  qualified_at: string | null; qualified_by: string | null; ball_with: string | null; ball_since: string | null; ball_note: string | null; parent_project_id: string | null;
  parent_name: string | null; parent_enquiry_no: string | null; ball_with_name: string | null; site_visit_by_name: string | null; boq_margin_pct: number | null;
  // from projects_live
  contractor: string | null; pm: string | null; pm2: string | null; site_engineer: string | null; estimator: string | null; days_since_enquiry: number | null;
  project_value: number; vo_count: number; days_to_completion: number | null; duration_days: number | null; days_delayed: number | null; status_since: string | null;
  // programme health + last PM check-in (null when no programme loaded / no check-in yet)
  prog_pkgs: number | null; prog_done: number | null; prog_behind: number | null; prog_pct: number | null; prog_next_due: string | null; prog_forecast_end: string | null;
  checkin_status: CheckinStatus | null; checkin_note: string | null; checkin_at: string | null; checkin_by: string | null;
  // removal (db/016): off every list, nothing deleted; deleted_by_name resolved by the view
  deleted_at: string | null; deleted_reason: string | null; deleted_by: string | null; deleted_by_name: string | null;
  // target completion revisions (db/016): highest rev_no = current, Rev 0 = original programme
  target_rev: number | null; target_rev0_date: string | null;
  // package counts (db/019 project_package_counts), stitched on by getProjects — not a view column
  pkg?: PackageCounts | null;
};
export type TargetRevision = { id: number; project_id: string; rev_no: number; target_date: string | null; prev_date: string | null; reason: string | null; set_by: string | null; set_at: string; who?: { name: string } | null };
export type CheckinStatus = "ON_TRACK" | "SLIPPING" | "BLOCKED";
export const CHECKIN_LABEL: Record<CheckinStatus, string> = { ON_TRACK: "On track", SLIPPING: "Slipping", BLOCKED: "Blocked" };
export type Checkin = { id: string; project_id: string; person_id: string | null; status: CheckinStatus; note: string | null; week_start: string; created_at: string; who?: { name: string } | null };

/** Site health for a live project, from the programme and the PM's last check-in. */
export function health(p: Pick<Project, "status" | "prog_pkgs" | "prog_behind" | "prog_done" | "prog_pct" | "checkin_status" | "checkin_at" | "prog_forecast_end" | "target_date">): { tone: Tone; text: string } | null {
  if (p.status !== "LIVE" && p.status !== "PRE_MOB") return null;
  const stale = p.checkin_at ? (Date.now() - new Date(p.checkin_at).getTime()) / 86400000 > 10 : true;
  if (p.checkin_status === "BLOCKED" && !stale) return { tone: "crit", text: "Blocked" };
  if (p.checkin_status === "SLIPPING" && !stale) return { tone: "warn", text: "Slipping" };
  if (!p.prog_pkgs) return { tone: "none", text: "No programme" };
  const behind = p.prog_behind ?? 0;
  if (behind > 0) return { tone: behind >= 3 ? "crit" : "warn", text: `${behind} package${behind === 1 ? "" : "s"} behind` };
  if (p.prog_forecast_end && p.target_date && p.prog_forecast_end > p.target_date) return { tone: "warn", text: "Forecast past target" };
  if (p.checkin_status === "ON_TRACK" && !stale) return { tone: "ok", text: "On track" };
  return { tone: "ok", text: `${p.prog_pct ?? 0}% · no check-in` };
}
export type Person = {
  id: string; name: string; full_name: string | null; role: string; email: string | null; whatsapp: string | null; position: string | null; is_active: boolean;
  can_edit_estimation: boolean; can_edit_projects: boolean; can_manage_team: boolean;
  is_admin: boolean; notify_on_award: boolean; handles_escalations: boolean; can_sign_in: boolean;
};
export type Me = { id: string | null; name: string; role: string; canEstimation: boolean; canProjects: boolean; canTeam: boolean; isAdmin: boolean };

/** Sort key for Bolsover enquiry numbers `BBC/MMYYYY/NNNNN`: year, month, serial. Anything else sorts by its digits. */
export function enqKey(no: string | null): number {
  if (!no) return Number.MAX_SAFE_INTEGER;
  const m = no.trim().match(/^BBC\/(\d{2})(\d{4})\/(\d{1,6})/i);
  if (m) return parseInt(m[2]) * 1e8 + parseInt(m[1]) * 1e6 + parseInt(m[3]);
  const d = no.replace(/\D/g, "");
  return d ? parseInt(d.slice(-9)) : Number.MAX_SAFE_INTEGER;
}
export const byEnq = <T extends { enquiry_no: string | null; name: string }>(a: T, b: T) => enqKey(a.enquiry_no) - enqKey(b.enquiry_no) || a.name.localeCompare(b.name);
export type Contractor = { id: string; name: string };
export type Variation = { id: string; project_id: string; vo_no: number; description: string | null; value: number; approved_on: string | null; source_enquiry_id?: string | null };
export type EnquiryPass = { id: number; project_id: string; from_id: string | null; to_id: string | null; note: string | null; passed_at: string; from?: { name: string } | null; to?: { name: string } | null };
// ---------- packages (db/019): one work package per trade; the programme rows ARE the package rows ----------
export type PackageStatus = "NOT_AWARDED" | "AWARDED" | "APPROVED" | "ON_SITE" | "COMPLETE" | "SNAGGED" | "CANCELLED";
export const PACKAGE_STATUSES: [PackageStatus, string][] = [
  ["NOT_AWARDED", "Not awarded"], ["AWARDED", "Awarded"], ["APPROVED", "Approvals done"], ["ON_SITE", "On site"], ["COMPLETE", "Complete"], ["SNAGGED", "Snagged"], ["CANCELLED", "Cancelled"],
];
export const PACKAGE_STATUS_LABEL: Record<PackageStatus, string> = Object.fromEntries(PACKAGE_STATUSES) as Record<PackageStatus, string>;
export const PACKAGE_STATUS_ORDER: Record<PackageStatus, number> = Object.fromEntries(PACKAGE_STATUSES.map(([k], i) => [k, i])) as Record<PackageStatus, number>;
/** the five milestones, in order, with the column each one lives in */
export const MILESTONES: [keyof Package, string][] = [["awarded_on", "Awarded"], ["approved_on", "Approvals done"], ["on_site_on", "On site"], ["complete_on", "Complete"], ["snagged_on", "Snagged"]];
export const AUTHORITIES = ["Dubai Municipality", "Emaar", "Nakheel", "Trakhees", "DDA", "Consultant", "Other"];
export type PackageTrade = { id: string; name: string; short: string; sort_order: number; is_active: boolean };
export type Supplier = { id: string; name: string; trade_id: string | null; contact: string | null; phone: string | null; email: string | null; notes: string | null; is_active: boolean };
export type Package = {
  id: string; project_id: string; code: string | null; name: string; sort: number;
  planned_start: string | null; planned_finish: string | null; planned_days: number | null;
  actual_start: string | null; actual_finish: string | null; forecast_finish: string | null;
  pct_complete: number; note: string | null; updated_at: string;
  trade_id: string | null; supplier_id: string | null; value: number | null; status: PackageStatus; owner_id: string | null;
  awarded_on: string | null; approved_on: string | null; on_site_on: string | null; complete_on: string | null; snagged_on: string | null; cancelled: boolean;
  approval_authority: string | null; approval_submitted: string | null; approval_received: string | null; approval_note: string | null;
  // from packages_live
  trade: string | null; trade_short: string | null; supplier: string | null; owner: string | null;
  project_name: string; enquiry_no: string | null; project_status: Status; client: string | null; project_deleted_at: string | null; project_archived_at: string | null;
  pm_id: string | null; pm: string | null; site_engineer_id: string | null;
  slipping: boolean; forecast_late: boolean; no_dates: boolean; approval_waiting: boolean; approval_waiting_days: number | null; days_overdue: number | null;
};
export type PackageCounts = { project_id: string; pkg_total: number; pkg_awarded: number; pkg_on_site: number; pkg_complete: number; pkg_slipping: number; pkg_not_awarded: number; pkg_value_awarded: number | null; earliest_slip: string | null };
/** What's wrong with a package, worst first — the flags on the row and the reminder rules in alerts.ts use the same test. */
export function packageFlags(k: Pick<Package, "status" | "cancelled" | "slipping" | "forecast_late" | "no_dates" | "approval_waiting" | "approval_waiting_days" | "days_overdue" | "approval_authority">): { tone: Tone; text: string }[] {
  if (k.cancelled || k.status === "COMPLETE" || k.status === "SNAGGED") return [];
  const f: { tone: Tone; text: string }[] = [];
  if (k.slipping) f.push({ tone: (k.days_overdue ?? 0) > 14 ? "crit" : "warn", text: `${k.days_overdue}d overdue` });
  else if (k.forecast_late) f.push({ tone: "warn", text: "Forecast late" });
  if (k.approval_waiting && (k.approval_waiting_days ?? 0) >= 14) f.push({ tone: "warn", text: `${k.approval_authority ?? "Approval"} ${k.approval_waiting_days}d` });
  if (k.no_dates) f.push({ tone: "soon", text: "No dates" });
  return f;
}
export const packageTone2 = (k: Parameters<typeof packageFlags>[0]): Tone => k.cancelled ? "none" : k.status === "COMPLETE" || k.status === "SNAGGED" ? "done" : (packageFlags(k)[0]?.tone ?? (k.status === "ON_SITE" ? "ok" : "none"));
export type Activity = { id: string; package_id: string; code: string | null; name: string; sort: number; planned_start: string | null; planned_finish: string | null; planned_days: number | null };
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

/** Programme package health against its baseline finish. slip = days the (actual or forecast) finish sits past the baseline. */
export function packageTone(k: Pick<Package, "planned_start" | "planned_finish" | "actual_start" | "actual_finish" | "forecast_finish" | "pct_complete">, today = new Date()): { tone: Tone; text: string; slip: number | null } {
  const t0 = new Date(today).setHours(0, 0, 0, 0);
  const day = (d: string) => Math.round((new Date(d).getTime() - t0) / 86400000);
  const plan = k.planned_finish;
  const end = k.actual_finish ?? k.forecast_finish;
  const slip = plan && end ? Math.round((new Date(end).getTime() - new Date(plan).getTime()) / 86400000) : null;
  if (k.actual_finish || k.pct_complete >= 100) return { tone: "done", text: slip == null ? "Done" : slip > 0 ? `Done ${slip}d late` : slip < 0 ? `Done ${-slip}d early` : "Done on time", slip };
  if (!plan) return { tone: "none", text: "No baseline", slip };
  if (slip != null && slip > 0) return { tone: slip > 14 ? "crit" : "warn", text: `Forecast ${slip}d late`, slip };
  const left = day(plan);
  const started = !!k.actual_start || k.pct_complete > 0;
  if (left < 0) return { tone: -left > 14 ? "crit" : "warn", text: `${-left}d overdue`, slip };
  if (!started && k.planned_start && day(k.planned_start) < 0) return { tone: "warn", text: `Should have started ${-day(k.planned_start)}d ago`, slip };
  if (!started) return { tone: "none", text: day(k.planned_start ?? plan) === 0 ? "Starts today" : `Starts in ${day(k.planned_start ?? plan)}d`, slip };
  return { tone: left <= 7 ? "soon" : "ok", text: left === 0 ? "Due today" : `${left}d left`, slip };
}

// ---------- meetings (db/018, copied from C5) ----------
export type MeetingLocation = "ROOM" | "SITE" | "ONLINE";
export const LOCATION_LABEL: Record<MeetingLocation, string> = { ROOM: "Office room", SITE: "On site", ONLINE: "Online" };
export type Meeting = {
  id: string; title: string; project_id: string | null; location: MeetingLocation;
  meeting_date: string; start_time: string; end_time: string; notes: string | null; cancelled: boolean;
  created_by: string | null; updated_by: string | null; created_at: string; updated_at: string;
  // from meetings_live
  project_name: string | null; enquiry_no: string | null; created_by_name: string | null; updated_by_name: string | null;
  attendee_ids: string[]; attendees: string[];
};
/** Working week: Monday to Saturday (Saturdays are quiet but on the diary), 08:00–18:00 Dubai. */
export const WEEK_DAYS = 6;
export const DAY_START = 8;   // working hours, shaded and where the grid opens
export const DAY_END = 18;
export const GRID_START = 6;  // the grid itself runs 06:00–22:00 so early or late meetings still fit
export const GRID_END = 22;
export const hm = (t: string | null | undefined) => (t ?? "").slice(0, 5);          // "09:30:00" -> "09:30"
export const mins = (t: string) => { const [h, m] = t.split(":").map(Number); return h * 60 + (m || 0); };
/** YYYY-MM-DD for today in Dubai, whatever the server's clock zone */
export const todayDubai = () => new Date().toLocaleDateString("en-CA", { timeZone: "Asia/Dubai" });
export const addDays = (iso: string, n: number) => { const d = new Date(iso + "T00:00:00Z"); d.setUTCDate(d.getUTCDate() + n); return d.toISOString().slice(0, 10); };
/** the Monday that starts the working week containing `iso` (a Sunday rolls forward to the coming week) */
export function weekStart(iso: string) {
  const dow = new Date(iso + "T00:00:00Z").getUTCDay(); // 0 = Sun
  return dow === 0 ? addDays(iso, 1) : addDays(iso, 1 - dow);
}
export const fmtDay = (iso: string) => new Date(iso + "T00:00:00Z").toLocaleDateString("en-GB", { weekday: "short", day: "numeric", month: "short", timeZone: "UTC" });
export const fmtDayLong = (iso: string) => new Date(iso + "T00:00:00Z").toLocaleDateString("en-GB", { weekday: "long", day: "numeric", month: "long", timeZone: "UTC" });
