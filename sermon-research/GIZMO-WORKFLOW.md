# Gizmo Research Workflow

## How to Run Gizmo (IMPORTANT)

Gizmo is NOT an ACP agent. It cannot be spawned via `sessions_spawn runtime="acp"`. 

**The correct way to run Gizmo:**

```bash
bash ~/.openclaw/workspace/sermon-research/scripts/run-gizmo-pipeline.sh "<slug>" "<prompt>" <output-dir> [--skip-review]
```

### Parameters:
- `slug`: Short identifier for this research (e.g., "judges-6-week4")
- `prompt`: The research task description (include source requirements!)
- `output-dir`: Where to save the output
- `--skip-review`: Skip the review step for automatic completion

### Example:
```bash
bash ~/.openclaw/workspace/sermon-research/scripts/run-gizmo-pipeline.sh \
  "judges-6-week4" \
  "Create research brief for Week 4: God Is Our Peace. Passage: Judges 6." \
  "/path/to/sermon-dev/Sermons/god-is/Week-4" \
  --skip-review
```

## Post-Processing Steps

After Gizmo completes:
1. Find output in `<output-dir>/<slug>/<slug>-polished.md`
2. Render to HTML using proper markdown parser (pipeline's HTML renderer has issues)
3. Copy to `research-brief.html` at target location
4. Post completion to sermon-research Discord channel

### Better HTML Rendering:
```python
import markdown

with open("polished.md") as f:
    md = f.read()

html = markdown.markdown(md, extensions=['tables', 'fenced_code'])
# Then wrap in styled HTML template
```

## Source Requirements (MANDATORY)

See `agents/gizmo/source-policy.md` for full list. Key points:

### ALWAYS Include:
- IVP Bible Background Commentary (NEVER skip)
- ESV Study Bible (NEVER skip)

### Use ALL Sources:
- Do NOT only use 2-3 favorites
- Rotate through the full list of pastoral voices
- 5-6 modern commentaries per section
- 3-4 pastoral voices per section

### Hyperlinks Required:
- Every online source must have a URL in the bibliography
- Link to: Gospel Coalition, Desiring God, Max Lucado site, etc.

## What Was Learned (Process Issues Fixed)

1. **Gizmo is CLI-only** - Cannot spawn via ACP sessions
2. **Source requirements too vague** - Had to add specific pastor list
3. **Pipeline HTML renderer broken** - Use Python markdown library instead
4. **Quality checklist didn't catch missing sources** - Added IVP/ESV checks
5. **Gizmo used same favorites** - Added "rotate through full list" requirement
6. **No hyperlinks** - Added link requirement to source policy
