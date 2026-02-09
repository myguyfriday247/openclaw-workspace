# 🎙️ Voice Interview Agent Setup Guide
## GoHighLevel AI Voice Agent for Book Interviews

---

## Overview

This guide will help you set up an AI voice agent in GoHighLevel that can call you and conduct structured interviews for "The Simple Disciple" book project (or any project). The agent will ask pre-defined questions, record your responses, and save the transcript.

---

## What You'll Need

Before starting, ensure you have:

- [ ] GoHighLevel account with AI Agents feature enabled
- [ ] A phone number connected to your GoHighLevel account
- [ ] Access to the AI Agents section in Settings
- [ ] This guide (you're reading it!)

---

## Step 1: Access AI Agents Section

1. Log in to your GoHighLevel dashboard
2. Select your sub-account
3. Navigate to **Settings** → **AI Agents**
4. Click the **Voice AI** tab

---

## Step 2: Create New Voice Agent

1. Click the blue **+ Create Agent** button in the top right
2. Select **Voice AI Agent**

---

## Step 3: Configure Agent Details

Fill in the following:

| Field | Value |
|-------|-------|
| **Agent Name** | `Interview Agent - Book Project` |
| **Business Name** | `Reimage Church` (or your preferred name) |
| **Agent Direction** | `Outbound` (we want it to call YOU) |
| **Voice** | Preview and select a voice you prefer |

**Initial Greeting Message:**
> "Hello Chris, this is your AI assistant calling to conduct an interview for The Simple Disciple book project. I'll ask you a few questions and record your responses. Shall we begin?"

---

## Step 4: Set Up Agent Goals (Advanced Mode)

### Switch to Advanced Mode
1. In the "Agent Goals" section
2. Click **Switch to Advanced Mode**
3. Look for the **Prompt** field

### Copy and Paste This Prompt

```
You are conducting a structured interview for a book called "The Simple Disciple" about discipleship for everyday believers.

YOUR TASK:
- Ask each question one at a time
- Wait for a complete response before moving on
- Ask follow-up questions if responses are too brief
- Be conversational but focused
- Take notes on key insights shared

THE INTERVIEW QUESTIONS:
1. What does discipleship mean to you personally?

2. Describe a time when you saw someone's faith grow significantly. What happened?

3. What are the biggest obstacles you see for Christians who want to grow spiritually?

4. If you could teach someone just three practices for growing closer to Jesus, what would they be?

5. How has community (church, small group, friends) played a role in your spiritual growth?

6. What's one misconception about discipleship that you'd like to clear up?

7. What does a "typical" disciple of Jesus look like in everyday life?

8. What would make discipleship feel more achievable for busy Christians?

9. Is there anything else you'd like to share about what discipleship should look like?

WHEN THE INTERVIEW IS COMPLETE:
- Thank the interviewee for their time
- Confirm that their responses have been recorded
- End the call warmly
```

---

## Step 5: Configure Call Transfer (Optional)

If you want the option to jump to a live conversation:

1. Find **Call Transfer** in the settings
2. Set to: **Manual** (you can transfer if needed)
3. Add your phone number as the transfer destination

---

## Step 6: Set Up Call Recording & Transcript

1. Scroll to **Email Notifications** section
2. Configure to send transcripts to your email after each call
3. Or configure a **Workflow** to save transcripts to a specific location

**Recommended Workflow Setup:**
- Trigger: After call ends
- Action: Create note in contact record
- Action: Send email with transcript
- Action: Update custom field with interview status

---

## Step 7: Assign Phone Number

1. Go to the **Phone and Availability** tab
2. Under **Assign Phone Number**
3. Select your GoHighLevel phone number
4. Configure working hours (set to 24/7 for outbound calls)

---

## Step 8: Test Your Agent

1. In the **Phone and Availability** tab
2. Look for **Test Your Agent** panel on the right
3. Select **Outbound** as the scenario
4. Enter your phone number
5. Click **Call Me**

**During the test:**
- Answer the call
- Have a conversation with the agent
- Evaluate how it handles your responses

**After the test:**
- Review Call History
- Read the Transcript
- Check the Summary
- Refine your prompt if needed

---

## Step 9: Make Your First Real Call

To have the agent call you for an actual interview:

### Option A: Manual Call (Recommended for Testing)
1. Go to **AI Agents** → **Voice AI**
2. Find your Interview Agent
3. Click the three dots menu
4. Select **Test Agent**
5. Enter your number and start the call

### Option B: Schedule Automatic Calls
You can set up a workflow to trigger the agent to call you:
1. Create a Workflow in GoHighLevel
2. Set trigger: Schedule (e.g., "Every Monday at 10 AM")
3. Action: **Run Voice AI Agent**
4. Select your Interview Agent
5. Action: **Call Contact** (your phone number)

---

## Information I'll Provide for Context

Before each interview session, you can provide me (Friday) with:

1. **Interview Focus** - What topic/questions to prioritize
2. **Current Draft Context** - Parts of the book you're currently writing
3. **Specific Follow-ups** - Questions based on previous interviews
4. **Tone Preference** - More casual, more formal, etc.

I'll update your custom prompt accordingly before each interview session.

---

## Quick Reference Card

**To start an interview:**
1. Go to Settings → AI Agents → Voice AI
2. Find "Interview Agent - Book Project"
3. Click → Test Agent
4. Enter your number → Call Me

**To edit questions:**
1. Click the agent
2. Go to Agent Goals → Advanced Mode
3. Edit the Prompt section
4. Click Evaluate to check for issues
5. Save

**To schedule regular interviews:**
1. Create a Workflow
2. Trigger: Schedule (your preferred time)
3. Action: Run Voice AI Agent → Call Contact

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Agent doesn't understand responses | Add more context in the prompt about expected answers |
| Agent talks too much | Add: "Keep responses concise" to the prompt |
| No transcript received | Check email notifications settings |
| Call doesn't connect | Verify phone number is assigned to agent |

---

## Support Resources

- GoHighLevel Help: https://help.gohighlevel.com
- Voice AI Agents Guide: https://help.gohighlevel.com/support/solutions/articles/155000004107
- Prompt Evaluator: https://help.gohighlevel.com/support/solutions/articles/155000006074

---

## Next Steps

After setup, here's our workflow:

1. **Before interview:** You tell me what topic/focus you want
2. **I update** the agent prompt with specific context
3. **You trigger** the call (manual or scheduled)
4. **Interview happens** - agent asks questions, records answers
5. **Transcript sent** to your email
6. **I review** the transcript and incorporate into the book

---

*Document created: February 5, 2026*
*Last updated: February 5, 2026*
