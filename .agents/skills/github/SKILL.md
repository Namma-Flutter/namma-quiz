---
name: github
description: GitHub and Git workflow standards for repository management, branching, conventional commits, pull requests, issue tracking, and GitHub CLI automation.
---

# GitHub Engineering & Workflow Standards

This skill governs all Git and GitHub operations across the repository, ensuring clean version control history, structured collaboration, and standardized release practices.

## 1. Git Branching Strategy

Follow a simplified feature-branch workflow rooted off `main`:

* `feature/<slug>`: New features, major UI additions, or new capabilities (e.g., `feature/hero-3d-scene`).
* `fix/<slug>`: Bug fixes, layout corrections, and patch updates (e.g., `fix/mobile-nav-overflow`).
* `refactor/<slug>`: Code structure, performance tuning, or styling cleanup without functional changes.
* `chore/<slug>`: Dependency upgrades, configuration adjustments, and documentation maintenance.

### Branch Hygiene Rules
1. Never commit directly to `main` without review or CI verification.
2. Keep branches short-lived and rebased against the latest `main`:
   ```bash
   git fetch origin main
   git rebase origin/main
   ```
3. Always verify local builds, linting, and tests pass before pushing.

---

## 2. Conventional Commits Standard

All commits must follow the **Conventional Commits 1.0.0** specification:

```text
<type>(<scope>): <short imperative summary>

[optional detailed body explaining why and what changed]

[optional footer, e.g. Fixes #123]
```

### Commit Types
* `feat`: A new user-facing feature or enhancement
* `fix`: A bug fix
* `refactor`: Code change that neither fixes a bug nor adds a feature
* `style`: Changes that do not affect code logic (formatting, whitespace)
* `perf`: Performance improvement
* `test`: Adding or correcting tests
* `build`: Build system or external dependency changes (npm, tsconfig, etc.)
* `ci`: GitHub Actions or CI configuration changes
* `docs`: Documentation updates (README, SKILL.md, DESIGN.md)
* `chore`: Routine maintenance tasks

### Examples
* `feat(portfolio): add interactive 3d project showcase card`
* `fix(navbar): resolve backdrop-filter blur flicker in safari`
* `perf(images): migrate hero visual to next/image with AVIF priority`
* `docs(design): update typography scale and primary color token in DESIGN.md`

---

## 3. Pull Request (PR) Workflow

When preparing a Pull Request:

### PR Title
Use conventional commit format matching the primary change:
`feat(skills): configure project-level agent skills and DESIGN.md`

### PR Description Template
```markdown
## Summary
Provide a concise overview of what this PR introduces, solves, or updates.

## Changes
- Detailed bullet point 1
- Detailed bullet point 2

## Visual & Functional Verification
- [ ] Local build passes: `npm run build`
- [ ] Linter passes without warnings: `npm run lint`
- [ ] Responsive view verified on mobile, tablet, and desktop
- [ ] Accessibility checks meet WCAG AA standards

## Related Issues
Closes #<issue_number>
```

### Code Review Guidelines
* **Readability First**: Keep code self-documenting, modular, and typed.
* **Non-destructive Changes**: Ensure existing functionality, routes, and styling tokens remain intact.
* **No Unvetted Dependencies**: Do not introduce heavy third-party packages when standard React/Next.js/Tailwind solutions suffice.

---

## 4. GitHub CLI (`gh`) Reference

Use the GitHub CLI (`gh`) for seamless terminal operations:

```bash
# Check authentication and repository status
gh auth status
gh repo view

# Pull Request operations
gh pr list --state open
gh pr view <pr-number> --web
gh pr create --title "feat: ..." --body "..." --base main
gh pr checkout <pr-number>
gh pr review <pr-number> --approve --comment "LGTM"

# Issue operations
gh issue list
gh issue create --title "bug: ..." --body "..."
gh issue close <issue-number>

# GitHub Actions monitoring
gh run list --limit 5
gh run view <run-id> --log-failed
```

---

## 5. Security & Repository Hygiene
* **Never commit secrets**: Check `.env.local`, API keys, tokens, or credentials against `.gitignore`.
* **Lockfile Integrity**: Always commit `package-lock.json` alongside `package.json` to guarantee reproducible builds.
* **Clean Working Tree**: Ensure temporary scratch files, build artifacts (`.next/`, `dist/`), and caches are ignored.

