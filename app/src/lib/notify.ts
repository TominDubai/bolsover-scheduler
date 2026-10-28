// Batched change notifications.
// Called every 10 minutes by pg_cron -> POST /api/notify. Reads unsent rows from scheduler.change_log,
// groups them per recipient, sends one email per person via Resend, then marks the rows notified.
import { createClient } from "@supabase/supabase-js";
import { LABEL, QUOTE_LABEL, isQuote, type Status, type QuoteStage } from "@/lib/model";

export const APP_URL = "https://bolsover-scheduler.vercel.app";
const FROM = "Bolsover Projects <scheduler@bolsovercontracting.com>";
const QUIET_MS = 3 * 60 * 1000;        // skip a project edited in the last 3 minutes - the person is probably still on it
const MAX_AGE_MS = 7 * 24 * 3600 * 1000; // never email about something older than a week (e.g. a backlog after an outage)

type Change = { id: number; project_id: string; kind: string; field: string | null; old_value: string | null; new_value: string | null; changed_by: string | null; changed_at: string };
type Proj = { id: string; enquiry_no: string | null; name: string; client: string | null; status: Status; pm_id: string | null; pm2_id: string | null; site_engineer_id: string | null; estimator_id: string | null; signed_quote: number | null };
type Person = { id: string; name: string; full_name: string | null; email: string | null; is_active: boolean; notify_on_award: boolean };
const tc = (n: string) => n.toLowerCase().replace(/\b\w/g, (c) => c.toUpperCase());

export function admin() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !key) throw new Error("SUPABASE_SERVICE_ROLE_KEY is not set");
  return createClient(url, key, { db: { schema: "scheduler" }, auth: { persistSession: false } });
}

const FIELD: Record<string, string> = {
  name: "Project name", client: "Client", enquiry_no: "Enquiry no", status: "Status", quote_stage: "Quote stage",
  pm_id: "PM", pm2_id: "Second PM", site_engineer_id: "Site engineer", estimator_id: "QS", contractor_id: "Contractor",
  start_date: "Start date", target_date: "Target completion", completed_date: "Completed date", quote_due_date: "Quote due",
  signed_quote: "Signed quote", quoted_value: "Quoted value",
};

const fmtDate = (s: string | null) => s ? new Date(s + "T00:00:00").toLocaleDateString("en-GB", { day: "numeric", month: "short", year: "numeric" }) : "—";
const fmtAed = (s: string | null) => s && parseFloat(s) ? "AED " + Math.round(parseFloat(s)).toLocaleString("en-GB") : "—";
const fmtTime = (iso: string) => new Date(iso).toLocaleString("en-GB", { timeZone: "Asia/Dubai", weekday: "short", hour: "2-digit", minute: "2-digit" });
const esc = (s: string) => s.replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c] as string));

function value(field: string | null, v: string | null): string {
  if (v == null || v === "") return "—";
  switch (field) {
    case "status": return LABEL[v as Status] ?? v;
    case "quote_stage": return QUOTE_LABEL[v as QuoteStage] ?? v;
    case "start_date": case "target_date": case "completed_date": case "quote_due_date": return fmtDate(v);
    case "signed_quote": case "quoted_value": return fmtAed(v);
    default: return v;
  }
}

/** A quote being won — the one change management are told about by name (people flagged notify_on_award). */
export const isAward = (c: Change) =>
  c.kind === "field" && c.field === "status" && c.new_value === "WON" && c.old_value !== "WON";

export function describe(c: Change, p?: Proj): string {
  if (isAward(c)) {
    const value = p?.signed_quote ? ` — ${fmtAed(String(p.signed_quote))}` : "";
    const missing = p ? [!p.pm_id && "a project manager", !p.site_engineer_id && "a site engineer"].filter(Boolean) as string[] : [];
    const needs = missing.length ? ` Still needs ${missing.join(" and ")}.` : "";
    return `Signed${value}. Now at ${LABEL[c.new_value as Status] ?? c.new_value}.${needs}`;
  }
  const vo = (s: string | null) => { const [d, v] = (s ?? "").split(" | "); return `${d || "no description"} (${fmtAed(v ?? null)})`; };
  switch (c.kind) {
    case "created": return "New project created";
    case "removed": return `Project removed from the board — ${c.new_value ?? "no reason given"}`;
    case "restored": return "Project restored to the board";
    case "watcher_added": return `${tc(c.new_value ?? "")} is now kept updated on this project`;
    case "watcher_removed": return `${tc(c.old_value ?? "")} is no longer kept updated on this project`;
    case "vo_added": return `${c.field} added — ${vo(c.new_value)}`;
    case "vo_changed": return `${c.field} changed — ${vo(c.old_value)} → ${vo(c.new_value)}`;
    case "vo_removed": return `${c.field} removed — ${vo(c.old_value)}`;
    case "programme": return `Programme — ${c.field}: ${c.old_value ?? "—"} → ${c.new_value ?? "—"}`;
    case "checkin": return `Weekly check-in: ${c.field === "ON_TRACK" ? "On track" : c.field === "SLIPPING" ? "Slipping" : "Blocked"}${c.new_value ? ` — ${c.new_value}` : ""}`;
    default: return `${FIELD[c.field ?? ""] ?? c.field}: ${value(c.field, c.old_value)} → ${value(c.field, c.new_value)}`;
  }
}

/** Who should hear about a change to this project (excluding whoever made it).
 *  The PM, second PM and site engineer, the QS while it's still a quote, plus anyone tagged on the
 *  project ("Also keep updated", db/016). When a quote is won, everyone flagged notify_on_award hears
 *  about it too — at that moment nobody is assigned yet, so without them the signing would go nowhere. */
export function recipients(p: Proj, changes: Change[], people: Map<string, Person>, watchers: Set<string>): Person[] {
  const ids = new Set<string>();
  for (const id of [p.pm_id, p.pm2_id, p.site_engineer_id]) if (id) ids.add(id);
  if (isQuote(p.status) && p.estimator_id) ids.add(p.estimator_id);
  for (const id of watchers) ids.add(id);
  const wonOrNew = changes.some((c) => (c.kind === "created" && !isQuote(p.status)) || isAward(c));
  if (wonOrNew) for (const person of people.values()) if (person.notify_on_award) ids.add(person.id);
  const actors = new Set(changes.map((c) => c.changed_by).filter(Boolean));
  // if every change in this batch came from one person, don't tell them about their own edits
  const soleActor = actors.size === 1 ? [...actors][0] : null;
  return [...ids].filter((id) => id !== soleActor).map((id) => people.get(id)).filter((x): x is Person => !!x && x.is_active && !!x.email);
}

function renderEmail(to: Person, groups: { p: Proj; changes: Change[] }[], people: Map<string, Person>): { subject: string; html: string; text: string } {
  const first = groups[0].p;
  const subject = groups.length === 1
    ? `${first.name}${first.enquiry_no ? ` (${first.enquiry_no})` : ""} — ${groups[0].changes.length === 1 ? describe(groups[0].changes[0], first) : groups[0].changes.length + " updates"}`
    : `${first.name} and ${groups.length - 1} other project${groups.length > 2 ? "s" : ""} updated`;

  const who = (id: string | null) => (id && people.get(id)?.name) || "someone";
  const sections = groups.map(({ p, changes }) => `
    <div style="margin:0 0 22px 0;padding:16px 18px;border:1px solid #e6e1d8;border-radius:10px;background:#fff">
      <div style="font-size:11px;letter-spacing:.08em;text-transform:uppercase;color:#8a7a5c">${esc(p.enquiry_no ?? "")}${p.client ? ` · ${esc(p.client)}` : ""}</div>
      <div style="font-size:17px;font-weight:600;color:#14213d;margin:2px 0 10px"><a href="${APP_URL}/projects/${p.id}" style="color:#14213d;text-decoration:none">${esc(p.name)}</a></div>
      <ul style="margin:0;padding:0 0 0 18px;color:#2b2b2b;font-size:14px;line-height:1.55">
        ${changes.map((c) => `<li>${esc(describe(c, p))} <span style="color:#8a8a8a;font-size:12px">— ${esc(who(c.changed_by))}, ${fmtTime(c.changed_at)}</span></li>`).join("")}
      </ul>
      <div style="margin-top:10px"><a href="${APP_URL}/projects/${p.id}" style="font-size:13px;color:#8a7a5c">Open project →</a></div>
    </div>`).join("");

  const html = `<!doctype html><html><body style="margin:0;background:#f6f3ee;font-family:-apple-system,Segoe UI,Helvetica,Arial,sans-serif">
    <div style="max-width:600px;margin:0 auto;padding:28px 18px">
      <div style="font-size:12px;letter-spacing:.1em;text-transform:uppercase;color:#8a7a5c;margin-bottom:6px">Bolsover Projects</div>
      <div style="font-size:15px;color:#2b2b2b;margin-bottom:18px">Hi ${esc(to.full_name?.split(" ")[0] ?? to.name)}, here's what changed on your projects.</div>
      ${sections}
      <div style="font-size:12px;color:#9a9a9a;margin-top:8px">You get this because you're the PM, site engineer or QS on these projects, or you've been tagged to be kept updated. Updates are grouped and sent at most every 10 minutes. <a href="${APP_URL}/board" style="color:#8a7a5c">Open the board</a></div>
    </div></body></html>`;

  const text = groups.map(({ p, changes }) => `${p.enquiry_no ?? ""} ${p.name}\n${changes.map((c) => `  - ${describe(c, p)} (${who(c.changed_by)}, ${fmtTime(c.changed_at)})`).join("\n")}\n  ${APP_URL}/projects/${p.id}`).join("\n\n");
  return { subject, html, text };
}

async function sendEmail(to: string, msg: { subject: string; html: string; text: string }) {
  const key = process.env.RESEND_API_KEY;
  if (!key) throw new Error("RESEND_API_KEY is not set");
  const r = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: { Authorization: `Bearer ${key}`, "Content-Type": "application/json" },
    body: JSON.stringify({ from: FROM, to: [to], subject: msg.subject, html: msg.html, text: msg.text }),
  });
  if (!r.ok) throw new Error(`Resend ${r.status}: ${await r.text()}`);
}

export async function runNotifications(opts: { dryRun?: boolean } = {}) {
  const db = admin();
  const now = Date.now();
  const { data: unsent, error } = await db.from("change_log").select("*").is("notified_at", null).order("changed_at");
  if (error) throw new Error(error.message);
  const all = (unsent ?? []) as Change[];
  if (all.length === 0) return { sent: 0, skipped: 0, pending: 0, stale: 0 };

  // changes older than a week are marked done without emailing
  const stale = all.filter((c) => now - new Date(c.changed_at).getTime() > MAX_AGE_MS);
  if (stale.length && !opts.dryRun) await db.from("change_log").update({ notified_at: new Date().toISOString() }).in("id", stale.map((c) => c.id));
  const fresh = all.filter((c) => !stale.includes(c));

  // group by project; hold back projects still being edited
  const byProject = new Map<string, Change[]>();
  for (const c of fresh) byProject.set(c.project_id, [...(byProject.get(c.project_id) ?? []), c]);
  const ready = [...byProject.entries()].filter(([, cs]) => now - Math.max(...cs.map((c) => new Date(c.changed_at).getTime())) > QUIET_MS);
  const pending = byProject.size - ready.length;
  if (ready.length === 0) return { sent: 0, skipped: 0, pending, stale: stale.length };

  const pIds = ready.map(([id]) => id);
  const [{ data: projs }, { data: ppl }, { data: ws }] = await Promise.all([
    db.from("projects").select("id, enquiry_no, name, client, status, pm_id, pm2_id, site_engineer_id, estimator_id, signed_quote").in("id", pIds),
    db.from("people").select("id, name, full_name, email, is_active, notify_on_award"),
    db.from("project_watchers").select("project_id, person_id").in("project_id", pIds),
  ]);
  const people = new Map(((ppl ?? []) as Person[]).map((p) => [p.id, p]));
  const watchers = new Map<string, Set<string>>();
  for (const w of (ws ?? []) as { project_id: string; person_id: string }[])
    watchers.set(w.project_id, (watchers.get(w.project_id) ?? new Set()).add(w.person_id));
  const projects = new Map(((projs ?? []) as Proj[]).map((p) => [p.id, p]));

  // fan out: recipient -> projects -> changes
  const perPerson = new Map<string, { p: Proj; changes: Change[] }[]>();
  const doneIds: number[] = []; let noRecipient = 0;
  for (const [pid, changes] of ready) {
    const p = projects.get(pid);
    doneIds.push(...changes.map((c) => c.id));
    if (!p) continue; // project deleted since
    const rs = recipients(p, changes, people, watchers.get(p.id) ?? new Set());
    if (rs.length === 0) noRecipient++;
    for (const r of rs) perPerson.set(r.id, [...(perPerson.get(r.id) ?? []), { p, changes }]);
  }

  let sent = 0; const failures: string[] = []; const preview: Record<string, string> = {};
  for (const [id, groups] of perPerson) {
    const to = people.get(id)!;
    const msg = renderEmail(to, groups, people);
    if (opts.dryRun) { preview[to.email!] = msg.subject; continue; }
    try { await sendEmail(to.email!, msg); sent++; }
    catch (e) { failures.push(`${to.email}: ${(e as Error).message}`); }
  }
  // Mark the batch done even if a send failed — one broken address must not make everyone else get the same email every 10 minutes.
  if (!opts.dryRun) await db.from("change_log").update({ notified_at: new Date().toISOString() }).in("id", doneIds);
  return { sent, projects: ready.length, noRecipient, pending, stale: stale.length, recipients: perPerson.size, failures, ...(opts.dryRun ? { preview } : {}) };
}
