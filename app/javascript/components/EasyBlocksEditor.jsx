import React from 'react';
import { EasyblocksEditor } from "@easyblocks/editor";
import { EasyblocksBackend } from "@easyblocks/core";

// Create a simple config for EasyBlocks
const easyblocksConfig = {
  backend: new EasyblocksBackend({
    accessToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcm9qZWN0X2lkIjoiZTA4N2FhMjgtYzc5Mi00YmE2LWI2MGUtMzk2ZTdlMDU2ZGE1IiwianRpIjoiYzg2YjI0YjUtNGQ1OS00NjQzLWFlMTMtMDRjZGZjMGUyMGM1IiwiaWF0IjoxNzQyMTcyMTEyfQ.Xo79ypgP1dIrOwlefv63_F85lGmYJtg_xttm5NaqiAg", // You'll need a real token in production
  }),
  components: [
    {
      id: "TextBlock",
      label: "Text Block",
      schema: [
        {
          prop: "text",
          label: "Text Content",
          type: "richText",
        },
        {
          prop: "align",
          label: "Alignment",
          type: "select",
          options: [
            { value: "left", label: "Left" },
            { value: "center", label: "Center" },
            { value: "right", label: "Right" }
          ],
        },
      ],
    },
  ],
};

// Create the component renderers
function TextBlock({ text, align }) {
  return (
    <div style={{ textAlign: align || "left" }}>
      <div dangerouslySetInnerHTML={{ __html: text }} />
    </div>
  );
}

// Export the editor component as default
const EasyBlocksEditor = ({ onSave }) => {
  return (
    <div style={{ height: "100vh", width: "100%" }}>
      <EasyblocksEditor
        config={easyblocksConfig}
        components={{ TextBlock }}
        rootComponent="TextBlock"
        onSave={onSave}
      />
    </div>
  );
};

// Make sure to export the component as default
export default EasyBlocksEditor;