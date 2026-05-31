# Research Agent Task Template

Use this template when spawning a research agent for sermon development. Copy and customize for each research task.

## Template

```
Create a comprehensive research brief for [SERIES] Week [X].

**Week**: Week [X]
**Title**: [TITLE]
**Passage**: [PASSAGE]
**Date**: [DATE]
**Series**: [SERIES NAME]

## REQUIRED: Discord Thread Setup

At the START of your research:
1. Use the message tool to send to channel 1486001884320763994:
   - Channel: discord
   - Action: send
   - To: channel:1486001884320763994
   - Message: "🧪 Research STARTED: [Title]\nPassage: [Passage]\nResearch will be posted here when complete."

2. Use the message tool to create a thread:
   - Channel: discord
   - Action: thread-create
   - channelId: "1486001884320763994"
   - threadName: "[Series] Week [X] Research: [Topic]"
   - Message: Initial research tracking message

## Research Requirements

Follow the sermon development research procedure. Create an HTML research brief that includes:

1. **Introduction & Burden** - The pastor's message burden
2. **Theological Foundation** - Deep dive into passage themes
3. **Biblical Context** - What the passage means
4. **Key Passages** - Important verses with exposition
5. **Common Objections** - Address objections
6. **Modern Commentaries** - Quotes from ESV Study Bible, IVP, scholars
7. **Sermon Application** - Main point, illustrations, call to action

## REQUIRED: Discord Thread Completion

When research is COMPLETE:
1. Use message tool to send to channel 1486001884320763994:
   - Message: "✅ Research COMPLETE: [Title]\nFile: [PATH TO HTML]\nKey findings: [3-4 bullet summary]"

2. Save the output to: [FULL PATH TO research-brief.html]

## Quality Standards
- Research should be 300+ lines with deep commentary
- Include theologian quotes and cultural context
- Use word studies for key Greek/Hebrew terms
- Match format of Defined series research brief

Save output to: [FULL PATH TO research-brief.html]
```

## Usage

When spawning research agent, customize the bracketed fields and include the Discord thread creation steps.

## Channel ID Reference
- sermon-research: 1486001884320763994
- sermon-command-center: 1481876729005080636