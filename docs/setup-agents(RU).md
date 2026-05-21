# Установка AI-агентов

## Hermes

- GitHub: https://github.com/NousResearch/hermes-agent
- Документация: https://hermes-agent.nousresearch.com/docs
- Установка: `curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash`
- Требования: Python 3.11+, Node.js 18+, Git, WSL (если Windows)
- Настройка: `hermes setup` → `hermes model` → введите API-ключ
- Память: `~/.hermes/memories/`, `~/.hermes/SOUL.md`, `~/.hermes/USER.md`
- Скилы: `~/.hermes/skills/`, `hermes skills tap add &lt;owner/repo&gt;`

## OpenClaw

- GitHub: https://github.com/openclaw/openclaw
- Установка: `npm install -g openclaw@latest` → `openclaw onboard --install-daemon`
- Или из исходников: `git clone` → `pnpm install` → `pnpm openclaw setup`
- Конфиг: `openclaw.json`
- Память: `openclaw plugins install @mem0/openclaw-mem0`
- Скилы: `openclaw agents add`, `npx clawhub install &lt;skill&gt;`

## Anti-Gravity

- YouTube-гайд: https://www.youtube.com/watch?v=4gxd9A4L0PU
- Установка: Docker (`docker run anti-gravity`) или Python (`pip install anti-gravity`)
- Конфиг: `config.yaml`
- Плагины: через marketplace или вручную

## Обязательные компоненты

1. **Ядро** — Hermes / OpenClaw / Anti-Gravity
2. **Python 3.11+ / Node.js 18+ / Git**
3. **Модель LLM** — API-ключ или локальная (Ollama)
4. **Память** — MEMORY.md, Mem0, LanceDB, USER.md
5. **Скилы** — SKILL.md, Skills Hub, ClawHub
6. **Личность** — SOUL.md, AGENTS.md, TOOLS.md
7. **Инструменты** — Terminal, Git, Web Search (Brave API)

## Опционально

- Мессенджеры (Telegram Bot, Discord, Slack)
- Cron / планировщик задач
- MCP серверы
- Auto-memory на блокчейне (Autonomys)
