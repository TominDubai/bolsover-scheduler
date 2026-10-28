"use client";
import { MILESTONES, PACKAGE_STATUS_LABEL, fmtDShort, packageTone2, packageFlags, type Package } from "@/lib/model";

/** Five little segments — Awarded · Approvals · On site · Complete · Snagged — filled as the milestones are hit.
 *  With onTap, tapping an empty one stamps today; tapping the latest filled one clears it. */
export default function MilestoneStrip({ k, onTap }: { k: Package; onTap?: (milestone: string, date: string | null) => void }) {
  if (k.cancelled) return <span className="strip notissued" title="Cancelled">—</span>;
  const today = new Date().toISOString().slice(0, 10);
  const filled = MILESTONES.map(([m]) => !!k[m]);
  const last = filled.lastIndexOf(true);
  return (
    <span className="strip" aria-label="Milestones">
      {MILESTONES.map(([m, label], i) => {
        const d = k[m] as string | null;
        const late = !d && i === last + 1 && k.slipping && (m === "complete_on" || m === "on_site_on");
        const cls = d ? "complete" : late ? "late" : "not_started";
        const tip = `${label}${d ? ` · ${fmtDShort(d)}` : ""}${onTap ? (d ? (i === last ? " · tap to clear" : "") : " · tap to stamp today") : ""}`;
        return onTap
          ? <button type="button" key={m} className={cls} title={tip} aria-label={tip} onClick={(e) => { e.stopPropagation(); if (d && i !== last) return; onTap(m, d ? null : today); }} />
          : <i key={m} className={cls} title={tip} />;
      })}
    </span>
  );
}

export function PackageChip({ k }: { k: Package }) {
  return <span className={`pill ${packageTone2(k)}`}>{PACKAGE_STATUS_LABEL[k.status]}</span>;
}

export function PackageFlags({ k, max = 2 }: { k: Package; max?: number }) {
  return <>{packageFlags(k).slice(0, max).map((f) => <span key={f.text} className={`pill ${f.tone}`}>{f.text}</span>)}</>;
}

/** Package progress bar for cards and panels: complete · on site · awarded (not yet on site) · not awarded. */
export function PackageProgress({ complete, onSite, awarded, total, title }: { complete: number; onSite: number; awarded: number; total: number; title?: string }) {
  const appr = Math.max(awarded - onSite - complete, 0);
  const todo = Math.max(total - awarded, 0);
  const segs: [string, number][] = [["done", complete], ["site", onSite], ["appr", appr], ["todo", todo]];
  return <div className="progress" title={title} aria-label={title}>{segs.filter(([, n]) => n > 0).map(([c, n]) => <span key={c} className={c} style={{ flex: n }} />)}</div>;
}
