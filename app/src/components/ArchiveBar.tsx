"use client";
import { useTransition } from "react";
import { useRouter } from "next/navigation";
import { archiveProject } from "@/app/actions";
import { fmtD } from "@/lib/model";

/** Completed jobs can be archived off the board; they stay on the List under "Archived". */
export default function ArchiveBar({ projectId, archivedAt, canEdit }: { projectId: string; archivedAt: string | null; canEdit: boolean }) {
  const router = useRouter();
  const [pending, start] = useTransition();
  const go = (a: boolean) => start(async () => { await archiveProject(projectId, a); router.refresh(); });
  return (
    <div className={`archivebar${archivedAt ? " on" : ""}`}>
      <span>{archivedAt ? `Archived ${fmtD(archivedAt)} — off the board, still on the List under Archived.` : "Completed. Archive it to take it off the board."}</span>
      {canEdit && <button className="btn sm ghost" disabled={pending} onClick={() => go(!archivedAt)}>{archivedAt ? "Restore to board" : "Archive"}</button>}
    </div>
  );
}
