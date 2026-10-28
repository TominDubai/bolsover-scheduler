"use client";
import { Fragment, useActionState, useState } from "react";
import { title, type Person } from "@/lib/model";
import { savePerson, addPerson } from "@/app/actions";

const ROLE_LABEL: Record<string, string> = { MANAGEMENT: "Management", PM: "Project manager", SITE: "Site engineer / supervisor", QS: "QS / estimator", ADMIN: "Office / admin" };
const ROLE_ORDER = ["MANAGEMENT", "PM", "SITE", "QS", "ADMIN"];
type State = { error?: string; ok?: boolean; at?: string } | null;

function Pills({ p }: { p: Person }) {
  const edit = [p.can_edit_estimation && "quotes", p.can_edit_projects && "projects", p.can_manage_team && "team"].filter(Boolean).join(" + ");
  const hears = [p.notify_on_award && "signings", p.handles_escalations && "escalations"].filter(Boolean).join(" + ");
  return <>
    <span className="pill">{edit || "view"}</span>
    {hears && <span className="pill ok">{hears}</span>}
    {p.is_admin && <span className="pill warn">admin</span>}
    {!p.can_sign_in && <span className="pill">WhatsApp only</span>}
  </>;
}

function Row({ p, canEdit }: { p: Person; canEdit: boolean }) {
  const [state, action, pending] = useActionState(savePerson.bind(null, p.id), null as State);
  const [dirty, setDirty] = useState(false);
  const [waOnly, setWaOnly] = useState(!p.can_sign_in);
  if (!canEdit) return (
    <tr className={p.is_active ? "" : "off"}>
      <td className="name">{title(p.name)}</td><td>{p.full_name ?? "—"}{p.position ? <small className="pos">{p.position}</small> : null}</td>
      <td>{p.email ?? <i>{p.can_sign_in ? "no email" : "WhatsApp only"}</i>}</td><td>{p.whatsapp ?? "—"}</td><td>{ROLE_LABEL[p.role]}</td><td><Pills p={p} /></td><td>{p.is_active ? "Active" : "Left"}</td><td />
    </tr>
  );
  const f = `f-${p.id}`;
  const touch = () => setDirty(true);
  return (
    <tr className={p.is_active ? "" : "off"}>
      <td className="name">{title(p.name)}{p.is_admin && <span className="pill warn" style={{ marginLeft: 6 }}>admin</span>}</td>
      <td>
        <input form={f} name="full_name" defaultValue={p.full_name ?? ""} placeholder="Full name" onChange={touch} />
        <input form={f} name="position" defaultValue={p.position ?? ""} placeholder="Position (e.g. Site supervisor)" onChange={touch} className="pos" />
      </td>
      <td>
        <input form={f} name="email" type="email" defaultValue={p.email ?? ""} placeholder={waOnly ? "no email — WhatsApp only" : "name@bolsovercontracting.com"} onChange={touch} className={p.email || waOnly ? "" : "missing"} disabled={waOnly} />
        <label className="check" title="Site staff who get their updates by WhatsApp, not email, and don't sign in"><input form={f} type="checkbox" name="whatsapp_only" defaultChecked={!p.can_sign_in} onChange={(e) => { setWaOnly(e.target.checked); touch(); }} /> WhatsApp only</label>
      </td>
      <td><input form={f} name="whatsapp" defaultValue={p.whatsapp ?? ""} placeholder="+9715…" onChange={touch} className={waOnly && !p.whatsapp ? "missing" : ""} /></td>
      <td><select form={f} name="role" defaultValue={p.role} onChange={touch}>{ROLE_ORDER.map((r) => <option key={r} value={r}>{ROLE_LABEL[r]}</option>)}</select></td>
      <td className="perms">
        <div>
          <label className="check" title="Can add and edit quotes (Pending / Quoted)"><input form={f} type="checkbox" name="can_edit_estimation" defaultChecked={p.can_edit_estimation} onChange={touch} /> Quotes</label>
          <label className="check" title="Can edit projects from Won onwards, move cards, add VOs"><input form={f} type="checkbox" name="can_edit_projects" defaultChecked={p.can_edit_projects} onChange={touch} /> Projects</label>
          <label className="check" title="Can add people and set these permissions"><input form={f} type="checkbox" name="can_manage_team" defaultChecked={p.can_manage_team} onChange={touch} /> Team</label>
        </div>
        <div>
          <label className="check" title="Gets the email when a quote is won"><input form={f} type="checkbox" name="notify_on_award" defaultChecked={p.notify_on_award} onChange={touch} /> Signings</label>
          <label className="check" title="Gets whatever nobody else has answered"><input form={f} type="checkbox" name="handles_escalations" defaultChecked={p.handles_escalations} onChange={touch} /> Escalations</label>
        </div>
      </td>
      <td><label className="check"><input form={f} type="checkbox" name="is_active" defaultChecked={p.is_active} onChange={touch} /> Active</label></td>
      <td className="save">
        <form id={f} action={action} onSubmit={() => setDirty(false)}>
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
  const [waOnly, setWaOnly] = useState(false);
  return (
    <tr className="addrow">
      <td><input form="f-new" name="name" placeholder="SHORT NAME" required className="upper" /></td>
      <td><input form="f-new" name="full_name" placeholder="Full name" /><input form="f-new" name="position" placeholder="Position" className="pos" /></td>
      <td>
        <input form="f-new" name="email" type="email" placeholder={waOnly ? "no email — WhatsApp only" : "name@bolsovercontracting.com"} disabled={waOnly} />
        <label className="check"><input form="f-new" type="checkbox" name="whatsapp_only" onChange={(e) => setWaOnly(e.target.checked)} /> WhatsApp only</label>
      </td>
      <td><input form="f-new" name="whatsapp" placeholder="+9715…" /></td>
      <td><select form="f-new" name="role" defaultValue="PM">{ROLE_ORDER.map((r) => <option key={r} value={r}>{ROLE_LABEL[r]}</option>)}</select></td>
      <td className="perms">
        <div>
          <label className="check"><input form="f-new" type="checkbox" name="can_edit_estimation" /> Quotes</label>
          <label className="check"><input form="f-new" type="checkbox" name="can_edit_projects" /> Projects</label>
          <label className="check"><input form="f-new" type="checkbox" name="can_manage_team" /> Team</label>
        </div>
        <div>
          <label className="check"><input form="f-new" type="checkbox" name="notify_on_award" /> Signings</label>
          <label className="check"><input form="f-new" type="checkbox" name="handles_escalations" /> Escalations</label>
        </div>
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
          <thead><tr><th>Name</th><th>Full name</th><th>Email</th><th>WhatsApp</th><th>Role</th><th>Can edit · hears about</th><th>Status</th><th /></tr></thead>
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
