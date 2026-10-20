# BOQs for the live jobs — generated 20 Oct 2026

One folder per project (first 8 chars of the project id), one `boq_<n>_<file>.sql` per bill, built by
`boq_to_sql.py` from Pao's workbooks on `U:\Quotations - Pao\2026\…`. Re-runnable: a block replaces any
earlier load of the same source file. Load order inside a folder is the `boq_<n>` number (approved quote first).

Spec used per project is in the chat handover `Bolsover-Scheduler_Handover_2026-10-20`.
Discounts that only appear in the progress billing reports (Meadows 5, House MZ) were added by hand as
`update boqs set discount = …` lines — see the comment on each.
