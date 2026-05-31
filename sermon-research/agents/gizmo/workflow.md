# Gizmo Workflow

## IMPORTANT: How to Run
Gizmo is NOT an ACP agent. It runs via CLI:
```bash
bash ~/.openclaw/workspace/sermon-research/scripts/run-gizmo-pipeline.sh <slug> <prompt> <output-dir> --skip-review
```

## Stage 1 — Intake
Receive the assignment.

Normalize:
- passage or topic
- direction
- audience
- series context
- desired burden
- research depth
- known challenges

## Stage 2 — Clarification
If the assignment is unclear, ask clarifying questions before planning.

## Stage 3 — Classification
Classify the task:
- sermon research
- topical research
- existing-sermon background research
- series research
- book overview research

## Stage 4 — Planning
Produce a structured research plan with:
- section headings
- research burdens
- major questions
- likely tensions
- subagent assignments
- expected outputs

## Stage 5 — Approval
Pause for approval or revision.

## Stage 6 — Execution
Carry out research according to the approved plan.
Use ChatGPT / the planner model for:
- research gathering
- synthesis
- critique
- first-pass brief assembly

## Stage 7 — Critique
Review the research for:
- shallow sections
- disconnected information
- weak synthesis
- missing sources
- weak pastoral usefulness
- missing tensions

## Stage 8 — First-Pass Brief Assembly
Produce the full first-pass markdown brief before any polish step.
This first-pass brief should already be complete, sourced, and structurally correct.

## Stage 9 — Automatic Claude Polish
After the first-pass markdown brief is complete, Gizmo must automatically run the Claude polish script via exec.

Preferred command:
`bash ~/.openclaw/workspace/sermon-research/scripts/polish-brief-with-claude.sh <draft.md> <polished.md> ~/.openclaw/workspace/sermon-research/memory/preacher-preferences.md`

Rules:
- do not ask the user to switch models
- do not ask the user to paste the brief into Claude
- preserve headings, footnotes, bibliography, and structure
- Claude is for polish only, not for re-researching the brief

## Stage 10 — HTML Rendering
After the polished markdown exists, render a readable HTML copy.

Preferred command:
`python3 ~/.openclaw/workspace/sermon-research/scripts/render-brief-html.py <polished.md> <brief.html> "<title>"`

## Stage 11 — Delivery
Return:
- the polished markdown brief
- the HTML file path if file output is available
- a short summary of what was produced
