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
