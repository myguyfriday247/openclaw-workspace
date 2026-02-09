# Development Environment Setup

_Auto-development system for overnight app building_

---

## Vision

Chris gives me a project brief → I build apps overnight → Morning demo

---

## Software Stack

### Core (Required)

| Software | Purpose | Install Method |
|----------|---------|----------------|
| **Node.js** | JavaScript runtime | `brew install node` |
| **npm** | Package manager | Comes with Node |
| **Git** | Version control | `brew install git` |
| **VS Code** | Editor/IDE | `brew install --cask visual-studio-code` |

### Frameworks & Tools (As Needed)

| Software | Purpose | Install |
|----------|---------|---------|
| **Supabase CLI** | Local Supabase dev | `brew install supabase` |
| **React** | Frontend UI library | `npx create-react-app` |
| **Next.js** | Full-stack React | `npx create-next-app` |
| **Vue.js** | Frontend framework | `npm create vue@latest` |
| **Tailwind CSS** | Styling | `npm install -D tailwindcss` |
| **PostgreSQL** | Database | `brew install postgresql` |

### AI/Development Tools

| Software | Purpose | Install |
|----------|---------|---------|
| **Claude Code** | AI coding agent | `npm install -g @anthropic-ai/claude-code` |
| **Codex CLI** | OpenAI coding | `npm install -g @openai/codex` |

---

## Installation Checklist

```bash
# 1. Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install Node.js
brew install node

# 3. Install Git
brew install git

# 4. Install VS Code
brew install --cask visual-studio-code

# 5. Install Supabase CLI
brew install supabase

# 6. Install Claude Code (optional, for AI coding)
npm install -g @anthropic-ai/claude-code
```

---

## Workflow

### 1. Project Brief (Chris)
- Create a markdown file in `~/Desktop/OpenClaw-Workspace/Projects/`
- Include: Purpose, features, design preferences, Supabase needs

### 2. Planning (Me)
- Read brief
- Design architecture
- Create project structure
- Set up Supabase schema (if needed)

### 3. Development (Overnight)
- Build frontend
- Set up Supabase tables
- Connect APIs
- Test functionality

### 4. Morning Demo (Chris)
- I present working app
- Chris reviews
- Feedback → Iteration

---

## Project Structure

```
~/Desktop/OpenClaw-Workspace/Projects/
├── [project-name]/
│   ├── README.md           # Project brief
│   ├── src/                # Source code
│   ├── public/             # Static assets
│   ├── supabase/           # Supabase config
│   └── package.json        # Dependencies
```

---

## Supabase Integration

### Local Development
```bash
cd project-folder
supabase init
supabase start
```

### Remote Sync
```bash
supabase link --project-ref YOUR_PROJECT_ID
supabase db push
```

---

## Key Benefits

1. **Overnight development** — I build while you sleep
2. **Version control** — Git tracks all changes
3. **Supabase ready** — Full-stack capability
4. **AI assistance** — Claude Code can help debug
5. **Morning delivery** — Working apps by breakfast

---

## Next Steps

1. **Run installations** — Execute the install commands above
2. **Test environment** — Create a simple "Hello World" app
3. **First project** — Chris gives first brief
4. **Iterate** — Refine workflow based on experience

---

_Last Updated: February 4, 2026_
