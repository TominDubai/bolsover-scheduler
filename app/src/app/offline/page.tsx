import OfflineRetry from "./OfflineRetry";

export const dynamic = "force-static";

export default function OfflinePage() {
  return (
    <div className="login">
      <img className="logo" src="/bolsover-logo.svg" alt="Bolsover Building Contracting" />
      <div className="panel">
        <h1>You’re offline</h1>
        <p>Bolsover Projects needs a connection to show live project data. Check Wi-Fi or mobile data, then try again.</p>
        <OfflineRetry />
      </div>
    </div>
  );
}
