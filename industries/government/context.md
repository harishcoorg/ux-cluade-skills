# Industry Context — Government & Public Sector

Auto-loaded when `PROJECT_BRIEF.md` sets `industry: government` or `industry: public-sector`.

---

## Domain Characteristics
- Users range from frontline staff to senior officials to members of the public
- Trust, transparency, and accountability are non-negotiable
- Legacy systems and integrations are almost always a constraint
- Procurement cycles are long — design for longevity, not trends
- Accessibility is a legal requirement (not a nice-to-have)

---

## UX Heuristics — Government Context

### 1. Plain language above all
Government services are used by the full public — including people with low literacy, learning disabilities, or limited English. Every word on screen must earn its place.
- Use the GOV.UK style guide as a baseline: active voice, short sentences, common words
- Replace jargon with the word a 10-year-old would use
- Test comprehension, not just usability

### 2. Inclusive by default
Design for the full population:
- WCAG 2.1 AA is the legal minimum — aim for AAA on critical journeys
- Support screen readers, keyboard navigation, high-contrast mode, and text resize
- Design for varying digital literacy — don't assume smartphone fluency
- Consider access via older hardware and slower connections

### 3. One thing per page
Complex multi-step processes (applications, forms, registrations) work better when broken into single-question pages:
- Reduces cognitive load
- Easier to save progress and return later
- Error recovery is simpler
- Easier for screen readers to navigate

### 4. Show the process
Government processes are often long and opaque. Users need to know:
- How long will this take?
- What information will I need?
- What happens after I submit?
- How will I know if it worked?
Always show a clear progress indicator and confirmation state.

### 5. Design for failure and abandonment
- Users may need to pause and return (save progress)
- Network may be unreliable — design for partial saves
- Forms must recover gracefully from timeout
- Error messages must tell the user exactly what to fix and how

### 6. Neutral, authoritative tone
Not warm and casual — clear, direct, respectful. Government speaks for the state.
- Avoid exclamation marks, informal contractions, first-person brand voice
- Use "you" to address the user directly
- Never use passive voice for instructions ("You must provide" not "Documentation is required")

---

## User Mental Models

**Public users (citizens):**
- Distrust digital government by default — anxiety about making mistakes
- Fear of consequences: "If I get this wrong, will I be penalised?"
- Low patience — "Just tell me what to do"
- Often come from Google, not directly to the service

**Internal users (civil servants / staff):**
- Trained on legacy systems — resistant to change
- Time pressure: must process high volumes efficiently
- Accountability mindset — "I need an audit trail"
- Power user patterns: keyboard shortcuts, bulk operations

---

## Common Pain Points to Design Against
- Long, confusing forms with no progress saving
- Error messages that don't explain what went wrong or how to fix it
- Processes that require the user to gather information before starting (no checklist up front)
- Jargon from legislation that users don't understand
- Inconsistent terminology across related services
- No confirmation of receipt — "Did it work?"

---

## Regulatory & Compliance Considerations
- **WCAG 2.1 AA** — legally required in most jurisdictions (UK, EU, US Section 508)
- **GDPR / Privacy by design** — minimal data collection, clear purpose, explicit consent
- **Government design standards** — many governments have design systems: GOV.UK Design System, US Web Design System (USWDS), Australian Government Design System
- **Data residency** — government data often cannot be stored outside the jurisdiction
- **Audit trails** — actions by civil servants on citizen data must be logged
- **Freedom of Information** — design decisions and research outputs may be subject to FOI requests

---

## Anti-Patterns (avoid these)
- Dark patterns — government services must never manipulate or deceive users
- Making the digital service harder than the offline alternative
- Requiring account creation to access public information
- Burying help and support behind multiple clicks
- Designing only for the "happy path" — edge cases and errors are the most important scenarios
- Inconsistent design between related services in the same department

---

## High-Value UX Patterns for Government
- **Start pages** — clear eligibility checker before the user begins a long process
- **Check your answers** — review screen before final submission
- **Reference numbers** — always give users a confirmation number they can quote
- **What happens next** — post-submission timeline screen
- **Save and return** — essential for long forms
- **Offline fallbacks** — downloadable PDF alternative for users who cannot complete online
- **Multiple contact channels** — phone, email, post for users who get stuck

---

## Key Metrics for Government UX
- Task completion rate (primary metric)
- Error rate on forms
- Contact volume after task (high contact = poor UX)
- Assisted digital rate (users who need help)
- Accessibility compliance score
- Drop-off point in multi-step flows
