import { Controller } from '@hotwired/stimulus';
import React from 'react';
import { createRoot } from 'react-dom/client';
import App from '../components/App';
import Tiptap from '../components/Tiptap';

export default class extends Controller {
  connect() {
    console.log('React controller connected');
    
    const app = document.getElementById('app');
    if (app) {
      if (!app._reactRoot) {
        app._reactRoot = createRoot(app);
      }
      app._reactRoot.render(<App />);
    }
    
    for (let i = 0; i < 6; i++) {
      const tiptap = document.getElementById(`tiptap-${i}`);
      if (tiptap) {
        if (!tiptap._reactRoot) {
          tiptap._reactRoot = createRoot(tiptap);
        }
        tiptap._reactRoot.render(<Tiptap />);
      }
    }
  }
}
