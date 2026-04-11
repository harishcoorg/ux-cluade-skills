# UX Automation Starter Kit — Claude Code

A complete UX pipeline powered by Claude Code. Drop this folder into any project, fill in your brief, and run slash commands to generate every UX deliverable from discovery through to production-ready frontend code.

---

## What this does

28 slash commands cover the entire UX process:

```
Client docs → PRD intake → Kickoff → Discovery → Empathize → Research
  → Synthesis → Framing → Ideation → IA → Content → Visual Direction
  → Wireframes → Prototype → Design System → Hi-Fi → Design QA
  → Handoff → Frontend Code → Accessibility → Post-launch Measurement
```

Every command saves its output as Markdown files in `outputs/`. Designs push directly to Figma via MCP. Frontend components are generated with TypeScript, CSS Modules, unit tests, and Figma Code Connect.

---

## Prerequisites

| Requirement | Where to get it |
|-------------|----------------|
| Claude Code | [claude.ai/code](https://claude.ai/code) |
| Figma account | Professional or Org plan (for Figma Variables API) |
| figma-console MCP | [southleft/figma-console-mcp](https://github.com/southleft/figma-console-mcp) — see `figma/FIGMA-MCP-SETUP.md` |
| Node.js v18+ | For Figma push scripts (optional) |

---

## Quick start

```bash
# 1. Copy this folder for your project (never work in the original)
cp -r ux-starter-kit/ my-project-name/
cd my-project-name/

# 2. Open with Claude Code
claude .

# 3. Drop client documents into client-inputs/ (PDFs, Word, Excel, etc.)

# 4. Run the first command
/ux-prd
```

Claude will read your client documents, summarise the requirements, and list every question that needs answering before design work begins.

---

## Starting points

**You have client documents (PDFs, Word docs, etc.)**
→ Drop them in `client-inputs/` → run `/ux-prd`

**You have an existing design system**
→ Drop DS files in `existing-ds/` → set `Has Existing Design System: Yes` in `PROJECT_BRIEF.md` → run `/ux-prd`

**You want to skip a phase**
→ `/ux-skip [phase-name] [reason]`

**You want to check where you are**
→ `/ux-status`

---

## All 28 commands

### Setup
| Command | What it does |
|---------|-------------|
| `/ux-prd` | Read client docs in `client-inputs/` → summarise requirements → list gaps → generate stakeholder questions → pre-fill `PROJECT_BRIEF.md` |
| `/ux-kickoff` | Stakeholder map, RACI matrix, kickoff meeting agenda, pre-flight risk check |
| `/ux-skip` | Skip any phase: `/ux-skip [phase-name] [reason]`. Logs skip + downstream assumptions. |

### Research & Strategy
| Command | What it does |
|---------|-------------|
| `/ux-discover` | Assumption map, competitive analysis, heuristic evaluation, risk register |
| `/ux-empathize` | Empathy maps, task flows, mental models, service blueprint, storyboards |
| `/ux-research` | Research plan, screener, interview guide, survey |
| `/ux-synthesize` | Paste notes → affinity map, personas, journey maps, insight statements |
| `/ux-frame` | POV statements, HMW questions, design principles, problem statement |
| `/ux-ideate` | Concept generation, evaluation matrix, recommended direction |

### IA & Content
| Command | What it does |
|---------|-------------|
| `/ux-sitemap` | Navigation structure, site map, URL scheme, IA decision log |
| `/ux-content` | Voice & tone guide, all screen copy, error/empty/loading states, onboarding copy |

### Design
| Command | What it does |
|---------|-------------|
| `/ux-brief` | Compile all research into design brief with screen inventory |
| `/ux-inspire` | Analyse screenshots + URLs + mood board → Visual Direction Brief + colour palette |
| `/ux-wireframe` | Lo-fi wireframe specs, component inventory, Figma JSON |
| `/ux-prototype` | Interaction spec, prototype flows, micro-interactions |
| `/ux-design-system` | **Import existing DS** (if `existing-ds/` has files) or **generate from scratch** → SDS tokens + 21 components → push to Figma Variables |
| `/ux-hifi` | Hi-fi screen specs, annotations, responsive breakpoints, QA checklist |

### Quality & Testing
| Command | What it does |
|---------|-------------|
| `/ux-test` | Usability test plan, task scenarios, moderation guide, session notes template |
| `/ux-test-results` | Session notes → rainbow spreadsheet → findings → design fix brief |
| `/ux-design-qa` | Token compliance, component audit, state coverage, accessibility pre-check — must pass before handoff |
| `/ux-changelog` | Log what changed, why, and what evidence drove each decision |
| `/ux-accessibility` | WCAG 2.1 AA audit, remediation plan |

### Handoff & Code
| Command | What it does |
|---------|-------------|
| `/ux-handoff` | Developer handoff — build notes, component reference, asset checklist, interaction spec, QA acceptance criteria |
| `/ux-to-code` | Read Figma design system → generate React/Angular component library + Figma Code Connect |
| `/ux-to-pages` | Read Figma hi-fi screens → generate all page components + routing |

### Measurement & Reporting
| Command | What it does |
|---------|-------------|
| `/ux-measure` | Goal-metric mapping, hypothesis validation plan, instrumentation checklist, review schedule |
| `/ux-report` | Stakeholder-ready executive summary of all completed phases |
| `/ux-status` | Dashboard: phase completion status, approval gates, next step |

---

## Folder structure

```
ux-starter-kit/
│
├── PROJECT_BRIEF.md          ← Fill this in first ⭐
├── CLAUDE.md                 ← Claude's instructions (do not edit)
├── HOW-TO-USE.md             ← Detailed guide with tips per command
├── README.md                 ← This file
│
├── client-inputs/            ← Drop client docs here (PDF, Word, Excel, etc.) ⭐
│   └── README.md             ← Supported file types + naming convention
│
├── existing-ds/              ← Drop existing DS files here (CSS, JSON, Figma export) ⭐
│   └── README.md             ← What to put here + what it affects
│
├── inspiration/              ← Visual references for /ux-inspire
│   ├── screenshots/          ← Drop images here (prefix: color_, layout_, type_)
│   ├── links.md              ← Website + Behance + Dribbble URLs
│   └── mood-board.md         ← Written visual direction
│
├── .claude/
│   └── commands/             ← All 28 slash commands
│
├── industries/               ← Domain context (auto-loaded by Claude)
│   ├── fintech/context.md
│   ├── healthcare/context.md
│   ├── ecommerce/context.md
│   ├── enterprise-saas/context.md
│   ├── consumer-app/context.md
│   ├── government/context.md
│   └── education/context.md
│
├── outputs/                  ← All generated files saved here (auto-created)
│   ├── prd-intake/           ← Requirements synthesis + stakeholder questions
│   ├── kickoff/              ← Stakeholder map, RACI, meeting agenda
│   ├── discovery/
│   ├── empathy-maps/
│   ├── personas/
│   ├── journey-maps/
│   ├── research-reports/
│   ├── design-briefs/
│   ├── inspiration/
│   ├── wireframes/
│   ├── design-system/
│   │   ├── tokens/           ← JSON + CSS token files
│   │   └── components/       ← Component specs
│   ├── design-qa/
│   ├── hifi-specs/
│   ├── handoff/
│   ├── changelogs/
│   ├── measurement/
│   └── frontend/
│       ├── react/
│       └── angular/
│
└── figma/
    ├── FIGMA-MCP-SETUP.md
    └── scripts/
```

---

## The pipeline at a glance

```
[PRD Review] → [Kickoff]
    ↓
Discovery → Empathize → Research → [USER INTERVIEWS] → Synthesis → Framing → Ideation
    ↓
Sitemap → Content
    ↓
Brief → Inspire → Wireframe → Prototype
    ↓
[TEST ROUND 1] → Changelog → fix
    ↓
Design System → Hi-Fi → [Design QA]
    ↓
[TEST ROUND 2] → Changelog → approve
    ↓
Handoff → Frontend Components → Pages
    ↓
[ACCESSIBILITY AUDIT] → fix → launch
    ↓
[Measurement Plan]
```

**Human gates** — Claude never passes these automatically:
- User interviews (Gate 2) — must be run by a human facilitator
- Usability testing sessions (Gates 5 + 7) — must be run by a human facilitator
- Every approval gate — requires explicit designer sign-off

---

## How phases interact with an existing design system

If you declare `Has Existing Design System: Yes` in `PROJECT_BRIEF.md` and place files in `existing-ds/`:

| Phase | Behaviour |
|-------|----------|
| `/ux-inspire` | Uses DS colours as primary palette. Screenshots inform layout and mood only — never override DS hex values. |
| `/ux-design-system` | Runs in **Import Mode**: maps existing tokens to SDS structure, generates only what is missing. No scratch build. |
| `/ux-hifi` | Applies imported DS tokens throughout. |
| `/ux-to-code` | Imports from existing component library. Generates wrappers for SDS gaps only. |

---

## Tips

- **More detail in `PROJECT_BRIEF.md` = better outputs.** Claude reads it at the start of every command.
- **Paste raw research notes into `/ux-synthesize`** — actual quotes and observations, not your summaries.
- **Use `/ux-skip [phase] [reason]`** to skip phases you don't need. The skip is logged and downstream phases adapt.
- **Run `/ux-status`** at any point to see a full progress dashboard.
- **Copy this folder fresh for every project** — never work in the original starter kit.
>>>>>>> 5003f02 (first commit)
# cluade-ux-skills
