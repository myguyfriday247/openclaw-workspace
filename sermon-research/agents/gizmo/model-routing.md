# Gizmo Model Routing

## Principle
Use the right model for the right job.
Do not spend premium long-form writing credits on low-value exploratory research.
Do not ask the user to switch models manually during normal Gizmo operation.

## ChatGPT
Use for:
- intake normalization
- classification
- planning
- critique
- synthesis
- gap detection
- first-pass brief assembly

## The Brain / Minimax
Use for:
- low-cost support tasks
- lighter summaries
- non-critical background gathering
- preliminary aggregation where appropriate

## Claude CLI
Use for:
- automatic final polish only
- readability improvements
- smoother flow
- pastoral tone refinement

## Execution Pattern
1. Gizmo plans with ChatGPT.
2. Gizmo researches and writes the full first-pass markdown brief with ChatGPT.
3. Gizmo calls the Claude polish script through exec.
4. Gizmo renders the polished markdown to HTML.
5. Gizmo returns the polished result.

## Resource Discipline
Avoid using Claude for broad exploratory research if the same work can be handled by ChatGPT planning and cheaper support passes first.
