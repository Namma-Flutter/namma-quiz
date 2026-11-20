# DESIGN.md — Namma Quiz Design System

## 1. Brand Voice & Philosophy
- **Product**: Namma Quiz — Real-Time Multiplayer Quiz & Interactive Learning Platform.
- **Tone & Mood**: Vibrant, energetic, game-show electric, yet refined with high-craft precision. Tactile arcade feel meets modern SaaS polish.
- **Visual Anchors**:
  - The iconic 4-color Game Action Quad (Red Triangle, Blue Diamond, Yellow Circle, Green Square).
  - Deep Royal Purple canvas (`#46178F` / `#5E27B0`) with playful geometric background motifs.
  - Tactile 3D button depths with physical click-down feedback (`translateY(4px)` with zeroed shadow).
  - Asymmetric, bento-inspired feature cards with purposeful visual rhythm (no generic 3-column AI slop).
- **Target Audience**: Students, teachers, tech communities, event organizers, party hosts, and competitive trivia players.

---

## 2. Color Palette & Semantic Tokens

### Core Brand & Quad Action Colors
| Token | Hex Value | Semantic Role |
| :--- | :--- | :--- |
| `--color-brand-primary` | `#46178F` | Hero backgrounds, brand purple, primary anchors |
| `--color-brand-vibrant` | `#5E27B0` | Active highlights, glowing accents, gradient stops |
| `--color-brand-light` | `#F3EDFD` | Purple tint surfaces, badges, active pill backgrounds |
| `--color-tile-red` | `#E21B3C` | Game Option 1 (Triangle) • Danger states |
| `--color-tile-blue` | `#1368CE` | Game Option 2 (Diamond) • Info states |
| `--color-tile-yellow` | `#D89E00` | Game Option 3 (Circle) • Warning states |
| `--color-tile-green` | `#26890C` | Game Option 4 (Square) • Success states • Correct answer |

### Neutrals & Surfaces
| Token | Hex Value | Semantic Role |
| :--- | :--- | :--- |
| `--color-bg-canvas` | `#F8F9FD` | Main page canvas background |
| `--color-bg-surface` | `#FFFFFF` | Card surfaces, modals, popovers |
| `--color-bg-subtle` | `#F0F2F8` | Inset containers, secondary button backgrounds |
| `--color-text-main` | `#11142D` | Primary headings, high-contrast body text (passes WCAG AAA) |
| `--color-text-muted` | `#5E6278` | Secondary labels, descriptions, subheadings |
| `--color-text-subtle` | `#8E92BC` | Footnotes, input placeholders, quiet captions |
| `--color-border-subtle`| `#E4E7F2` | Subtle hairline card borders and dividers |
| `--color-dark-solid` | `#141724` | High-contrast dark button backgrounds, footer backdrop |

---

## 3. Typography Hierarchy

- **Font Family**: `'Montserrat', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`
- **Monospace (PIN & Stats)**: `'Courier New', Consolas, Monaco, monospace`

### Scale
- **Display Hero**: `font-size: 44px; line-height: 1.15; font-weight: 900; letter-spacing: -0.03em;` (Desktop: `56px`)
- **Section Heading**: `font-size: 28px; line-height: 1.25; font-weight: 800; letter-spacing: -0.02em;` (Desktop: `36px`)
- **Card Title / Question**: `font-size: 20px; line-height: 1.35; font-weight: 800;` (Desktop: `24px`)
- **Body Large**: `font-size: 16px; line-height: 1.5; font-weight: 500;`
- **Body Base**: `font-size: 14px; line-height: 1.5; font-weight: 500;`
- **Caption / Monospace**: `font-size: 12px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.06em;`
- **Game PIN Hero**: `font-size: 32px; font-weight: 900; letter-spacing: 12px; font-family: monospace;`

---

## 4. Spacing, Geometry & Layout

- **Desktop Max-Width**: `1200px` for public hero and showcases, `960px` for live host stage, `520px` for player focus cards.
- **Border Radiuses**:
  - Small pills & chips: `999px`
  - Inputs & Buttons: `12px`
  - Cards & Panels: `16px` to `20px`
  - Action Tiles: `14px`
- **Tactile Depths**:
  - Primary Game Buttons: `box-shadow: 0 4px 0 var(--btn-shadow);` with active `transform: translateY(4px); box-shadow: 0 0 0;`
  - Answer Tiles: `box-shadow: 0 5px 0 var(--tile-shadow);` with active `transform: translateY(4px);`
- **Grid Spacing**: 8pt consistent rhythm (`8px`, `16px`, `24px`, `32px`, `48px`, `64px`).

---

## 5. Component Specifications

### 1. Unified Navigation Bar
- Sticky topbar with glass blur (`backdrop-filter: blur(16px)`).
- Brand icon with lightning bolt spark.
- Fast links: "Play", "Host a Quiz", "Studio (Admin)", GitHub stars.

### 2. Tactile Arcade Buttons
- `.btn-arcade-brand`: Deep purple background `#46178F`, shadow `#2D0D60`.
- `.btn-arcade-dark`: High-contrast obsidian `#141724`, shadow `#000000`.
- `.btn-arcade-light`: Pure white surface with `#E4E7F2` border, shadow `#CBD0E2`.

### 3. Asymmetric Bento Feature Grid (Zero-AI-Slop)
- Replaces generic 3-column identical boxes.
- 1 featured horizontal span with live latency metrics & real-time architecture.
- 1 interactive game mechanic card (podiums & dynamic pillar distribution).
- 1 developer card (100% full-stack Dart, Serverpod, Jaspr, Flutter).

### 4. Answer Tiles
- 2x2 grid on desktop, responsive flex/grid on mobile.
- High-contrast white text, distinct geometric SVG shape icons (Triangle, Diamond, Circle, Square).
- Dedicated hover lift and tactile active press.

---

## 6. Motion & Transitions
- Micro-interactions: `transition: all 0.18s cubic-bezier(0.16, 1, 0.3, 1)`.
- Celebratory Pop: `animation: popIn 0.45s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards`.
- Floating Ambient Icons: smooth `translateY` floating with alternating speeds and delays (clamped within safe container boundaries so zero mobile overflow).

---

## 7. Forbidden Anti-Patterns (Zero-Tolerance)
1. NO generic 3-column symmetrical cards with default Lucide/Tabler icons.
2. NO purple-to-indigo generic linear gradients.
3. NO faint gray-on-dark text (WCAG AA violation).
4. NO negative-margin floating icons that cause horizontal scroll on mobile.
5. NO conflicting border radiuses or button depths on the same screen.
6. NO desktop views squished into an awkward 600px mobile column.
