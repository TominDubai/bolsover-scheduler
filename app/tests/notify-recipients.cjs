// Who gets emailed, and what the email says. Pure-function tests for src/lib/notify.ts.
//
// Run from the app directory:
//   npx esbuild src/lib/notify.ts --bundle --platform=node --format=cjs --alias:@=./src \
//     --external:@supabase/supabase-js --outfile=.notify-test.cjs && node tests/notify-recipients.cjs; rm -f .notify-test.cjs
//
// The cases that matter: a won quote reaches the people flagged notify_on_award even though nobody is
// assigned to the project yet, an ordinary edit does NOT reach them, and nobody is told about their own action.
// Names here are test fixtures, not the real team — the real list lives in the database.
const { recipients, describe, isAward } = require(require('path').join(__dirname, '..', '.notify-test.cjs'));
const P = (id, name, award = false) => [id, { id, name, full_name: name, email: `${name.toLowerCase()}@example.com`, is_active: true, notify_on_award: award }];
const people = new Map([P('md','MD',true), P('ops','OPS',true), P('office','OFFICE',true),
                        P('qs','QS'), P('pm1','PM1'), P('site1','SITE1'), P('pm2','PM2')]);
const names = (rs) => rs.map(r => r.name).sort().join(', ') || '(nobody)';
const ch = (o) => ({ id: 1, project_id: 'p1', kind: 'field', field: null, old_value: null, new_value: null, changed_by: null, changed_at: new Date().toISOString(), ...o });

let fail = 0;
const t = (label, got, want) => { const ok = got === want; if (!ok) fail++; console.log(`${ok ? 'PASS' : 'FAIL'}  ${label}\n      got:  ${got}${ok ? '' : `\n      want: ${want}`}`); };

// 1. The QS marks a quote won. Nobody assigned yet.
const quote = { id:'p1', enquiry_no:'BBC/102026/00113', name:'VILLA 12', client:'CLIENT', status:'WON', pm_id:null, pm2_id:null, site_engineer_id:null, estimator_id:'qs', signed_quote:450000 };
const award = [ch({ field:'status', old_value:'QUOTED', new_value:'WON', changed_by:'qs' })];
t('award -> everyone flagged for signings, not the QS herself', names(recipients(quote, award, people, new Set())), 'MD, OFFICE, OPS');
t('award wording', describe(award[0], quote), 'Signed — AED 450,000. Now at Won. Still needs a project manager and a site engineer.');

// 2. Same award, but the MD is the one who clicked Won -> not told about his own action
t('award by MD excludes MD', names(recipients(quote, [ch({ field:'status', old_value:'QUOTED', new_value:'WON', changed_by:'md' })], people, new Set())), 'OFFICE, OPS');

// 3. Team assigned + two people tagged; an ordinary later change
const live = { ...quote, status:'LIVE', pm_id:'pm1', site_engineer_id:'site1' };
const edit = [ch({ field:'target_date', old_value:'2026-11-01', new_value:'2026-12-01', changed_by:'pm1' })];
t('ordinary change -> team + tagged, not the editor', names(recipients(live, edit, people, new Set(['pm2','ops']))), 'OPS, PM2, SITE1');
t('no award spam on an ordinary change', recipients(live, edit, people, new Set()).some(r => r.name === 'MD'), false);

// 4. Award once the team is already on it -> no "still needs" tail
t('award wording when staffed', describe(award[0], { ...live, status:'WON' }), 'Signed — AED 450,000. Now at Won.');

// 5. Lost / rejected / quoted are not awards
t('lost is not an award', isAward(ch({ field:'status', old_value:'QUOTED', new_value:'LOST' })), false);
t('quote-stage change is not an award', isAward(ch({ field:'quote_stage', old_value:'PRICING', new_value:'SUBMITTED' })), false);

// 6. Tagging someone reads properly in the digest
t('watcher added wording', describe(ch({ kind:'watcher_added', field:'watcher', new_value:'PM2' })), 'Pm2 is now kept updated on this project');

console.log(fail ? `\n${fail} FAILED` : '\nall passed');
process.exit(fail ? 1 : 0);
