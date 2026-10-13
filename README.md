# Bolsover Project Scheduler

Bolsover Building Contracting's project pipeline tracker — replaces `Quotation Register 2025.xlsx` on the U: drive. Built from the C5 Project Scheduler template (`TominDubai/c5-scheduler`).

- `app/` — Next.js 15 app (deployed on Vercel). **Root directory for Vercel is `app`.**
- `db/` — Supabase migrations for the `scheduler` schema inside the Bolsover Supabase project (the one with the CRM).
- `import/` — register audit, clean-up and import scripts, import report.
- `design/` — design-direction pages (to come).
- `docs/` — team guide (to come).

## Programme

Each project from WON onwards gets a **Programme** panel on its page: the package-level baseline (planned start / finish / days) taken from Jasper's P6 "Classic Schedule Layout" export, with the activities under each package as read-only checkpoints. Site progress is recorded per package — % complete, actual start, forecast finish, actual finish, note — and each package shows its health against the baseline (late / overdue / due / done). Progress changes go into `change_log` (kind `programme`) so they ride the digest. Load a new project's programme with a seed like `import/sidra170_programme.sql` (idempotent — re-run to refresh the baseline without touching progress).

## Pipeline

`PENDING` (being priced) → `QUOTED` (sent, awaiting feedback) → `WON` → `PRE_MOB` (approvals, permits, procurement, access, site readiness) → `LIVE` → `COMPLETED`

Exits from QUOTED: `ON_HOLD`, `REJECTED` (client dropped it), `LOST` (went elsewhere / by others).

## Env vars (Vercel)

`NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, `RESEND_API_KEY`, `NOTIFY_SECRET` (same value as the `scheduler_notify_secret` entry in Supabase Vault). Env changes need a redeploy — an empty commit forces one.

## Change notifications

Same pattern as C5: triggers write significant changes to `scheduler.change_log`; pg_cron POSTs to `/api/notify` every 10 minutes; one quiet email per affected person via Resend from `scheduler@bolsovercontracting.com`. Editor isn't emailed about their own change; 3-minute hold; >7 days marked done unsent.

## Where things are

- Supabase: project `qmigtdpwzdmwnbmxewfm`, schema `scheduler` (see `db/README.md`)
- Vercel: team `bolsover`, project `bolsover-scheduler`, root directory `app`
- Resend: `scheduler@bolsovercontracting.com` (domain already verified)

## Status

Session 1 (13 Oct 2026): register audited (`import/Bolsover-Scheduler_Audit_v1.md`), app re-pointed at the Bolsover pipeline and rebranded with a placeholder wordmark. Live at bolsover-scheduler.vercel.app with the register imported (85 projects, 161 revisions, 26 VOs). Tom and Mye manage the team and permissions from the Team page. Still to do: design-direction pass, notifications/digest wiring (Resend key, service role, pg_cron), triage of the 59 QUOTED cards.
