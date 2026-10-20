-- 015: site photos. One row per photo, taken on a project on a given day, optionally against a bill item.
-- Files live in the public Storage bucket `site-photos` under <project_id>/<day>/<uuid>.jpg — the path is unguessable
-- and the links go into client WhatsApp groups, so public read is the point. Uploads are done from the browser
-- (resized to 1600px first) and the row is written through a server action.
set search_path = scheduler, public;

create table if not exists site_photos (
  id          uuid primary key default gen_random_uuid(),
  project_id  uuid not null references projects(id) on delete cascade,
  day         date not null,
  item_id     uuid references boq_items(id) on delete set null,
  path        text not null unique,            -- storage object path inside the bucket
  caption     text,
  by_id       uuid references people(id),
  created_at  timestamptz not null default now()
);
create index if not exists site_photos_project_day on site_photos(project_id, day desc);

alter table site_photos enable row level security;
create policy read_all on site_photos for select to authenticated using (true);
create policy write_photos on site_photos for all to authenticated
  using ((me()).can_edit_projects or exists (select 1 from projects p where p.id = project_id and current_person_id() in (p.pm_id, p.pm2_id, p.site_engineer_id)))
  with check ((me()).can_edit_projects or exists (select 1 from projects p where p.id = project_id and current_person_id() in (p.pm_id, p.pm2_id, p.site_engineer_id)));

create or replace function site_photo_touch() returns trigger language plpgsql security definer set search_path = scheduler, public as $$
begin
  if new.by_id is null then new.by_id := current_person_id(); end if;
  return new;
end $$;
create trigger trg_site_photo_touch before insert on site_photos for each row execute function site_photo_touch();

-- storage: public bucket, signed-in people can add and remove
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('site-photos', 'site-photos', true, 8388608, array['image/jpeg','image/png','image/webp'])
on conflict (id) do nothing;
create policy "site photos read"   on storage.objects for select to public        using (bucket_id = 'site-photos');
create policy "site photos add"    on storage.objects for insert to authenticated with check (bucket_id = 'site-photos');
create policy "site photos remove" on storage.objects for delete to authenticated using (bucket_id = 'site-photos');
