# Industry Context — Education & EdTech

Auto-loaded when `PROJECT_BRIEF.md` sets `industry: education` or `industry: edtech`.

---

## Domain Characteristics
- Multiple distinct user groups with opposing needs: learners, educators, administrators, parents
- Engagement and motivation are core design challenges — not just usability
- Context shifts: classroom, home, on commute, exam conditions
- Accessibility spans age ranges (children to adults) and ability levels
- Institutional procurement means the buyer (school/university) ≠ the user (student/teacher)

---

## UX Heuristics — Education Context

### 1. Design for motivation, not just efficiency
In most products, speed is the goal. In education, the journey matters:
- Make progress visible and rewarding — streaks, progress bars, milestones
- But avoid shallow gamification that rewards activity over learning (badges for badge's sake)
- Reduce anxiety around wrong answers — normalise mistakes as part of learning
- Design confidence-building pathways: scaffold complexity, don't front-load difficulty

### 2. Respect the learning flow
Cognitive load theory applies directly:
- Introduce one new concept at a time
- Remove all non-essential UI when a user is in a learning moment (focus mode)
- Don't interrupt a learner mid-task with notifications or promotions
- Chunk content: short lessons > long lectures

### 3. Design for multiple roles with very different goals
| Role | Primary goal | Key frustration |
|------|-------------|----------------|
| Student / learner | Complete tasks, understand concepts | Confusion, boredom, anxiety |
| Teacher / instructor | Deliver, assess, track progress | Admin overhead, lack of insight |
| Parent | Monitor child's progress | Opacity, too many logins |
| Administrator | Manage at scale | Complexity, reporting burden |

Never design a single interface for all roles — they need different entry points and views.

### 4. Accessibility across age and ability
- **Children (under 13):** Larger touch targets (48px min), simpler language, limited text, high contrast
- **Adults returning to education:** May have lower digital literacy — avoid assumed knowledge
- **Students with disabilities:** SEN/IEP requirements demand excellent screen reader support, dyslexia-friendly fonts, adjustable text size
- **COPPA compliance (US):** Under-13 users — strict data privacy requirements

### 5. Offline and low-bandwidth resilience
Students work in libraries, at home with poor broadband, in rural areas:
- Offline mode for core learning tasks
- Graceful degradation — content accessible without rich media
- Progress saves locally and syncs when reconnected

### 6. Assessment and feedback UX
- Instant feedback on answers reduces anxiety and aids learning
- Show not just correct/incorrect — show why
- Never use red for wrong if it can be avoided — use neutral indicators
- Progress must be visible, honest, and motivating — not punishing

---

## User Mental Models

**Students / Learners:**
- "Learning = effort + boredom" — the product must reframe this
- Short attention spans in digital contexts (Netflix-brain effect)
- Fear of being wrong / looking stupid in front of peers
- Expect consumer-app quality (Instagram, TikTok) — institutional tools feel jarring

**Teachers / Instructors:**
- "I know my subject — I shouldn't have to learn complex software"
- Want less admin, more time with students
- Need to see the whole class at once, not just one student
- Sceptical of new tools — they've seen many come and go

**Administrators:**
- Data and reporting are primary concerns
- Need to manage at scale — bulk actions, exports, integrations with SIS
- Compliance with local curriculum and assessment standards

---

## Common Pain Points to Design Against
- Switching between too many tools (LMS + video + assessment + communication)
- Course creation that's so complex only IT-trained teachers can do it
- Assessment feedback that comes too late or is too generic
- Progress metrics that show activity but not learning
- Onboarding that drops students into a blank, empty environment
- No clear "what do I do next?" signal for learners

---

## Regulatory & Compliance Considerations
- **COPPA (US)** — strict rules for under-13 users: parental consent, no behavioural advertising
- **FERPA (US)** — student educational records privacy
- **GDPR (EU)** — applies to student data even under 16
- **WCAG 2.1 AA** — typically required for institutional procurement
- **SCORM / xAPI** — interoperability standards for learning content if integrating with LMS
- **Local curriculum standards** — UK: National Curriculum / Ofqual; US: Common Core; India: NCERT; etc.

---

## Anti-Patterns (avoid these)
- Gamification that rewards time-on-platform over actual learning outcomes
- Hiding progress behind paywalls (especially in freemium models for students)
- Requiring school email to sign up — many students don't have one
- Heavy video as the only learning format — not accessible, not bandwidth-friendly
- Leaderboards that rank students against each other — demotivating for lower performers
- Grade display that prioritises the number over the feedback
- Dark patterns in parent notification settings (defaulting to maximum email)

---

## High-Value UX Patterns for EdTech
- **Learning path visualisation** — show where learner is and where they're going
- **Spaced repetition UI** — surface content at optimal review intervals
- **Social learning signals** — "3 of your classmates found this difficult too" (reduces shame)
- **Teacher dashboard** — at-a-glance class progress, who needs attention
- **Assignment builder** — drag-and-drop, template-based for non-technical teachers
- **Offline-first lesson player** — download for later, sync progress on reconnect
- **Accessibility mode toggle** — dyslexia font, high contrast, text-to-speech
- **Parent summary digest** — weekly email, not real-time notification flood

---

## Key Metrics for EdTech UX
- Learning outcome completion rate (not just content views)
- Return rate / habit formation (did they come back?)
- Time-to-first-success (first lesson completed, first assignment submitted)
- Teacher adoption rate (created at least 1 lesson/assignment)
- Support ticket volume (high = UX failure)
- Assessment completion vs. abandonment rate
- Student satisfaction / NPS
