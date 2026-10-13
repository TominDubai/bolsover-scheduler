"use client";
import { useActionState, useState } from "react";
import { fmtD, packageTone, title, type Package, type Activity } from "@/lib/model";
import { saveProgramme } from "@/app/actions";

type Props = { projectId: string; packages: Package[]; activities: Activity[]; canEdit: boolean };

/** Programme: package-level baseline (from the P6 export) with site progress recorded against it. */
export default function Programme({ projectId, packages, activities, canEdit }: Props) {
  const [open, setOpen] = useState<string | null>(null);
  if (packages.length === 0) {
    return (
      <div className="panel">
        <h2>Programme</h2>
        <span style={{ color: "var(--fg3)", fontSize: 13 }}>No programme loaded. Load the package dates from the P6 schedule export (see <code>import/</code>).</span>
      </div>
    );
  }
  const overall = Math.round(packages.reduce((s, k) => s + (k.planned_days ?? 1) * k.pct_complete, 0) / Math.max(1, packages.reduce((s, k) => s + (k.planned_days ?? 1), 0)));
  const late = packages.filter((k) => ["warn", "crit"].includes(packageTone(k).tone)).length;
  const done = packages.filter((k) => packageTone(k).tone === "done").length;
  return (
    <div className="panel">
      <div className="prog-head">
        <h2>Programme</h2>
        <span className="note">{done}/{packages.length} packages done · {overall}% weighted · {late ? <b style={{ color: "var(--crit)" }}>{late} behind</b> : <b style={{ color: "var(--ok)" }}>on track</b>}</span>
      </div>
      <div className="prog">
        <div className="prog-row prog-th"><span /><span>Package</span><span>Planned</span><span>Actual / forecast</span><span>Progress</span><span /></div>
        {packages.map((k) => {
          const t = packageTone(k);
          const acts = activities.filter((a) => a.package_id === k.id);
          const isOpen = open === k.id;
          return (
            <div key={k.id} className={`prog-pkg ${isOpen ? "open" : ""}`}>
              <button type="button" className="prog-row" onClick={() => setOpen(isOpen ? null : k.id)} aria-expanded={isOpen}>
                <span className={`dot ${t.tone}`} />
                <span className="pkg-name"><b>{title(k.name).replace(/\bMep\b/, "MEP").replace(/\bHvac\b/, "HVAC")}</b><small>{k.code} · {k.planned_days ?? "—"}d · {acts.length} activit{acts.length === 1 ? "y" : "ies"}</small></span>
                <span className="dates">{fmtD(k.planned_start)} → {fmtD(k.planned_finish)}</span>
                <span className="dates">{k.actual_start || k.actual_finish || k.forecast_finish ? <>{fmtD(k.actual_start)} → {k.actual_finish ? fmtD(k.actual_finish) : k.forecast_finish ? <i>{fmtD(k.forecast_finish)}</i> : "—"}</> : <i>—</i>}</span>
                <span className="bar"><span style={{ width: `${k.pct_complete}%` }} className={t.tone} /><small>{k.pct_complete}%</small></span>
                <span className={`pill ${t.tone}`}>{t.text}</span>
              </button>
              {isOpen && (
                <div className="prog-detail">
                  <ul className="acts">
                    {acts.map((a) => <li key={a.id}><code>{a.code}</code><span>{a.name}</span><time>{fmtD(a.planned_start)} → {fmtD(a.planned_finish)}</time><small>{a.planned_days ?? 0}d</small></li>)}
                  </ul>
                  {canEdit ? <PackageForm projectId={projectId} k={k} /> : k.note ? <p className="note">{k.note}</p> : null}
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}

function PackageForm({ projectId, k }: { projectId: string; k: Package }) {
  const [state, action, pending] = useActionState(saveProgramme.bind(null, projectId, k.id), null as { error?: string; ok?: boolean; at?: string } | null);
  return (
    <form action={action} className="prog-form">
      <label className="field"><span>Progress %</span><input name="pct_complete" type="number" min={0} max={100} defaultValue={k.pct_complete} /></label>
      <label className="field"><span>Actual start</span><input name="actual_start" type="date" defaultValue={k.actual_start ?? ""} /></label>
      <label className="field"><span>Forecast finish</span><input name="forecast_finish" type="date" defaultValue={k.forecast_finish ?? ""} /></label>
      <label className="field"><span>Actual finish</span><input name="actual_finish" type="date" defaultValue={k.actual_finish ?? ""} /></label>
      <label className="field wide"><span>Note</span><input name="note" defaultValue={k.note ?? ""} placeholder="What's holding it up, what changed" /></label>
      <div className="actions"><button className="btn sm" disabled={pending}>{pending ? "Saving…" : "Save progress"}</button>
        {state?.error && <span className="msg err">{state.error}</span>}
        {state?.ok && <span className="msg">Saved</span>}</div>
    </form>
  );
}
