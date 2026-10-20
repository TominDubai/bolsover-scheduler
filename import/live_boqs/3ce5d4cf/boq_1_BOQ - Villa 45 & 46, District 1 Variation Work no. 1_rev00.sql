set search_path = scheduler, public;
do $x$ declare b uuid; s uuid; v uuid; begin
delete from boqs where project_id = '3ce5d4cf-aa9c-440a-826c-d6fedb0779d6' and source_file = 'BOQ - Villa 45 & 46, District 1 Variation Work no. 1_rev00.xlsx';
insert into variations(project_id, vo_no, description, value) values ('3ce5d4cf-aa9c-440a-826c-d6fedb0779d6', 1, 'Villa 45 & 46, District 1 Variation Work no. 1_rev00', 0) on conflict (project_id, vo_no) do nothing;
select id into v from variations where project_id = '3ce5d4cf-aa9c-440a-826c-d6fedb0779d6' and vo_no = 1;
insert into boqs(project_id, kind, rev_no, variation_id, title, quote_ref, status, issue_date, working_days, terms, source_file, payment_terms) values ('3ce5d4cf-aa9c-440a-826c-d6fedb0779d6', 'VARIATION', 0, v, 'Villa 45 & 46, District 1 Variation Work no. 1_rev00', 'BBC/032026/00061_rev00', 'DRAFT', '2026-03-06', null, null, 'BOQ - Villa 45 & 46, District 1 Variation Work no. 1_rev00.xlsx', '30% advance, 70% on progress') returning id into b;
insert into boq_sections(boq_id, sort, code, title) values (b, 0, 'A', 'Preliminaries') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, null, null, 'Preparation, coordination, and procurement of all necessary approvals (authority submissions, revisions, and NOC) for this scopes at Villa 45 & 46, District 1, MBRC by Client.', null, null, null, null, null, true, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 1, 'B', 'Villa 45') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'B1a.', 'B1. Ground Floor', 'Supply and Installation of Cement Board Cladding

Location: Powder Toilet', 6.3, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'B1b.', 'B1. Ground Floor', 'Supply and Installation of Cement Board Cladding

Location: Guest Bathroom', 6.5, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'B1c.', 'B1. Ground Floor', 'Supply and Installation of 18mm plywood backing for chandelier as per updated drawing (rev 03)', 4.0, 'Nos', 525.0, 350.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'B1d.', 'B1. Ground Floor', 'Installation of trimless track light frame as per updated drawing (rev 03)', 8.0, 'LM', 52.5, 35.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'B2a.', 'B2. First Floor', 'Supply and Installation of Cement Board Cladding

Location: Master Bathroom', 8.0, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'B2b.', 'B2. First Floor', 'Supply and Installation of Cement Board Cladding 

Location: Bedroom 1 - Bathroom', 11.0, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'B2c.', 'B2. First Floor', 'Supply and Installation of Cement Board Cladding

Location: Bedroom 2 - Bathroom', 8.8, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'B2d.', 'B2. First Floor', 'Supply and Installation of Precast gypsum light cove bulkhead as per updated drawing (rev 03)', 75.0, 'LM', 180.0, 120.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, null, 'B2. First Floor', 'Supply and installation of gypsum board bulkhead
(150-200mm) - Removed', 75.0, 'LM', 48.0, 40.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'B2e.', 'B2. First Floor', 'Supply and Installation of 12.5mm thick regular gypsum board ceiling, ready for primer - (Double Height) as per updated drawing (rev 03)', 13.0, 'sqm', 330.0, 220.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'B2f.', 'B2. First Floor', 'Installation of trimless track light frame as per updated drawing (rev 03)', 20.0, 'LM', 52.5, 35.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'B2g.', 'B2. First Floor', 'Preparation of trimless A/C grill as per updated drawing (rev 03)', 20.0, 'LM', 36.0, 30.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'B2h.', 'B2. First Floor', 'Supply and apply of paint on the ceiling. (One coat primer, two coat stucco, two coat Rich mat white) as per updated drawing (rev 03)', 5.0, 'sqm', 48.0, 40.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'B3a.', 'B3. Roof Floor', 'Supply and Installation of Cement Board Cladding

Location: Bathroom', 4.5, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_sections(boq_id, sort, code, title) values (b, 2, 'C', 'Villa 46') returning id into s;
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 0, 'C1a.', 'C1. Ground Floor', 'Supply and Installation of Cement Board Cladding

Location: Powder Toilet', 6.3, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 1, 'C1b.', 'C1. Ground Floor', 'Supply and Installation of Cement Board Cladding

Location: Guest Bathroom', 6.5, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 2, 'C1c.', 'C1. Ground Floor', 'Supply and Installation of 18mm plywood backing for chandelier as per updated drawing (rev 03)', 4.0, 'Nos', 525.0, 350.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 3, 'C1d.', 'C1. Ground Floor', 'Installation of trimless track light frame as per updated drawing (rev 03)', 8.0, 'LM', 52.5, 35.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 4, 'C2a.', 'C2. First Floor', 'Supply and Installation of Cement Board Cladding

Location: Master Bathroom', 8.0, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 5, 'C2b.', 'C2. First Floor', 'Supply and Installation of Cement Board Cladding 

Location: Bedroom 1 - Bathroom', 11.0, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 6, 'C2c.', 'C2. First Floor', 'Supply and Installation of Cement Board Cladding

Location: Bedroom 2 - Bathroom', 8.8, 'sqm', 240.0, 160.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 7, 'C2d.', 'C2. First Floor', 'Supply and Installation of Precast gypsum light cove bulkhead as per updated drawing (rev 03)', 75.0, 'LM', 180.0, 120.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 8, null, 'C2. First Floor', 'Supply and installation of gypsum board bulkhead
(150-200mm) - Removed', 75.0, 'LM', 48.0, 40.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 9, 'C2e.', 'C2. First Floor', 'Supply and Installation of 12.5mm thick regular gypsum board ceiling, ready for primer - (Double Height) as per updated drawing (rev 03)', 13.0, 'sqm', 330.0, 220.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 10, 'C2f.', 'C2. First Floor', 'Installation of trimless track light frame as per updated drawing (rev 03)', 20.0, 'LM', 52.5, 35.0, 50.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 11, 'C2g.', 'C2. First Floor', 'Preparation of trimless A/C grill as per updated drawing (rev 03)', 20.0, 'LM', 36.0, 30.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 12, 'C2h.', 'C2. First Floor', 'Supply and apply of paint on the ceiling. (One coat primer, two coat stucco, two coat Rich mat white) as per updated drawing (rev 03)', 5.0, 'sqm', 48.0, 40.0, 20.0, false, false);
insert into boq_items(boq_id, section_id, sort, ref, subheading, description, qty, unit, rate, cost_rate, markup_pct, is_note, excluded) values (b, s, 13, 'C3a.', 'C3. Roof Floor', 'Supply and Installation of Cement Board Cladding

Location: Bathroom', 4.5, 'sqm', 240.0, 160.0, 50.0, false, false);
update boqs set status = 'APPROVED' where id = b;
end $x$;
