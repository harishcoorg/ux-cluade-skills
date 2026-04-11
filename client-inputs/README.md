# client-inputs/

Drop all client-provided documents here before running `/ux-prd`.

Claude will scan every file in this folder, extract requirements, identify gaps, and generate stakeholder questions automatically.

---

## 🎯 Objective

Claude should:

1. Extract and summarize requirements
2. Identify gaps, ambiguities, and missing details
3. Highlight assumptions (explicit + implicit)
4. Generate structured stakeholder questions
5. Prepare inputs for UX, product, and design decisions

---

## 📂 Supported file types

| Type | Examples | Notes |
|------|----------|-------|
| PDF | Requirements doc, RFP, research report, brand guidelines | Best format — read in full |
| Word (.docx) | Functional spec, user stories, meeting notes | Read as text |
| Excel (.xlsx / .csv) | User data, feature matrix, survey results | CSV preferred; Excel read as structured data |
| PowerPoint (.pptx) | Client pitch deck, existing product overview | Slide text extracted |
| Text / Markdown (.txt / .md) | Notes, emails, raw requirements | Full read |
| Images (.png / .jpg / .webp) | UI screenshots, wireframes, brand reference | Visual + contextual analysis |

---

## 🧠 File prioritization logic

1. req_ → Core requirements (highest priority)
2. research_ → User insights
3. data_ → Behavioral validation
4. notes_ → Contextual discussions
5. brand_ → UI/visual direction
6. ref_ → Competitive/reference inputs
7. other_ → Supporting information

If conflicts arise:
→ Prefer req_ unless contradicted by validated data_ or research_.

---

## 🔍 Extraction framework

### 1. Product Understanding
- Product purpose
- Core features
- Target users / personas
- Platforms (web, mobile, etc.)

### 2. User Experience Inputs
- User journeys / flows
- Pain points
- Key tasks
- Accessibility considerations

### 3. Business Context
- Goals / KPIs
- Monetization
- Success metrics

### 4. Technical Constraints
- Integrations
- Platforms / devices
- Performance/security constraints

---

## ⚠️ Gap detection checklist

- Target users not defined
- Core flows incomplete
- Edge cases missing
- Error states not defined
- Permissions unclear
- Data inputs/outputs undefined
- Success metrics missing
- Dependencies not mentioned

---

## 🧩 Output format (MANDATORY)

### 1. Executive Summary
### 2. Feature Breakdown
### 3. User Flows
### 4. Gaps & Risks
### 5. Assumptions
### 6. Stakeholder Questions
### 7. File-wise Summary

---

## 🧠 Smart behaviors

- Merge duplicate info
- Highlight contradictions
- Prefer clarity over verbosity
- Flag unreadable files
- Do not assume silently

---

## 💡 Tips

- More files = better synthesis
- Convert scanned PDFs if needed
- Paste content directly if required
- Outputs saved to outputs/prd-intake/
