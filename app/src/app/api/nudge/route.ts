// POST /api/nudge — 15:30 Dubai daily-report nudge (db/013_cron_nudge.sql). GET = dry run.
import { NextResponse, type NextRequest } from "next/server";
import { runReportNudge } from "@/lib/alerts";
export const dynamic = "force-dynamic";
export const maxDuration = 60;
const ok = (req: NextRequest) => { const s = process.env.NOTIFY_SECRET; return !!s && (req.headers.get("authorization") ?? "") === `Bearer ${s}`; };
async function handle(req: NextRequest, dryRun: boolean) {
  if (!ok(req)) return NextResponse.json({ error: "unauthorised" }, { status: 401 });
  try { return NextResponse.json({ ok: true, dryRun, ...(await runReportNudge({ dryRun })) }); }
  catch (e) { return NextResponse.json({ ok: false, error: (e as Error).message }, { status: 500 }); }
}
export async function POST(req: NextRequest) { return handle(req, false); }
export async function GET(req: NextRequest) { return handle(req, true); }
