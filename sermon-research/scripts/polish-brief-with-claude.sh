#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <input-markdown> <output-markdown> [style-note-file]" >&2
  exit 64
fi

INPUT="$1"
OUTPUT="$2"
STYLE_NOTE="${3:-}"

if [[ ! -f "$INPUT" ]]; then
  echo "Input markdown file not found: $INPUT" >&2
  exit 66
fi

TMP_PROMPT=$(mktemp)
cleanup() { rm -f "$TMP_PROMPT"; }
trap cleanup EXIT

cat > "$TMP_PROMPT" <<'EOF'
You are polishing a sermon research brief.

Goals:
- improve readability
- improve flow and transitions
- strengthen pastoral but academically informed tone
- preserve meaning
- preserve headings
- preserve markdown structure
- preserve citations and footnotes exactly
- do not add new claims unless they are already clearly implied by the draft
- do not remove bibliography entries
- do not turn the brief into a sermon manuscript
- do not create sermon points or a final outline

Output only the revised markdown brief.
EOF

if [[ -n "$STYLE_NOTE" && -f "$STYLE_NOTE" ]]; then
  {
    echo
    echo "Additional style notes:"
    cat "$STYLE_NOTE"
  } >> "$TMP_PROMPT"
fi

{
  echo
  echo '----- BEGIN DRAFT MARKDOWN -----'
  cat "$INPUT"
  echo
  echo '----- END DRAFT MARKDOWN -----'
} >> "$TMP_PROMPT"

claude < "$TMP_PROMPT" > "$OUTPUT"
