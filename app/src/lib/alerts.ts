// Site-progress alerts. Called once a day (07:00 Dubai) by pg_cron -> POST /api/alerts.
//
//   Mon  ask       every PM gets one email per live project: "Is X on track?" with a link to the check-in
//   Wed  nudge     PMs who haven't checked in this week
//   Thu  escalate  management gets the list of projects still without a check-in
//   daily          programme packages overdue / forecast late -> PM (and management if >= 3 behind or forecast past target)
//   daily          a Slipping / Blocked check-in in the last 24h -> management, with the PM's note
//
// Every email is recorded in scheduler.alerts (rule + project + person); a rule is not repeated to the same
// person for the same project within 6 days, so a bad week produces one email per rule, not one per day.
import { admin, APP_URL } from "@/lib/notify";
import { CHECKIN_LABEL, type CheckinStatus } from "@/lib/model";

const FROM = "Bolsover Projects <scheduler@bolsovercontracting.com>";
type Person = { id: string; name: string; full_name: string | null; email: string | null; is_active: boolean; role: string };
type Proj = {
  id: string; enquiry_no: string | null; name: string; client: string | null; status: string; pm_id: string | null; pm2_id: string | null; site_engineer_id: string | null;
  target_date: string | null; prog_pkgs: number | null; prog_behind: number | null; prog_done: number | null; prog_pct: number | null; prog_forecast_end: string | null;
  checkin_status: CheckinStatus | null; checkin_note: string | null; checkin_at: string | null; checkin_by: string | null;
};
type Pkg = { id: string; project_id: string; name: string; planned_start: string | null; planned_finish: string | null; forecast_finish: string | null; actual_start: string | null; actual_finish: string | null; pct_complete: number; note: string | null };

const title = (s: string | null | undefined) => s ? s.toLowerCase().replace(/\b\w/g, (c) => c.toUpperCase()).replace(/\bMep\b/, "MEP") : "—";
const fmtD = (s: string | null) => s ? new Date(s + "T00:00:00").toLocaleDateString("en-GB", { day: "numeric", month: "short" }) : "—";
const esc = (s: string) => s.replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c] as string));
const dubai = () => new Date(new Date().toLocaleString("en-US", { timeZone: "Asia/Dubai" }));
const weekStart = () => { const d = dubai(); d.setDate(d.getDate() - ((d.getDay() + 6) % 7)); return d.toISOString().slice(0, 10); };
const daysAgo = (iso: string | null) => iso ? Math.floor((Date.now() - new Date(iso).getTime()) / 86400000) : 999;

function pkgIssue(k: Pkg, today: string): string | null {
  if (k.actual_finish || k.pct_complete >= 100) return null;
  if (k.forecast_finish && k.planned_finish && k.forecast_finish > k.planned_finish) {
    const slip = Math.round((new Date(k.forecast_finish).getTime() - new Date(k.planned_finish).getTime()) / 86400000);
    return `forecast ${slip}d late (${fmtD(k.planned_finish)} → ${fmtD(k.forecast_finish)})`;
  }
  if (k.planned_finish && k.planned_finish < today) return `${daysAgo(k.planned_finish)}d overdue (due ${fmtD(k.planned_finish)}, ${k.pct_complete}% done)`;
  if (!k.actual_start && k.pct_complete === 0 && k.planned_start && k.planned_start < today) return `should have started ${daysAgo(k.planned_start)}d ago`;
  return null;
}

function wrap(heading: string, body: string, cta?: { href: string; label: string }) {
  return `<!doctype html><html><body style="margin:0;background:#f6f3ee;font-family:Helvetica,Arial,sans-serif;color:#1b2a41">
    <div style="max-width:620px;margin:0 auto;padding:28px 20px">
      <div style="font-size:12px;letter-spacing:.1em;text-transform:uppercase;color:#8a7a5c;margin-bottom:6px">Bolsover Projects</div>
      <h1 style="font-size:20px;margin:0 0 16px">${esc(heading)}</h1>
      <div style="background:#fff;border:1px solid #e6e0d6;border-radius:12px;padding:18px 20px;font-size:14px;line-height:1.5">${body}</div>
      ${cta ? `<p style="margin:18px 0 0"><a href="${cta.href}" style="display:inline-block;background:#1b2a41;color:#fff;text-decoration:none;padding:10px 16px;border-radius:999px;font-weight:700">${esc(cta.label)}</a></p>` : ""}
      <div style="font-size:12px;color:#9a9a9a;margin-top:18px">Sent once a day at most, only when something needs a look. <a href="${APP_URL}/board" style="color:#8a7a5c">Open the board</a></div>
    </div></body></html>`;
}

async function send(to: string, subject: string, html: string) {
  const key = process.env.RESEND_API_KEY;
  if (!key) throw new Error("RESEND_API_KEY is not set");
  const r = await fetch("https://api.resend.com/emails", {
    method: "POST", headers: { Authorization: `Bearer ${key}`, "Content-Type": "application/json" },
    body: JSON.stringify({ from: FROM, to: [to], subject, html, text: html.replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim() }),
  });
  if (!r.ok) throw new Error(`Resend ${r.status}: ${await r.text()}`);
}

export async function runAlerts(opts: { dryRun?: boolean; force?: string } = {}) {
  const db = admin();
  const today = dubai().toISOString().slice(0, 10);
  const dow = opts.force ?? ["sun", "mon", "tue", "wed", "thu", "fri", "sat"][dubai().getDay()];
  const week = weekStart();

  const [{ data: projs }, { data: ppl }, { data: pkgs }, { data: recent }] = await Promise.all([
    db.from("projects_live").select("id, enquiry_no, name, client, status, pm_id, pm2_id, site_engineer_id, target_date, prog_pkgs, prog_behind, prog_done, prog_pct, prog_forecast_end, checkin_status, checkin_note, checkin_at, checkin_by").in("status", ["LIVE", "PRE_MOB"]),
    db.from("people").select("id, name, full_name, email, is_active, role").eq("is_active", true),
    db.from("programme_packages").select("id, project_id, name, planned_start, planned_finish, forecast_finish, actual_start, actual_finish, pct_complete, note"),
    db.from("alerts").select("rule, project_id, sent_to, sent_at").gte("sent_at", new Date(Date.now() - 6 * 86400000).toISOString()),
  ]);
  const projects = (projs ?? []) as Proj[];
  const people = new Map(((ppl ?? []) as Person[]).map((p) => [p.id, p]));
  const management = [...people.values()].filter((p) => p.role === "MANAGEMENT" && p.email);
  const packages = (pkgs ?? []) as Pkg[];
  const already = new Set(((recent ?? []) as { rule: string; project_id: string | null; sent_to: string | null }[]).map((a) => `${a.rule}|${a.project_id ?? ""}|${a.sent_to ?? ""}`));

  const planned: { rule: string; project_id: string | null; to: Person; subject: string; html: string }[] = [];
  const plan = (rule: string, project_id: string | null, to: Person | undefined, subject: string, html: string) => {
    if (!to?.email) return;
    if (already.has(`${rule}|${project_id ?? ""}|${to.id}`)) return;
    planned.push({ rule, project_id, to, subject, html });
  };
  const link = (p: Proj) => `${APP_URL}/projects/${p.id}#checkin`;
  const owners = (p: Proj) => [p.pm_id, p.pm2_id].filter(Boolean).map((id) => people.get(id as string)).filter((x): x is Person => !!x);

  for (const p of projects) {
    const mine = packages.filter((k) => k.project_id === p.id);
    const issues = mine.map((k) => ({ k, why: pkgIssue(k, today) })).filter((x) => x.why);
    const issueList = issues.length ? `<ul style="margin:8px 0 0;padding-left:18px">${issues.map(({ k, why }) => `<li><b>${esc(title(k.name))}</b> — ${esc(why as string)}</li>`).join("")}</ul>` : "";
    const checkedThisWeek = p.checkin_at && new Date(p.checkin_at).toISOString().slice(0, 10) >= week;
    const name = `${p.enquiry_no ? p.enquiry_no + " " : ""}${title(p.name)}`;

    // Monday: ask the PM
    if (dow === "mon") for (const pm of owners(p)) plan("checkin_ask", p.id, pm, `Is ${title(p.name)} on track?`,
      wrap(`${title(p.name)} — weekly check-in`, `<p>Hi ${esc(title(pm.name))}, one minute: is <b>${esc(title(p.name))}</b> on track this week?</p>${issues.length ? `<p>The programme says these need a look:</p>${issueList}` : "<p>Programme shows nothing overdue.</p>"}<p>Tap below, pick On track / Slipping / Blocked, add a line.</p>`, { href: link(p), label: "Check in" }));

    // Wednesday: nudge
    if (dow === "wed" && !checkedThisWeek) for (const pm of owners(p)) plan("checkin_nudge", p.id, pm, `Still need your check-in: ${title(p.name)}`,
      wrap(`No check-in yet for ${title(p.name)}`, `<p>Hi ${esc(title(pm.name))}, there's no check-in for <b>${esc(title(p.name))}</b> this week. It takes a minute — and if it's not done by Thursday it goes to Tom.</p>${issueList}`, { href: link(p), label: "Check in now" }));

    // daily: programme behind -> PM; management when it's serious
    if (issues.length) {
      for (const pm of owners(p)) plan("programme_late", p.id, pm, `${issues.length} package${issues.length === 1 ? "" : "s"} behind on ${title(p.name)}`,
        wrap(`${title(p.name)} — programme`, `<p>${issues.length} package${issues.length === 1 ? " is" : "s are"} behind the baseline:</p>${issueList}<p>Update the progress or the forecast dates on the project page so the picture's right.</p>`, { href: `${APP_URL}/projects/${p.id}`, label: "Open project" }));
      const serious = issues.length >= 3 || (p.prog_forecast_end && p.target_date && p.prog_forecast_end > p.target_date);
      if (serious) for (const m of management) plan("programme_late_mgmt", p.id, m, `${name}: ${issues.length} packages behind${p.prog_forecast_end && p.target_date && p.prog_forecast_end > p.target_date ? ", forecast past target" : ""}`,
        wrap(`${title(p.name)} — ${issues.length} packages behind`, `<p>PM: ${owners(p).map((o) => esc(title(o.name))).join(" + ") || "<b>unassigned</b>"} · ${p.prog_done ?? 0}/${p.prog_pkgs} done · ${p.prog_pct ?? 0}% weighted${p.prog_forecast_end ? ` · forecast end ${fmtD(p.prog_forecast_end)}` : ""}${p.target_date ? ` · target ${fmtD(p.target_date)}` : ""}</p>${issueList}${p.checkin_status ? `<p>Last check-in: <b>${CHECKIN_LABEL[p.checkin_status]}</b> ${daysAgo(p.checkin_at)}d ago${p.checkin_note ? ` — “${esc(p.checkin_note)}”` : ""}</p>` : "<p>No check-in on record.</p>"}`, { href: `${APP_URL}/projects/${p.id}`, label: "Open project" }));
    }

    // daily: a Slipping / Blocked check-in in the last 24h -> management
    if (p.checkin_status && p.checkin_status !== "ON_TRACK" && p.checkin_at && Date.now() - new Date(p.checkin_at).getTime() < 26 * 3600 * 1000) {
      const by = p.checkin_by ? people.get(p.checkin_by) : undefined;
      for (const m of management) plan(`checkin_flag:${p.checkin_at}`, p.id, m, `${CHECKIN_LABEL[p.checkin_status]}: ${title(p.name)}`,
        wrap(`${title(p.name)} — ${CHECKIN_LABEL[p.checkin_status]}`, `<p>${esc(title(by?.name ?? "The PM"))} checked in <b>${CHECKIN_LABEL[p.checkin_status]}</b>:</p><blockquote style="margin:8px 0;padding:8px 12px;border-left:3px solid #8a7a5c;background:#faf7f2">${esc(p.checkin_note ?? "no note")}</blockquote>${issueList}`, { href: `${APP_URL}/projects/${p.id}`, label: "Open project" }));
    }
  }

  // Thursday: escalate the missing check-ins in one email
  if (dow === "thu") {
    const missing = projects.filter((p) => !(p.checkin_at && new Date(p.checkin_at).toISOString().slice(0, 10) >= week));
    if (missing.length) for (const m of management) plan("checkin_escalate", null, m, `${missing.length} project${missing.length === 1 ? "" : "s"} with no check-in this week`,
      wrap("No weekly check-in", `<p>These live projects have had no PM check-in this week (asked Monday, nudged Wednesday):</p><ul style="margin:8px 0 0;padding-left:18px">${missing.map((p) => `<li><a href="${APP_URL}/projects/${p.id}" style="color:#1b2a41"><b>${esc(title(p.name))}</b></a> — ${owners(p).map((o) => esc(title(o.name))).join(" + ") || "<b>no PM assigned</b>"}${p.prog_behind ? ` · ${p.prog_behind} behind` : ""}</li>`).join("")}</ul>`, { href: `${APP_URL}/board`, label: "Open the board" }));
  }

  if (opts.dryRun) return { dow, week, planned: planned.map((x) => ({ rule: x.rule, to: x.to.email, subject: x.subject })) };
  let sent = 0; const errors: string[] = [];
  for (const x of planned) {
    try {
      await send(x.to.email as string, x.subject, x.html);
      await db.from("alerts").insert({ rule: x.rule, project_id: x.project_id, sent_to: x.to.id, channel: "email" });
      sent++;
    } catch (e) { errors.push(`${x.rule} → ${x.to.email}: ${(e as Error).message}`); }
  }
  return { dow, week, sent, errors };
}

// ---------- 15:30 daily-report nudge ----------
// One email per person listing their live sites with no daily report yet today (no notes saved and no
// progress logged). Recorded as rule 'report_nudge' per project per person; one per person per day.
export async function runReportNudge(opts: { dryRun?: boolean } = {}) {
  const db = admin();
  const today = dubai().toISOString().slice(0, 10);
  const dayStart = new Date(`${today}T00:00:00+04:00`).toISOString();
  const [{ data: projs }, { data: ppl }, { data: reps }, { data: prog }, { data: done }] = await Promise.all([
    db.from("projects_live").select("id, enquiry_no, name, client, status, pm_id, pm2_id, site_engineer_id").in("status", ["LIVE", "PRE_MOB"]).is("archived_at", null),
    db.from("people").select("id, name, full_name, email, is_active, role").eq("is_active", true),
    db.from("site_reports").select("project_id, done, tomorrow, issues, sent_at").eq("day", today),
    db.from("boq_progress").select("item_id, boq_items!inner(boq_id, boqs!inner(project_id))").gte("at", dayStart),
    db.from("alerts").select("sent_to").eq("rule", "report_nudge").gte("sent_at", dayStart),
  ]);
  const people = new Map(((ppl ?? []) as Person[]).map((p) => [p.id, p]));
  const reported = new Set<string>();
  for (const r of (reps ?? []) as { project_id: string; done: string | null; tomorrow: string | null; issues: string | null; sent_at: string | null }[]) if (r.done || r.tomorrow || r.issues || r.sent_at) reported.add(r.project_id);
  for (const x of (prog ?? []) as unknown as { boq_items: { boqs: { project_id: string } } }[]) reported.add(x.boq_items.boqs.project_id);
  const alreadyNudged = new Set(((done ?? []) as { sent_to: string }[]).map((a) => a.sent_to));

  const byPerson = new Map<string, { id: string; name: string }[]>();
  for (const p of (projs ?? []) as Pick<Proj, "id" | "name" | "pm_id" | "pm2_id" | "site_engineer_id">[]) {
    if (reported.has(p.id)) continue;
    for (const id of [p.pm_id, p.pm2_id].filter(Boolean) as string[]) { if (!byPerson.has(id)) byPerson.set(id, []); byPerson.get(id)!.push({ id: p.id, name: p.name }); }
  }
  const planned: { to: Person; sites: { id: string; name: string }[] }[] = [];
  for (const [id, sites] of byPerson) { const to = people.get(id); if (to?.email && !alreadyNudged.has(id)) planned.push({ to, sites }); }
  if (opts.dryRun) return { today, planned: planned.map((x) => ({ to: x.to.email, sites: x.sites.map((s) => title(s.name)) })) };

  let sent = 0; const errors: string[] = [];
  for (const x of planned) {
    const list = x.sites.map((s) => `<li><a href="${APP_URL}/projects/${s.id}/report" style="color:#1b2a41"><b>${esc(title(s.name))}</b></a></li>`).join("");
    const html = wrap("Daily report not sent yet", `<p>Hi ${esc(title(x.to.name))}, it's 3:30 — ${x.sites.length === 1 ? "this site has" : "these sites have"} no daily report yet:</p><ul style="margin:8px 0 0;padding-left:18px">${list}</ul><p>Open the site, add your three lines (on site today / tomorrow / issues), tap <b>Open in WhatsApp</b> and send it to the project group. Two minutes.</p>`,
      { href: x.sites.length === 1 ? `${APP_URL}/projects/${x.sites[0].id}/report` : `${APP_URL}/board`, label: x.sites.length === 1 ? "Write the report" : "Open the board" });
    try {
      await send(x.to.email as string, `Daily report: ${x.sites.map((s) => title(s.name)).join(", ")}`, html);
      for (const s of x.sites) await db.from("alerts").insert({ rule: "report_nudge", project_id: s.id, sent_to: x.to.id, channel: "email" });
      sent++;
    } catch (e) { errors.push(`${x.to.email}: ${(e as Error).message}`); }
  }
  return { today, sent, errors };
}

// ---------- one-off announcement to everyone who owns a live site ----------
export async function runAnnouncement(opts: { dryRun?: boolean; subject: string; html: string }) {
  const db = admin();
  const [{ data: projs }, { data: ppl }] = await Promise.all([
    db.from("projects_live").select("id, pm_id, pm2_id, site_engineer_id").in("status", ["LIVE", "PRE_MOB"]).is("archived_at", null),
    db.from("people").select("id, name, full_name, email, is_active, role").eq("is_active", true),
  ]);
  const people = new Map(((ppl ?? []) as Person[]).map((p) => [p.id, p]));
  const ids = new Set<string>();
  for (const p of (projs ?? []) as { pm_id: string | null; pm2_id: string | null; site_engineer_id: string | null }[]) for (const id of [p.pm_id, p.pm2_id, p.site_engineer_id]) if (id) ids.add(id);
  const to = [...ids].map((id) => people.get(id)).filter((p): p is Person => !!p?.email);
  if (opts.dryRun) return { to: to.map((p) => `${title(p.name)} <${p.email}>`) };
  let sent = 0; const errors: string[] = [];
  for (const p of to) {
    try { await send(p.email as string, opts.subject, wrap(opts.subject, opts.html.replace(/\{name\}/g, esc(title(p.name))), { href: `${APP_URL}/board`, label: "Open Bolsover Projects" })); await db.from("alerts").insert({ rule: "announce", project_id: null, sent_to: p.id, channel: "email" }); sent++; }
    catch (e) { errors.push(`${p.email}: ${(e as Error).message}`); }
  }
  return { sent, errors };
}
