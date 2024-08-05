// esbuild.config.js
const esbuild = require('esbuild');
const { esbuildPluginTsc } = require('esbuild-plugin-tsc');

esbuild
  .build({
    entryPoints: ['src/index.tsx'],
    bundle: true,
    outfile: 'dist/bundle.js',
    sourcemap: true,
    format: 'esm',
    plugins: [esbuildPluginTsc()],
    loader: {
      '.js': 'jsx',
    },
  })
  .catch(() => process.exit(1));
