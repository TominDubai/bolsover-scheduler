"use client";
import { useState } from "react";

/** Thumbnail via Supabase image transforms; falls back to the original if transforms aren't on this plan. */
export default function Pic({ thumb, full, alt }: { thumb: string; full: string; alt: string }) {
  const [src, setSrc] = useState(thumb);
  return <img src={src} alt={alt} loading="lazy" onError={() => { if (src !== full) setSrc(full); }} />;
}
