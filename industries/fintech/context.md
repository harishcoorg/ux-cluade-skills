# Industry Context: Fintech

## Domain Characteristics
- High-stakes decisions (money, savings, credit)
- Trust and credibility are the #1 UX currency
- Regulatory compliance affects what you can and cannot show
- Users range from financially savvy to financially anxious

## Key User Mental Models
- Money = security and control. Loss of control = high anxiety
- Users compare every flow to their bank app (baseline expectation)
- Notifications about money are high-attention but high-risk (false positives erode trust)
- Onboarding friction is expected (KYC) — the problem is when it feels pointless
- "Where is my money?" is always question #1 in any negative moment

## Common UX Anti-Patterns (avoid)
- Hiding fees or terms in fine print — causes abandonment and regulatory risk
- Forcing account linking before showing value
- Overusing dark patterns for upsell (subscription traps)
- Error messages that don't explain what to do next
- Inconsistent number formatting (commas, decimals, currency symbols)

## High-Value UX Patterns (apply when relevant)
- Progressive disclosure for complex financial information
- Confidence indicators (verification badges, last-updated timestamps)
- Clear empty states with onboarding prompts
- Undo / cancel for high-stakes actions (transfers, payments)
- Biometric auth as default (reduces friction, increases trust)
- Spending categorization with user correction capability

## Regulatory Considerations to Flag
- KYC/AML requirements affect onboarding flows
- GDPR / CCPA: data consent must be explicit and revocable
- PCI-DSS: card data must never be stored in plain text
- RBI / SEBI / FCA guidelines depending on geography

> Research Needed: Confirm applicable regulations for the specific geography and product type.

## Key Metrics for Fintech UX
- Onboarding completion rate
- Time to first meaningful action (first transaction, first investment)
- Feature adoption rate (e.g., auto-save, bill split)
- Support ticket volume (indicator of confusion)
- Trust score / NPS by user segment

## Competitive Reference Points
- Robinhood: Simplified investing, gamification risk
- Monzo/Revolut: Transparency and control patterns
- Stripe: B2B developer-first UX
- Zerodha Kite: Power-user financial UI patterns (India)
- PhonePe / GPay: Mass-market payment UX (India)
