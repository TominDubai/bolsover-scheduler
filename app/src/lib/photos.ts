import { createClient } from "@/lib/supabase/server";

/** Site photos — rows in scheduler.site_photos, files in the public Storage bucket `site-photos`. */

export const BUCKET = "site-photos";
export type SitePhoto = { id: string; project_id: string; day: string; item_id: string | null; path: string; caption: string | null; by_id: string | null; created_at: string; by?: string | null };

/** Public URL of a stored photo (the bucket is public; the path is unguessable). */
export function photoUrl(path: string) {
  return `${process.env.NEXT_PUBLIC_SUPABASE_URL}/storage/v1/object/public/${BUCKET}/${path}`;
}
/** Supabase image transform — a small render for thumbnails and WhatsApp previews. */
export function thumbUrl(path: string, width = 480) {
  return `${process.env.NEXT_PUBLIC_SUPABASE_URL}/storage/v1/render/image/public/${BUCKET}/${path}?width=${width}&quality=70`;
}

/** The photos taken on a project on one day, oldest first, with the photographer's name. */
export async function getDayPhotos(projectId: string, day: string): Promise<SitePhoto[]> {
  const supabase = await createClient();
  const [{ data }, { data: people }] = await Promise.all([
    supabase.from("site_photos").select("*").eq("project_id", projectId).eq("day", day).order("created_at"),
    supabase.from("people").select("id, name"),
  ]);
  const names = new Map((people ?? []).map((x: { id: string; name: string }) => [x.id, x.name]));
  return ((data ?? []) as SitePhoto[]).map((p) => ({ ...p, by: p.by_id ? names.get(p.by_id) ?? null : null }));
}

/** Photo counts per bill item on a project (for the camera badges on the progress sheet). */
export async function getItemPhotoCounts(projectId: string): Promise<Record<string, number>> {
  const supabase = await createClient();
  const { data } = await supabase.from("site_photos").select("item_id").eq("project_id", projectId).not("item_id", "is", null);
  const out: Record<string, number> = {};
  for (const r of (data ?? []) as { item_id: string }[]) out[r.item_id] = (out[r.item_id] ?? 0) + 1;
  return out;
}
