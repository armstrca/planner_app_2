import React, { useState, useEffect, useRef } from 'react';
import { Tldraw } from 'tldraw';
import {
  DEFAULT_CAMERA_OPTIONS,
  DefaultQuickActions,
  DefaultQuickActionsContent,
  TldrawUiMenuItem,
} from 'tldraw';
import PowerOffIcon from './PowerOffIcon';
import 'tldraw/tldraw.css';

function CustomQuickActions({ onToggleTldraw }) {
  return (
    <DefaultQuickActions>
      <TldrawUiMenuItem
        id='toggle-tldraw'
        label='Toggle Tldraw'
        icon='hidden'
        onSelect={onToggleTldraw}
      />
      <DefaultQuickActionsContent />
    </DefaultQuickActions>
  );
}

export default function App() {
  const [showTldraw, setShowTldraw] = useState(true);
  const editorRef = useRef(null); // Ref to hold the editor instance

  useEffect(() => {
    console.log('showTldraw:', showTldraw);
    console.log('editor:', editorRef.current);

    if (editorRef.current && showTldraw) {
      editorRef.current.setCameraOptions = {
        ...DEFAULT_CAMERA_OPTIONS,
        isLocked: true,
        wheelBehavior: 'pan',
        panSpeed: 1,
        zoomSpeed: 1,
        zoomSteps: [0.1, 0.25, 0.5, 1, 2, 4, 8],
        constraints: {
          initialZoom: 'fit-max',
          baseZoom: 'fit-max',
          bounds: {
            x: 0,
            y: 0,
            w: 1600,
            h: 900,
          },
          behavior: { x: 'contain', y: 'contain' },
          padding: { x: 100, y: 100 },
          origin: { x: 0.5, y: 0.5 },
        },
      };
    }
  }, [showTldraw]);

  const toggleTldrawVisibility = () => {
    setShowTldraw((prev) => !prev);
    const appDiv = document.getElementById('app');
    if (appDiv) {
      appDiv.style.zIndex = showTldraw ? '0' : '10';
    }
  };

  const components = {
    QuickActions: () => (
      <CustomQuickActions onToggleTldraw={toggleTldrawVisibility} />
    ),
  };

  return (
    <div style={{ position: 'fixed', inset: 0, zIndex: showTldraw ? 10 : 0 }}>
      {showTldraw && (
        <Tldraw
          autoFocus={false}
          persistenceKey='monthly'
          components={components}
          onMount={(editor) => (editorRef.current = editor)} // Capture the editor instance
        />
      )}
      {!showTldraw && (
        <div
          style={{ position: 'absolute', inset: 0, top: '5px', left: '5px' }}
        >
          <div className='tlui-buttons__horizontal'>
            <button
              onClick={toggleTldrawVisibility}
              className='tlui-icon tlui-icon__small tlui-button__icon'
              style={{
                position: 'absolute',
                top: '10px',
                left: '10px',
                zIndex: 20,
                backgroundColor: 'hsl(204, 16%, 94%)',
                color: 'black',
                borderRadius: '6px',
                border: 'none',
                height: '25px',
                width: '25px',
              }}
            >
              <PowerOffIcon
                style={{ height: '20px', width: '20px', paddingLeft: '5px' }}
              />
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
