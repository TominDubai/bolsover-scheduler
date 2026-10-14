"use client";
import { useTransition, useState } from "react";
import { useRouter } from "next/navigation";
import type { Boq } from "@/lib/boq-model";
import { setBoqStatus } from "@/app/actions";

/** Draft → Submitted → Approved (or Rejected). Approving sets the project's signed value / the VO's value. */
export default function BoqStatus({ projectId, boq }: { projectId: string; boq: Boq }) {
  const router = useRouter();
  const [pending, start] = useTransition();
  const [err, setErr] = useState<string | null>(null);
  const go = (s: string, ask?: string) => { if (ask && !confirm(ask)) return; start(async () => { const r = await setBoqStatus(projectId, boq.id, s); if (r.error) setErr(r.error); else router.refresh(); }); };
  const what = boq.kind === "QUOTE" ? "the project's signed quote" : "this VO's value";
  return (
    <span style={{ display: "flex", gap: 6, alignItems: "center" }}>
      {boq.status === "DRAFT" && <button className="btn sm" disabled={pending} onClick={() => go("SUBMITTED")}>Mark submitted</button>}
      {(boq.status === "DRAFT" || boq.status === "SUBMITTED") && <button className="btn sm bronze" disabled={pending} onClick={() => go("APPROVED", `Approve this bill? It becomes ${what} and any previously approved version is superseded.`)}>Approve</button>}
      {boq.status === "SUBMITTED" && <button className="btn sm danger" disabled={pending} onClick={() => go("REJECTED")}>Rejected</button>}
      {boq.status === "REJECTED" && <button className="btn sm ghost" disabled={pending} onClick={() => go("DRAFT")}>Reopen</button>}
      {err && <span className="msg err">{err}</span>}
    </span>
  );
}
