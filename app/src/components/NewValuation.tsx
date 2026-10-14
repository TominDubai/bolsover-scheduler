"use client";
import { useActionState, useState } from "react";
import { createValuation } from "@/app/actions";

export default function NewValuation({ projectId, nextNo, lastDeposit }: { projectId: string; nextNo: number; lastDeposit: number }) {
  const [open, setOpen] = useState(false);
  const [state, action, pending] = useActionState(createValuation.bind(null, projectId), null as { error?: string } | null);
  if (!open) return <button className="btn sm bronze" onClick={() => setOpen(true)}>New progress billing report (no. {nextNo})</button>;
  return (
    <form action={action} className="form">
      <label className="field"><span>Progress as of</span><input type="date" name="period_to" defaultValue={new Date().toISOString().slice(0, 10)} required /></label>
      <label className="field"><span>Advance received to date (inc VAT)</span><input name="deposit_received" inputMode="decimal" defaultValue={lastDeposit} /></label>
      <label className="field"><span>Extra line (e.g. advance for a VO)</span><input name="adj_label" placeholder="Additional downpayment for Variation — HVAC" /></label>
      <label className="field"><span>Extra amount (inc VAT, + or −)</span><input name="adj_amount" inputMode="decimal" placeholder="0" /></label>
      <label className="field wide"><span>Notes</span><input name="notes" /></label>
      <div className="actions"><button className="btn" disabled={pending}>Build report from current progress</button><button type="button" className="btn ghost" onClick={() => setOpen(false)}>Cancel</button>{state?.error && <span className="msg err">{state.error}</span>}</div>
      <p className="note wide">Uses the installed % on every item of the approved bill and VOs right now. The advance is recovered pro-rata to this period&apos;s progress, the way the Sidra report does it.</p>
    </form>
  );
}
