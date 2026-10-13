-- Villa 170, Sidra 2 — programme baseline from Jasper's P6 export (New_Schedule.pdf, data date 22-Sep-26).
-- Project RW-26-001: 208 days, 18-May-26 → 09-Feb-27. Loads against enquiry BBC/032026/00063.
-- Idempotent: re-running updates planned dates and leaves progress fields alone.

set search_path = scheduler, public;

do $$
declare pid uuid; pk uuid;
begin
  select id into pid from projects where enquiry_no = 'BBC/032026/00063';
  if pid is null then raise exception 'Project BBC/032026/00063 not found'; end if;

  -- packages: code, name, sort, days, start, finish
  insert into programme_packages(project_id, code, name, sort, planned_days, planned_start, planned_finish) values
    (pid,'RW-26-001.1', 'PRELIMINARIES',                  1,  97,'2026-05-18','2026-09-23'),
    (pid,'RW-26-001.2', 'SITE WORKS',                     2,  48,'2026-06-04','2026-07-30'),
    (pid,'RW-26-001.3', 'CONCRETE WORKS',                 3,  63,'2026-08-11','2026-10-31'),
    (pid,'RW-26-001.4', 'MASONRY / PARTITION',            4, 105,'2026-07-24','2026-12-04'),
    (pid,'RW-26-001.5', 'METAL WORKS',                    5,  52,'2026-09-23','2026-11-21'),
    (pid,'RW-26-001.6', 'THERMAL & MOISTURE PROTECTION',  6,  28,'2026-10-05','2026-11-05'),
    (pid,'RW-26-001.7', 'DOORS, WINDOWS & SKYLIGHTS',     7,  54,'2026-09-24','2026-11-25'),
    (pid,'RW-26-001.8', 'MEP WORKS',                      8, 100,'2026-07-24','2026-11-26'),
    (pid,'RW-26-001.9', 'FINISHES (WET TRADES)',          9, 113,'2026-07-24','2026-12-14'),
    (pid,'RW-26-001.10','JOINERY WORKS',                 10,  59,'2026-09-24','2026-12-01'),
    (pid,'RW-26-001.11','FINISHES (HARD FINISHES)',      11,  28,'2026-11-26','2027-01-06'),
    (pid,'RW-26-001.12','ACCESSORIES',                   12,   3,'2026-12-28','2026-12-30'),
    (pid,'RW-26-001.13','INTERNAL SNAGGING & CLOSE OUT', 13,   3,'2027-01-04','2027-01-07'),
    (pid,'RW-26-001.14','EXTERNAL WORKS',                14, 109,'2026-09-23','2027-02-05'),
    (pid,'RW-26-001.15','HANDOVER',                      15,   3,'2027-02-06','2027-02-09')
  on conflict (project_id, code) do update
    set name = excluded.name, sort = excluded.sort, planned_days = excluded.planned_days,
        planned_start = excluded.planned_start, planned_finish = excluded.planned_finish;

  -- activities: package code, activity id, name, days, start, finish
  with a(pcode, code, name, days, s, f) as (values
    ('RW-26-001.1','A1000','Mobilization, site setup, HSE & temporary facilities, and protection works',10,'2026-05-18','2026-06-03'),
    ('RW-26-001.1','A1010','Shop drawings preparation & submission',45,'2026-07-24','2026-09-23'),
    ('RW-26-001.1','A1020','Authority approvals / NOC coordination (by client, tracked)',0,'2026-05-18','2026-05-18'),
    ('RW-26-001.1','A1250','DDA approvals',96,'2026-05-18','2026-09-15'),
    ('RW-26-001.2','A1040','Strip-out - bathrooms, kitchen, ceilings, doors, windows, flooring',18,'2026-06-04','2026-06-24'),
    ('RW-26-001.2','A1030','Demolition - block walls, RCC column & roof slab opening',24,'2026-06-25','2026-07-23'),
    ('RW-26-001.2','A1050','Cartway & disposal of debris',30,'2026-06-25','2026-07-30'),
    ('RW-26-001.3','A1080','Raised floor system (125mm build-up) - kitchen',5,'2026-08-11','2026-08-15'),
    ('RW-26-001.3','A1060','RCC suspended slab & beams (Pumpcrete/PCD ready mix) extension slabs',28,'2026-09-23','2026-10-24'),
    ('RW-26-001.3','A1090','Raised floor system (150mm build-up) - master bathroom and closet on existing floor slab',14,'2026-10-16','2026-10-31'),
    ('RW-26-001.3','A1070','Raised floor system at closet area in slab extension',5,'2026-10-26','2026-10-30'),
    ('RW-26-001.4','A1100','Block masonry walls (hollow & thermal block) not in slab and beam extension',15,'2026-07-24','2026-08-10'),
    ('RW-26-001.4','A1110','Block masonry walls (hollow & thermal block) - at the slab and beam extension',8,'2026-10-26','2026-11-03'),
    ('RW-26-001.4','A1120','Gypsum board partitions (closet dummy windows)',6,'2026-11-26','2026-12-04'),
    ('RW-26-001.5','A1130','Steel staircase - fabrication (offsite workshop)',40,'2026-09-23','2026-11-07'),
    ('RW-26-001.5','A1140','Steel staircase - site installation incl. rooflight steelwork',12,'2026-11-09','2026-11-21'),
    ('RW-26-001.6','A1160','Wet area waterproofing (horizontal & vertical)',10,'2026-10-05','2026-10-15'),
    ('RW-26-001.6','A1150','Roof waterproofing membrane & rockwool insulation',10,'2026-10-26','2026-11-05'),
    ('RW-26-001.7','A1170','Aluminium glazed doors, windows & skylights - Schüco system - fabrication',42,'2026-09-24','2026-11-11'),
    ('RW-26-001.7','A1190','Aluminium glazed doors, windows & skylights - Schüco system - installation',12,'2026-11-12','2026-11-25'),
    ('RW-26-001.7','A1180','Wooden doors & ironmongery installation',5,'2026-11-18','2026-11-23'),
    ('RW-26-001.8','A1210','HVAC equipment and ductwork installation including removal of existing',22,'2026-07-24','2026-08-18'),
    ('RW-26-001.8','A1200','MEP first fix - electrical containment, plumbing rough-in',15,'2026-09-10','2026-10-03'),
    ('RW-26-001.8','A1220','HVAC grills and thermostat roughing-in',12,'2026-11-02','2026-11-14'),
    ('RW-26-001.8','A1240','MEP testing & commissioning (incl. Hassantuk smart monitoring)',7,'2026-11-16','2026-11-23'),
    ('RW-26-001.8','A1230','MEP second fix - fittings, fixtures, devices, sanitaryware',10,'2026-11-16','2026-11-26'),
    ('RW-26-001.9','A1260','Internal & external wall plastering on walls not in extension area',21,'2026-07-24','2026-08-17'),
    ('RW-26-001.9','A1480','False ceiling frameworks and shadow gap',24,'2026-10-05','2026-10-31'),
    ('RW-26-001.9','A1490','Internal and external plastering on walls at extension area',10,'2026-11-04','2026-11-14'),
    ('RW-26-001.9','A1270','False ceiling works - gypsum board and precast curved design installation',14,'2026-11-26','2026-12-14'),
    ('RW-26-001.10','A1500','Joinery drawing approvals',5,'2026-09-24','2026-09-29'),
    ('RW-26-001.10','A1280','Joinery - offsite fabrication (wardrobes, kitchen, vanities, cabinets)',42,'2026-09-30','2026-11-17'),
    ('RW-26-001.10','A1290','Joinery - site installation & fitting-out',12,'2026-11-18','2026-12-01'),
    ('RW-26-001.11','A1320','Timber ceiling, wood grill works & gypsum installation',12,'2026-11-26','2026-12-11'),
    ('RW-26-001.11','A1310','Floor finishes - wood floor, SPC, microcement and marble skirting',12,'2026-11-30','2026-12-15'),
    ('RW-26-001.11','A1300','Wall finishes - textured paint finish, fenomastic paint finish, curved accent wall',12,'2026-12-14','2026-12-30'),
    ('RW-26-001.11','A1470','Epoxy floor finish',3,'2027-01-04','2027-01-06'),
    ('RW-26-001.12','A1330','Mirrors & smart film installation',3,'2026-12-28','2026-12-30'),
    ('RW-26-001.13','A1340','Internal snagging & de-snagging, internal deep cleaning',3,'2027-01-04','2027-01-06'),
    ('RW-26-001.13','A1350','INTERNAL WORKS COMPLETE (TARGET)',0,'2027-01-07','2027-01-07'),
    ('RW-26-001.14','A1370','Pergola raise-up, dismantling & protection',10,'2026-09-23','2026-10-03'),
    ('RW-26-001.14','A1430','Utility room base',8,'2026-09-23','2026-10-01'),
    ('RW-26-001.14','A1400','Exterior painting - entire villa (weatherproof paint)',12,'2027-01-04','2027-01-16'),
    ('RW-26-001.14','A1440','External snagging and touch-ups',3,'2027-01-18','2027-01-20'),
    ('RW-26-001.14','A1450','Authority final inspection',1,'2027-01-20','2027-01-20'),
    ('RW-26-001.14','A1390','External drainage, parapet wall & pipe insulation works',4,'2027-01-21','2027-01-25'),
    ('RW-26-001.14','A1460','Utility room finishing',14,'2027-01-21','2027-02-05'),
    ('RW-26-001.15','A1410','Final handover and completion certificate',2,'2027-02-06','2027-02-08'),
    ('RW-26-001.15','A1420','Project completion and handover (target)',1,'2027-02-09','2027-02-09')
  )
  insert into programme_activities(package_id, code, name, sort, planned_days, planned_start, planned_finish)
  select p.id, a.code, a.name, row_number() over (partition by a.pcode order by a.s::date, a.f::date), a.days, a.s::date, a.f::date
  from a join programme_packages p on p.project_id = pid and p.code = a.pcode
  on conflict (package_id, code) do update
    set name = excluded.name, sort = excluded.sort, planned_days = excluded.planned_days,
        planned_start = excluded.planned_start, planned_finish = excluded.planned_finish;

  -- the project's own programme dates, if not already set
  update projects set start_date = coalesce(start_date, '2026-05-18'), target_date = coalesce(target_date, '2027-02-09') where id = pid;
end $$;

select p.code, p.name, p.planned_start, p.planned_finish, count(a.id) as activities
from programme_packages p left join programme_activities a on a.package_id = p.id
join projects j on j.id = p.project_id where j.enquiry_no = 'BBC/032026/00063'
group by p.code, p.name, p.planned_start, p.planned_finish, p.sort order by p.sort;
