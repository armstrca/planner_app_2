// app/javascript/components/App.jsx
import React, { useState, useEffect } from 'react';
import {
  Tldraw,
  TLCameraOptions,
  BoxModel,
  track,
  useEditor,
  useLocalStorageState,
} from 'tldraw';
import PowerOffIcon from './PowerOffIcon';
import 'tldraw/tldraw.css';

const CAMERA_OPTIONS = {
  isLocked: false,
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

const BOUNDS_SIZES = {
  a4: { x: 0, y: 0, w: 1050, h: 1485 },
  landscape: { x: 0, y: 0, w: 1600, h: 900 },
  portrait: { x: 0, y: 0, w: 900, h: 1600 },
  square: { x: 0, y: 0, w: 900, h: 900 },
};


function CustomQuickActions({ onToggleTldraw }) {
  return (
    <DefaultQuickActions>
      <TldrawUiMenuItem
        id='toggle-tldraw'
        label='Toggle Tldraw'
        icon='hidden' // Make sure this icon exists or omit this prop if it doesn't
        onSelect={onToggleTldraw}
      />
      <DefaultQuickActionsContent />
    </DefaultQuickActions>
  );
}

export default function App() {
  const [showTldraw, setShowTldraw] = useState(true);

  const toggleTldrawVisibility = () => {
    setShowTldraw((prev) => !prev);
    // Adjust the styling of the #app div directly when toggling Tldraw visibility
    const appDiv = document.getElementById('app');
    if (appDiv) {
      appDiv.style.zIndex = showTldraw ? '0' : '10'; // Toggle zIndex based on the current state
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
                zIndex: 20, // Ensure the button is always clickable
                backgroundColor: 'hsl(204, 16%, 94%)',
                color: 'black',
                borderRadius: '6px', // Adjust border-radius as needed
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
