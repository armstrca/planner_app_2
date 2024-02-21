// app/javascript/components/App.jsx
import React, { useEffect } from "react";
import { Tldraw } from "@tldraw/tldraw";

import "@tldraw/tldraw/tldraw.css";

export default function App() {
  return (
    <div style={{ position: "fixed", inset: 0 }}>
      <Tldraw editor />
    </div>
  );
}
