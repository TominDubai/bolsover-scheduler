// Dry-run runAlerts (src/lib/alerts.ts) against a JSON fixture instead of the live schema — prints rule / recipient / subject.
// Names in the fixture are fixtures; the real team lives in the database.
// Run from the app directory:
//   npx esbuild src/lib/alerts.ts --bundle --platform=node --format=cjs --alias:@=./src --external:@supabase/supabase-js --outfile=.alerts-test.cjs \
//     && node tests/alerts-dry-run.cjs tests/alerts-fixture.json; rm -f .alerts-test.cjs
const fixtures = JSON.parse(require('fs').readFileSync(process.argv[2], 'utf8'));
const tables = { projects_live: fixtures.projects, people: fixtures.people, packages_live: fixtures.packages, alerts: [], alert_settings: fixtures.settings };
function q(rows) { let r = rows; const api = {
  select: () => api, in: (k, vs) => { r = r.filter(x => vs.includes(x[k])); return api; }, is: (k) => { r = r.filter(x => x[k] == null); return api; },
  eq: (k, v) => { r = r.filter(x => x[k] === v); return api; }, gte: () => api, then: (res) => res({ data: r }) }; return api; }
process.env.NEXT_PUBLIC_SUPABASE_URL = 'https://x'; process.env.SUPABASE_SERVICE_ROLE_KEY = 'x';
require('module')._load = ((orig) => function (req, ...a) { if (req === '@supabase/supabase-js') return { createClient: () => ({ from: (t) => q(tables[t] ?? []) }) }; return orig.call(this, req, ...a); })(require('module')._load);
const { runAlerts } = require(path.resolve('.alerts-test.cjs'));
runAlerts({ dryRun: true }).then((r) => { for (const p of r.planned) console.log(p.rule.padEnd(22), (p.to||'').padEnd(34), p.subject); });
