# Knowledge Card Visual Output Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Strengthen the Skill's final-output specification and publish two exact-text 3:4 visual cards from the first real creator test on the GitHub README.

**Architecture:** Keep procedural output rules in `references/output-template.md`. Keep the editable HTML source and rendered PNG examples at repository level because they support public documentation rather than runtime Skill behavior. Render exact Chinese text with HTML/CSS and headless Chrome so typography is deterministic.

**Tech Stack:** Markdown, HTML/CSS, PowerShell validation, headless Chrome, PNG.

---

### Task 1: Add failing visual-output checks

**Files:**
- Modify: `scripts/validate_repository.ps1`

- [ ] Require the editable HTML source and two rendered PNG files.
- [ ] Require the visual template to specify 3:4, 1200 × 1600, numbered modules, restrained accent colors and a SUMMARY block.
- [ ] Require README image references.
- [ ] Run `& .\scripts\validate_repository.ps1` and confirm failure because the assets and enhanced markers do not exist yet.

### Task 2: Strengthen the Skill output template

**Files:**
- Modify: `skills/hedy-content-positioning/references/output-template.md`

- [ ] Add a table of contents because the reference exceeds 100 lines.
- [ ] Preserve candidate output, evidence labels and the two-card Markdown contract.
- [ ] Add hard visual constraints, text-density limits, image-rendering instructions and a visual preflight checklist.
- [ ] Keep image rendering conditional: always provide accurate Markdown; create images only when the active Agent has a suitable rendering capability or the user asks for images.

### Task 3: Create the two example cards

**Files:**
- Create: `assets/examples/hedy-content-positioning-cards.html`
- Create: `assets/examples/hedy-content-positioning-card.png`
- Create: `assets/examples/hedy-7-day-validation-card.png`

- [ ] Encode the first real test result with exact Chinese text.
- [ ] Render each card independently at 1200 × 1600.
- [ ] Visually inspect both images for clipping, hierarchy, legibility and spacing.

### Task 4: Publish the example on GitHub

**Files:**
- Modify: `README.md`
- Modify: `README_EN.md`

- [ ] Add a clear “真实使用示例” section near the promised outputs.
- [ ] Label it honestly as the creator's first self-test, not independent customer validation.
- [ ] Embed both PNG files with relative repository paths.

### Task 5: Verify and deploy

**Files:**
- Verify all modified files.

- [ ] Run repository validation and Skill `quick_validate.py`.
- [ ] Run `git diff --check` and privacy scans.
- [ ] Commit and push `main`.
- [ ] Copy the updated Skill files to the local Codex installation and verify matching hashes.
