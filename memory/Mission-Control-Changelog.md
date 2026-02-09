# Mission Control Changelog

_A running log of all changes and improvements to Mission Control_

---

## 2026-02-06 - Big Feature Day

### ✅ Refresh Button
- Added "🔄 Refresh" button to Mission Control header
- Solves connection/loading issues without terminal commands
- Simply click to reload all data

### ✅ Mission Control Changelog
- New doc in Docs sidebar (last item)
- Tracks all Mission Control changes over time
- Auto-updates as new features are added

### ✅ Task System Built
**Script:** `/scripts/tasks.js`

**Two task types:**
- **Standalone tasks** - Independent tasks ("Call mom")
- **Project tasks** - Linked to projects with dependencies

**Task dependencies:**
- Tasks can be ordered (1 → 2 → 3 → 4)
- Locked tasks show 🔒
- Completing unlocks dependent tasks

**Commands:**
```
node tasks.js list                              # Show all tasks
node tasks.js add-standalone "Call mom"         # Independent task
node tasks.js add "Research" --project=X --phase=brief
node tasks.js complete <id>                    # Complete & unlock dependents
node tasks.js generate "Project Name" "phase"   # Auto-generate phase tasks
```

### ✅ Project Page Tasks Display
- Tasks appear in project pages under "Phase Tasks"
- Grouped by phase
- Shows locked/unlocked status
- Click to alert "tell Friday to complete"

### ✅ 10 AM Questions Working
- Cron → system event → runs script → sends to Telegram
- Tested and confirmed working

---

## 2026-02-05

### Initial Build

#### Mission Control Dashboard
- **Tabs:** Dashboard, Docs, Ideas
- **Dashboard:** Kanban-style project tracking
- **Docs:** Searchable sidebar with markdown rendering
- **Ideas:** Idea pipeline with approve/defer/reject actions

#### Project Pages
- Individual project pages at `/mission-control/projects/[project].html`
- Timeline view showing project phases
- Action items with checkboxes

#### Features
- No frameworks - pure HTML/CSS/JS
- Dynamic markdown loading from `/memory/`
- Project categories: Pastor, Writer, Personal, Entrepreneur

---

## How Chris Can Use Tasks

**Tell Friday to:**
- "Add a standalone task: [title]"
- "Generate tasks for [project] [phase]"
- "Complete task [id]"

**Friday will:**
- Add/manage tasks via `/scripts/tasks.js`
- Track dependencies and locking
- Show tasks in project pages
- Ask about locked tasks when ready
