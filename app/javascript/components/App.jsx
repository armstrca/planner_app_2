// app/javascript/components/App.jsx
import React, { useEffect, useRef, useState } from 'react';
import { Editor, Tldraw } from '@tldraw/tldraw';
import '@tldraw/tldraw/tldraw.css';

export default function App() {
  const [focused, setFocused] = useState(false);
  const rEditorRef = (useRef < Editor) | (null > null);

  useEffect(() => {
    const editor = rEditorRef.current;
    if (!editor) return;
    editor.updateInstanceState({ isFocused: false });
  }, [focused]);

  return (
    <div style={{ position: 'fixed', inset: 0 }}>
      <Tldraw 
      autoFocus={false}
      persistenceKey='monthly' 
      />
    </div>
  );
}
