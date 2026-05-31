#!/usr/bin/env python3
import subprocess
import json
from datetime import datetime

now = datetime.now()
date_str = now.strftime("%A, %B %d, %Y")

digest = f"""**📖 Daily Discipleship Digest**
*{date_str}*

**Sermon Prep Pipeline — Update**

The sermon research pipeline is now operational:
- ✅ Gizmo (research agent) — wired and functional on ChatGPT
- ✅ One-command pipeline runner — draft → polish → HTML
- ✅ Discord-ready summary output (no full-text dumps)
- ✅ Moses configured for Discord-to-Gizmo delegation

**How it works:**
1. Request research in Discord → Moses creates thread in #sermon-research
2. Gizmo generates research → Claude polishes → HTML rendered
3. Moses posts summary + file links to thread
4. You review, request adjustments or say "done"

**What's next:**
- Sermon Developer agent (takes research → develops structure)
- Semester Planning agent (handles church research for series)
- Full pipeline handoffs through Moses

**Current sermon series:** God Is (Names of God) — Judges 6 (Jehovah Shalom)

Have a great Wednesday! 🙌
"""

result = subprocess.run(
    ["openclaw", "message", "--channel", "discord", "--to", "channel:1478831519874285630", "--json"],
    input=json.dumps({"action": "send", "message": digest}),
    capture_output=True, text=True
)
print(result.stdout, result.stderr)