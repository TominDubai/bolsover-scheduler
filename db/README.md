# Database

Supabase project: **qmigtdpwzdmwnbmxewfm** (`tom@bolsovercontracting.com's Project`, ap-northeast-1), schema `scheduler`.

Applied 13 Oct 2026 via the Supabase MCP (`apply_migration` / `execute_sql`):

- `001_schema.sql` — tables, triggers, view, RLS (migration name `bolsover_scheduler_schema_v1`)
- `002_people.sql` — Tom + Mye with full rights (run through execute_sql)
- `003_team_permissions.sql`
- `004_programme.sql` — programme packages + activities per project, progress change-log trigger, RLS (migration name `bolsover_scheduler_programme_v1`). Sidra 170 baseline loaded from `import/sidra170_programme.sql` via execute_sql.

Dashboard settings (not expressible in SQL):
- Project Settings → Data API → **Exposed schemas**: add `scheduler`
- Authentication → Providers → Email: OTP sign-in on; email template must include `{{ .Token }}` (6-digit code)
- Authentication → SMTP: Resend, sender `scheduler@bolsovercontracting.com`

Gotchas carried over from C5: the MCP migration tool rejects `drop trigger if exists` / `drop view` — run those through `execute_sql`.

Applied 28 Oct 2026 (session 1 of the C5 catch-up, via execute_sql):

- `016_session1_plumbing.sql` — people flags (`notify_on_award`, `handles_escalations`, `can_sign_in`, `position`, `is_admin`), `project_watchers`, `target_revisions` + `projects.target_change_reason`, soft delete (`deleted_at/by/reason` + guard), change-log v2, `projects_live` rebuilt with `deleted_by_name`, `target_rev`, `target_rev0_date`. The `drop …` lines in the file were not needed on a fresh apply; the old view was renamed to `projects_live_old` instead of dropped (the MCP cancels drops) — `drop view scheduler.projects_live_old;` in the SQL editor tidies it. Seed (section 6) run the same day.
