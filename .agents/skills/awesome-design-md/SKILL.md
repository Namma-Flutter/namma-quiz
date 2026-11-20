---
name: awesome-design-md
description: VoltAgent's DESIGN.md specification format and design system integration. Use when creating, updating, reading, or enforcing project-level visual design tokens, component specifications, color schemes, and layout systems via the project-root DESIGN.md file.
---

# Awesome DESIGN.md: Agent Design System Standard

Adapted from `VoltAgent/awesome-design-md`. This skill governs how AI agents use, read, maintain, and generate `DESIGN.md` in the project root as the single source of truth for all visual and frontend decisions.

---

## 1. What is `DESIGN.md`?

`DESIGN.md` is a plain-text markdown document committed at the root of a project that serves as a machine-readable, human-friendly design system contract. 

Instead of relying on heavy Figma files, design tokens trapped in proprietary tools, or fragmented Tailwind configs, `DESIGN.md` establishes the visual identity, tokens, and component guidelines directly within the agent's context.

### The Golden Rule
> **Before writing any UI code, the agent MUST read `DESIGN.md` in the project root.** 
> All colors, typography, spacing, border radiuses, and component patterns must strictly adhere to the tokens defined in `DESIGN.md`.

---

## 2. Standard Structure of a `DESIGN.md`

Every `DESIGN.md` must adhere to this standardized schema:

```markdown
# DESIGN.md - [Project Name] Design System

## 1. Brand Voice & Philosophy
- Tone & Mood: (e.g. Modern, Minimalist, Engineering-Grade, High-Craft)
- Visual Anchors: (Key visual motifs, e.g. glassmorphism, 3D interactive canvas, clean gridlines)
- Target Audience: (e.g. Technical founders, developers, design-forward clients)

## 2. Color Palette & Semantic Tokens
| Token | Light Value | Dark Value | Tailwind Class / CSS Variable | Usage |
| :--- | :--- | :--- | :--- | :--- |
| `background` | `#fafafa` | `#09090b` | `bg-background` | Canvas background |
| `foreground` | `#09090b` | `#fafafa` | `text-foreground` | Primary text |
| `primary` | `#18181b` | `#f4f4f5` | `bg-primary`, `text-primary` | Main buttons, active indicators |
| `secondary` | `#f4f4f5` | `#27272a` | `bg-secondary` | Secondary badges, cards |
| `muted` | `#71717a` | `#a1a1aa` | `text-muted-foreground` | Subtitles, footnotes |
| `accent` | `#3b82f6` | `#60a5fa` | `text-accent`, `bg-accent` | Highlights, links, glow effects |
| `border` | `#e4e4e7` | `#27272a` | `border-border` | Subtle dividers, container borders |

## 3. Typography Hierarchy
- Display Font: [Family Name, e.g. Inter Display / Instrument Serif / Geist]
- Body Font: [Family Name, e.g. Geist Sans / Satoshi]
- Code / Monospace Font: [Family Name, e.g. Geist Mono / JetBrains Mono]

Scale:
- `Display Hero`: `text-5xl md:text-7xl font-bold tracking-tight leading-[1.05]`
- `H1 Section Title`: `text-3xl md:text-4xl font-semibold tracking-tight`
- `H2 Card Title`: `text-xl md:text-2xl font-medium tracking-tight`
- `Body Large`: `text-lg font-normal leading-relaxed`
- `Body Base`: `text-base font-normal leading-normal`
- `Caption / Monospace`: `text-xs font-mono tracking-wider uppercase`

## 4. Spacing, Geometry & Layout
- Container Widths: `max-w-6xl` (Standard content), `max-w-7xl` (Full width hero)
- Base Radius: `rounded-xl` (12px for cards), `rounded-lg` (8px for buttons/inputs), `rounded-full` (pills)
- Grid Spacing: 8pt grid (`gap-4`, `gap-6`, `gap-8`, `gap-12`)

## 5. Component Specifications
- Buttons (Primary, Outline, Ghost, Link)
- Cards (Surface, Border, Hover transition, Shadow)
- Navigation Bar (Sticky, glass blur, height, item spacing)
- Footer (Copyright, links, social icons)

## 6. Motion & Transitions
- Default Transition: `transition-all duration-200 ease-out`
- Spring Parameters: `{ stiffness: 300, damping: 25 }`
- Hover Scale: `hover:scale-[1.02] active:scale-[0.98]`

## 7. Forbidden Anti-Patterns (Do NOT Do)
- List explicit visual defects to prevent (e.g. unstyled blue hyperlinks, unconstrained images, missing dark mode values)
```

---

## 3. Workflows for this Skill

### Workflow A: Reading and Enforcing `DESIGN.md`
1. Check if `DESIGN.md` exists in the project root.
2. If it exists, extract the semantic tokens for colors, typography, and spacing.
3. Apply those exact classes or CSS variables when generating new components or pages.

### Workflow B: Initializing or Updating `DESIGN.md`
1. When starting a project or introducing a new brand direction, draft or update `DESIGN.md` at the project root.
2. Ensure all defined tokens match the active Tailwind config / CSS setup (`src/app/globals.css` or `tailwind.config`).
3. Document any newly introduced signature components.

### Workflow C: Design Drift Audit
1. Compare JSX/TSX files against `DESIGN.md`.
2. Flag any hardcoded arbitrary color values (e.g., `text-[#123456]` or random hex codes) that should be replaced with canonical design tokens.

