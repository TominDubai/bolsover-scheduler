-- 013 (15 Oct 2026): 15:30 Dubai daily-report nudge (11:30 UTC; Dubai has no DST). Applied via execute_sql.
select cron.schedule('bolsover-scheduler-report-nudge', '30 11 * * *', $job$
  select net.http_post(
    url := 'https://bolsover-scheduler.vercel.app/api/nudge',
    headers := jsonb_build_object('Content-Type','application/json','Authorization','Bearer ' || (select decrypted_secret from vault.decrypted_secrets where name = 'scheduler_notify_secret')),
    body := '{}'::jsonb, timeout_milliseconds := 55000);
$job$);
