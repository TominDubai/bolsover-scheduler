"use client";
import { useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { recordPhoto } from "@/app/actions";

/**
 * Camera / gallery button. Resizes each photo in the browser (max 1600px, JPEG), uploads it straight to the
 * `site-photos` bucket under <project>/<day>/<uuid>.jpg, then records the row. Works for several photos at once.
 */
type Props = { projectId: string; day: string; itemId?: string | null; label?: string; small?: boolean; onDone?: () => void };

const MAX = 1600;

async function shrink(file: File): Promise<Blob> {
  // createImageBitmap honours EXIF orientation, so phone photos come out the right way up
  const bmp = await createImageBitmap(file, { imageOrientation: "from-image" } as ImageBitmapOptions).catch(() => null);
  if (!bmp) return file;
  const k = Math.min(1, MAX / Math.max(bmp.width, bmp.height));
  const w = Math.round(bmp.width * k), h = Math.round(bmp.height * k);
  const c = document.createElement("canvas"); c.width = w; c.height = h;
  c.getContext("2d")!.drawImage(bmp, 0, 0, w, h);
  bmp.close?.();
  return await new Promise<Blob>((res) => c.toBlob((b) => res(b ?? file), "image/jpeg", 0.82));
}

export default function PhotoButton({ projectId, day, itemId = null, label = "Add photo", small, onDone }: Props) {
  const router = useRouter();
  const input = useRef<HTMLInputElement>(null);
  const [busy, setBusy] = useState<string | null>(null);
  const [err, setErr] = useState<string | null>(null);

  const pick = async (files: FileList | null) => {
    if (!files || files.length === 0) return;
    setErr(null);
    const supabase = createClient();
    let n = 0;
    for (const f of Array.from(files)) {
      n++; setBusy(files.length > 1 ? `Uploading ${n}/${files.length}…` : "Uploading…");
      try {
        const blob = await shrink(f);
        const path = `${projectId}/${day}/${crypto.randomUUID()}.jpg`;
        const { error } = await supabase.storage.from("site-photos").upload(path, blob, { contentType: "image/jpeg", cacheControl: "31536000" });
        if (error) throw new Error(error.message);
        const r = await recordPhoto(projectId, day, path, itemId, null);
        if (r.error) throw new Error(r.error);
      } catch (e) {
        setErr(e instanceof Error ? e.message : "Upload failed");
        break;
      }
    }
    setBusy(null);
    if (input.current) input.current.value = "";
    onDone?.(); router.refresh();
  };

  return (
    <span className={`photo-btn ${small ? "sm" : ""}`}>
      <input ref={input} type="file" accept="image/*" multiple hidden onChange={(e) => pick(e.target.files)} />
      <button type="button" className={`btn ${small ? "sm ghost" : ""}`} disabled={!!busy} onClick={() => input.current?.click()} title={label}>
        {busy ?? (small ? "📷" : `📷 ${label}`)}
      </button>
      {err && <span className="msg err">{err}</span>}
    </span>
  );
}
