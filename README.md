# Bolsover Project Scheduler

Bolsover Building Contracting's project pipeline tracker — replaces `Quotation Register 2025.xlsx` on the U: drive. Built from the C5 Project Scheduler template (`TominDubai/c5-scheduler`).

- `app/` — Next.js 15 app (deployed on Vercel). **Root directory for Vercel is `app`.**
- `db/` — Supabase migrations for the `scheduler` schema inside the Bolsover Supabase project (the one with the CRM).
- `import/` — register audit, clean-up and import scripts, import report.
- `design/` — design-direction pages (to come).
- `docs/` — team guide (to come).

## Pipeline

`PENDING` (being priced) → `QUOTED` (sent, awaiting feedback) → `WON` → `PRE_MOB` (approvals, permits, procurement, access, site readiness) → `LIVE` → `COMPLETED`

Exits from QUOTED: `ON_HOLD`, `REJECTED` (client dropped it), `LOST` (went elsewhere / by others).

## Env vars (Vercel)

`NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, `RESEND_API_KEY`, `NOTIFY_SECRET` (same value as the `scheduler_notify_secret` entry in Supabase Vault). Env changes need a redeploy — an empty commit forces one.

## Change notifications

Same pattern as C5: triggers write significant changes to `scheduler.change_log`; pg_cron POSTs to `/api/notify` every 10 minutes; one quiet email per affected person via Resend from `scheduler@bolsovercontracting.com`. Editor isn't emailed about their own change; 3-minute hold; >7 days marked done unsent.

## Status

Session 1 (13 Oct 2026): register audited (`import/Bolsover-Scheduler_Audit_v1.md`), app re-pointed at the Bolsover pipeline and rebranded with a placeholder wordmark. DB schema, import, people list and design pass still to do. The `db/` folder currently holds the C5 migrations as reference — they will be replaced.
