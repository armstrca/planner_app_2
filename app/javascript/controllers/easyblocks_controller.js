// app/javascript/controllers/easyblocks_controller.js
import { Controller } from '@hotwired/stimulus'
import { createRoot } from 'react-dom/client'
import EasyBlocksEditor from '../components/EasyBlocksEditor';
import { EasyblocksBackend } from '@easyblocks/core';
import { Easyblocks } from '@easyblocks/core';
import React from 'react';
import { DummyBanner } from '../components/EasyBlocksComponents'
import { EasyblocksEditor } from '@easyblocks/editor';

export default class extends Controller {
  connect() {
    const editorContainer = document.getElementById('easyblocks');

    // Configuration from EasyBlocks docs
    const easyblocksConfig = {
      backend: new EasyblocksBackend({
        accessToken:
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcm9qZWN0X2lkIjoiZTA4N2FhMjgtYzc5Mi00YmE2LWI2MGUtMzk2ZTdlMDU2ZGE1IiwianRpIjoiYzg2YjI0YjUtNGQ1OS00NjQzLWFlMTMtMDRjZGZjMGUyMGM1IiwiaWF0IjoxNzQyMTcyMTEyfQ.Xo79ypgP1dIrOwlefv63_F85lGmYJtg_xttm5NaqiAg', // Replace with actual token
      }),
      locales: [
        { code: 'en-US', isDefault: true },
        { code: 'de-DE', fallback: 'en-US' },
      ],
      components: [
        {
          id: 'DummyBanner',
          label: 'DummyBanner',
          schema: [
            {
              prop: 'backgroundColor',
              label: 'Background Color',
              type: 'color',
            },
            { prop: 'padding', label: 'Padding', type: 'space' },
            {
              prop: 'Title',
              type: 'component',
              required: true,
              accepts: ['@easyblocks/rich-text'],
            },
          ],
          styles: ({ values }) => ({
            styled: {
              Root: {
                backgroundColor: values.backgroundColor,
                padding: values.padding,
              },
            },
          }),
        },
      ],
      tokens: {
        colors: [
          { id: 'black', label: 'Black', value: '#000000', isDefault: true },
          { id: 'white', label: 'White', value: '#ffffff' },
          { id: 'coral', label: 'Coral', value: '#ff7f50' },
        ],
        fonts: [
          {
            id: 'body',
            label: 'Body',
            value: { fontSize: 18, lineHeight: 1.8, fontFamily: 'sans-serif' },
            isDefault: true,
          },
          {
            id: 'heading',
            label: 'Heading',
            value: {
              fontSize: 24,
              fontFamily: 'sans-serif',
              lineHeight: 1.2,
              fontWeight: 700,
            },
          },
        ],
        space: [
          { id: '0', label: '0', value: '0px', isDefault: true },
          // ... rest of space tokens
        ],
      },
      hideCloseButton: true,
    };

    if (!editorContainer._reactRoot) {
      editorContainer._reactRoot = createRoot(editorContainer);
    }


    editorContainer._reactRoot.render(
      <div style={{ background: 'red', padding: '20px' }}>
        <h1>TEST COMPONENT</h1>
        <EasyblocksEditor
          config={easyblocksConfig}
          components={{ DummyBanner }}
          onSave={(template) => this.saveTemplate(template)}
        />
      </div>
    );
  }

  async saveTemplate(template) {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    try {
      const response = await fetch('/page_templates', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken
        },
        body: JSON.stringify({ template })
      });
      
      if (!response.ok) throw new Error('Save failed');
      // Handle successful save
    } catch (error) {
      console.error('Save error:', error);
    }
  }
}