# Gizmo for OpenClaw

This pack creates **Gizmo**, a research orchestrator for sermon development inside OpenClaw.

Gizmo supports:
- sermon passage research
- topical/doctrinal research
- background research for an existing sermon
- whole-series research
- book overview research

Gizmo outputs:
- polished Markdown briefs
- readable HTML copies
- footnote-style references and bibliography sections

## Included
- agent identity and workflow files
- subagent specs
- schemas
- markdown templates
- HTML shell template
- install guide
- sample OpenClaw config snippets
- sample Discord kickoff prompt
- automation scripts for Claude polish and HTML rendering

## Recommended runtime pattern
- ChatGPT OAuth: planning, classification, synthesis, critique, and first-pass brief writing
- MiniMax: optional lower-cost support tasks
- Claude CLI: automatic final polish through the workspace script

## Recommended Model Flow
- ChatGPT plans the work and writes the full first-pass markdown brief.
- Gizmo automatically invokes Claude CLI to polish the completed brief.
- Gizmo then renders the polished markdown to HTML.
- The user should not need to switch models manually.

Read `INSTALLATION.md` first.
