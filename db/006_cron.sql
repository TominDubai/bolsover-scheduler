-- 006 (13 Oct 2026): the two scheduled jobs. Applied via execute_sql.
-- The bearer token lives in Vault as `scheduler_notify_secret` and on Vercel as NOTIFY_SECRET (same value).
select vault.create_secret('<token>', 'scheduler_notify_secret', 'Bearer token the pg_cron jobs send to /api/notify and /api/alerts; same value as NOTIFY_SECRET on Vercel');

-- change digests, every 10 minutes
select cron.schedule('bolsover-scheduler-notify', '*/10 * * * *', $job$
  select net.http_post(
    url := 'https://bolsover-scheduler.vercel.app/api/notify',
    headers := jsonb_build_object('Content-Type','application/json','Authorization','Bearer ' || (select decrypted_secret from vault.decrypted_secrets where name = 'scheduler_notify_secret')),
    body := '{}'::jsonb, timeout_milliseconds := 25000);
$job$);

-- site-progress alerts, daily 07:00 Dubai (03:00 UTC): Monday ask, Wednesday nudge, Thursday escalation, programme checks every day
select cron.schedule('bolsover-scheduler-alerts', '0 3 * * *', $job$
  select net.http_post(
    url := 'https://bolsover-scheduler.vercel.app/api/alerts',
    headers := jsonb_build_object('Content-Type','application/json','Authorization','Bearer ' || (select decrypted_secret from vault.decrypted_secrets where name = 'scheduler_notify_secret')),
    body := '{}'::jsonb, timeout_milliseconds := 55000);
$job$);
