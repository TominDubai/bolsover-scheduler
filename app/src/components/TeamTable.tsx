"use client";
import { Fragment, useActionState, useState } from "react";
import { title, type Person } from "@/lib/model";
import { savePerson, addPerson } from "@/app/actions";

const ROLE_LABEL: Record<string, string> = { MANAGEMENT: "Management", PM: "Project manager", SITE: "Site engineer / supervisor", QS: "QS / estimator", ADMIN: "Office / admin" };
const ROLE_ORDER = ["MANAGEMENT", "PM", "SITE", "QS", "ADMIN"];
type State = { error?: string; ok?: boolean; at?: string } | null;

function Row({ p, canEdit }: { p: Person; canEdit: boolean }) {
  const [state, action, pending] = useActionState(savePerson.bind(null, p.id), null as State);
  const [dirty, setDirty] = useState(false);
  const flags = [p.can_edit_projects && "projects", p.can_edit_estimation && "estimation", p.can_manage_team && "team"].filter(Boolean).join(" + ");
  if (!canEdit) return (
    <tr className={p.is_active ? "" : "off"}>
      <td className="name">{title(p.name)}</td><td>{p.full_name ?? "—"}</td><td>{p.email ?? <i>no email</i>}</td><td>{p.whatsapp ?? "—"}</td><td>{ROLE_LABEL[p.role]}</td><td><span className="pill">{flags || "view"}</span></td><td>{p.is_active ? "Active" : "Left"}</td><td />
    </tr>
  );
  return (
    <tr className={p.is_active ? "" : "off"}>
      <td className="name">{title(p.name)}</td>
      <td><input form={`f-${p.id}`} name="full_name" defaultValue={p.full_name ?? ""} placeholder="Full name" onChange={() => setDirty(true)} /></td>
      <td><input form={`f-${p.id}`} name="email" type="email" defaultValue={p.email ?? ""} placeholder="name@bolsovercontracting.com" onChange={() => setDirty(true)} className={p.email ? "" : "missing"} /></td>
      <td><input form={`f-${p.id}`} name="whatsapp" defaultValue={p.whatsapp ?? ""} placeholder="+9715…" onChange={() => setDirty(true)} /></td>
      <td><select form={`f-${p.id}`} name="role" defaultValue={p.role} onChange={() => setDirty(true)}>{ROLE_ORDER.map((r) => <option key={r} value={r}>{ROLE_LABEL[r]}</option>)}</select></td>
      <td className="perms">
        <label className="check" title="Can add and edit quotes (Pending / Quoted)"><input form={`f-${p.id}`} type="checkbox" name="can_edit_estimation" defaultChecked={p.can_edit_estimation} onChange={() => setDirty(true)} /> Quotes</label>
        <label className="check" title="Can edit projects from Won onwards, move cards, add VOs"><input form={`f-${p.id}`} type="checkbox" name="can_edit_projects" defaultChecked={p.can_edit_projects} onChange={() => setDirty(true)} /> Projects</label>
        <label className="check" title="Can add people and set these permissions"><input form={`f-${p.id}`} type="checkbox" name="can_manage_team" defaultChecked={p.can_manage_team} onChange={() => setDirty(true)} /> Team</label>
      </td>
      <td><label className="check"><input form={`f-${p.id}`} type="checkbox" name="is_active" defaultChecked={p.is_active} onChange={() => setDirty(true)} /> Active</label></td>
      <td className="save">
        <form id={`f-${p.id}`} action={action} onSubmit={() => setDirty(false)}>
          <button className={"btn sm" + (dirty ? " bronze" : " ghost")} disabled={pending}>{pending ? "Saving…" : "Save"}</button>
          {state?.error && <span className="msg err">{state.error}</span>}
          {state?.ok && !dirty && <span className="msg">Saved</span>}
        </form>
      </td>
    </tr>
  );
}

function AddRow() {
  const [state, action, pending] = useActionState(addPerson, null as State);
  return (
    <tr className="addrow">
      <td><input form="f-new" name="name" placeholder="SHORT NAME" required className="upper" /></td>
      <td><input form="f-new" name="full_name" placeholder="Full name" /></td>
      <td><input form="f-new" name="email" type="email" placeholder="name@bolsovercontracting.com" /></td>
      <td><input form="f-new" name="whatsapp" placeholder="+9715…" /></td>
      <td><select form="f-new" name="role" defaultValue="PM">{ROLE_ORDER.map((r) => <option key={r} value={r}>{ROLE_LABEL[r]}</option>)}</select></td>
      <td className="perms">
        <label className="check"><input form="f-new" type="checkbox" name="can_edit_estimation" /> Quotes</label>
        <label className="check"><input form="f-new" type="checkbox" name="can_edit_projects" /> Projects</label>
        <label className="check"><input form="f-new" type="checkbox" name="can_manage_team" /> Team</label>
      </td>
      <td className="save">
        <form id="f-new" action={action} key={state?.at}>
          <button className="btn sm" disabled={pending}>{pending ? "Adding…" : "+ Add"}</button>
          {state?.error && <span className="msg err">{state.error}</span>}
          {state?.ok && <span className="msg">Added</span>}
        </form>
      </td>
    </tr>
  );
}

export default function TeamTable({ people, canEdit }: { people: Person[]; canEdit: boolean }) {
  const groups = ROLE_ORDER.map((r) => [r, people.filter((p) => p.role === r).sort((a, b) => Number(b.is_active) - Number(a.is_active) || a.name.localeCompare(b.name))] as const).filter(([, ps]) => ps.length);
  return (
    <div className="listview">
      <div className="tablewrap team">
        <table>
          <thead><tr><th>Name</th><th>Full name</th><th>Email</th><th>WhatsApp</th><th>Role</th><th>Can edit</th><th>Status</th><th /></tr></thead>
          <tbody>
            {groups.map(([role, ps]) => (
              <Fragment key={role}>
                <tr className="group"><td colSpan={8}>{ROLE_LABEL[role]}</td></tr>
                {ps.map((p) => <Row key={p.id} p={p} canEdit={canEdit} />)}
              </Fragment>
            ))}
            {canEdit && <AddRow />}
          </tbody>
        </table>
      </div>
    </div>
  );
}
