---
name: taste-skill
description: Anti-slop frontend art direction and design taste framework by Leon Lin (Leonxlnx). Use when creating, redesigning, or refining web frontends, landing pages, or UI components to eliminate generic AI aesthetics and ensure distinct art direction, curated typography, spring motion, and pre-flight verification.
---

# Taste Skill: Anti-Slop Frontend Art Direction

Adapted from `Leonxlnx/taste-skill`. This skill eliminates generic AI frontend patterns ("AI slop"—monotonous Inter fonts, purple-to-indigo gradients, uniform 3-card grids, low-contrast washed-out text) and replaces them with intentional product craftsmanship.

---

## 1. The Anti-Slop Core Directive

When instructed to design or code frontend interfaces:
1. **Never default to generic AI tropes**:
   * Do NOT use default Inter for everything without intention.
   * Do NOT plaster the page in generic radial gradients of `#6366f1` to `#a855f7` (Indigo to Purple).
   * Do NOT create symmetrical 3-column feature cards with identical rounded boxes and generic Lucide icon circles.
   * Do NOT use ultra-faint gray text (`text-zinc-600` on black backgrounds) that fails accessibility.
2. **Every interface must possess an opinionated aesthetic identity** that reflects the product's actual purpose, audience, and industry context.

---

## 2. The Design Contract: Establishing the Read

Before writing any frontend markup or styling, evaluate the user's brief and define:

### 1. The One-Line Design Read
Identify:
* **Page Kind**: Developer portfolio, SaaS dashboard, agency showcase, technical tool, or editorial blog.
* **Target Audience**: Senior engineers, founders, design leaders, or hiring managers.
* **Core Vibe**: Refined & understated, bold & punchy, technical & precise, or editorial & literary.

### 2. The Three Dials
Calibrate the following dials:
* `DESIGN_VARIANCE`: `[Low | Medium | High]`
  * *Low*: Clean, strict design system, zero unnecessary ornamentation.
  * *Medium*: Thoughtful accents, distinctive typography, refined card silhouettes.
  * *High*: Bespoke layouts, dynamic asymmetry, signature visual motifs.
* `MOTION_INTENSITY`: `[Subtle | Lively | Expressive]`
  * *Subtle*: Micro-interactions, 150-200ms opacity & transform transitions.
  * *Lively*: Coordinated spring entrances (`framer-motion`), staggered list items.
  * *Expressive*: Dynamic cursor tracking, 3D tilt, continuous ambient particle or mesh canvas.
* `VISUAL_DENSITY`: `[Compact | Balanced | Spacious]`
  * *Compact*: Dense data tables, terminal panes, technical HUDs.
  * *Balanced*: Standard modern SaaS and product interfaces.
  * *Spacious*: High-end portfolios, editorial landing pages, storytelling layouts.

---

## 3. Aesthetic Archetypes

Choose one primary archetype or blend deliberately:

### Archetype A: Polished & Soft (Modern High-End SaaS)
* **Palette**: Deep charcoal or warm neutral backdrop, subtle borders (`border-white/10` or `border-black/5`), soft layered ambient shadows (`shadow-sm` + `shadow-lg/5`).
* **Typography**: Crisp geometric sans-serif (e.g., Geist, Satoshi, Plus Jakarta Sans) paired with neutral tabular numbers.
* **Motion**: Tactile spring physics (damping: 24, stiffness: 280), smooth pill toggles, refined button press states (`scale: 0.98`).

### Archetype B: Editorial & Minimalist (Notion / Linear / iA Writer)
* **Palette**: High-contrast monochrome, pure white / deep black, warm stone grays, single razor-sharp accent (e.g., international Klein blue or burnt amber).
* **Typography**: Expressive editorial serif for headers (e.g., Newsreader, Playfair, Instrument Serif) balanced with functional monospace or neutral grotesque body.
* **Layout**: Asymmetric grid columns, generous whitespace margins, horizontal rules with hairline borders, caption notes.

### Archetype C: Brutalist & Technical (Terminal / Cyber-Minimal / Vercel CLI)
* **Palette**: Pitch black (`#09090b`), high-contrast pure white text, electric lime or safety orange focal cues.
* **Typography**: Dense monospace (e.g., JetBrains Mono, Fira Code, Geist Mono), uppercase micro-labels (`tracking-widest uppercase text-xs`).
* **Geometry**: Sharp corners (`rounded-none` or `rounded-sm`), visible grid lines (`border-zinc-800`), live status indicators, raw badges.

---

## 4. Typography & Layout Systems

* **Modular Scale**: Maintain a consistent ratio between `text-xs`, `text-sm`, `text-base`, `text-xl`, `text-3xl`, and display headers (`text-5xl` to `text-7xl`).
* **Line-height & Tracking**:
  * Large headings: Tighten tracking (`tracking-tight` or `-0.02em`) with snug line-height (`leading-[1.1]`).
  * Body copy: Relax line-height (`leading-relaxed`) and keep line length between 45 and 75 characters (`max-w-prose` or `max-w-2xl`).
* **Focal Hierarchy**: Every viewport must have one undeniable visual anchor (e.g., an interactive 3D hero, an oversized statement header, or an immersive preview card). Secondary elements must visually yield to it.

---

## 5. Pre-Flight Quality Gate Checklist

Before declaring any frontend build or redesign complete, check each item:

- [ ] **Contrast Verification**: All body and headline text passes WCAG AA contrast against its immediate background.
- [ ] **No Placeholder Content**: No "Lorem Ipsum", generic placeholder cards, or `TODO` visual blocks.
- [ ] **Interactive States**: Every interactive element (buttons, cards, links, inputs) has clear `:hover`, `:focus-visible`, and `:active` states.
- [ ] **Responsive Integrity**: Tested and visually sound across Mobile (375px), Tablet (768px), and Desktop (1280px+).
- [ ] **No Content Overflow**: No unintended horizontal scrolling (`overflow-x-hidden` on main root, cards wrap gracefully).
- [ ] **Motion Performance**: Animations use GPU-accelerated properties (`transform`, `opacity`) and respect `prefers-reduced-motion`.

