"use client";
import { Fragment, useState } from "react";
import { useRouter } from "next/navigation";
import { LABEL, PACKAGE_STATUS_ORDER, aed, fmtDShort, title, enqKey, type Package } from "@/lib/model";
import MilestoneStrip, { PackageChip, PackageFlags } from "@/components/MilestoneStrip";

type Key = "code" | "name" | "project_name" | "trade" | "supplier" | "owner" | "status" | "planned_start" | "planned_finish" | "value";
const COLS: [Key, string, boolean][] = [
  ["code", "Code", false], ["name", "Package", false], ["project_name", "Project", false], ["trade", "Trade", false], ["supplier", "Subcontractor", false], ["owner", "Owner", false],
  ["status", "Status", false], ["planned_start", "Start", true], ["planned_finish", "Finish", true], ["value", "Value", true],
];
const nice = (s: string) => title(s).replace(/\bMep\b/, "MEP").replace(/\bHvac\b/, "HVAC");

/** All packages across live projects, grouped by project when sorted by project (the default). */
export default function PackagesTable({ rows: items, total, showValue }: { rows: Package[]; total: number; showValue: boolean }) {
  const router = useRouter();
  const [sort, setSort] = useState<{ k: Key; d: 1 | -1 }>({ k: "project_name", d: 1 });
  const cols = COLS.filter(([k]) => showValue || k !== "value");
  const rows = [...items].sort((a, b) => {
    if (sort.k === "project_name") return ((enqKey(a.enquiry_no) - enqKey(b.enquiry_no)) || a.project_name.localeCompare(b.project_name) || a.sort - b.sort) * sort.d;
    if (sort.k === "status") return ((PACKAGE_STATUS_ORDER[a.status] - PACKAGE_STATUS_ORDER[b.status]) || a.sort - b.sort) * sort.d;
    const av = a[sort.k] ?? null, bv = b[sort.k] ?? null;
    if (av == null && bv == null) return 0; if (av == null) return 1; if (bv == null) return -1;
    return (av < bv ? -1 : av > bv ? 1 : 0) * sort.d;
  });
  const click = (k: Key) => setSort((s) => ({ k, d: s.k === k ? (s.d === 1 ? -1 : 1) : 1 }));
  const grouped = sort.k === "project_name";
  let lastProject: string | null = null;
  return (
    <div className="listview">
      {items.length === 0 ? <p className="empty-items">{total === 0 ? "No packages on any live project yet. Each project's PM adds them from the project page." : "Nothing matches these filters."}</p> : (
      <div className="tablewrap drawings">
        <table>
          <thead><tr>{cols.map(([k, l, num]) => <th key={k} className={(num ? "num " : "") + (sort.k === k ? "sorted" : "")} onClick={() => click(k)}>{l}{sort.k === k ? (sort.d === 1 ? " ↑" : " ↓") : ""}</th>)}<th>Milestones</th><th>Flags</th></tr></thead>
          <tbody>
            {rows.map((k) => {
              const head = grouped && k.project_id !== lastProject; lastProject = k.project_id;
              return (
                <Fragment key={k.id}>
                  {head && <tr className="group"><td colSpan={cols.length + 2}><span className="enq">{k.enquiry_no ?? "—"}</span> {title(k.project_name)} <span className={`status s-${k.project_status}`}>{LABEL[k.project_status]}</span><small>{k.client ? ` · ${title(k.client)}` : ""}{k.pm ? ` · PM ${title(k.pm)}` : ""}</small></td></tr>}
                  <tr className="row" onClick={() => router.push(`/projects/${k.project_id}?pkg=${k.id}#packages`)}>
                    <td className="enq code">{k.code ?? "—"}</td>
                    <td className="name">{nice(k.name)}</td>
                    <td>{grouped ? "" : title(k.project_name)}</td>
                    <td>{k.trade ?? <i>—</i>}</td>
                    <td>{k.supplier ?? <i>none</i>}</td>
                    <td>{k.owner ? title(k.owner) : <i>—</i>}</td>
                    <td><PackageChip k={k} /></td>
                    <td className="num">{fmtDShort(k.planned_start)}</td>
                    <td className="num"><span className={k.slipping ? "due crit" : ""}>{fmtDShort(k.planned_finish)}</span></td>
                    {showValue && <td className="num">{k.value ? aed(k.value) : "—"}</td>}
                    <td><MilestoneStrip k={k} /></td>
                    <td className="flags"><PackageFlags k={k} /></td>
                  </tr>
                </Fragment>
              );
            })}
          </tbody>
        </table>
      </div>)}
    </div>
  );
}
