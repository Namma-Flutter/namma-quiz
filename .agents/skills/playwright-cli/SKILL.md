---
name: playwright-cli
description: Microsoft Playwright CLI browser automation, visual inspection, and end-to-end testing skill. Use when interacting with live web applications, capturing accessibility snapshots, taking screenshots, running E2E tests, or verifying UI state in a real browser.
---

# Playwright CLI: Token-Efficient Browser Automation

Adapted from `microsoft/playwright-cli`. This skill enables token-efficient browser automation and UI testing through concise CLI commands and accessibility snapshots rather than bloated DOM trees.

---

## 1. Why Playwright CLI?

Traditional Model Context Protocol (MCP) browser tools dump massive raw HTML trees and hundreds of lines of JSON schema into the model's context window. 

The Playwright CLI (`playwright-cli`) runs a persistent local browser daemon, maintaining the DOM and state locally on disk. The agent interacts using brief, token-efficient terminal commands and lightweight accessibility/ARIA snapshots.

---

## 2. Core CLI Commands

### Session Lifecycle
```bash
# Open a browser session targeting a URL
playwright-cli open http://localhost:3000

# Open in headless mode (default for CI / automation)
playwright-cli open http://localhost:3000 --headless

# Close the active browser session
playwright-cli close
```

### Snapshot & Navigation
```bash
# Capture lightweight accessibility snapshot with element refs
playwright-cli snapshot

# Navigate to a new URL
playwright-cli goto http://localhost:3000/projects

# History navigation
playwright-cli back
playwright-cli reload
```

### Element Interaction (Using Ref IDs)
When `playwright-cli snapshot` is executed, interactive elements are labeled with compact ref tags (e.g. `[ref=e12]`):
```bash
# Click an element by ref ID
playwright-cli click e12

# Click by text or selector
playwright-cli click "Get in Touch"
playwright-cli click "button[data-testid='submit-btn']"

# Fill input fields
playwright-cli fill e5 "keerthi@example.com"

# Type keystrokes or shortcuts
playwright-cli press Enter
playwright-cli press Escape
```

### Visual Verification & Evaluation
```bash
# Take a full-page screenshot
playwright-cli screenshot --full-page output/homepage.png

# Take an element screenshot
playwright-cli screenshot e12 output/button.png

# Evaluate JavaScript expression inside page context
playwright-cli eval "document.title"
playwright-cli eval "window.innerWidth"
```

---

## 3. Standard Verification Workflows

### Workflow 1: Pre-Flight Visual & Layout Check
1. Start the local Next.js dev server:
   ```bash
   npm run dev
   ```
2. Open the page in Playwright CLI:
   ```bash
   playwright-cli open http://localhost:3000
   ```
3. Capture the accessibility snapshot:
   ```bash
   playwright-cli snapshot
   ```
4. Verify key headings, navigation items, and interactive controls are present.
5. Take a screenshot for visual inspection:
   ```bash
   playwright-cli screenshot output/preview.png
   ```
6. Close the session:
   ```bash
   playwright-cli close
   ```

### Workflow 2: Responsive Testing
Test layout across device viewports:
```bash
# Mobile Portrait (375x667)
playwright-cli open http://localhost:3000 --viewport 375x667
playwright-cli screenshot output/mobile.png

# Tablet View (768x1024)
playwright-cli open http://localhost:3000 --viewport 768x1024
playwright-cli screenshot output/tablet.png

# Desktop View (1440x900)
playwright-cli open http://localhost:3000 --viewport 1440x900
playwright-cli screenshot output/desktop.png
```

### Workflow 3: Form & Flow Interaction
1. Navigate to contact or interactive section.
2. Fill out test data using element refs.
3. Submit and verify success toast or state change.

---

## 4. Troubleshooting & Best Practices
* **Keep sessions clean**: Always run `playwright-cli close` when finished with a testing pass to release memory.
* **Ref stability**: Ref IDs (`e1`, `e2`) are regenerated after navigation or major DOM updates. Run `playwright-cli snapshot` again if a ref is not found.
* **Deterministic selectors**: For critical tests, prefer semantic roles (`button`, `link`, `heading`) or test IDs (`data-testid="..."`).

