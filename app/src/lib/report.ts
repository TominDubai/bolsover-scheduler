import { createClient } from "@/lib/supabase/server";
import { health, title, type Project, type Package } from "@/lib/model";
import { getApprovedItems } from "@/lib/boq";
import { APP_URL } from "@/lib/notify";

/** Daily site report — figures computed live from the progress log, words from site_reports. */

export type SiteReport = { id: string; project_id: string; day: string; done: string | null; tomorrow: string | null; issues: string | null; by_id: string | null; sent_at: string | null };
export type ProgressLine = { ref: string | null; description: string; section: string; from: number; to: number; amount: number; by: string | null };
export const hasNotes = (r: SiteReport | null) => !!(r && (r.done || r.tomorrow || r.issues));
export type ProjectDay = {
  project: Project; day: string; report: SiteReport | null;
  lines: ProgressLine[];                     // every item that moved on the day (collapsed to first → last)
  total: number; installed: number;          // ex-VAT contract value and installed value now
  installedStart: number;                    // installed value at the start of the day (to show the day's delta)
  itemsDone: number; itemsLive: number;
  hasBill: boolean;
  photos: number;                            // photos taken on the day
  packages: Package[];                       // the project's packages (db/019): on site / slipping / milestones hit today
};

/** Dubai day boundaries as UTC ISO strings. */
export function dayBounds(day: string) {
  const start = new Date(`${day}T00:00:00+04:00`); const end = new Date(start.getTime() + 86400000);
  return { start: start.toISOString(), end: end.toISOString() };
}
export const todayDubai = () => new Date(Date.now() + 4 * 3600000).toISOString().slice(0, 10);

export async function getProjectDay(projectId: string, day: string): Promise<ProjectDay | null> {
  const supabase = await createClient();
  const { start, end } = dayBounds(day);
  const [{ data: p }, a, { data: rep }, { data: log }, { data: people }, { count: photos }, { data: pkgs }] = await Promise.all([
    supabase.from("projects_live").select("*").eq("id", projectId).maybeSingle(),
    getApprovedItems(projectId),
    supabase.from("site_reports").select("*").eq("project_id", projectId).eq("day", day).maybeSingle(),
    supabase.from("boq_progress").select("item_id, pct, prev_pct, by_id, at").gte("at", start).lt("at", end).order("at"),
    supabase.from("people").select("id, name"),
    supabase.from("site_photos").select("id", { count: "exact", head: true }).eq("project_id", projectId).eq("day", day),
    supabase.from("packages_live").select("*").eq("project_id", projectId).eq("cancelled", false).order("sort"),
  ]);
  if (!p) return null;
  const project = p as Project;
  const names = new Map((people ?? []).map((x: { id: string; name: string }) => [x.id, title(x.name)]));
  const live = a.items.filter((i) => !i.is_note && !i.excluded);
  const byId = new Map(live.map((i) => [i.id, i]));
  const secTitle = new Map(a.sections.map((s) => [s.id, `${s.code ?? ""}. ${s.title}`.replace(/^\. /, "")]));
  // collapse the day's log per item: first prev_pct → last pct
  const moved = new Map<string, { from: number; to: number; by: string | null }>();
  for (const l of (log ?? []) as { item_id: string; pct: number; prev_pct: number | null; by_id: string | null }[]) {
    if (!byId.has(l.item_id)) continue;
    const m = moved.get(l.item_id);
    if (m) { m.to = Number(l.pct); m.by = l.by_id ? names.get(l.by_id) ?? m.by : m.by; }
    else moved.set(l.item_id, { from: Number(l.prev_pct ?? 0), to: Number(l.pct), by: l.by_id ? names.get(l.by_id) ?? null : null });
  }
  const lines: ProgressLine[] = [];
  let installedStart = 0;
  for (const i of live) {
    const m = moved.get(i.id);
    installedStart += i.amount * (m ? m.from : i.installed_pct) / 100;
    if (m && m.to !== m.from) lines.push({ ref: i.ref, description: i.description.split("\n")[0], section: secTitle.get(i.section_id) ?? "", from: m.from, to: m.to, amount: i.amount, by: m.by });
  }
  lines.sort((x, y) => x.section.localeCompare(y.section) || (x.ref ?? "").localeCompare(y.ref ?? ""));
  return {
    project, day, report: (rep as SiteReport | null) ?? null, lines,
    total: live.reduce((s, i) => s + i.amount, 0), installed: live.reduce((s, i) => s + i.amount * i.installed_pct / 100, 0), installedStart,
    itemsDone: live.filter((i) => i.installed_pct >= 100).length, itemsLive: live.length, hasBill: a.boqs.length > 0,
    photos: photos ?? 0,
    packages: (pkgs ?? []) as Package[],
  };
}

const nice = (s: string) => title(s).replace(/\bMep\b/, "MEP").replace(/\bHvac\b/, "HVAC");
/** Package lines for the message: milestones stamped today, what's on site, what's slipping. */
function packageLines(d: ProjectDay): string[] {
  const ks = d.packages;
  if (!ks.length) return [];
  const out: string[] = [];
  const hit = (m: "awarded_on" | "approved_on" | "on_site_on" | "complete_on" | "snagged_on", label: string) => ks.filter((k) => k[m] === d.day).map((k) => `• ${nice(k.name)}${k.supplier ? ` (${k.supplier})` : ""} — ${label}`);
  const today = [...hit("snagged_on", "snagged ✅"), ...hit("complete_on", "complete ✅"), ...hit("on_site_on", "started on site"), ...hit("approved_on", "approvals in"), ...hit("awarded_on", "awarded")];
  const onSite = ks.filter((k) => k.status === "ON_SITE");
  const slipping = ks.filter((k) => (k.slipping || k.forecast_late) && k.status !== "COMPLETE" && k.status !== "SNAGGED");
  const done = ks.filter((k) => k.status === "COMPLETE" || k.status === "SNAGGED").length;
  const awarded = ks.filter((k) => k.status !== "NOT_AWARDED").length;
  out.push(`*Packages:* ${awarded}/${ks.length} awarded · ${onSite.length} on site · ${done} complete${slipping.length ? ` · ⚠️ ${slipping.length} slipping` : ""}`);
  if (onSite.length) out.push(`_On site:_ ${onSite.slice(0, 6).map((k) => `${nice(k.name)}${k.supplier ? ` (${k.supplier})` : ""}${k.pct_complete ? ` ${k.pct_complete}%` : ""}`).join(", ")}${onSite.length > 6 ? ` +${onSite.length - 6}` : ""}`);
  if (slipping.length) out.push(`_Slipping:_ ${slipping.slice(0, 5).map((k) => `${nice(k.name)}${k.days_overdue ? ` ${k.days_overdue}d` : " (forecast)"}`).join(", ")}${slipping.length > 5 ? ` +${slipping.length - 5}` : ""}`);
  if (today.length) { out.push("_Today:_"); out.push(...today); }
  return out;
}

const dmy = (d: string) => new Date(`${d}T12:00:00+04:00`).toLocaleDateString("en-GB", { weekday: "short", day: "numeric", month: "short", year: "numeric" });
const dm = (d: string | null) => d ? new Date(`${d}T12:00:00+04:00`).toLocaleDateString("en-GB", { day: "numeric", month: "short" }) : "";
const pc = (v: number) => `${Math.round(v)}%`;

/** The WhatsApp message for one site. WhatsApp bold = *text*. */
export function formatProjectReport(d: ProjectDay, author: string): string {
  const p = d.project;
  const out: string[] = [];
  out.push(`*${title(p.name)} — site report*`);
  out.push(`${dmy(d.day)}${author ? ` · ${author}` : ""}`);
  out.push("");
  if (d.hasBill) {
    const overall = d.total ? d.installed / d.total * 100 : 0;
    const delta = d.total ? (d.installed - d.installedStart) / d.total * 100 : 0;
    out.push(`*Installed:* ${pc(overall)} by value${delta > 0.05 ? ` (+${delta.toFixed(1)}% today)` : ""} · ${d.itemsDone}/${d.itemsLive} items complete`);
  }
  const h = health(p);
  const prog: string[] = [];
  if (p.prog_pkgs) prog.push(`${p.prog_done ?? 0}/${p.prog_pkgs} packages done${p.prog_behind ? `, ${p.prog_behind} behind` : ""}`);
  if (p.prog_next_due) prog.push(`next due ${dm(p.prog_next_due)}`);
  if (p.target_date) prog.push(`target ${dm(p.target_date)}`);
  if (prog.length) out.push(`*Programme:* ${prog.join(" · ")}${h && h.text !== "No programme" ? ` — ${h.text}` : ""}`);
  out.push(...packageLines(d));
  if (d.lines.length) {
    out.push(""); out.push("*Progress today*");
    const show = d.lines.slice(0, 14);
    let sec = "";
    for (const l of show) {
      if (l.section !== sec) { out.push(`_${l.section}_`); sec = l.section; }
      out.push(`• ${l.ref ? l.ref + " " : ""}${l.description.length > 70 ? l.description.slice(0, 70) + "…" : l.description} ${pc(l.from)} → ${pc(l.to)}${l.to >= 100 ? " ✅" : ""}`);
    }
    if (d.lines.length > show.length) out.push(`• +${d.lines.length - show.length} more items`);
  }
  const r = d.report;
  if (r?.done) { out.push(""); out.push("*On site today*"); out.push(r.done.trim()); }
  if (r?.tomorrow) { out.push(""); out.push("*Tomorrow*"); out.push(r.tomorrow.trim()); }
  if (r?.issues) { out.push(""); out.push("*Issues / needs*"); out.push(r.issues.trim()); }
  if (d.photos) { out.push(""); out.push(`📷 ${d.photos} photo${d.photos === 1 ? "" : "s"}: ${APP_URL}/p/${p.id}/${d.day}`); }
  return out.join("\n");
}

/** One message covering every live site — for Tom and the office. */
export async function formatDigest(day: string): Promise<{ text: string; days: ProjectDay[] }> {
  const supabase = await createClient();
  const { data } = await supabase.from("projects_live").select("id, name, status").in("status", ["LIVE", "PRE_MOB"]).is("archived_at", null).is("deleted_at", null).order("name");
  const days = (await Promise.all(((data ?? []) as { id: string }[]).map((p) => getProjectDay(p.id, day)))).filter((x): x is ProjectDay => !!x);
  const out: string[] = [`*Bolsover sites — ${dmy(day)}*`, ""];
  for (const d of days) {
    const p = d.project; const h = health(p);
    const overall = d.total ? d.installed / d.total * 100 : null;
    const delta = d.total ? (d.installed - d.installedStart) / d.total * 100 : 0;
    const bits: string[] = [];
    if (overall != null) bits.push(`${pc(overall)} installed${delta > 0.05 ? ` (+${delta.toFixed(1)}%)` : ""}`);
    if (d.lines.length) bits.push(`${d.lines.length} item${d.lines.length === 1 ? "" : "s"} moved`);
    if (d.photos) bits.push(`${d.photos} photo${d.photos === 1 ? "" : "s"}`);
    const onSite = d.packages.filter((k) => k.status === "ON_SITE").length, slip = d.packages.filter((k) => (k.slipping || k.forecast_late) && k.status !== "COMPLETE" && k.status !== "SNAGGED").length;
    if (d.packages.length) bits.push(`${onSite} pkg on site${slip ? ` · ${slip} slipping` : ""}`);
    if (h) bits.push(h.text);
    if (p.target_date) bits.push(`target ${dm(p.target_date)}`);
    out.push(`*${title(p.name)}*${p.pm ? ` · ${title(p.pm)}` : ""}`);
    out.push(bits.length ? bits.join(" · ") : "no update");
    if (d.report?.done) out.push(d.report.done.trim().split("\n")[0]);
    if (d.report?.issues) out.push(`⚠️ ${d.report.issues.trim().split("\n")[0]}`);
    const stamped = d.packages.some((k) => [k.awarded_on, k.approved_on, k.on_site_on, k.complete_on, k.snagged_on].includes(d.day));
    if (!hasNotes(d.report) && !d.lines.length && !stamped) out[out.length - 1] = "no report today";
    out.push("");
  }
  return { text: out.join("\n").trim(), days };
}
