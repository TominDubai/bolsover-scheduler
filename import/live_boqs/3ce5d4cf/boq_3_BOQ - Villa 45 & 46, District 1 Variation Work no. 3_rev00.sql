set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '3ce5d4cf-aa9c-440a-826c-d6fedb0779d6' and source_file = 'BOQ - Villa 45 & 46, District 1 Variation Work no. 3_rev00.xlsx';
insert into variations(project_id, vo_no, description, value) values ('3ce5d4cf-aa9c-440a-826c-d6fedb0779d6', 3, 'Villa 45 & 46, District 1 Variation Work no. 3_rev00', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '3ce5d4cf-aa9c-440a-826c-d6fedb0779d6' and vo_no = 3;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('3ce5d4cf-aa9c-440a-826c-d6fedb0779d6', 'VARIATION', 0, v, 'Villa 45 & 46, District 1 Variation Work no. 3_rev00', 'BBC/072026/00091_rev00', 'DRAFT', '2026-07-17', null, null, 'BOQ - Villa 45 & 46, District 1 Variation Work no. 3_rev00.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'Preparation, coordination, and procurement of all necessary approvals (authority submissions, revisions, and NOC) for this scopes at Villa 45 & 46, District 1, MBRC by Client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'B', 'Additional work no. 3 for Villa 45') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'B1.', null, 'Supply and installation of 12.5mm thick regular gypsum board ceiling including cutout for light and Ac, ready for primer', 256.0, 'sqm', 117.0, 90.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'B2.', null, 'Supply and apply of paint on the ceiling. (One coat primer & One coat Rich mat white)', 256.0, 'sqm', 50.75, 35.0, 45.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'C', 'Additional work no. 3 for Villa 46') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'C1.', null, 'Supply and installation of 12.5mm thick regular gypsum board ceiling including cutout for light and Ac, ready for primer', 256.0, 'sqm', 117.0, 90.0, 30.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'C2.', null, 'Supply and apply of paint on the ceiling. (One coat primer & One coat Rich mat white)', 256.0, 'sqm', 50.75, 35.0, 45.0, false, false);
update boqs set status = 'REJECTED' where id = b;
end $x$;
