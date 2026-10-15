"use client";
import { useState } from "react";

export default function DigestView({ text }: { text: string }) {
  const [copied, setCopied] = useState(false);
  const copy = async () => { try { await navigator.clipboard.writeText(text); setCopied(true); setTimeout(() => setCopied(false), 1500); } catch { /* selectable textarea remains */ } };
  return (
    <div className="panel">
      <textarea className="smsg" readOnly value={text} rows={Math.min(30, text.split("\n").length + 1)} aria-label="Digest message" />
      <div className="srow">
        <a className="btn wa" href={`https://wa.me/?text=${encodeURIComponent(text)}`} target="_blank" rel="noopener">Open in WhatsApp</a>
        <button type="button" className="btn ghost" onClick={copy}>{copied ? "Copied" : "Copy text"}</button>
      </div>
    </div>
  );
}
