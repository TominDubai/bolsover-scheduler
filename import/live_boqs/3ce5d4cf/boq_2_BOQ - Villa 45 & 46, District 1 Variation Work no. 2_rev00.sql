set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '3ce5d4cf-aa9c-440a-826c-d6fedb0779d6' and source_file = 'BOQ - Villa 45 & 46, District 1 Variation Work no. 2_rev00.xlsx';
insert into variations(project_id, vo_no, description, value) values ('3ce5d4cf-aa9c-440a-826c-d6fedb0779d6', 2, 'Villa 45 & 46, District 1 Variation Work no. 2_rev00', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '3ce5d4cf-aa9c-440a-826c-d6fedb0779d6' and vo_no = 2;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('3ce5d4cf-aa9c-440a-826c-d6fedb0779d6', 'VARIATION', 0, v, 'Villa 45 & 46, District 1 Variation Work no. 2_rev00', 'BBC/072026/00088_rev00', 'DRAFT', '2026-07-02', null, null, 'BOQ - Villa 45 & 46, District 1 Variation Work no. 2_rev00.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'Preparation, coordination, and procurement of all necessary approvals (authority submissions, revisions, and NOC) for this scopes at Villa 45 & 46, District 1, MBRC by Client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'B', 'Additional work no. 2 for Villa 45 & 46') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'B1.', null, 'Supply and installation of regular gypsum wall
cladding nibe

Location: Living area near kitchen', 2.0, 'Nos', 375.0, 250.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'B2.', null, 'Supply and installation of regular gypsum
board lintel in door area

Location: Guest Room & Powder Room', 4.0, 'Nos', 300.0, 200.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'B3.', null, 'Demolition of existing curtain pelmet with lightcove bulkhead & Reinstallation of curtain pelmet with lightcove bulkhead 

Location: Bedroom 1', 2.0, 'Nos', 1275.0, 850.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'B4.', null, 'Supply and installation of cement board ledge
wall

Location: Guest Bathroom', 2.0, 'Nos', 975.0, 650.0, 50.0, false, false);
update boqs set status = 'REJECTED' where id = b;
end $x$;
