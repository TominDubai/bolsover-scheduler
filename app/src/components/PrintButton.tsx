"use client";
export default function PrintButton() {
  return <button className="btn noprint" onClick={() => window.print()} style={{ position: "fixed", top: 16, right: 16 }}>Save as PDF</button>;
}
