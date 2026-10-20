import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { admin } from "@/lib/notify";
import { photoUrl, thumbUrl, type SitePhoto } from "@/lib/photos";
import { title } from "@/lib/model";
import Pic from "@/components/Pic";

export const dynamic = "force-dynamic";

/**
 * Public photo gallery for one site on one day — the link that goes into the client's WhatsApp group.
 * No sign-in: the URL carries the project uuid, which is unguessable, and the bucket is public anyway.
 * Read with the service key because the viewer has no session. Nothing but photos and captions is shown.
 */
type P = { params: Promise<{ id: string; day: string }> };
const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
const DAY = /^\d{4}-\d{2}-\d{2}$/;

async function load({ params }: P) {
  const { id, day } = await params;
  if (!UUID.test(id) || !DAY.test(day)) return null;
  const db = admin();
  const [{ data: p }, { data: photos }] = await Promise.all([
    db.from("projects").select("id, name, location").eq("id", id).maybeSingle(),
    db.from("site_photos").select("id, path, caption, created_at").eq("project_id", id).eq("day", day).order("created_at"),
  ]);
  if (!p) return null;
  return { id, day, name: title(p.name as string), location: p.location as string | null, photos: (photos ?? []) as Pick<SitePhoto, "id" | "path" | "caption" | "created_at">[] };
}

export async function generateMetadata(props: P): Promise<Metadata> {
  const d = await load(props);
  if (!d) return { title: "Bolsover" };
  const first = d.photos[0];
  return {
    title: `${d.name} — site photos ${d.day}`,
    description: `${d.photos.length} photo${d.photos.length === 1 ? "" : "s"} from site · Bolsover Building Contracting`,
    openGraph: first ? { images: [{ url: thumbUrl(first.path, 800) }] } : undefined,
    robots: { index: false, follow: false },
  };
}

export default async function Gallery(props: P) {
  const d = await load(props);
  if (!d) notFound();
  const when = new Date(`${d.day}T12:00:00+04:00`).toLocaleDateString("en-GB", { weekday: "long", day: "numeric", month: "long", year: "numeric" });
  return (
    <main className="gallery">
      <header>
        <img src="/bolsover-mark.svg" alt="" width={28} height={28} />
        <div><h1>{d.name}</h1><p>{when}{d.location ? ` · ${d.location}` : ""} · {d.photos.length} photo{d.photos.length === 1 ? "" : "s"}</p></div>
      </header>
      {d.photos.length === 0 ? <p className="empty">No photos for this day.</p> : (
        <div className="ggrid">
          {d.photos.map((p) => (
            <figure key={p.id}>
              <a href={photoUrl(p.path)} target="_blank" rel="noopener"><Pic thumb={thumbUrl(p.path, 900)} full={photoUrl(p.path)} alt={p.caption ?? ""} /></a>
              {p.caption && <figcaption>{p.caption}</figcaption>}
            </figure>
          ))}
        </div>
      )}
      <footer>Bolsover Building Contracting · photos from site, shared by the project team</footer>
    </main>
  );
}
