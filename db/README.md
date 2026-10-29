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

Applied 28 Oct 2026 (session 2 of the catch-up: Estimation + Meetings, via execute_sql):

- `017_tender_pipeline.sql` — `QUALIFYING` quote stage (every new enquiry; management proceed / decline), `MERGED` status, tender fields on `projects` (source + name, consultant, client address, project type, site visit date + by, submit via, outcome reason, qualified at/by, ball holder, `parent_project_id`), `enquiry_passes` + `log_ball_pass()` trigger (writes `change_log` kind `passed`), `win_as_vo(uuid)` (VO enquiry → next VO on the parent, enquiry → MERGED), `update_rows` policy widened with `alter policy`, `projects_live` rebuilt with `parent_name`, `parent_enquiry_no`, `ball_with_name`, `site_visit_by_name`, `boq_margin_pct`. Old view renamed `projects_live_016` — `drop view scheduler.projects_live_016;` (and `projects_live_old` from session 1) in the SQL editor tidies up. Enum values were run as two separate statements first.
- `018_meetings.sql` — `meetings`, `meeting_attendees`, `meetings_live`, room exclusion constraint (`btree_gist` installed in `extensions`), `change_log.meeting_id` (project_id now nullable), meeting / attendee change-log triggers, pg_cron `bolsover-scheduler-meetings-today` at 03:30 UTC Mon–Sat → `/api/notify/daily`.

Applied 28 Oct 2026 (session 4 of the catch-up: Packages, via execute_sql, section by section):

- `019_packages.sql` — `package_trades` (Tom's 18), `suppliers` (subcontractors; `contractors` stays the came-via list), `alert_settings` (P1/P4/P6/PA), and the package columns on **`programme_packages`** (trade, supplier, value, owner, five milestones, cancelled, authority approval line) — the P6 programme rows *are* the package rows, nothing duplicated. `stamp_package()` keeps milestones ↔ actual dates in step and derives `status`; `log_package_changes()` writes `change_log` kinds `package_*`. Views `packages_live`, `project_package_counts`. `projects_live` **not** rebuilt (counts are stitched on in the app), so nothing to drop. New policy `write_own_job` lets the PM / 2nd PM / site engineer edit their job's packages. Backfill: Sidra 170's 15 packages got a trade each (`package_trade_guess`) and the PM as owner; those change-log lines were marked notified.

Session 5 (29 Oct 2026: Packages follow-ups):

- `020_programme_imports.sql` — `programme_imports`: one row per P6 load (source file, data date, packages / activities upserted, new packages). The loader is now `import/programme_to_sql.py` (JSON → SQL); on an existing package it updates planned dates / days only and leaves every package column alone.
