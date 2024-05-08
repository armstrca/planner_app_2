// app/javascript/components/App.jsx
import React, { useState } from 'react';
import { Tldraw } from '@tldraw/tldraw';
import {
  DefaultQuickActions,
  DefaultQuickActionsContent,
  TldrawUiMenuItem,
} from '@tldraw/tldraw';
import PowerOffIcon from './PowerOffIcon';
import '@tldraw/tldraw/tldraw.css';

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
        <div style={{ position: 'absolute', top: '5px', left: '5px' }}>
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
                width: '25px'
              }}
            >
              <PowerOffIcon 
              style={{ height: '20px', width: '20px', paddingLeft: '5px' }} />
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
