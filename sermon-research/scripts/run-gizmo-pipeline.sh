#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <slug> <assignment prompt> [output-dir] [--skip-review]" >&2
  exit 64
fi

SKIP_REVIEW=""
SLUG=""
PROMPT=""
OUTDIR=""

for arg in "$@"; do
  case "$arg" in
    --skip-review) SKIP_REVIEW="1" ;;
    *)
      if [[ -z "$SLUG" ]]; then SLUG="$arg"
      elif [[ -z "$PROMPT" ]]; then PROMPT="$arg"
      elif [[ -z "$OUTDIR" ]]; then OUTDIR="$arg"
      fi
      ;;
  esac
done

OUTDIR="${OUTDIR:-$HOME/.openclaw/workspace/sermon-research/projects}"

WORKDIR="$OUTDIR/$SLUG"
DRAFT="$WORKDIR/${SLUG}-draft.md"
POLISHED="$WORKDIR/${SLUG}-polished.md"
HTML="$WORKDIR/${SLUG}.html"
META="$WORKDIR/${SLUG}-run.json"
SUMMARY="$WORKDIR/${SLUG}-summary.txt"
STYLE_NOTE="$HOME/.openclaw/workspace/sermon-research/memory/preacher-preferences.md"

mkdir -p "$WORKDIR"
JSON_OUT=$(mktemp)
trap 'rm -f "$JSON_OUT"' EXIT

openclaw agent --agent gizmo --json -m "$PROMPT" > "$JSON_OUT"

python3 -c "
import json, sys
from pathlib import Path
src, draft, meta = Path('$JSON_OUT'), Path('$DRAFT'), Path('$META')
obj = json.loads(src.read_text())
text = obj['result']['payloads'][0]['text']
draft.write_text(text, encoding='utf-8')
meta.write_text(json.dumps(obj, indent=2), encoding='utf-8')
"

bash "$HOME/.openclaw/workspace/sermon-research/scripts/polish-brief-with-claude.sh" "$DRAFT" "$POLISHED" "$STYLE_NOTE"
python3 "$HOME/.openclaw/workspace/sermon-research/scripts/render-brief-html.py" "$POLISHED" "$HTML" "$SLUG"

python3 -c "
import re
from pathlib import Path
text = Path('$POLISHED').read_text()
body = re.sub(r'^#{1,6}\s+', '', text, flags=re.MULTILINE).strip()
paragraphs = [p.strip() for p in re.split(r'\n\n+', body) if len(p.strip()) > 80]
summary_text = (paragraphs[0][:300] if paragraphs else body[:300]) + '...'
sections = re.findall(r'^##\s+(.+)$', text, re.MULTILINE)
output = f'''Research complete for: $SLUG

Project: $SLUG
Brief: $POLISHED
HTML: $HTML

Summary:
{summary_text}

Sections in this brief:
''' + '\n'.join('- ' + s for s in sections) + '''

Reply with any adjustments or \"done\" to finalize.'''
Path('$SUMMARY').write_text(output)
print(output)
"

echo "DRAFT=$DRAFT"
echo "POLISHED=$POLISHED"
echo "HTML=$HTML"
echo "META=$META"
echo "SUMMARY=$SUMMARY"