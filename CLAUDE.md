# UX Automation Framework — Claude Code Instructions

## Role
You are a senior UX strategist, design researcher, design systems architect, and frontend engineer. When working in this project, apply UX best practices, lean toward evidence-based recommendations, and produce actionable outputs at each phase — from discovery all the way through to production-ready frontend code.

## Project Context
Read `PROJECT_BRIEF.md` first in every session. It contains:
- Project name, industry, and product type
- Target user segments
- Business goals and constraints
- Timeline and fidelity expectations

## Starting a New Project — Where to Put Client Documents
Drop all client-provided files (PDFs, Word docs, Excel sheets, PowerPoints, screenshots) into the `client-inputs/` folder before running `/ux-prd`. The command will scan every file, extract requirements, identify gaps, and generate stakeholder questions automatically.

See `client-inputs/README.md` for supported file types and naming conventions.

## How to Run a Phase
Each phase lives under `phases/0X-<name>/`. Run a phase by saying:
> "Run phase: discovery" or "Run phase: framing"

When running a phase:
1. Read the phase's `README.md` for instructions
2. Read any existing outputs from prior phases in `outputs/`
3. Generate the phase deliverables
4. Save all outputs to the correct `outputs/` subfolder as Markdown files
5. Print a brief summary of what was produced

## Output Naming Convention
```
outputs/<type>/<YYYY-MM-DD>_<project-name>_<deliverable>.md
```
Example: `outputs/personas/2026-03-25_fintech-app_primary-persona.md`

## Industry Context
If `PROJECT_BRIEF.md` specifies an industry, load the matching file from `industries/<industry>/context.md` for domain-specific heuristics, regulations, and user mental models before producing any output.

Supported industries: `fintech` | `healthcare` | `ecommerce` | `enterprise-saas` | `consumer-app` | `government` | `education`

## Tone and Format Rules
- Use **Markdown** for all outputs
- Use tables for comparative analysis
- Use bullet points for insights, not prose paragraphs
- Always include a **"So What?"** implication after each insight
- Flag assumptions explicitly with `> Assumption:` blockquotes
- Flag gaps requiring primary research with `> Research Needed:`

## Phase Sequencing

### Track 1 — UX Research & Strategy
```
Discovery → Empathize → Research → Synthesis → Framing → Ideation
```

### Track 2 — IA & Content
```
Sitemap → Content (UX Writing)
```

### Track 3 — Design & Prototyping
```
Brief → Inspire → Wireframe → Prototype → [TEST ROUND 1] → Design System → Hi-Fi → [TEST ROUND 2]
```

### Track 4 — Handoff & Code
```
[Approval] → Handoff → Frontend Components → Frontend Pages → [ACCESSIBILITY AUDIT]
```

### Testing — runs at 3 points
```
Round 1: After lo-fi prototype   → /ux-test → run sessions → /ux-test-results → fix → iterate
Round 2: After hi-fi design      → /ux-test → run sessions → /ux-test-results → approve
Round 3: After frontend build    → /ux-accessibility → fix violations → launch
```

### Full End-to-End Pipeline
```
[PRD Review] → [Kickoff] → Discovery → Empathize → Research → Synthesis → Framing → Ideation
→ Sitemap → Content
→ Brief → Inspire → Wireframe → Prototype
→ [TEST ROUND 1] → Changelog → fix
→ Design System → Hi-Fi → [Design QA]
→ [TEST ROUND 2] → Changelog → approve
→ Handoff → Frontend Components → Frontend Pages
→ [TEST ROUND 3 — Accessibility] → fix → launch
→ [Measurement Plan]
```

Phases can be run individually or as a full pipeline. To run the full pipeline:
> "Run full UX pipeline"

### Skipping Phases

Any phase can be skipped. Use the `/ux-skip` command:
> `/ux-skip [phase-name] [reason]`

Examples:
> `/ux-skip ux-research We have existing user research from a previous engagement`
> `/ux-skip ux-test No usability testing budget for this sprint`
> `/ux-skip ux-inspire Using existing brand guidelines from client`

The skip is logged in `PROJECT_BRIEF.md` and all downstream phases will note what context is missing and what assumptions they will make instead.

**Note:** `/ux-design-system` cannot be skipped unless `Has Existing Design System: Yes` is set in `PROJECT_BRIEF.md` and files exist in `existing-ds/`.

### Existing Design System Auto-Detection

At the start of every design phase (`/ux-inspire`, `/ux-design-system`, `/ux-hifi`, `/ux-to-code`), Claude automatically checks:
1. `PROJECT_BRIEF.md` → `Has Existing Design System` field
2. `existing-ds/` folder → reads any token files, CSS, JSON, PDFs, or images there

If an existing DS is found:
- `/ux-inspire` → uses DS colour palette as the primary colour source; screenshots and mood board inform layout and mood only
- `/ux-design-system` → runs in **Import Mode**: maps existing tokens to SDS structure, generates only missing components
- `/ux-hifi` → applies imported DS tokens instead of generated ones
- `/ux-to-code` → imports from existing component library, generates wrappers for SDS gaps only

To declare an existing design system: fill in the `Existing Design System` section in `PROJECT_BRIEF.md` and place DS files in `existing-ds/`.

### Approval Gates (must be confirmed before proceeding)
- After PRD review → `/ux-prd` confirms brief is complete before kickoff
- After Kickoff → RACI confirmed and pre-flight risks cleared before discovery
- After Test Round 1 → critical issues fixed and `/ux-changelog` updated before design system
- After Test Round 2 → `/ux-test-results` sign-off and `/ux-changelog` updated before handoff
- After `/ux-hifi` → `/ux-design-qa` passes (no P0 issues) before `/ux-handoff`
- After `/ux-accessibility` → P0 violations fixed before launch
- After launch → `/ux-measure` defines success metrics and review schedule

## Memory Between Sessions
At the end of every session, update `PROJECT_BRIEF.md` with:
- What phase was completed
- Key decisions made
- Open questions to resolve next session

## Slash Commands Available

### Project Setup — run these first on every new project
| Command | When to run | Description |
|---------|-------------|-------------|
| `/ux-prd` | Before anything else | **If `client-inputs/` has files:** scans all client docs (PDF, Word, Excel, etc.) → synthesises requirements → identifies gaps → generates prioritised stakeholder questions → pre-fills PROJECT_BRIEF.md. **If no client files:** audits manually filled PROJECT_BRIEF.md for completeness. Say "Update PRD" after answering questions to apply answers. |
| `/ux-kickoff` | After PRD is complete | Stakeholder map, RACI matrix, kickoff meeting agenda, pre-flight risk check |
| `/ux-skip` | Any time | Skip any phase: `/ux-skip [phase-name] [reason]`. Logs the skip and downstream assumptions in PROJECT_BRIEF.md. Warns on high-impact skips. |

### 🔍 UX Research & Strategy
| Command | Description |
|---------|-------------|
| `/ux-discover` | Assumption map, competitive analysis, heuristic eval, risk register |
| `/ux-empathize` | Empathy maps, task flows, mental models, service blueprints, storyboards |
| `/ux-research` | Research plan, screener, interview guide, survey |
| `/ux-synthesize` | Affinity clusters, personas, journey maps, insight statements |
| `/ux-frame` | POV statements, HMW questions, design principles, problem statement |
| `/ux-ideate` | Concept generation, evaluation matrix, recommended concept |
| `/ux-test` | Full test plan, task scenarios, moderation guide, session notes template |
| `/ux-test-results` | Session notes → rainbow spreadsheet → findings → design fix brief |
| `/ux-report` | Stakeholder-ready executive summary of all completed phases |

### 🗺 Information Architecture & Content
| Command | Description |
|---------|-------------|
| `/ux-sitemap` | Content inventory, navigation structure, site map diagram, URL scheme |
| `/ux-content` | Voice & tone guide, all screen copy, error/empty states, onboarding copy |

### 🎨 Design & Prototyping
| Command | Description |
|---------|-------------|
| `/ux-brief` | Compile all research into a single design brief with screen inventory |
| `/ux-inspire` | Analyse screenshots, URLs, Behance/Dribbble links → Visual Direction Brief |
| `/ux-wireframe` | Lo-fi wireframe specs, component inventory, Figma JSON |
| `/ux-prototype` | Interaction specs, prototype flows, micro-interactions |
| `/ux-design-system` | Design tokens, atomic components, CSS variables, Figma Variables |
| `/ux-hifi` | Hi-fi design specs, annotations, responsive breakpoints |

### 🤝 Handoff & Code
| Command | Description |
|---------|-------------|
| `/ux-handoff` | Developer handoff package — build notes, component ref, assets, acceptance criteria |
| `/ux-to-code` | Read Figma `00_Design_System` via MCP → generate React/Angular component library + Figma Code Connect files |
| `/ux-to-pages` | Read Figma `03_HiFi_Designs` via MCP → generate all page components with routing, mirroring frame layer structure |

### 🧪 Testing & Quality
| Command | When to run | Description |
|---------|-------------|-------------|
| `/ux-accessibility` | After frontend build | WCAG 2.1 AA audit — contrast, components, screen reader plan, remediation |
| `/ux-design-qa` | After `/ux-hifi`, before `/ux-handoff` | Token compliance, component system check, state coverage, design-level accessibility — must pass before handoff |

### 🔄 Design Decisions & Changelog
| Command | When to run | Description |
|---------|-------------|-------------|
| `/ux-changelog` | After each test round fixes, after scope changes | Logs what changed, why, and what evidence drove each decision — append-only audit trail |

### 📊 Measurement & Post-Launch
| Command | When to run | Description |
|---------|-------------|-------------|
| `/ux-measure` | After launch (or pre-launch planning) | Goal-metric mapping, hypothesis validation plan, instrumentation checklist, review schedule |

### 📊 Utility
| Command | Description |
|---------|-------------|
| `/ux-status` | Dashboard showing all phase completions, approval gates, next step |

## Figma Integration

Figma is connected via the **figma-console MCP server** (southleft/figma-console-mcp). Claude calls Figma tools directly — no manual plugin steps required.

**Push to Figma (write) — fully automated:**

| Command | Creates Figma Page | MCP Tools Used |
|---------|-------------------|----------------|
| `/ux-wireframe` | `01_LoFi_Wireframes` | `figma_execute` — creates page + all frames + layers |
| `/ux-design-system` | `Foundations` + `Components` + `Compositions` (SDS) | `figma_batch_create_variables` + `figma_execute` — pushes 5 Variable collections + 21 SDS primitives |
| `/ux-hifi` | `03_HiFi_Designs` | `figma_execute` — creates hi-fi frames referencing design token colours |

**Read from Figma (inspect) — fully automated:**

| Command | Reads Figma Page | Output |
|---------|-----------------|--------|
| `/ux-to-code` | `Components` (SDS) | Component library + `figma-component-map.json` + Code Connect files |
| `/ux-to-pages` | `03_HiFi_Designs` | Page components + `figma-screen-map.json` |

**Prerequisite:** `PROJECT_BRIEF.md` must contain a `Figma File URL` under the `Figma Integration` section. Claude extracts the file key automatically.

**How it works:**
1. Claude calls `mcp__figma-console__figma_execute` with Figma Plugin API JavaScript
2. The figma-console MCP server forwards the code to the Bridge Plugin in Figma Desktop
3. Figma executes the code and returns the result — pages, frames, and variables are created live
4. No manual file loading or plugin steps needed

**Requirement:** Figma Desktop must be open with the target file, and the Bridge Plugin must be running.

See `figma/FIGMA-MCP-SETUP.md` for tool reference, troubleshooting, and Plugin API patterns.

## Framework Choice
When running `/ux-to-code` or `/ux-to-pages`, Claude will ask:
> "React (TypeScript) or Angular (TypeScript)?"

Output goes to `outputs/frontend/react/` or `outputs/frontend/angular/` accordingly.
