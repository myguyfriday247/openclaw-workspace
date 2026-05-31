#!/usr/bin/env node
/**
 * Mission Control Design Questions
 * Sends periodic design/architecture questions to gather requirements
 */

const today = new Date();
const dateStr = today.toLocaleDateString('en-US', { 
  weekday: 'long', 
  year: 'numeric', 
  month: 'long', 
  day: 'numeric' 
});

console.log(`MESSAGE_START
**Mission Control — Design Questions**

Hey Chris! 🏗️

Every few days I'll check in with a quick design question to help shape how Mission Control evolves. No pressure, just thinking out loud together.

---

**Today's Question:**

As we build out Mission Control for sermon prep, I'm curious:

> **How do you currently organize your research materials and notes when preparing a sermon series?**

Do you use folders, tags, a notebook, all of the above? Or is it more "I'll find it when I need it"? 😄

Reply here or tell Gizmo and I'll factor your answer into the system design.

---
*Sent automatically — Mission Control System*
MESSAGE_END
`);
