# Philippians Week 1 — Research Prompt

**Title:** Joy Through Partnership
**Passage:** Philippians 1:1-11
**Date:** August 2, 2026
**Series:** Philippians

## Full Gizmo Prompt Used

```
Create a comprehensive research brief for Week 1 of the Philippians series.

**Week**: Week 1
**Title**: Joy Through Partnership
**Passage**: Philippians 1:1-11
**Date**: August 2, 2026
**Series**: Philippians

**Research Requirements:**

Create an HTML research brief that includes:

1. **Introduction & Burden** - The pastor's message burden for this week
2. **Theological Foundation** - Deep dive into the passage themes
3. **Biblical Context** - What the passage means, word studies (presbeutes, koinonia, etc.)
4. **Key Passages** - Important verses with exposition
5. **Common Objections** - Address objections like "my joy doesn't depend on others"
6. **Your Content** - Incorporate these observations from the pastor:
   - Joy is rooted in shared gospel purpose, not shared preferences
   - Paul thanks God "with joy" for their partnership - gospel-centered, not personality-based
   - Confidence anchored in God who began the work (v.6) - not human performance
   - Love that abounds in knowledge and discernment (v.9-11)

Save the output to: /Users/myguyfriday/.openclaw/workspace/mission-control/sermon-dev/Sermons/philippians/Week-1-Joy-Through-Partnership/research-brief.html

Make it comprehensive (like the Defined series research brief), not just summaries.
```

---

## Later Updated Prompt (with pastor's Series Framework)

The pastor provided a detailed Series Framework with key observations for each week. For Week 1, these observations were incorporated:

### Key Observations from Series Framework:

**Observation 1:** Joy is rooted in shared gospel purpose, not shared preferences.

Paul's joy isn't based on personality compatibility or emotional closeness—it's rooted in partnership in the gospel. These are people who are moving in the same direction, not just enjoying the same things. That kind of connection runs deeper than surface-level relationships. It creates a bond that circumstances can't easily break.

**Observation 2:** Confidence in people grows when you trust God's work in them.

Paul is confident not because the Philippians are perfect, but because God is at work in them. His trust is anchored in God's faithfulness, not their consistency. This reframes how we view others—we don't place ultimate confidence in their performance, but in God's process. It allows us to stay hopeful even when growth is slow.

**Observation 3:** Spiritual maturity is measured by growing, discerning love.

Paul prays that their love would abound more and more—but not blindly. It's a love shaped by knowledge and discernment, able to recognize what truly matters. This kind of love produces a life that is pure, steady, and fruitful. It's not just about feeling more—it's about loving better.

---

## Gizmo Pipeline Prompt (for future reference)

When running through Gizmo pipeline, use:

```bash
bash scripts/run-gizmo-pipeline.sh "phil-1-joy-partnership" \
  "Create a comprehensive research brief for Week 1 of the Philippians series. Title: Joy Through Partnership. Passage: Philippians 1:1-11. Date: August 2 2026. Series: Philippians.

PARTIAL COMPLIANCE MODE - use sources from training data. Do NOT invent quotes.

PASTORAL VOICES (from training):
- Max Lucado, Matt Chandler, Steven Furtick, Craig Groeschel, Tony Evans, Judah Smith, D.A. Carson, John Piper, Sinclair Ferguson, JD Greer

COMMENTARIES (from training):
- Matthew Henry, Charles Spurgeon, Augustine (classic)

STRUCTURE:
- Big Idea
- Theological Burden (incorporate pastor's observations above)
- Passage Overview (Phil 1:1-11)
- Word Studies (koinonia, chairo, etc.)
- Historical/Cultural Context
- Major Exegetical Insights
- Theological Themes
- Christological Trajectory
- Theologian Quotes (classic AND modern)
- Objections and Pastoral Tensions
- Sermon Application
- Main Point Options
- Cross-References

Include 5-6 commentaries and 3-4 pastoral voices per section." \
  "/path/to/philippians/Week-1-Joy-Through-Partnership" --skip-review
```

---

## Notes
- This research was originally done manually (Apr 21) at 340 lines
- Later runs through Gizmo pipeline would produce similar output with the above prompts
- Pastor's Series Framework observations should always be incorporated into the burden/theme sections
