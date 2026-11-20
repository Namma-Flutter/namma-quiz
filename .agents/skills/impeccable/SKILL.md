---
name: impeccable
description: Paul Bakaus's Impeccable design system critique, audit, and polish toolkit. Use when auditing UI quality, reviewing visual hierarchy, refining micro-details, eliminating design anti-patterns, or handling design commands (/impeccable audit, critique, polish, bolder, quiet, document).
---

# Impeccable: AI Design Toolkit & Critique Engine

Adapted from `pbakaus/impeccable`. This skill provides a specialized design vocabulary, command surface, and deterministic anti-pattern checking rules to guide coding agents in crafting production-grade UI.

---

## 1. Core Principles

1. **The Brief Wins**: Pinned aesthetics, client preferences, brand palettes, or custom font choices defined in the project override generic defaults. Never overwrite a distinct stylistic choice with bland mainstream tropes.
2. **Refinement vs. Redesign**: 
   * When asked to *polish* or *audit*, preserve existing brand identity, structure, and content copy. Focus strictly on typography scale, contrast, micro-spacing, alignment, and transitions.
   * When asked for a *redesign*, systematically establish goals, user perspective, and design system contracts before restructuring.
3. **Contextual Memory**: Maintain and reference `PRODUCT.md` (purpose, audience, voice) and `DESIGN.md` (tokens, styles, components) to ensure long-term consistency.

---

## 2. Command Vocabulary

Respond to and execute these commands whenever prompted:

### `/impeccable audit`
Performs a rigorous, objective inspection of the UI:
* Checks for contrast failures (WCAG AA compliance).
* Scans for awkward line wraps, unconstrained container widths, and text over-stretching (>75ch).
* Flags inconsistent spacing (e.g., mixing 13px, 17px, 21px margins instead of a consistent 4/8pt system).
* Detects visual clutter, redundant borders, and competing visual weights.

### `/impeccable critique`
Offers a designer-grade assessment of the layout:
* Analyzes visual hierarchy: What is the eye drawn to first, second, and third?
* Assesses balance and whitespace: Does the page breathe, or are elements fighting for attention?
* Evaluates typography pairing and rhythm: Do the font weights and scales create clear informational layers?
* Suggests 2-3 high-impact aesthetic enhancements.

### `/impeccable polish`
Refines micro-interactions and surface quality without changing structure:
* Tightens letter-spacing on display headers (`tracking-tight`).
* Adds subtle layered shadows or hairline borders for depth.
* Refines button click/press feedback (`active:scale-[0.98]`).
* Harmonizes padding between cards, headers, and container boundaries.
* Smooths transition timing curves (springs over linear).

### `/impeccable bolder`
Amplifies visual impact when a design feels too timid or washed out:
* Increases contrast between primary focal points and secondary elements.
* Enhances heading scale (e.g., bumping `text-4xl` to `text-6xl`).
* Deepens shadows or introduces accent glow borders.
* Sharpens copy phrasing for stronger punch.

### `/impeccable quiet`
Softens noise when a design feels overwhelming or chaotic:
* Reduces unnecessary borders, dividers, and background cards.
* Expands whitespace (`py-12` -> `py-20`, `gap-6` -> `gap-10`).
* Tones down competing saturated colors to a cohesive, restrained palette.
* Replaces visual decorations with clean typographic structure.

### `/impeccable document`
Analyzes the existing codebase and writes or updates:
* `PRODUCT.md`: Documenting product scope, target audience, core user stories.
* `DESIGN.md`: Documenting detected color tokens, typography scales, spacing rules, and components.

---

## 3. Surface Modes

Determine the primary operational mode of the interface:

| Mode | Target Surface | Key Design Mandate |
| :--- | :--- | :--- |
| **Persuade** | Marketing, Landing Pages, Portfolios | Emotion, visual arrest, undeniable hero, clear call-to-action, social proof. |
| **Operate** | Web Apps, Dashboards, Settings, Editors | Scannability, low visual noise, predictable hitboxes, high contrast, state feedback. |
| **Read** | Docs, Articles, Case Studies, Blogs | Effortless readability, ideal line lengths (50-70ch), typographic rhythm, non-distracting navigation. |
| **Experience** | Interactive 3D, Creative Showcases | Dynamic spatial depth, physics-based motion, sound/canvas integration, surprise & delight. |

---

## 4. Mechanical Anti-Pattern Checklist (Zero-Tolerance)

Avoid these 10 ubiquitous frontend anti-patterns:

1. **Borders on everything**: Stacking borders inside borders inside cards. Use subtle background contrast or whitespace instead.
2. **Uniform 3-card grids**: Having every feature represented by identical three-column cards with generic icons. Introduce asymmetric layouts, featured cards, or bento grids.
3. **Gray text on dark backgrounds**: Falling below 4.5:1 contrast for body text and 3:1 for large headlines.
4. **Unrestrained content stretch**: Letting text span across wide 1920px screens. Always clamp reading widths (`max-w-prose` or `max-w-2xl`).
5. **No focus-visible indicators**: Removing native outlines without replacing them with accessible custom focus rings (`focus-visible:ring-2`).
6. **Missing empty & error states**: Designing only the happy path.
7. **Abrupt linear animations**: Transitions using `transition: all 0.3s linear` instead of natural cubic-bezier or spring dynamics.
8. **Clashing icon weights**: Mixing thin line icons with solid filled icons in the same component.
9. **Dead click targets**: Buttons without pointer cursors or interactive hover/active feedback.
10. **Font scale cacophony**: Defining arbitrary font sizes (15px, 17px, 23px, 31px) instead of adhering to a standardized scale.

