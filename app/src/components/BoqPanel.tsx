"use client";
import Link from "next/link";
import { useActionState, useState } from "react";
import { aed } from "@/lib/model";
import { BOQ_STATUS_LABEL, BOQ_STATUS_TONE, pct, type BoqSummary, type ProjectContract, type Valuation } from "@/lib/boq-model";
import { createBoq } from "@/app/actions";

type Props = { projectId: string; boqs: BoqSummary[]; contract: ProjectContract; valuations: Valuation[]; canEdit: boolean; showCost: boolean; isLive: boolean };

/** Project page: the bills (quote revisions + VOs), the approved contract value, installed progress and valuations. */
export default function BoqPanel({ projectId, boqs, contract, valuations, canEdit, showCost, isLive }: Props) {
  const [adding, setAdding] = useState<null | "QUOTE" | "VARIATION">(null);
  const [state, action, pending] = useActionState(createBoq.bind(null, projectId), null as { error?: string } | null);
  const latestQuote = boqs.find((b) => b.kind === "QUOTE");
  const margin = contract.contract_value > 0 ? (contract.contract_value - contract.cost_value) / contract.contract_value * 100 : null;
  const lastVal = valuations[valuations.length - 1];
  return (
    <div className="panel">
      <div className="prog-head">
        <h2>Bill of quantities</h2>
        {contract.approved_boqs > 0 && (
          <span className="note">
            Contract <b>{aed(contract.contract_value)}</b> ex VAT · installed <b>{pct(contract.installed_pct)}</b> = {aed(contract.installed_value)}
            {showCost && margin != null && <> · margin <b className={margin < 20 ? "crit" : "ok"}>{Math.round(margin)}%</b> ({aed(contract.contract_value - contract.cost_value)})</>}
          </span>
        )}
      </div>
      {boqs.length === 0 ? (
        <span style={{ color: "var(--fg3)", fontSize: 13 }}>No bill yet — the quote is a single number until one is built or imported.</span>
      ) : (
        <div className="boqlist">
          {boqs.map((b) => (
            <Link key={b.boq_id} href={`/projects/${projectId}/boq/${b.boq_id}`} className="boqrow">
              <b>{b.kind === "QUOTE" ? `rev${String(b.rev_no).padStart(2, "0")}` : `VO${b.vo_no ?? "?"}`}</b>
              <span className="t">{b.title}<small>{b.item_count} items{b.status === "APPROVED" && b.installed_pct > 0 ? ` · ${pct(b.installed_pct)} installed` : ""}</small></span>
              <span className={`pill ${BOQ_STATUS_TONE[b.status]}`}>{BOQ_STATUS_LABEL[b.status]}</span>
              <span className="amt">{aed(b.total)}</span>
            </Link>
          ))}
        </div>
      )}
      {canEdit && (
        adding ? (
          <form action={action} className="vo-form">
            <input type="hidden" name="kind" value={adding} />
            {adding === "QUOTE" && latestQuote && <input type="hidden" name="copy_from" value={latestQuote.boq_id} />}
            <input name="title" required placeholder={adding === "QUOTE" ? (latestQuote ? `Revision ${latestQuote.rev_no + 1} (copies rev${String(latestQuote.rev_no).padStart(2, "0")})` : "Bill title") : `Additional Work no. ${boqs.filter((b) => b.kind === "VARIATION").length + 1}`} defaultValue={adding === "QUOTE" && latestQuote ? latestQuote.title : ""} aria-label="Bill title" />
            <input name="quote_ref" placeholder="Quote ref (optional)" aria-label="Quote reference" />
            <span style={{ display: "flex", gap: 6 }}><button className="btn sm" disabled={pending}>Create</button><button type="button" className="btn sm ghost" onClick={() => setAdding(null)}>Cancel</button></span>
            {state?.error && <span className="msg err">{state.error}</span>}
          </form>
        ) : (
          <div style={{ display: "flex", gap: 8, flexWrap: "wrap" }}>
            <button className="btn sm ghost" onClick={() => setAdding("QUOTE")}>{latestQuote ? "New revision" : "Build the bill"}</button>
            {boqs.some((b) => b.status === "APPROVED") && <button className="btn sm ghost" onClick={() => setAdding("VARIATION")}>New VO</button>}
          </div>
        )
      )}
      {contract.approved_boqs > 0 && isLive && (
        <div className="boq-links">
          <Link href={`/projects/${projectId}/progress`} className="btn sm bronze">Site progress</Link>
          <Link href={`/projects/${projectId}/valuations`} className="btn sm ghost">Valuations{lastVal ? ` · no. ${lastVal.no} ${lastVal.status.toLowerCase()}` : ""}</Link>
        </div>
      )}
    </div>
  );
}
