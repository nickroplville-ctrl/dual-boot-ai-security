# AI Agent Setup

## Hermes

- GitHub: https://github.com/NousResearch/hermes-agent
- Docs: https://hermes-agent.nousresearch.com/docs
- Install: `curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash`
- Requirements: Python 3.11+, Node.js 18+, Git, WSL (if Windows)
- Setup: `hermes setup` → `hermes model` → enter API key
- Memory: `~/.hermes/memories/`, `~/.hermes/SOUL.md`, `~/.hermes/USER.md`
- Skills: `~/.hermes/skills/`, `hermes skills tap add <owner/repo>`

## OpenClaw

- GitHub: https://github.com/openclaw/openclaw
- Install: `npm install -g openclaw@latest` → `openclaw onboard --install-daemon`
- Or from source: `git clone` → `pnpm install` → `pnpm openclaw setup`
- Config: `openclaw.json`
- Memory: `openclaw plugins install @mem0/openclaw-mem0`
- Skills: `openclaw agents add`, `npx clawhub install <skill>`

## Anti-Gravity

- YouTube guide: https://www.youtube.com/watch?v=4gxd9A4L0PU
- Install: Docker (`docker run anti-gravity`) or Python (`pip install anti-gravity`)
- Config: `config.yaml`
- Plugins: via marketplace or manually

## Required Components

1. **Core** — Hermes / OpenClaw / Anti-Gravity
2. **Python 3.11+ / Node.js 18+ / Git**
3. **LLM Model** — API key or local (Ollama)
4. **Memory** — MEMORY.md, Mem0, LanceDB, USER.md
5. **Skills** — SKILL.md, Skills Hub, ClawHub
6. **Persona** — SOUL.md, AGENTS.md, TOOLS.md
7. **Tools** — Terminal, Git, Web Search (Brave API)

## Optional

- Messengers (Telegram Bot, Discord, Slack)
- Cron / task scheduler
- MCP servers
- Blockchain auto-memory (Autonomys)
