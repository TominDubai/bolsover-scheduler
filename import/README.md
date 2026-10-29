# Import

`import_register.py <register.xlsx>` reads the Quotation Register, cleans it, and writes `import.sql` + `Import_Report_v1.md`.
`register_snapshot_2026-10-13.xlsx` is the copy that was imported on 13 Oct 2026.

Loaded through the Supabase MCP as JSON payloads (`payload_*.json`, built from `import.sql`) because the raw SQL is too big for one call.
After loading: status history stamped with the received date, change_log marked notified so the digest doesn't replay the import.

Not yet imported: anything added to the register after 13 Oct 2026. The register goes read-only once the team has run on the app for a week.

## Programme (P6) loads

`programme_to_sql.py <project>_programme.json > <project>_programme.sql` turns a P6 export (typed up as JSON: packages with activities, dates, days) into SQL for the Supabase SQL editor or `execute_sql`. It upserts on `(project_id, code)` and on an existing package changes **only** the planned dates and days — trade, subcontractor, value, owner, milestones, approval line, sort and name stay as the team set them (db/020). Activities are upserted in full. Each run writes a row to `scheduler.programme_imports`.

`sidra170_programme.json` is Sidra 170's baseline (Jasper's New_Schedule.pdf, data date 22 Sep 2026); `sidra170_programme_v2.sql` is generated from it. `sidra170_programme.sql` is the original hand-written load from 13 Oct, kept for history — don't run it, it also rewrites names and sort.
