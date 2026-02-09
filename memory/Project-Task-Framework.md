# Project & Task Management Framework

_Last updated: February 5, 2026_

---

## Quick Reference

### Two Separate Systems

| Aspect | Projects | Tasks |
|--------|----------|-------|
| **Scope** | Multi-phase initiatives | Standalone requests |
| **Complexity** | High (requires briefs, phases) | Low (single output) |
| **Planning** | Phases defined up-front | Confirmed description only |
| **Examples** | Gospel Share Tracker app, Sermon Prep Assistant | "Fix this bug", "Research this topic" |

---

## SECTION 1: PROJECT KANBAN BOARD

Projects represent multi-phase initiatives with a defined outcome.

### Status Columns

**1. Ideas** — Raw concepts, brainstorming
- No research depth, no commitment
- Exit: Owner confirms interest

**2. Ideas in Development** — Light validation, feasibility
- High-level research only
- Exit: Owner approves moving to Project Brief

**3. Project Brief** — Authoritative blueprint
- Assistant creates from approved template
- Must include: name, description, success definition, phases, risks
- Exit: Explicit Telegram approval

**4. In Progress** — Active execution
- Phase by phase work
- **Critical:** End of each phase → summarize, confirm, ask approval, restate next phase goal

**5. Troubleshoot / Finalize** — Refinement, bug fixes
- No new features, no scope expansion
- Exit: Owner confirms readiness to deploy

**6. Deploy** — Launch, handoff
- No changes without approval
- Exit: Deployment confirmed successful

**7. Complete** — Finished, archived
- Audit record for reference

---

## SECTION 2: INSIDE A PROJECT (Detail View)

When a project is opened, structure is mandatory:

### Block 1: Project Overview
- Project name + description (from Project Brief)
- Read-only unless brief is updated

### Block 2: Project Timeline
- Phase-level only
- Ordered sequentially
- No dates, no task granularity

### Block 3: Action Items
- Questions, decisions, missing info, approval requests
- **Any open item blocks progress**
- Owner may add items

### Block 4: Up Next
- Next 3-5 concrete steps
- More detailed than phase names
- Informational only

### Block 5: Recent Work (Audit Trail)
- Last 3-5 completed steps
- Immutable — never edited or deleted
- Accountability log

---

## SECTION 3: TASK KANBAN BOARD

Tasks are standalone requests, never tied to projects.

### Status Columns

**1. Task Request** — Initial submission (may be vague)

**2. Task Confirmation** — Assistant restates precisely
- Scope clarified, assumptions surfaced
- Requires explicit confirmation
- Exit: Owner confirms task description

**3. In Progress** — Execution
- No scope expansion

**4. Review** — Quality checkpoint
- Owner provides: score (1-10) + written feedback
- If score < 7 → return to Task Confirmation or accept feedback for future

**5. Complete** — Accepted, finished

---

## ENFORCEMENT SUMMARY

- Never assume approval
- Never advance silently
- Never blur projects and tasks
- Never bypass Telegram for approvals
- Always summarize before transitioning phases
- Always ask before proceeding

**When in doubt: stop, clarify, ask.**

---

## Questions / Clarifications

1. Where should active projects appear in Mission Control?
2. Do you want a separate "Tasks" tab, or should tasks be handled differently?
3. Who creates the initial "Ideas" entries — me, you, or both?
