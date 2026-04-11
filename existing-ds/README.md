# existing-ds/

If the project already has a design system, place its files here **before running `/ux-prd`**.

Claude will automatically detect this folder, extract the colour palette, typography, spacing, and components, and use them across the entire pipeline instead of generating from scratch.

---

## What this affects

| Phase | Without existing DS | With existing DS |
|-------|-------------------|-----------------|
| `/ux-inspire` | Derives colour palette from screenshots + mood board | Uses DS colour tokens as primary palette — screenshots used for layout/mood only |
| `/ux-design-system` | Generates full SDS system from scratch | Imports and maps existing tokens to SDS structure — generates only what is missing |
| `/ux-hifi` | Applies generated tokens | Applies imported DS tokens |
| `/ux-to-code` | Generates component library | Imports from existing DS, generates wrappers only for missing components |

---

## What to put here

Place **any** of the following — Claude will read whatever is provided:

| File type | What it should contain | Example filename |
|-----------|----------------------|-----------------|
| CSS variables file | `:root { --color-primary: #...; }` | `tokens.css` |
| JSON token file | Style Dictionary / Figma Tokens / W3C format | `tokens.json` |
| Figma Variables export | JSON export from Figma Variables panel | `figma-variables.json` |
| Storybook export | Component list and style guide | `storybook-export.json` |
| Markdown / text summary | Manual write-up of DS rules and values | `design-system-overview.md` |
| Screenshot of DS page | Screenshot of Figma DS / Storybook / Zeroheight | `ds-screenshot.png` |
| PDF / brand guidelines | Brand colour book, typography rules, component guide | `brand-guidelines.pdf` |

**The more you provide, the more faithfully the pipeline will replicate the existing system.**

---

## Minimum useful input

At minimum, provide one of:
- A CSS variables file with colour tokens
- A JSON token file
- A screenshot of the DS colour palette and typography page

With just the colour palette, Claude can:
- Use correct brand colours throughout inspire and design phases
- Generate harmonious semantic tokens that extend the existing palette
- Flag which components need to be built from scratch vs already exist

---

## No files here?

If this folder is empty (or has only this README), Claude will assume **no existing design system** and will generate one from scratch using inspiration references and industry defaults.

To explicitly tell Claude "no existing DS" — leave this folder empty. No action needed.
