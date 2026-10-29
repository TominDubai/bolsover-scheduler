import { aed, type Package } from "@/lib/model";
import type { ProjectContract } from "@/lib/boq-model";

/** Job P&L, cost side (session 5): the awarded package values against the cost total the bill was priced on.
 *  Sell = approved bill + approved VOs (ex VAT). BOQ cost = what the QS priced the job at. Awarded = the subcontract
 *  orders recorded on the packages. Only rendered for people who can see cost (QS / management / admin / estimators). */
export default function JobPnl({ contract, packages }: { contract: ProjectContract; packages: Package[] }) {
  const live = packages.filter((k) => !k.cancelled);
  const awarded = live.filter((k) => k.status !== "NOT_AWARDED");
  const awardedValue = awarded.reduce((s, k) => s + (k.value ?? 0), 0);
  const unpriced = awarded.filter((k) => !k.value).length;
  const notAwarded = live.length - awarded.length;
  const sell = contract.contract_value, cost = contract.cost_value;
  if (sell <= 0 && awardedValue <= 0) return null;
  const tenderMargin = sell > 0 ? (sell - cost) / sell * 100 : null;
  const variance = cost - awardedValue;              // + = BOQ cost not yet committed, − = awarded over the BOQ cost
  const over = variance < 0;
  const committedPct = cost > 0 ? Math.min(100, awardedValue / cost * 100) : 0;
  const marginNow = sell > 0 ? (sell - awardedValue) / sell * 100 : null;
  const line = awarded.length === 0
    ? "No packages awarded yet — the cost side is still the BOQ."
    : over
      ? `Awarded packages are ${aed(-variance)} over the BOQ cost${notAwarded ? ` with ${notAwarded} package${notAwarded === 1 ? "" : "s"} still to award` : ""} — the tender margin is gone before the job is fully let.`
      : `${aed(variance)} of the BOQ cost is still uncommitted — ${notAwarded} package${notAwarded === 1 ? "" : "s"} not yet awarded${unpriced ? `, ${unpriced} awarded with no value recorded` : ""}.`;
  return (
    <div className="panel pnl">
      <div className="prog-head">
        <h2>Job P&amp;L <small>cost side</small></h2>
        <span className="note">Sell and BOQ cost come from the approved bills; awarded value from the packages below. Put the order value on each package as it's let and this fills in.</span>
      </div>
      <div className="pnl-grid">
        <div className="pnl-cell"><span>Sell (contract, ex VAT)</span><b>{aed(sell)}</b></div>
        <div className="pnl-cell"><span>BOQ cost as priced</span><b>{aed(cost)}</b><small>{tenderMargin != null ? `tender margin ${Math.round(tenderMargin)}%` : "no cost on the bill"}</small></div>
        <div className="pnl-cell"><span>Packages awarded</span><b>{aed(awardedValue)}</b><small>{awarded.length} of {live.length} package{live.length === 1 ? "" : "s"}{unpriced ? ` · ${unpriced} with no value` : ""}</small></div>
        <div className={`pnl-cell${over ? " crit" : ""}`}><span>{over ? "Over the BOQ cost" : "BOQ cost uncommitted"}</span><b>{aed(Math.abs(variance))}</b><small>{marginNow != null && awarded.length > 0 ? `margin on what's let so far ${Math.round(marginNow)}%` : ""}</small></div>
      </div>
      {cost > 0 && (
        <div className="pnl-bar" title={`${Math.round(committedPct)}% of the BOQ cost committed`}>
          <span style={{ width: `${committedPct}%` }} className={over ? "over" : ""} />
        </div>
      )}
      <p className={`pnl-line${over ? " crit" : ""}`}>{line}</p>
    </div>
  );
}
