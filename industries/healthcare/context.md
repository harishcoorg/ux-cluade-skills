# Industry Context: Healthcare

## Domain Characteristics
- Emotional stakes are the highest of any domain (health, life, family)
- Two user modes: proactive wellness vs. reactive crisis
- Significant variability in digital literacy and health literacy
- Privacy is non-negotiable — any doubt destroys trust

## Key User Mental Models
- Patients distrust anything that feels like it's replacing their doctor
- "Is this safe?" is asked before "Is this easy?"
- Health information causes anxiety when not contextualized
- Caregivers are often the primary users, not patients
- Time pressure is extreme in clinical contexts

## Common UX Anti-Patterns (avoid)
- Medical jargon without plain-language explanations
- Overwhelming dashboards with every possible metric
- Requiring account creation before showing any utility
- Notification fatigue (especially for chronic condition apps)
- Generic error messages ("Something went wrong") in health-critical flows
- Inaccessible design (small text, low contrast, no screen reader support)

## High-Value UX Patterns
- Plain language first, clinical detail on demand
- Progress indicators for long clinical intake flows
- "Ask your doctor" CTA as a safe exit for medical uncertainty
- Symptom checkers with transparent logic ("why am I seeing this")
- Medication reminders with smart snooze (not just dismiss)
- Accessibility-first design: WCAG 2.1 AA minimum

## Regulatory Considerations to Flag
- HIPAA (US): PHI must be encrypted, audit logs required
- GDPR Article 9 (EU): Health data is "special category"
- FDA guidelines for digital health devices and SaMD
- NHS Digital Standards (UK)
- Clinical decision support: cannot replace clinical judgment

> Research Needed: Confirm if product is a wellness app, SaMD, or clinical tool — regulatory burden differs greatly.

## Key Metrics for Healthcare UX
- Appointment adherence / no-show rate
- Medication adherence rate
- Task completion in intake flows
- Time to find information (search/navigation)
- Accessibility audit score
- Patient satisfaction (CAHPS equivalent)

## Competitive Reference Points
- Epic MyChart: Enterprise clinical portal (complex, but ubiquitous)
- Headspace / Calm: Wellness engagement patterns
- Ada Health: AI symptom checker with trust-building UX
- Practo / Apollo 247: Telehealth UX patterns (India)
- Zocdoc: Appointment booking friction reduction
