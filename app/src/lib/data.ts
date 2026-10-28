import { createClient } from "@/lib/supabase/server";
import { cache } from "react";
import type { Project, Person, Contractor, Me, TargetRevision, Package, PackageCounts, PackageTrade, Supplier } from "@/lib/model";

async function allProjects(): Promise<Project[]> {
  const supabase = await createClient();
  const [{ data, error }, { data: counts }] = await Promise.all([
    supabase.from("projects_live").select("*").order("name"),
    supabase.from("project_package_counts").select("*"),
  ]);
  if (error) throw new Error(`projects_live: ${error.message}`);
  // package counts (db/019) ride on the project row so the board strip and the digest don't need a second query
  const byProject = new Map(((counts ?? []) as PackageCounts[]).map((c) => [c.project_id, c]));
  return ((data ?? []) as Project[]).map((p) => ({ ...p, pkg: byProject.get(p.id) ?? null }));
}
/** every project still in play: not removed (archived projects are included — the list filters them) */
export const getProjects = cache(async function getProjects(): Promise<Project[]> {
  return (await allProjects()).filter((p) => !p.deleted_at);
});
/** projects someone has removed — shown only on the List's "Removed" view, where they can be restored */
export const getRemovedProjects = cache(async function getRemovedProjects(): Promise<Project[]> {
  return (await allProjects()).filter((p) => !!p.deleted_at).sort((a, b) => (b.deleted_at! < a.deleted_at! ? -1 : 1));
});
export async function getProject(id: string): Promise<Project | null> {
  const supabase = await createClient();
  const { data } = await supabase.from("projects_live").select("*").eq("id", id).maybeSingle();
  return (data as Project) ?? null;
}
export const getPeople = cache(async function getPeople(): Promise<Person[]> {
  const supabase = await createClient();
  const { data } = await supabase.from("people").select("*").eq("is_active", true).order("name");
  return (data ?? []) as Person[];
});
export const getContractors = cache(async function getContractors(): Promise<Contractor[]> {
  const supabase = await createClient();
  const { data } = await supabase.from("contractors").select("*").order("name");
  return (data ?? []) as Contractor[];
});
export function pmCounts(projects: Project[]) {
  const m = new Map<string, number>();
  for (const p of projects) { if (p.pm) m.set(p.pm, (m.get(p.pm) ?? 0) + 1); if (p.pm2) m.set(p.pm2, (m.get(p.pm2) ?? 0) + 1); }
  return [...m.entries()].sort().map(([name, n]) => ({ name, n }));
}

export const getMe = cache(async function getMe(): Promise<Me> {
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("me");
  if (error) throw new Error(`me(): ${error.message}`);
  const p = data as Person | null;
  return { id: p?.id ?? null, name: p?.name ?? "", role: p?.role ?? "", canEstimation: !!p?.can_edit_estimation, canProjects: !!p?.can_edit_projects, canTeam: !!p?.can_manage_team, isAdmin: !!p?.is_admin };
});

export function applyFilters<T extends { name: string; client: string | null; enquiry_no: string | null; pm: string | null; pm2: string | null }>(rows: T[], sp: { pm?: string; q?: string }) {
  const q = (sp.q ?? "").toLowerCase();
  return rows.filter((p) => (!sp.pm || p.pm === sp.pm || p.pm2 === sp.pm) && (!q || `${p.name} ${p.client ?? ""} ${p.enquiry_no ?? ""}`.toLowerCase().includes(q)));
}

export const getUser = cache(async function getUser() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  return user;
});

/** Every target completion date a project has had, newest first. Written by trigger (db/016). */
export async function getTargetRevisions(projectId: string): Promise<TargetRevision[]> {
  const supabase = await createClient();
  const { data } = await supabase.from("target_revisions").select("*, who:people(name)").eq("project_id", projectId).order("rev_no", { ascending: false });
  return (data ?? []) as TargetRevision[];
}

/** People tagged on a project, over and above the PM / second PM / site engineer. */
export async function getProjectWatchers(projectId: string): Promise<string[]> {
  const supabase = await createClient();
  const { data } = await supabase.from("project_watchers").select("person_id").eq("project_id", projectId);
  return ((data ?? []) as { person_id: string }[]).map((r) => r.person_id);
}

// ---------- meetings (db/018) ----------
import type { Meeting, EnquiryPass } from "@/lib/model";
export async function getMeetings(from: string, to: string): Promise<Meeting[]> {
  const supabase = await createClient();
  const { data, error } = await supabase.from("meetings_live").select("*").eq("cancelled", false).gte("meeting_date", from).lte("meeting_date", to).order("meeting_date").order("start_time");
  if (error) throw new Error(`meetings_live: ${error.message}`);
  return (data ?? []) as Meeting[];
}
export async function getProjectMeetings(projectId: string): Promise<Meeting[]> {
  const supabase = await createClient();
  const { data } = await supabase.from("meetings_live").select("*").eq("cancelled", false).eq("project_id", projectId).order("meeting_date", { ascending: false }).order("start_time").limit(20);
  return (data ?? []) as Meeting[];
}

/** The responsibility passes on an enquiry, newest first (db/017). */
export async function getEnquiryPasses(projectId: string): Promise<EnquiryPass[]> {
  const supabase = await createClient();
  const { data } = await supabase.from("enquiry_passes").select("*, from:people!enquiry_passes_from_id_fkey(name), to:people!enquiry_passes_to_id_fkey(name)").eq("project_id", projectId).order("passed_at", { ascending: false }).limit(20);
  return (data ?? []) as EnquiryPass[];
}

// ---------- packages (db/019) ----------
export async function getPackages(projectId: string): Promise<Package[]> {
  const supabase = await createClient();
  const { data, error } = await supabase.from("packages_live").select("*").eq("project_id", projectId).order("sort");
  if (error) throw new Error(`packages_live: ${error.message}`);
  return (data ?? []) as Package[];
}
/** every package on every live (Won → Completed, not removed, not archived) project — the Packages tab */
export async function getAllPackages(): Promise<Package[]> {
  const supabase = await createClient();
  const { data, error } = await supabase.from("packages_live").select("*").in("project_status", ["WON", "PRE_MOB", "LIVE", "COMPLETED", "ON_HOLD"]).is("project_deleted_at", null).is("project_archived_at", null).order("sort");
  if (error) throw new Error(`packages_live: ${error.message}`);
  return (data ?? []) as Package[];
}
export const getTrades = cache(async function getTrades(): Promise<PackageTrade[]> {
  const supabase = await createClient();
  const { data } = await supabase.from("package_trades").select("*").eq("is_active", true).order("sort_order");
  return (data ?? []) as PackageTrade[];
});
export const getSuppliers = cache(async function getSuppliers(): Promise<Supplier[]> {
  const supabase = await createClient();
  const { data } = await supabase.from("suppliers").select("*").eq("is_active", true).order("name");
  return (data ?? []) as Supplier[];
});
