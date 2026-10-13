import LoginForm from "./LoginForm";

export default async function LoginPage({ searchParams }: { searchParams: Promise<{ error?: string }> }) {
  const { error } = await searchParams;
  return (
    <div className="login">
      <img className="logo" src="/bolsover-logo.svg" alt="Bolsover Building Contracting" />
      <div className="panel">
        <h1>Sign in</h1>
        <p>Enter your work email and we’ll send you a 6-digit code. No password needed.</p>
        <LoginForm />
        {error === "not_allowed" && <span className="msg err">That email isn’t on the Bolsover team list. Ask Tom to add you.</span>}
        {error === "link" && <span className="msg err">That link has expired or was already used. Request a new one.</span>}
      </div>
    </div>
  );
}
