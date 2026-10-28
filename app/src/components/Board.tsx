"use client";
import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { STAGES, SIDE, aedS, fmtDShort, title, ini, tone, delayText, health, type Project, type Status } from "@/lib/model";
import { setStatus, archiveProject } from "@/app/actions";
import { PackageProgress } from "@/components/MilestoneStrip";
import type { PackageCounts } from "@/lib/model";

export default function Board({ projects, canEdit }: { projects: Project[]; canEdit: boolean }) {
  const router = useRouter();
  const [rows, setRows] = useState(projects);
  const [dragId, setDragId] = useState<string | null>(null);
  const [over, setOver] = useState<Status | null>(null);
  const [pending, start] = useTransition();
  const [err, setErr] = useState<string | null>(null);

  function drop(stage: Status) {
    if (!dragId || !canEdit) return;
    const p = rows.find((r) => r.id === dragId);
    setOver(null); setDragId(null);
    if (!p || p.status === stage) return;
    const prev = rows;
    setRows(rows.map((r) => (r.id === dragId ? { ...r, status: stage } : r)));
    start(async () => {
      const res = await setStatus(p.id, stage);
      if (res?.error) { setRows(prev); setErr(res.error); } else { setErr(null); router.refresh(); }
    });
  }

  // Pending / Quoted live on the Estimation tab; the board starts at Won.
  const cols = [...STAGES.filter(([k]) => k !== "PENDING" && k !== "QUOTED"), ...SIDE].map(([k, l]) => {
    const items = rows.filter((p) => p.status === k).sort((a, b) => (b.days_delayed ?? -9e9) - (a.days_delayed ?? -9e9));
    return (
      <section key={k} className={`col${k === "ON_HOLD" || k === "LOST" || k === "REJECTED" ? " side" : ""}${over === k ? " over" : ""}${items.length === 0 && over !== k && dragId === null ? " collapsed" : ""}`}
        onDragOver={(e) => { e.preventDefault(); if (over !== k) setOver(k); }} onDragLeave={() => setOver(null)} onDrop={() => drop(k)}>
        <header><h2>{l}</h2><span className="count">{items.length}</span></header>
        <div className="cards">
          {items.length === 0 && <div className="empty">{canEdit ? "Drop a project here" : "Nothing here"}</div>}
          {items.map((p) => <Card key={p.id} p={p} canEdit={canEdit} dragging={dragId === p.id} onDragStart={() => setDragId(p.id)} onDragEnd={() => { setDragId(null); setOver(null); }} />)}
        </div>
      </section>
    );
  });

  return (
    <>
      {err && <div className="msg err" style={{ padding: "0 24px" }}>Couldn’t move that project: {err}</div>}
      <div className="board" aria-busy={pending}>{cols}</div>
    </>
  );
}

function Card({ p, canEdit, dragging, onDragStart, onDragEnd }: { p: Project; canEdit: boolean; dragging: boolean; onDragStart: () => void; onDragEnd: () => void }) {
  const router = useRouter();
  const t = tone(p);
  const h = health(p);
  return (
    <article className={`card ${t}${dragging ? " dragging" : ""}`} draggable={canEdit} onDragStart={onDragStart} onDragEnd={onDragEnd}
      tabIndex={0} role="link" onClick={() => router.push(`/projects/${p.id}`)} onKeyDown={(e) => e.key === "Enter" && router.push(`/projects/${p.id}`)}>
      <div className="card-top"><span className="enq">{p.enquiry_no ?? "—"}</span><span className={`pill ${t}`}>{delayText(p)}</span></div>
      <h3>{title(p.name)}</h3>
      <div className="client">{title(p.client)}{p.contractor ? ` · ${p.contractor}` : ""}</div>
      <div className="card-foot">
        <span className="who"><b className="av">{ini(p.pm)}</b>{p.pm ? title(p.pm) : "No PM"}{p.pm2 ? ` + ${title(p.pm2)}` : ""}</span>
        <span className="val">{p.project_value ? aedS(p.project_value) : "—"}</span>
      </div>
      <div className="dates"><span>Start {fmtDShort(p.start_date)}</span><span>Target {fmtDShort(p.target_date)}{p.target_rev != null && p.target_rev > 0 && <span className="rev">R{p.target_rev}</span>}</span></div>
      {p.pkg && p.pkg.pkg_total > 0 && <PackagesStrip c={p.pkg} />}
      {h && <div className={`site ${h.tone}`}><span className={`dot ${h.tone}`} />{h.text}{p.prog_pkgs ? <small>{p.prog_done}/{p.prog_pkgs} · {p.prog_pct ?? 0}%</small> : null}</div>}
      {canEdit && p.status === "COMPLETED" && (
        <button type="button" className="btn sm ghost archive" onClick={(e) => { e.stopPropagation(); archiveProject(p.id, true).then(() => router.refresh()); }}>Archive</button>
      )}
    </article>
  );
}

/** Tiny package strip on the card: complete / on site / awarded / not awarded (db/019). */
function PackagesStrip({ c }: { c: PackageCounts }) {
  const appr = Math.max(c.pkg_awarded - c.pkg_on_site - c.pkg_complete, 0);
  return (
    <div className="card-items" title={`${c.pkg_total} packages: ${c.pkg_complete} complete, ${c.pkg_on_site} on site, ${appr} awarded, ${c.pkg_not_awarded} not awarded${c.pkg_slipping ? ` · ${c.pkg_slipping} slipping` : ""}`}>
      <PackageProgress complete={c.pkg_complete} onSite={c.pkg_on_site} awarded={c.pkg_awarded} total={c.pkg_total} />
      <small>{c.pkg_awarded}/{c.pkg_total} awarded{c.pkg_on_site ? ` · ${c.pkg_on_site} on site` : ""}{c.pkg_slipping ? <b className="crit"> · {c.pkg_slipping} slipping</b> : null}</small>
    </div>
  );
}
