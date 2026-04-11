/**
 * push-tokens.js
 * Pushes design tokens from outputs/design-system/tokens/ to Figma Variables via REST API
 *
 * Usage: node push-tokens.js
 *
 * Requires Figma Professional/Organization plan for Variables API access
 */

require('dotenv').config();
const fs   = require('fs');
const path = require('path');

const FIGMA_API_TOKEN = process.env.FIGMA_API_TOKEN;
const FIGMA_FILE_KEY  = process.env.FIGMA_FILE_KEY;
const TOKENS_DIR      = path.resolve(__dirname, '../../outputs/design-system/tokens');

if (!FIGMA_API_TOKEN || !FIGMA_FILE_KEY) {
  console.error('❌  Missing FIGMA_API_TOKEN or FIGMA_FILE_KEY in .env');
  process.exit(1);
}

async function figmaAPI(method, endpoint, body) {
  const res = await fetch(`https://api.figma.com/v1${endpoint}`, {
    method,
    headers: {
      'X-Figma-Token': FIGMA_API_TOKEN,
      'Content-Type': 'application/json',
    },
    body: body ? JSON.stringify(body) : undefined,
  });
  if (!res.ok) {
    const error = await res.text();
    throw new Error(`Figma API ${method} ${endpoint} failed: ${error}`);
  }
  return res.json();
}

async function pushTokens() {
  console.log('🎨  Pushing design tokens to Figma Variables...\n');

  // Load token files
  const colorTokens = JSON.parse(fs.readFileSync(path.join(TOKENS_DIR, 'colors.json'), 'utf8'));
  const spacingTokens = JSON.parse(fs.readFileSync(path.join(TOKENS_DIR, 'spacing.json'), 'utf8'));
  const typographyTokens = JSON.parse(fs.readFileSync(path.join(TOKENS_DIR, 'typography.json'), 'utf8'));

  // Build Figma Variables payload
  const variableCollections = [
    {
      action: 'CREATE',
      id: 'collection_primitives',
      name: '🎨 Primitives',
      initialModeId: 'mode_default',
    },
    {
      action: 'CREATE',
      id: 'collection_semantic',
      name: '🎯 Semantic Tokens',
      initialModeId: 'mode_light',
    },
    {
      action: 'CREATE',
      id: 'collection_spacing',
      name: '📐 Spacing',
      initialModeId: 'mode_default',
    },
  ];

  // Flatten color primitives into variables
  const colorVariables = flattenTokens(colorTokens.color.primitive, 'COLOR');
  const semanticVariables = flattenTokens(colorTokens.color.semantic, 'COLOR');
  const spacingVariables = flattenTokens(spacingTokens.spacing, 'FLOAT');

  const payload = {
    variableCollections,
    variableModes: [
      { action: 'CREATE', id: 'mode_default', name: 'Default', variableCollectionId: 'collection_primitives' },
      { action: 'CREATE', id: 'mode_light',   name: 'Light',   variableCollectionId: 'collection_semantic' },
      { action: 'CREATE', id: 'mode_dark',    name: 'Dark',    variableCollectionId: 'collection_semantic' },
    ],
    variables: [
      ...colorVariables.map(v => ({ ...v, variableCollectionId: 'collection_primitives' })),
      ...semanticVariables.map(v => ({ ...v, variableCollectionId: 'collection_semantic' })),
      ...spacingVariables.map(v => ({ ...v, variableCollectionId: 'collection_spacing' })),
    ],
    variableModeValues: [
      ...colorVariables.map(v => ({
        variableId: v.id,
        modeId: 'mode_default',
        value: hexToFigmaColor(v._rawValue),
      })),
      ...spacingVariables.map(v => ({
        variableId: v.id,
        modeId: 'mode_default',
        value: parseFloat(v._rawValue),
      })),
    ],
  };

  console.log(`📊  Variables to create: ${payload.variables.length}`);

  const result = await figmaAPI('POST', `/files/${FIGMA_FILE_KEY}/variables`, payload);
  console.log('\n✅  Design tokens pushed to Figma Variables!');
  console.log(`   Collections: ${variableCollections.length}`);
  console.log(`   Variables: ${payload.variables.length}`);

  return result;
}

function flattenTokens(obj, resolvedType, prefix = '', results = []) {
  for (const [key, value] of Object.entries(obj)) {
    const fullKey = prefix ? `${prefix}/${key}` : key;
    if (value && typeof value === 'object' && 'value' in value) {
      results.push({
        action: 'CREATE',
        id: `var_${fullKey.replace(/[^a-z0-9]/gi, '_').toLowerCase()}`,
        name: fullKey,
        resolvedType,
        _rawValue: value.value,
      });
    } else if (value && typeof value === 'object') {
      flattenTokens(value, resolvedType, fullKey, results);
    }
  }
  return results;
}

function hexToFigmaColor(hex) {
  const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  return result ? {
    r: parseInt(result[1], 16) / 255,
    g: parseInt(result[2], 16) / 255,
    b: parseInt(result[3], 16) / 255,
    a: 1,
  } : { r: 0, g: 0, b: 0, a: 1 };
}

pushTokens().catch(err => {
  console.error('❌  Failed:', err.message);
  process.exit(1);
});
