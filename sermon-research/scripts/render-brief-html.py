#!/usr/bin/env python3
from __future__ import annotations

import html
import sys
from pathlib import Path

if len(sys.argv) < 3:
    print('Usage: render-brief-html.py <input-markdown> <output-html> [title]', file=sys.stderr)
    sys.exit(64)

inp = Path(sys.argv[1])
out = Path(sys.argv[2])
title = sys.argv[3] if len(sys.argv) > 3 else inp.stem.replace('-', ' ').title()
text = inp.read_text(encoding='utf-8')
lines = text.splitlines()
body: list[str] = []
in_list = False

for line in lines:
    s = line.rstrip()
    if s.startswith('### '):
        if in_list:
            body.append('</ul>')
            in_list = False
        body.append(f'<h3>{html.escape(s[4:])}</h3>')
    elif s.startswith('## '):
        if in_list:
            body.append('</ul>')
            in_list = False
        body.append(f'<h2>{html.escape(s[3:])}</h2>')
    elif s.startswith('# '):
        if in_list:
            body.append('</ul>')
            in_list = False
        body.append(f'<h1>{html.escape(s[2:])}</h1>')
    elif s.startswith('- '):
        if not in_list:
            body.append('<ul>')
            in_list = True
        body.append(f'<li>{html.escape(s[2:])}</li>')
    elif not s.strip():
        if in_list:
            body.append('</ul>')
            in_list = False
    else:
        if in_list:
            body.append('</ul>')
            in_list = False
        body.append(f'<p>{html.escape(s)}</p>')

if in_list:
    body.append('</ul>')

html_doc = """<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>{title}</title>
<style>
body {{ font-family: Georgia, serif; color:#222; margin:0; background:#f4f1ea; }}
main {{ max-width: 960px; margin: 40px auto; background:#fffdf9; padding: 56px 64px; box-shadow: 0 8px 30px rgba(0,0,0,.08); border-radius: 12px; }}
h1,h2,h3 {{ font-family: Arial, sans-serif; color:#111; line-height:1.25; }}
h1 {{ font-size: 2.1rem; margin: 0 0 1rem; }}
h2 {{ font-size: 1.35rem; margin-top: 2rem; padding-top: .75rem; border-top: 1px solid #e7decf; }}
h3 {{ font-size: 1.08rem; margin-top: 1.3rem; }}
p, li {{ font-size: 1rem; line-height: 1.72; }}
ul {{ padding-left: 1.4rem; }}
code {{ background:#f2eee6; padding:.1rem .3rem; border-radius:4px; }}
@media (max-width: 700px) {{ main {{ margin: 0; border-radius: 0; padding: 28px 20px; }} }}
</style>
</head>
<body>
<main>
{body}
</main>
</body>
</html>""".format(title=html.escape(title), body=''.join(body))

out.write_text(html_doc, encoding='utf-8')
