# Figma MCP Integration Setup

This guide explains how Claude Code connects to Figma via the **Figma MCP (claude-plugins-official)** to read designs, push frames, variables, and components into Figma — no Bridge Plugin or local MCP server required.

> **You are using the official Figma MCP provided by Anthropic (claude-plugins-official).**
> This file documents how Claude uses these tools in each phase.

---

## Architecture

```
Claude Code (Claude AI)
    │
    ├── mcp__plugin_figma_figma__use_figma              ← Write designs into Figma (frames, variables, components)
    ├── mcp__plugin_figma_figma__get_design_context     ← Read design context, components, variables
    ├── mcp__plugin_figma_figma__get_metadata           ← Read file structure and node metadata
    ├── mcp__plugin_figma_figma__get_screenshot         ← Capture screenshots of frames/nodes
    └── mcp__plugin_figma_figma__generate_diagram       ← Create diagrams in FigJam
            │
            ▼
    Figma MCP Plugin (plugin:figma:figma)
            │
            ▼
    Figma REST API + Figma File
```

> **IMPORTANT:** Before calling `use_figma`, you must load the `figma-use` skill via the Skill tool.
> Each UX command that writes to Figma will remind you of this. The skill teaches the correct
> Plugin API patterns (auto-layout, variable binding, font loading) that prevent common errors.

---

## Setup (one-time)

### 1. Add Figma MCP via claude-plugins-official

In Claude Code, install the official Figma MCP:
```
claude mcp add --transport http figma https://mcp.figma.com/sse
```

Or via Claude Desktop → Settings → Integrations → search "Figma" → Connect.

### 2. Authenticate

When prompted, sign in with your Figma account to grant access. Your Figma Personal Access Token is managed by the MCP — no manual token configuration needed.

### 3. Set your Figma File URL in `PROJECT_BRIEF.md`

```markdown
## Figma Integration
- Figma File URL: https://www.figma.com/design/YOUR_FILE_KEY/your-file-name
- Figma File Key: YOUR_FILE_KEY
```

Claude extracts the file key automatically from the URL.

---

## MCP Tools Used by Each Command

### FigJam Commands (discovery & research — use `figma:figma-use-figjam` skill)

| Command | Tool Calls | FigJam Board Created |
|---------|-----------|---------------------|
| `/ux-kickoff` | `use_figma` (×2–3) | `00_Kickoff` — stakeholder map section, RACI table stickies, risk pre-flight |
| `/ux-discover` | `use_figma` (×3–4) | `01_Discovery` — assumption sticky wall, competitor cards section, risk register table |
| `/ux-empathize` | `use_figma` (×4–5) | `02_Empathy` — empathy map 2×2 grid, task flow connectors, mental model diagram, storyboard |
| `/ux-research` | `use_figma` (×2–3) | `03_Research` — research questions board, screener stickies |
| `/ux-synthesize` | `use_figma` (×3–4) | `04_Synthesis` — affinity cluster stickies, journey map with swimlanes, persona cards |
| `/ux-frame` | `use_figma` (×2–3) | `05_Framing` — HMW sticky voting board, POV cards, design principles |
| `/ux-ideate` | `use_figma` (×2–3) | `06_Ideation` — concept sketch sections, evaluation matrix |
| `/ux-sitemap` | `use_figma` (×2) | `07_Sitemap` — IA hierarchy with connectors, URL scheme |
| `/ux-sprint` | `use_figma` (×5–8) | `08_Sprint` — one section per day, storyboard frames, rainbow spreadsheet |
| `/ux-test` | `use_figma` (×2) | `09_Testing` — test plan board, task scenario cards |
| `/ux-test-results` | `use_figma` (×2–3) | `09_Testing` — rainbow spreadsheet table, findings stickies by severity |

### Figma Commands (design & code — use `figma:figma-use` skill)

| Command | Tool Calls | Figma Page Created |
|---------|-----------|-------------------|
| `/ux-wireframe` | `use_figma` (×N per screen) | `01_LoFi_Wireframes` — annotated lo-fi frames |
| `/ux-prototype` | `use_figma` (×N) | `02_Prototype_Flows` — interaction flow frames |
| `/ux-design-system` | `use_figma` (variables + frames) | `00_Design_System` — 5 Variable collections + 21 SDS primitives |
| `/ux-hifi` | `use_figma` (×N per screen) | `03_HiFi_Designs` — hi-fi frames with token colours |
| `/ux-handoff` | `use_figma` (×N) | `04_Handoff_Specs` — annotated handoff frames |
| `/ux-figma-docs` | `use_figma` (×1–N per phase) | `05_UX_Documentation` — design-phase summaries (brief, inspire, accessibility, measure) |
| `/ux-to-code` | `get_design_context` + `get_metadata` | Reads `00_Design_System`; extracts component + token map |
| `/ux-to-pages` | `get_design_context` | Reads `03_HiFi_Designs`; extracts screen frame structure |

---

## Figma File Structure (auto-created by commands)

```
📁 your_project (YOUR_FILE_KEY)
  📄 Foundations             ← Created by /ux-design-system (SDS page 1)
       Color swatches, type scale, spacing scale
       Variables: Primitives/Color | Semantic (Light+Dark) | Primitives/Size | Primitives/Typography | Responsive
  📄 Components              ← Created by /ux-design-system (SDS page 2)
       21 SDS primitives: Button | Input | Checkbox | Radio | Switch | Tag | Tab | Accordion
       Notification | Tooltip | Avatar | Dialog | Menu | Select | Search | Slider | Pagination | Link | Text | Textarea | Icon
  📄 Compositions            ← Created by /ux-design-system (SDS page 3)
       Cards | Forms | Headers | Footers | Sections
  📄 05_UX_Documentation     ← Created by /ux-figma-docs (runs as final step of every phase)
       One section frame per phase: Discovery | Empathy | Research | Synthesis | Framing
       Ideation | IA | Content | Brief | Visual Direction | Prototype | Tests | Handoff | Measure
       Each frame: phase title, project name, date, key deliverables as text/tables/callouts
  📄 01_LoFi_Wireframes      ← Created by /ux-wireframe
       Frames per screen: [ID]_[Name]_LoFi — Desktop | Mobile
  📄 02_Prototype_Flows      ← Manual (guided by /ux-prototype output)
  📄 03_HiFi_Designs         ← Created by /ux-hifi
       Frames per screen: Desktop | Mobile | Dark (if required)
  📄 04_Handoff_Specs        ← Generated by /ux-handoff
```

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `use_figma` tool not found | The Figma plugin uses `mcp__plugin_figma_figma__use_figma`. Restart Claude Code after installing the Figma MCP via claude-plugins-official |
| Authentication error | Re-authenticate via Claude Desktop → Settings → Integrations → Figma |
| `use_figma` timeout | Break large operations into multiple calls (one frame at a time) |
| Font load error | Always `await figma.loadFontAsync(...)` before creating text nodes |
| Page already exists warning | The commands check for existing pages and navigate to them rather than duplicating |
| Variables not showing in Figma | Ensure your Figma plan supports the Variables API (Professional or Org) |

---

## Providing Your Figma File URL

Every phase reads the Figma File URL from `PROJECT_BRIEF.md`:

```markdown
## Figma Integration
- Figma File URL: https://www.figma.com/design/NmLHhW3lmdC66JpvFDNPGs/pocket_ledger
- Figma File Key: NmLHhW3lmdC66JpvFDNPGs
```

Claude extracts the file key automatically from the URL.
