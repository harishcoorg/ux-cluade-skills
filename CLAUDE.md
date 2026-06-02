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

### 🏃 Sprint Planning
| Command | Description |
|---------|-------------|
| `/ux-sprint` | Run a full 5-day GV design sprint: sprint question, Day 1–5 plans, storyboard, prototype plan, test script, Day 5 rainbow spreadsheet, and sprint decision |
| `/ux-persona` | Create or update personas standalone — with or without prior research. Arguments: `primary`, `secondary`, or a role name (e.g. `/ux-persona admin`) |

### 📊 Utility
| Command | Description |
|---------|-------------|
| `/ux-status` | Dashboard showing all 19-phase completion status, approval gates, and next recommended step |
| `/ux-figma-docs` | Push any completed phase output to the `05_UX_Documentation` Figma page as a structured documentation frame. Run after any phase: `/ux-figma-docs discovery` or push all at once: `/ux-figma-docs all` |

## Figma & FigJam Integration

Both tools are connected via the **Figma MCP (plugin:figma:figma)**. Claude calls Figma and FigJam tools directly — no manual plugin steps required.

> **Skill loading rules:**
> - Before every `use_figma` call on a **Figma** file → load `figma:figma-use` skill
> - Before every `use_figma` call on a **FigJam** file → load `figma:figma-use-figjam` skill
> - The actual MCP tool name is `mcp__plugin_figma_figma__use_figma` for both

### Which Commands Use FigJam vs Figma

| Phase | Tool | What gets created |
|-------|------|------------------|
| `/ux-kickoff` | **FigJam** | `00_Kickoff` board — stakeholder map, RACI, risk notes |
| `/ux-discover` | **FigJam** | `01_Discovery` board — assumption stickies, competitor cards, risk register |
| `/ux-empathize` | **FigJam** | `02_Empathy` board — empathy map 2×2, task flow diagram, mental models, storyboard |
| `/ux-research` | **FigJam** | `03_Research` board — research plan, screener criteria, question bank |
| `/ux-synthesize` | **FigJam** | `04_Synthesis` board — affinity cluster stickies, journey map, persona cards |
| `/ux-frame` | **FigJam** | `05_Framing` board — HMW voting stickies, POV statements, design principles |
| `/ux-ideate` | **FigJam** | `06_Ideation` board — concept sketches, evaluation matrix |
| `/ux-sitemap` | **FigJam** | `07_Sitemap` board — IA diagram with connectors, URL hierarchy |
| `/ux-sprint` | **FigJam** | `08_Sprint` board — Day 1–5 sprint boards, storyboard, rainbow spreadsheet |
| `/ux-test` | **FigJam** | `09_Testing` board — test plan, task scenarios |
| `/ux-test-results` | **FigJam** | `09_Testing` board — rainbow spreadsheet, findings by severity |
| `/ux-brief` | **Figma** | `05_UX_Documentation` page — design brief summary frame |
| `/ux-inspire` | **Figma** | `05_UX_Documentation` page — mood board, colour palette frame |
| `/ux-wireframe` | **Figma** | `01_LoFi_Wireframes` page — all lo-fi frames |
| `/ux-prototype` | **Figma** | `02_Prototype_Flows` page — interaction flow frames |
| `/ux-design-system` | **Figma** | `00_Design_System` — 5 Variable collections + 21 SDS components |
| `/ux-hifi` | **Figma** | `03_HiFi_Designs` page — hi-fi frames with token colours |
| `/ux-handoff` | **Figma** | `04_Handoff_Specs` page — annotated handoff frames |
| `/ux-accessibility` | **Figma** | `05_UX_Documentation` — WCAG audit frame |
| `/ux-changelog` | **Figma** | `05_UX_Documentation` — changelog frame |
| `/ux-measure` | **Figma** | `05_UX_Documentation` — measurement plan frame |
| `/ux-report` | **Figma** | `05_UX_Documentation` — executive summary frame |
| `/ux-to-code` | **Figma** (read) | Reads `00_Design_System` → generates component library |
| `/ux-to-pages` | **Figma** (read) | Reads `03_HiFi_Designs` → generates page components |

### Prerequisites

- `PROJECT_BRIEF.md` must have a `Figma File URL` for design phases
- `PROJECT_BRIEF.md` must have a `FigJam File URL` for discovery/research phases
- Both URLs are set once — all commands read from the brief automatically
- A valid Figma account must be connected via the Figma MCP plugin

See `figma/FIGMA-MCP-SETUP.md` for setup, tool reference, and troubleshooting.

## Framework Choice
When running `/ux-to-code` or `/ux-to-pages`, Claude will ask:
> "React (TypeScript) or Angular (TypeScript)?"

Output goes to `outputs/frontend/react/` or `outputs/frontend/angular/` accordingly.
