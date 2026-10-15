"use server";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import type { Status, QuoteStage } from "@/lib/model";

const nz = (v: FormDataEntryValue | null) => { const s = (v ?? "").toString().trim(); return s === "" ? null : s; };
const num = (v: FormDataEntryValue | null) => { const n = parseFloat((v ?? "").toString().replace(/[^0-9.\-]/g, "")); return isNaN(n) ? 0 : n; };

export async function signOut() {
  const supabase = await createClient();
  await supabase.auth.signOut();
  redirect("/login");
}

export async function setStatus(id: string, status: Status) {
  const supabase = await createClient();
  const { error } = await supabase.from("projects").update({ status }).eq("id", id);
  if (error) return { error: error.message };
  revalidatePath("/board"); revalidatePath("/list"); revalidatePath(`/projects/${id}`);
  return { ok: true };
}

function projectFields(fd: FormData) {
  // Only fields present on the submitted form are touched (disabled inputs are not submitted).
  const out: Record<string, unknown> = {};
  const has = (k: string) => fd.has(k);
  if (has("enquiry_no")) out.enquiry_no = nz(fd.get("enquiry_no"));
  if (has("name")) out.name = (nz(fd.get("name")) ?? "").toUpperCase();
  if (has("client")) out.client = nz(fd.get("client"))?.toUpperCase() ?? null;
  if (has("contractor_id")) out.contractor_id = nz(fd.get("contractor_id"));
  if (has("pm_id")) out.pm_id = nz(fd.get("pm_id"));
  if (has("pm2_id")) out.pm2_id = nz(fd.get("pm2_id"));
  if (has("site_engineer_id")) out.site_engineer_id = nz(fd.get("site_engineer_id"));
  if (has("status")) out.status = (nz(fd.get("status")) ?? "PENDING") as Status;
  if (has("received_date")) out.received_date = nz(fd.get("received_date"));
  if (has("start_date")) out.start_date = nz(fd.get("start_date"));
  if (has("target_date")) out.target_date = nz(fd.get("target_date"));
  if (has("completed_date")) out.completed_date = nz(fd.get("completed_date"));
  if (has("signed_quote")) out.signed_quote = num(fd.get("signed_quote"));
  if (has("notes")) out.notes = nz(fd.get("notes"));
  if (has("quote_stage")) out.quote_stage = (nz(fd.get("quote_stage")) ?? "QUEUED") as QuoteStage;
  if (has("estimator_id")) out.estimator_id = nz(fd.get("estimator_id"));
  if (has("quoted_value")) out.quoted_value = nz(fd.get("quoted_value")) ? num(fd.get("quoted_value")) : null;
  if (has("quote_submitted_date")) out.quote_submitted_date = nz(fd.get("quote_submitted_date"));
  if (has("quote_due_date")) out.quote_due_date = nz(fd.get("quote_due_date"));
  if (has("folder_path")) out.folder_path = nz(fd.get("folder_path"));
  if (has("quote_type")) out.quote_type = nz(fd.get("quote_type"))?.toUpperCase() ?? null;
  if (has("scope")) out.scope = fd.getAll("scope").map(String).filter(Boolean).join(", ") || null;
  if (has("waiting_on")) out.waiting_on = nz(fd.get("waiting_on"));
  if (has("raised_by")) out.raised_by = nz(fd.get("raised_by"))?.toUpperCase() ?? null;
  return out as { name?: string } & Record<string, unknown>;
}

function bust(id?: string) {
  revalidatePath("/estimation"); revalidatePath("/board"); revalidatePath("/list");
  if (id) revalidatePath(`/projects/${id}`);
}

export async function setQuoteStage(id: string, quote_stage: QuoteStage) {
  const supabase = await createClient();
  const patch: Record<string, unknown> = { quote_stage };
  if (quote_stage === "SUBMITTED") patch.quote_submitted_date = new Date().toISOString().slice(0, 10);
  const { error } = await supabase.from("projects").update(patch).eq("id", id);
  if (error) return { error: error.message };
  bust(id); return { ok: true };
}

export async function saveWaitingOn(id: string, waiting_on: string | null) {
  const supabase = await createClient();
  const { error } = await supabase.from("projects").update({ waiting_on }).eq("id", id);
  if (error) return { error: error.message };
  bust(id);
  return { ok: true };
}

export async function markWon(id: string) {
  const supabase = await createClient();
  const { data: p } = await supabase.from("projects").select("signed_quote, quoted_value").eq("id", id).single();
  const patch: Record<string, unknown> = { status: "QUOTED", quote_stage: "SUBMITTED" };
  if (p && !(p.signed_quote > 0) && p.quoted_value) patch.signed_quote = p.quoted_value;
  const { error } = await supabase.from("projects").update(patch).eq("id", id);
  if (error) return { error: error.message };
  bust(id); return { ok: true };
}

export async function markLost(id: string) {
  const supabase = await createClient();
  const { error } = await supabase.from("projects").update({ status: "LOST" }).eq("id", id);
  if (error) return { error: error.message };
  bust(id); return { ok: true };
}

export async function createEnquiry(_prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const name = (nz(fd.get("name")) ?? "").toUpperCase();
  if (!name) return { error: "Project name (location / address) is required." };
  let enquiry_no = nz(fd.get("enquiry_no"));
  if (!enquiry_no) { const { data } = await supabase.rpc("next_enquiry_no"); enquiry_no = data as string; }
  const { data, error } = await supabase.from("projects").insert({
    enquiry_no, name, client: nz(fd.get("client"))?.toUpperCase() ?? null,
    contractor_id: nz(fd.get("contractor_id")), estimator_id: nz(fd.get("estimator_id")),
    received_date: nz(fd.get("received_date")) ?? new Date().toISOString().slice(0, 10),
    quote_due_date: nz(fd.get("quote_due_date")), folder_path: nz(fd.get("folder_path")), notes: nz(fd.get("notes")),
    quote_type: nz(fd.get("quote_type"))?.toUpperCase() ?? null, scope: fd.getAll("scope").map(String).filter(Boolean).join(", ") || null,
    raised_by: nz(fd.get("raised_by"))?.toUpperCase() ?? null,
    status: "PENDING", quote_stage: "QUEUED",
  }).select("id, enquiry_no").single();
  if (error) return { error: error.message };
  bust(data.id);
  return { ok: true, enquiry_no: data.enquiry_no as string, id: data.id as string };
}

export async function saveProject(id: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const fields = projectFields(fd);
  if (fields.name === "") return { error: "Project name is required." };
  const { error } = await supabase.from("projects").update(fields).eq("id", id);
  if (error) return { error: error.message };
  revalidatePath("/board"); revalidatePath("/list"); revalidatePath(`/projects/${id}`);
  return { ok: true, at: new Date().toISOString() };
}

export async function createProject(_prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const fields = projectFields(fd);
  if (!fields.name) return { error: "Project name is required." };
  const { data, error } = await supabase.from("projects").insert(fields as { name: string }).select("id").single();
  if (error) return { error: error.message };
  revalidatePath("/board"); revalidatePath("/list");
  redirect(`/projects/${data.id}`);
}

export async function addVariation(projectId: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const { data: last } = await supabase.from("variations").select("vo_no").eq("project_id", projectId).order("vo_no", { ascending: false }).limit(1);
  const vo_no = (last?.[0]?.vo_no ?? 0) + 1;
  const { error } = await supabase.from("variations").insert({ project_id: projectId, vo_no, description: nz(fd.get("description")), value: num(fd.get("value")) });
  if (error) return { error: error.message };
  revalidatePath(`/projects/${projectId}`); revalidatePath("/board"); revalidatePath("/list");
  return { ok: true };
}

export async function deleteVariation(projectId: string, id: string) {
  const supabase = await createClient();
  const { error } = await supabase.from("variations").delete().eq("id", id);
  if (error) return { error: error.message };
  revalidatePath(`/projects/${projectId}`); revalidatePath("/board"); revalidatePath("/list");
  return { ok: true };
}

// ---------- programme ----------
export async function saveProgramme(projectId: string, packageId: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const pct = Math.max(0, Math.min(100, Math.round(num(fd.get("pct_complete")))));
  const patch: Record<string, unknown> = {
    pct_complete: pct,
    actual_start: nz(fd.get("actual_start")),
    actual_finish: nz(fd.get("actual_finish")),
    forecast_finish: nz(fd.get("forecast_finish")),
    note: nz(fd.get("note")),
  };
  if (pct === 100 && !patch.actual_finish) patch.actual_finish = new Date().toISOString().slice(0, 10);
  if (pct > 0 && !patch.actual_start) patch.actual_start = new Date().toISOString().slice(0, 10);
  const { error } = await supabase.from("programme_packages").update(patch).eq("id", packageId).eq("project_id", projectId);
  if (error) return { error: error.message };
  revalidatePath(`/projects/${projectId}`);
  return { ok: true, at: new Date().toISOString() };
}

// ---------- team ----------
const ROLES = ["PM", "SITE", "QS", "MANAGEMENT", "ADMIN"];
const email = (v: FormDataEntryValue | null) => { const s = nz(v)?.toLowerCase() ?? null; if (s && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(s)) throw new Error("That email address doesn't look right."); return s; };
const phone = (v: FormDataEntryValue | null) => { const s = nz(v)?.replace(/[\s\-()]/g, "") ?? null; if (s && !/^\+?\d{7,15}$/.test(s)) throw new Error("WhatsApp number should be digits only, e.g. +9715xxxxxxx"); return s; };

export async function savePerson(id: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  try {
    const role = nz(fd.get("role")); if (role && !ROLES.includes(role)) return { error: "Pick a role." };
    const patch = { full_name: nz(fd.get("full_name")), email: email(fd.get("email")), whatsapp: phone(fd.get("whatsapp")), is_active: fd.get("is_active") === "on",
      ...(role ? { role } : {}), can_edit_estimation: fd.get("can_edit_estimation") === "on", can_edit_projects: fd.get("can_edit_projects") === "on", can_manage_team: fd.get("can_manage_team") === "on" };
    const { error } = await supabase.from("people").update(patch).eq("id", id);
    if (error) return { error: error.message.includes("people_email_key") ? "Another person already has that email." : error.message.includes("own team permission") ? "You can't remove your own Team permission." : error.message };
  } catch (e) { return { error: (e as Error).message }; }
  revalidatePath("/team");
  return { ok: true, at: new Date().toISOString() };
}

export async function addPerson(_prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const name = (nz(fd.get("name")) ?? "").toUpperCase();
  const role = nz(fd.get("role")) ?? "";
  if (!name) return { error: "Short name is required (the name shown on cards, e.g. BASIM)." };
  if (!ROLES.includes(role)) return { error: "Pick a role." };
  try {
    const { error } = await supabase.from("people").insert({ name, role, full_name: nz(fd.get("full_name")), email: email(fd.get("email")), whatsapp: phone(fd.get("whatsapp")),
      can_edit_estimation: fd.get("can_edit_estimation") === "on", can_edit_projects: fd.get("can_edit_projects") === "on", can_manage_team: fd.get("can_manage_team") === "on" });
    if (error) return { error: error.message.includes("people_name_key") ? `${name} already exists.` : error.message.includes("people_email_key") ? "Another person already has that email." : error.message };
  } catch (e) { return { error: (e as Error).message }; }
  revalidatePath("/team");
  return { ok: true, at: new Date().toISOString() };
}

// ---------- weekly check-in ----------
export async function addCheckin(projectId: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const status = nz(fd.get("status"));
  if (!status || !["ON_TRACK", "SLIPPING", "BLOCKED"].includes(status)) return { error: "Pick On track, Slipping or Blocked." };
  const note = nz(fd.get("note"));
  if (status !== "ON_TRACK" && !note) return { error: "Add a line saying what's slipping or blocking — that's what the alert carries." };
  const { error } = await supabase.from("checkins").insert({ project_id: projectId, status, note });
  if (error) return { error: error.message.includes("row-level security") ? "Only the PM, second PM or site engineer on this project can check in." : error.message };
  revalidatePath(`/projects/${projectId}`); revalidatePath("/board"); revalidatePath("/list");
  return { ok: true };
}

// ---------- BOQ ----------
const BOQ_STATUSES = ["DRAFT", "SUBMITTED", "APPROVED", "SUPERSEDED", "REJECTED"];
const boqPaths = (projectId: string, boqId?: string) => { revalidatePath(`/projects/${projectId}`); if (boqId) revalidatePath(`/projects/${projectId}/boq/${boqId}`); revalidatePath(`/projects/${projectId}/progress`); revalidatePath("/board"); revalidatePath("/list"); };

export async function setBoqStatus(projectId: string, boqId: string, status: string) {
  if (!BOQ_STATUSES.includes(status)) return { error: "Unknown status." };
  const supabase = await createClient();
  const { error } = await supabase.from("boqs").update({ status }).eq("id", boqId).eq("project_id", projectId);
  if (error) return { error: error.message };
  boqPaths(projectId, boqId);
  return { ok: true };
}

export async function createBoq(projectId: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const kind = nz(fd.get("kind")) === "VARIATION" ? "VARIATION" : "QUOTE";
  const title = nz(fd.get("title"));
  if (!title) return { error: "Give the bill a title." };
  let variation_id: string | null = null;
  let rev_no = 0;
  if (kind === "VARIATION") {
    const { data: last } = await supabase.from("variations").select("vo_no").eq("project_id", projectId).order("vo_no", { ascending: false }).limit(1);
    const vo_no = (last?.[0]?.vo_no ?? 0) + 1;
    const { data: v, error: ve } = await supabase.from("variations").insert({ project_id: projectId, vo_no, description: title, value: 0 }).select("id").single();
    if (ve) return { error: ve.message };
    variation_id = v.id;
  } else {
    const { data: last } = await supabase.from("boqs").select("rev_no").eq("project_id", projectId).eq("kind", "QUOTE").order("rev_no", { ascending: false }).limit(1);
    rev_no = last?.length ? last[0].rev_no + 1 : 0;
  }
  const copyFrom = nz(fd.get("copy_from"));
  const { data: b, error } = await supabase.from("boqs").insert({ project_id: projectId, kind, rev_no, variation_id, title, quote_ref: nz(fd.get("quote_ref")), issue_date: new Date().toISOString().slice(0, 10), payment_terms: "30% advance, 70% on progress" }).select("id").single();
  if (error) return { error: error.message };
  if (copyFrom) {
    // new revision = copy of the previous one (sections + items, progress reset)
    const { data: secs } = await supabase.from("boq_sections").select("*").eq("boq_id", copyFrom).order("sort");
    const { data: its } = await supabase.from("boq_items").select("*").eq("boq_id", copyFrom).order("sort");
    for (const s of secs ?? []) {
      const { data: ns } = await supabase.from("boq_sections").insert({ boq_id: b.id, sort: s.sort, code: s.code, title: s.title, notes: s.notes }).select("id").single();
      const rows = (its ?? []).filter((i) => i.section_id === s.id).map((i) => ({ boq_id: b.id, section_id: ns!.id, sort: i.sort, ref: i.ref, subheading: i.subheading, description: i.description, qty: i.qty, unit: i.unit, rate: i.rate, cost_rate: i.cost_rate, markup_pct: i.markup_pct, rate_item_id: i.rate_item_id, is_note: i.is_note, excluded: i.excluded, notes: i.notes }));
      if (rows.length) await supabase.from("boq_items").insert(rows);
    }
  } else {
    await supabase.from("boq_sections").insert({ boq_id: b.id, sort: 0, code: "I", title: "Preliminaries" });
  }
  boqPaths(projectId, b.id);
  redirect(`/projects/${projectId}/boq/${b.id}`);
}

export async function addSection(projectId: string, boqId: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const title = nz(fd.get("title")); if (!title) return { error: "Section needs a title." };
  const { data: last } = await supabase.from("boq_sections").select("sort").eq("boq_id", boqId).order("sort", { ascending: false }).limit(1);
  const sort = (last?.[0]?.sort ?? -1) + 1;
  const ROMAN = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX"];
  const { error } = await supabase.from("boq_sections").insert({ boq_id: boqId, sort, code: nz(fd.get("code")) ?? ROMAN[sort] ?? String(sort + 1), title });
  if (error) return { error: error.message };
  boqPaths(projectId, boqId);
  return { ok: true };
}

export async function saveItem(projectId: string, boqId: string, itemId: string | null, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const is_note = fd.get("is_note") === "on";
  const rate = fd.has("rate") ? num(fd.get("rate")) : null;
  const cost = fd.has("cost_rate") ? num(fd.get("cost_rate")) : null;
  const patch: Record<string, unknown> = {
    ref: nz(fd.get("ref")), subheading: nz(fd.get("subheading")), description: nz(fd.get("description")) ?? "",
    qty: is_note ? null : num(fd.get("qty")), unit: nz(fd.get("unit")), rate: is_note ? null : rate,
    is_note, excluded: fd.get("excluded") === "on", notes: nz(fd.get("notes")),
  };
  if (fd.has("rate_item_id")) patch.rate_item_id = nz(fd.get("rate_item_id"));
  if (fd.has("cost_rate")) { patch.cost_rate = cost || null; patch.markup_pct = cost && rate ? Math.round(((rate / cost) - 1) * 10000) / 100 : nz(fd.get("markup_pct")) ? num(fd.get("markup_pct")) : null; }
  if (!patch.description) return { error: "Description is required." };
  if (itemId) {
    const { error } = await supabase.from("boq_items").update(patch).eq("id", itemId).eq("boq_id", boqId);
    if (error) return { error: error.message };
  } else {
    const section_id = nz(fd.get("section_id")); if (!section_id) return { error: "Pick a section." };
    const { data: last } = await supabase.from("boq_items").select("sort").eq("section_id", section_id).order("sort", { ascending: false }).limit(1);
    const { error } = await supabase.from("boq_items").insert({ ...patch, boq_id: boqId, section_id, sort: (last?.[0]?.sort ?? -1) + 1 });
    if (error) return { error: error.message };
  }
  boqPaths(projectId, boqId);
  return { ok: true, at: new Date().toISOString() };
}

export async function deleteItem(projectId: string, boqId: string, itemId: string) {
  const supabase = await createClient();
  const { error } = await supabase.from("boq_items").delete().eq("id", itemId).eq("boq_id", boqId);
  if (error) return { error: error.message };
  boqPaths(projectId, boqId);
  return { ok: true };
}

/** Site progress: installed % on one item (PM / site engineer of the project, or anyone who edits projects). */
export async function setInstalled(projectId: string, itemId: string, pct: number) {
  const supabase = await createClient();
  const p = Math.max(0, Math.min(100, Math.round(pct)));
  const { error } = await supabase.from("boq_items").update({ installed_pct: p }).eq("id", itemId);
  if (error) return { error: error.message.includes("row-level security") ? "Only the PM or site engineer on this project can update progress." : error.message };
  boqPaths(projectId);
  return { ok: true, pct: p };
}

// ---------- valuations (Progress Billing Reports) ----------
export async function createValuation(projectId: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const period_to = nz(fd.get("period_to")) ?? new Date().toISOString().slice(0, 10);
  const deposit_received = num(fd.get("deposit_received"));
  const adjLabel = nz(fd.get("adj_label")); const adjAmount = num(fd.get("adj_amount"));
  const { data: boqs } = await supabase.from("boqs").select("id, vat_pct").eq("project_id", projectId).eq("status", "APPROVED");
  const ids = (boqs ?? []).map((b) => b.id);
  if (ids.length === 0) return { error: "No approved BOQ on this project yet." };
  const vat = Number(boqs?.[0]?.vat_pct ?? 5);
  const { data: items } = await supabase.from("boq_items").select("id, amount, installed_pct, is_note, excluded").in("boq_id", ids);
  const live = (items ?? []).filter((i) => !i.is_note && !i.excluded);
  const contract_value = live.reduce((s, i) => s + Number(i.amount), 0);
  const installed_value = live.reduce((s, i) => s + Number(i.amount) * Number(i.installed_pct) / 100, 0);
  const { data: prev } = await supabase.from("valuations").select("no, installed_value").eq("project_id", projectId).order("no", { ascending: false }).limit(1);
  const no = (prev?.[0]?.no ?? 0) + 1;
  const prev_installed = Number(prev?.[0]?.installed_value ?? 0);
  const { data: prevRow } = await supabase.from("valuations").select("period_to").eq("project_id", projectId).eq("no", no - 1).maybeSingle();
  // Pao's method: progress is measured on the contract value inc VAT; the advance is recovered pro-rata to progress.
  const grand = contract_value * (1 + vat / 100);
  const thisPeriod = (installed_value - prev_installed) * (1 + vat / 100);
  const deposit_recovery = grand > 0 ? deposit_received * (installed_value - prev_installed) / contract_value : 0;
  const amount_due = thisPeriod + adjAmount - deposit_recovery;
  const snapshot = { items: live.map((i) => ({ id: i.id, pct: Number(i.installed_pct), amount: Number(i.amount) })), adjustments: adjLabel ? [{ label: adjLabel, amount: adjAmount }] : [] };
  const { data: v, error } = await supabase.from("valuations").insert({ project_id: projectId, no, period_from: prevRow?.period_to ?? null, period_to, issued_date: period_to, contract_value, installed_value, prev_installed, deposit_received, deposit_recovery, vat_pct: vat, amount_due, notes: nz(fd.get("notes")), snapshot }).select("id").single();
  if (error) return { error: error.message };
  revalidatePath(`/projects/${projectId}`);
  redirect(`/projects/${projectId}/valuations/${v.id}`);
}

export async function setValuationStatus(projectId: string, id: string, status: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const patch: Record<string, unknown> = { status };
  if (status === "PAID") { patch.paid_amount = num(fd.get("paid_amount")) || null; patch.paid_date = nz(fd.get("paid_date")) ?? new Date().toISOString().slice(0, 10); }
  if (fd.has("invoice_no")) patch.invoice_no = nz(fd.get("invoice_no"));
  const { error } = await supabase.from("valuations").update(patch).eq("id", id).eq("project_id", projectId);
  if (error) return { error: error.message };
  revalidatePath(`/projects/${projectId}`); revalidatePath(`/projects/${projectId}/valuations/${id}`);
  return { ok: true };
}

// ---------- archive (completed jobs leave the board; they stay on the List under "Archived") ----------
export async function archiveProject(id: string, archive: boolean) {
  const supabase = await createClient();
  const { error } = await supabase.rpc(archive ? "archive_project" : "unarchive_project", { p: id });
  if (error) return { error: error.message };
  revalidatePath("/board"); revalidatePath("/list"); revalidatePath(`/projects/${id}`);
  return { ok: true };
}

// ---------- rate library ----------
export type RateHit = { id: string; code: string | null; category: string; description: string; unit: string; cost_rate: number | null; sell_rate: number | null; markup_pct: number | null; use_count: number; last_used: string | null };

/** Search the rate library for the item picker. Cost comes back only for people who can see cost. */
export async function searchRates(q: string, showCost: boolean): Promise<RateHit[]> {
  const supabase = await createClient();
  const term = q.trim();
  if (term.length < 2) return [];
  const cols = "id, code, category, description, unit, sell_rate, markup_pct, use_count, last_used" + (showCost ? ", cost_rate" : "");
  const { data } = await supabase.from("rate_items").select(cols).eq("is_active", true)
    .or(`description.ilike.%${term.replace(/[%,()]/g, " ")}%,code.ilike.%${term.replace(/[%,()]/g, " ")}%,category.ilike.%${term.replace(/[%,()]/g, " ")}%`)
    .order("use_count", { ascending: false }).limit(12);
  return ((data ?? []) as unknown as RateHit[]).map((r) => ({ ...r, cost_rate: showCost ? r.cost_rate ?? null : null }));
}

export async function saveRate(id: string | null, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const sell = num(fd.get("sell_rate")) || null, cost = num(fd.get("cost_rate")) || null;
  const patch = {
    code: nz(fd.get("code")), category: nz(fd.get("category")) ?? "Misc", description: nz(fd.get("description")) ?? "", unit: nz(fd.get("unit")) ?? "Nos",
    sell_rate: sell, cost_rate: cost, markup_pct: cost && sell ? Math.round((sell / cost - 1) * 10000) / 100 : null, notes: nz(fd.get("notes")),
    is_active: fd.has("is_active") ? fd.get("is_active") === "on" : true,
  };
  if (!patch.description) return { error: "Description is required." };
  const { error } = id ? await supabase.from("rate_items").update(patch).eq("id", id) : await supabase.from("rate_items").insert(patch);
  if (error) return { error: error.code === "23505" ? "That description and unit is already in the library." : error.message };
  revalidatePath("/rates");
  return { ok: true };
}

export async function setRateActive(id: string, active: boolean) {
  const supabase = await createClient();
  const { error } = await supabase.from("rate_items").update({ is_active: active }).eq("id", id);
  if (error) return { error: error.message };
  revalidatePath("/rates");
  return { ok: true };
}

// ---------- daily site report ----------
export async function saveSiteReport(projectId: string, day: string, _prev: unknown, fd: FormData) {
  const supabase = await createClient();
  const row = { project_id: projectId, day, done: nz(fd.get("done")), tomorrow: nz(fd.get("tomorrow")), issues: nz(fd.get("issues")) };
  const { error } = await supabase.from("site_reports").upsert(row, { onConflict: "project_id,day" });
  if (error) return { error: error.message.includes("row-level security") ? "Only the PM or site engineer on this project can write the report." : error.message };
  revalidatePath(`/projects/${projectId}/report`); revalidatePath("/report");
  return { ok: true, at: new Date().toISOString() };
}

export async function markReportSent(projectId: string, day: string) {
  const supabase = await createClient();
  await supabase.from("site_reports").upsert({ project_id: projectId, day, sent_at: new Date().toISOString() }, { onConflict: "project_id,day" });
  revalidatePath(`/projects/${projectId}/report`); revalidatePath("/report");
  return { ok: true };
}
