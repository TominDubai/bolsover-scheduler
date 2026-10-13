# Import

`import_register.py <register.xlsx>` reads the Quotation Register, cleans it, and writes `import.sql` + `Import_Report_v1.md`.
`register_snapshot_2026-10-13.xlsx` is the copy that was imported on 13 Oct 2026.

Loaded through the Supabase MCP as JSON payloads (`payload_*.json`, built from `import.sql`) because the raw SQL is too big for one call.
After loading: status history stamped with the received date, change_log marked notified so the digest doesn't replay the import.

Not yet imported: anything added to the register after 13 Oct 2026. The register goes read-only once the team has run on the app for a week.
