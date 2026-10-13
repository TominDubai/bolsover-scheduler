// POST /api/alerts — site-progress alerts (Monday ask, Wednesday nudge, Thursday escalation, daily programme checks).
// Called once a day at 07:00 Dubai by pg_cron (db/006_cron.sql). Protected by the same NOTIFY_SECRET as /api/notify.
// GET is a dry run: lists who would be emailed. ?day=mon|wed|thu forces a weekday for testing.
import { NextResponse, type NextRequest } from "next/server";
import { runAlerts } from "@/lib/alerts";

export const dynamic = "force-dynamic";
export const maxDuration = 60;

function authorised(req: NextRequest) {
  const secret = process.env.NOTIFY_SECRET;
  return !!secret && (req.headers.get("authorization") ?? "") === `Bearer ${secret}`;
}

async function handle(req: NextRequest, dryRun: boolean) {
  if (!authorised(req)) return NextResponse.json({ error: "unauthorised" }, { status: 401 });
  const force = req.nextUrl.searchParams.get("day") ?? undefined;
  try {
    return NextResponse.json({ ok: true, dryRun, ...(await runAlerts({ dryRun, force })) });
  } catch (e) {
    return NextResponse.json({ ok: false, error: (e as Error).message }, { status: 500 });
  }
}

export async function POST(req: NextRequest) { return handle(req, false); }
export async function GET(req: NextRequest) { return handle(req, true); }
