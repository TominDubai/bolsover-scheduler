"use client";
import { useActionState } from "react";
import { useRouter } from "next/navigation";
import type { Valuation } from "@/lib/boq-model";
import { setValuationStatus } from "@/app/actions";

export default function ValuationStatus({ projectId, v }: { projectId: string; v: Valuation }) {
  const router = useRouter();
  const next = v.status === "DRAFT" ? "ISSUED" : v.status === "ISSUED" ? "CERTIFIED" : v.status === "CERTIFIED" ? "PAID" : null;
  const [state, action, pending] = useActionState(async (prev: unknown, fd: FormData) => { const r = await setValuationStatus(projectId, v.id, next!, prev, fd); if (r.ok) router.refresh(); return r; }, null as { error?: string } | null);
  if (!next) return <span className="pill done">paid {v.paid_date ?? ""}</span>;
  return (
    <form action={action} style={{ display: "flex", gap: 6, alignItems: "center" }}>
      <span className="pill">{v.status.toLowerCase()}</span>
      {next === "ISSUED" && <input name="invoice_no" placeholder="Invoice no." aria-label="Invoice no." style={{ width: 130 }} />}
      {next === "PAID" && <><input name="paid_amount" inputMode="decimal" defaultValue={v.amount_due} aria-label="Paid amount" style={{ width: 130 }} /><input type="date" name="paid_date" defaultValue={new Date().toISOString().slice(0, 10)} aria-label="Paid date" /></>}
      <button className="btn sm" disabled={pending}>Mark {next.toLowerCase()}</button>
      {state?.error && <span className="msg err">{state.error}</span>}
    </form>
  );
}
