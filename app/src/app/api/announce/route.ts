// POST /api/announce — one-off email to everyone who owns a live site. Body: { subject, html }. GET = who would get it.
import { NextResponse, type NextRequest } from "next/server";
import { runAnnouncement } from "@/lib/alerts";
export const dynamic = "force-dynamic";
export const maxDuration = 60;
const ok = (req: NextRequest) => { const s = process.env.NOTIFY_SECRET; return !!s && (req.headers.get("authorization") ?? "") === `Bearer ${s}`; };
export async function GET(req: NextRequest) {
  if (!ok(req)) return NextResponse.json({ error: "unauthorised" }, { status: 401 });
  return NextResponse.json({ ok: true, dryRun: true, ...(await runAnnouncement({ dryRun: true, subject: "", html: "" })) });
}
export async function POST(req: NextRequest) {
  if (!ok(req)) return NextResponse.json({ error: "unauthorised" }, { status: 401 });
  const { subject, html } = await req.json().catch(() => ({})) as { subject?: string; html?: string };
  if (!subject || !html) return NextResponse.json({ error: "subject and html required" }, { status: 400 });
  try { return NextResponse.json({ ok: true, ...(await runAnnouncement({ subject, html })) }); }
  catch (e) { return NextResponse.json({ ok: false, error: (e as Error).message }, { status: 500 }); }
}
