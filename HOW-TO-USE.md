# How to Use — UX Automation Starter Kit

Step-by-step guide for running the full pipeline with Claude Code.

---

## Before you start

### 1. Copy this folder for your project
Never work inside the starter kit itself. Copy it fresh for every project:
```bash
cp -r ux-starter-kit/ my-project-name/
cd my-project-name/
claude .
```

### 2. Prerequisites
- **Claude Code** installed (`claude` CLI)
- **Figma account** — Professional or Org plan (needed for Figma Variables API)
- **figma-console MCP** configured — see `figma/FIGMA-MCP-SETUP.md`
- **Node.js v18+** — only needed for Figma push scripts

---

## Step 1 — Project intake (always start here)

### Drop client documents into `client-inputs/`
Accepted: PDF, Word (.docx), Excel (.xlsx/.csv), PowerPoint (.pptx), text, Markdown, images.

Optional naming prefixes that help Claude prioritise correctly:
- `req_` — requirements / functional spec
- `research_` — existing user research
- `brand_` — brand guidelines
- `data_` — analytics, survey results
- `ref_` — competitor info, reference apps
- `notes_` — meeting notes, email threads

### Run `/ux-prd`
```
/ux-prd
```
Claude will:
1. Read every file in `client-inputs/`
2. Present a structured requirements summary (confirm or correct before anything is saved)
3. List every gap and unclear requirement as prioritised stakeholder questions
4. Pre-fill `PROJECT_BRIEF.md` with confirmed values

After your stakeholder meeting, answer the questions in chat:
```
Q1: [your answer]
Q2: [your answer]
...
Update PRD
```

### If you have an existing design system
Before running `/ux-prd`, place DS files in `existing-ds/` and set in `PROJECT_BRIEF.md`:
```
Has Existing Design System: Yes
DS Location: existing-ds/tokens.css
```
Claude will detect this and use your DS colours throughout inspire, design system, and hi-fi phases.

---

## Step 2 — Kickoff

```
/ux-kickoff
```
Generates: stakeholder map, RACI matrix (named owner for every approval gate), 90-minute kickoff meeting agenda, pre-flight risk check.

---

## Step 3 — Discovery & Research

Run these in order. Each builds on the previous.

```
/ux-discover        → Assumption map, competitive analysis, heuristic eval, risk register
/ux-empathize       → Empathy maps, task flows, service blueprint, storyboards
/ux-research        → Research plan, participant screener, interview guide, survey
```

After running `/ux-research`, recruit participants and run your interviews. Then:

```
/ux-synthesize      → Paste raw notes → personas, journey maps, insight statements
/ux-frame           → POV statements, HMW questions, design principles
/ux-ideate          → Generate + evaluate concepts → recommended direction
```

**To skip user interviews** (e.g. you have existing research):
```
/ux-skip ux-research  We have existing research from a previous engagement
```
Note in chat what research you have — Claude will use it in synthesis.

---

## Step 4 — IA & Content

```
/ux-sitemap         → Navigation structure, site map, URL scheme
/ux-content         → Voice & tone, all screen copy, error/empty states, onboarding
```
Run sitemap before wireframing. Content can run after wireframes are approved.

---

## Step 5 — Visual Direction (before design system)

### Add inspiration references
Drop images into `inspiration/screenshots/` with prefix naming:

| Prefix | Claude uses it for |
|--------|-------------------|
| `color_` | **Primary colour source** — hex values extracted from this image override everything else |
| `layout_` | Grid, density, whitespace, section structure |
| `type_` | Font style, weight contrast, hierarchy |
| `component_` | Button, card, input styling |
| `mood_` | Overall aesthetic feeling |
| `avoid_` | What NOT to replicate |

Add website URLs to `inspiration/links.md`. Write direction in `inspiration/mood-board.md`.

```
/ux-inspire
```

**If existing DS is declared:** DS colours are the primary palette. Screenshots inform layout and mood only.

**Output:** `outputs/inspiration/visual-direction.md` — feeds automatically into `/ux-design-system` and `/ux-hifi`.

---

## Step 6 — Design

```
/ux-brief           → Compile research into design brief with screen inventory
/ux-wireframe       → Lo-fi wireframe specs + Figma JSON
/ux-prototype       → Interaction spec + prototype flows
```

**Approval gate:** Get stakeholder sign-off on the prototype before proceeding to the design system.

### Test Round 1 (after lo-fi prototype)
```
/ux-test            → Test plan, task scenarios, moderation guide
[Run usability sessions — human facilitator required]
/ux-test-results    → Session notes → findings → fix brief
/ux-changelog       → Log what changed and why (post-fix)
```

```
/ux-design-system   → Generate (or import) design system → push to Figma Variables
/ux-hifi            → Hi-fi screen specs, annotations, responsive breakpoints
```

**Design QA before handoff:**
```
/ux-design-qa       → Token compliance, component audit, state coverage, accessibility pre-check
```
Must show no P0 issues before proceeding. Re-run after fixes.

### Test Round 2 (after hi-fi)
```
/ux-test            → Updated test plan for hi-fi
[Run usability sessions — human facilitator required]
/ux-test-results    → Findings → approval
/ux-changelog       → Log changes
```

---

## Step 7 — Handoff & Code

```
/ux-handoff         → Build notes, component reference, assets checklist, interaction spec, QA criteria
/ux-to-code         → Read Figma design system → React/Angular component library + Figma Code Connect
/ux-to-pages        → Read Figma hi-fi screens → page components + routing
```

**Publish Figma Code Connect** (after `/ux-to-code`):
```bash
export FIGMA_ACCESS_TOKEN=your_token
bash outputs/frontend/code-connect-publish.sh
```
Developers then see live React/Angular code snippets in Figma Dev Mode.

---

## Step 8 — Accessibility & Launch

```
/ux-accessibility   → WCAG 2.1 AA audit, contrast check, screen reader plan, remediation
```
Fix all P0 violations before launch.

---

## Step 9 — Post-launch

```
/ux-measure         → Goal-metric mapping, instrumentation checklist, review schedule
```
Defines which analytics events to instrument, what surveys to set up, and when to review results.

---

## Utility commands (use any time)

```
/ux-status          → Progress dashboard: what's done, what's next, gate status
/ux-report          → Stakeholder executive summary of all completed phases
/ux-skip [name] [reason]  → Skip any phase, log assumptions for downstream phases
/ux-changelog       → Log design decisions + evidence at any point
```

---

## Design system — import vs generate

`/ux-design-system` detects the mode automatically:

| Condition | Mode | What happens |
|-----------|------|-------------|
| `Has Existing Design System: Yes` + files in `existing-ds/` | **Import** | Maps existing tokens to SDS structure, generates only missing components |
| `Has Existing Design System: No` or `existing-ds/` empty | **Generate** | Full SDS system generated from `/ux-inspire` output (or industry defaults) |

---

## Skipping phases

Any phase can be skipped. Use `/ux-skip`:
```
/ux-skip ux-research   No new research needed — using prior study from Q1
/ux-skip ux-test       No usability testing budget in this sprint
/ux-skip ux-inspire    Using existing brand guidelines (files in existing-ds/)
```

**Note:** `/ux-design-system` cannot be skipped unless an existing DS is declared in `PROJECT_BRIEF.md`.

High-impact skips (test rounds, synthesis) will ask for confirmation and log the downstream assumptions.

---

## Tips

- Run `/ux-status` at any point for a progress dashboard
- Paste raw interview quotes into `/ux-synthesize` — not summaries
- Add your Figma file URL to `PROJECT_BRIEF.md` before running wireframe or design system commands
- Claude reads `PROJECT_BRIEF.md` at the start of every command — keep it updated
- The session log at the bottom of `PROJECT_BRIEF.md` is your project memory across sessions
