# Screenshots Folder

Drop any image files here before running `/ux-inspire`.

This README is the **primary instruction file** and is always processed before any images.  
Use it to tell Claude exactly what to extract from each file.

---

## Supported formats
PNG, JPG, JPEG, WebP, GIF (static)

---

## 🧠 Extraction Priority Rules (Critical)

1. `color_` files → ALWAYS override all other colour inputs  
2. `layout_` files → define spacing, grid, and structure  
3. `type_` files → define typography system  
4. `component_` files → define UI patterns  
5. `mood_` files → influence tone only (never override above)  
6. `avoid_` files → act as strict constraints (must not be violated)

---

## ⚠️ Conflict Resolution

If multiple files of the same prefix conflict:
- Prefer the most recently added file  
- If unclear, prioritise the file marked as **PRIMARY** in the intent table  

---

## Filename Prefix Convention (Required)

Prefix every screenshot with its intent. This controls what Claude prioritises extracting:

| Prefix | Example filename | What Claude extracts first | Weight in brief |
|--------|-----------------|---------------------------|-----------------|
| `color_` | `color_palette-fintech.png` | **All hex values** — this IS the colour palette seed | Colour section driven by this file |
| `layout_` | `layout_dashboard-monzo.png` | Grid, density, whitespace, section structure | Layout/spacing section driven by this |
| `type_` | `type_inter-specimen.png` | Font style, weight contrast, size hierarchy | Typography section driven by this |
| `component_` | `component_card-styles.png` | Button, card, input, nav styling details | Component style section driven by this |
| `mood_` | `mood_calm-finance.png` | Overall aesthetic feeling, vibe | Brand personality confirmation |
| `avoid_` | `avoid_too-complex.png` | What NOT to replicate | Negative constraints only |

---

## Naming Examples

✅ Good:
- `color_fintech-dark.png`  
- `layout_travel-homepage.png`  
- `component_cards-modern.png`  

❌ Bad:
- `image1.png`  
- `final-design.png`  
- `screenshot.png`  

---

## ⚠️ Mandatory Step: Intent Annotation Table

Every file **MUST** have a corresponding row in the table below.  
Files without annotation may be ignored or misinterpreted.

---

## Intent Annotation Table (Add a row for every file)

| File | Intent | What to extract | What NOT to take from it |
|------|--------|----------------|--------------------------|
| `color_theme-reference.webp` | **PRIMARY COLOUR SOURCE** | Exact hex palette — brand, background, accent, text colours | Layout or typography patterns |
| `layout_dashboard-reference.webp` | **LAYOUT STRUCTURE** | Grid density, card arrangement, whitespace rhythm, section flow | Colours — ignore them, use color_ file for palette |

> Replace the example rows above with your actual files.

---

## How to add a screenshot effectively

### 🎨 For colour references
1. Name it `color_[description].png`  
2. Add a row: **PRIMARY COLOUR SOURCE — extract all hex values**  
3. In `mood-board.md`, reference it  
4. This file defines the final palette  

---

### 🧱 For layout references
1. Name it `layout_[description].png`  
2. Add a row: **LAYOUT REFERENCE — take grid and spacing**  
3. Cross-reference in `mood-board.md`  

---

### 🧩 For component references
1. Name it `component_[description].png`  
2. Mention what components are visible  
   - Buttons  
   - Cards  
   - Inputs  
   - Navigation  

---

### 🔤 For typography references
1. Name it `type_[description].png`  
2. Capture:
   - Font family  
   - Weight hierarchy  
   - Size scale  

---

### 🌈 For mood / vibe references
1. Name it `mood_[description].png`  
2. Used only for:
   - Tone  
   - Emotion  
   - Brand feel  
3. Does NOT override colour or layout  

---

### 🚫 For things to avoid (Strict Rules)

1. Name it `avoid_[description].png`  
2. Clearly describe what is wrong  

**Rules:**
- These define patterns that MUST NOT appear in the output  
- They override ALL other inputs if conflict occurs  
- Examples:
  - Avoid cluttered layouts  
  - Avoid neon colours  
  - Avoid excessive shadows  

---

## What Claude reads

When you run `/ux-inspire`, Claude:

1. Reads this README for intent annotations  
2. Reads every image using vision  
3. Extracts:
   - Colours (always)  
   - Layout  
   - Typography  
   - Components  
   - Mood  
4. Applies priority + conflict rules  
5. Synthesises a **Visual Direction Brief**

---

## Expected Output from /ux-inspire

Claude will generate:

- 🎨 Colour palette (with hex values)  
- 🔤 Typography system  
- 🧱 Layout principles  
- 🧩 Component styling guidelines  
- 🌈 Brand personality summary  
- ✅ Do’s and Don’ts  

---

## Scaling Note

For large projects:
- Limit to **5–10 key images per category**  
- Too many inputs may dilute clarity and reduce output quality  

---

## Important Note

Colour is extracted from all images,  
but only `color_` files define the **final palette**.