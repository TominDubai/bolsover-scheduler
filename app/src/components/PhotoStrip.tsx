"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import PhotoButton from "@/components/PhotoButton";
import Pic from "@/components/Pic";
import { deletePhoto, setPhotoCaption } from "@/app/actions";
import type { SitePhoto } from "@/lib/photos";

type Props = { projectId: string; day: string; photos: SitePhoto[]; urls: Record<string, { full: string; thumb: string }>; canWrite: boolean; galleryUrl: string };

/** The day's photos as a thumbnail grid with captions, add / remove for the PM, and the public gallery link. */
export default function PhotoStrip({ projectId, day, photos, urls, canWrite, galleryUrl }: Props) {
  return (
    <div className="panel pstrip">
      <div className="srow">
        <b>Photos{photos.length ? ` (${photos.length})` : ""}</b>
        {canWrite && <PhotoButton projectId={projectId} day={day} />}
      </div>
      {photos.length === 0
        ? <small className="note">{canWrite ? "Add photos from site — they go into the report as a link the client can open without logging in." : "No photos today."}</small>
        : (
          <>
            <div className="pgrid">
              {photos.map((p) => <Thumb key={p.id} projectId={projectId} photo={p} url={urls[p.id]} canWrite={canWrite} />)}
            </div>
            <small className="note">Shared link: <a href={galleryUrl} target="_blank" rel="noopener">{galleryUrl.replace(/^https?:\/\//, "")}</a></small>
          </>
        )}
    </div>
  );
}

function Thumb({ projectId, photo, url, canWrite }: { projectId: string; photo: SitePhoto; url: { full: string; thumb: string }; canWrite: boolean }) {
  const router = useRouter();
  const [pending, start] = useTransition();
  const [cap, setCap] = useState(photo.caption ?? "");
  const save = () => { if ((cap.trim() || null) === (photo.caption ?? null)) return; start(async () => { await setPhotoCaption(projectId, photo.id, cap.trim() || null); router.refresh(); }); };
  const remove = () => { if (!confirm("Remove this photo?")) return; start(async () => { const r = await deletePhoto(projectId, photo.id); if (r.error) alert(r.error); else router.refresh(); }); };
  return (
    <figure className={`pthumb ${pending ? "saving" : ""}`}>
      <a href={url.full} target="_blank" rel="noopener"><Pic thumb={url.thumb} full={url.full} alt={photo.caption ?? ""} /></a>
      {canWrite
        ? <input className="cap" value={cap} placeholder="Caption" onChange={(e) => setCap(e.target.value)} onBlur={save} onKeyDown={(e) => { if (e.key === "Enter") (e.target as HTMLInputElement).blur(); }} aria-label="Caption" />
        : <figcaption>{photo.caption ?? ""}</figcaption>}
      <small>{photo.by ?? ""}{photo.by ? " · " : ""}{new Date(photo.created_at).toLocaleTimeString("en-GB", { hour: "2-digit", minute: "2-digit", timeZone: "Asia/Dubai" })}
        {canWrite && <button type="button" className="x" onClick={remove} disabled={pending} aria-label="Remove photo">×</button>}</small>
    </figure>
  );
}
