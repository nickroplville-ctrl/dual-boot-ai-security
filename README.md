[Russian version](README.ru.md)
AI Agent Dual Boot Isolation

Securely isolate AI agents (Hermes, OpenClaw, Anti-Gravity) using dual boot Windows + BitLocker.
Free. Hardware-level isolation. Zero cost.

---

## The Idea

Two independent Windows installations on one computer:

- **Windows Personal** — personal data, passwords, banking, Telegram. Encrypted with BitLocker.
- **Windows AI** — AI agent and work tasks only. No personal data.

Switch via boot menu when turning on the computer.

---

## Why It's Secure

| Threat | Protection |
| --- | --- |
| Agent gets admin rights | Admin only inside Windows AI |
| Access to data drive | Drive encrypted with BitLocker, password not entered in Windows AI |
| Prompt injection | Even if tricked — actions limited to empty system |
| Password theft | No passwords in Windows AI, nothing to steal |

---

## What You Need

- Free disk space (~400 GB)
- USB flash drive for Windows installation (optional — for BitLocker key)
- Internet connection

---

## Disk Partition Scheme

```
┌─────────────────────────────────────────────────────┐
│  SSD/HDD Disk                                        │
├────────────────────────┬────────────────────────────┤
│  Windows Personal (400GB)│  Windows AI (400 GB)       │
│  ├─ User profile         │  ├─ AI agent               │
│  ├─ Browsers with passwords│  ├─ Work files             │
│  ├─ Telegram             │  ├─ Browser (clean)        │
│  ├─ Documents           │                              │
│  ├─ BitLocker ON        │  ├─ BitLocker OFF          │
│                         │  └─ No personal data       │
├────────────────────────┴────────────────────────────┤
│  Boot loader (menu to choose Windows at startup)     │
└─────────────────────────────────────────────────────┘
```

---

## Quick Setup Guide

### 1. Create partition from C: drive

`Win + X` → Disk Management → Right-click C: → Shrink Volume → 400000 MB → Create Simple Volume.

### 2. Enable BitLocker on Windows Personal

`Win + S` → BitLocker → Manage BitLocker → Turn on for C: → Save key to Microsoft account (or USB/printout) → Password at startup.

### 3. Install Windows AI

Download ISO from microsoft.com → Write to USB via Rufus → Reboot → F12 (boot from USB) → Custom install → Select free 400 GB partition.

### 4. Configure boot menu

After installation, boot menu appears: Windows Personal / Windows AI. Select with arrow keys → Enter.

### 5. Secure Windows AI

- **UAC maximum**: Control Panel → User Accounts → Change UAC settings → Always notify.
- **Disable Defender shutdown**: `Win + R` → `gpedit.msc` → Computer Configuration → Administrative Templates → Windows Components → Microsoft Defender Antivirus → Turn off Microsoft Defender → Disabled.
- **Disk image**: Install Macrium Reflect Free → Create image of entire Windows AI disk → Save to external drive.

### 6. Install AI agent

See "AI Agent Installation" section below.

---

## Usage Rules

| Action | When |
| --- | --- |
| Boot Windows Personal | Banking, personal, Telegram, purchases, games |
| Boot Windows AI | Only AI agent work |
| Do NOT enter BitLocker password in Windows AI | Otherwise agent gets access |
| Do NOT mount Windows Personal drive in Windows AI | Windows won't show it if BitLocker is on |

---

## Limitations

- Reboot required when switching systems
- AI agent does not work while you're in Windows Personal
- Price for security: convenience

---

## Comparison with Alternatives

| Method | Cost | Reliability | Convenience |
| --- | --- | --- | --- |
| Separate PC | $100-500+ | Maximum | Convenient |
| **Dual boot (this)** | **$0** | **High** | **Moderate** |
| VM / Docker | $0  | Medium | Convenient |
| Cloud | Subscription | Medium | Convenient |

---

## AI Agent Installation

### Hermes

- GitHub: https://github.com/NousResearch/hermes-agent
- Docs: https://hermes-agent.nousresearch.com/docs
- Install: `curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash`
- Requirements: Python 3.11+, Node.js 18+, Git, WSL (if Windows)
- Memory: `~/.hermes/memories/`, `~/.hermes/SOUL.md`, `~/.hermes/USER.md`
- Skills: `~/.hermes/skills/`, `hermes skills tap add <owner/repo>`
- Config: `~/.hermes/config.yaml`, `~/.hermes/.env`

### OpenClaw

- GitHub: https://github.com/openclaw/openclaw
- Install: `npm install -g openclaw@latest` → `openclaw onboard --install-daemon`
- Or from source: `git clone` → `pnpm install` → `pnpm openclaw setup`
- Config: `openclaw.json`
- Memory: Mem0 (`openclaw plugins install @mem0/openclaw-mem0`), LanceDB (built-in)
- Skills: `openclaw agents add`, ClawHub (`npx clawhub install <skill>`)

### Anti-Gravity

- YouTube guide: https://www.youtube.com/watch?v=4gxd9A4L0PU
- Install: Docker (`docker run anti-gravity`) or Python (`pip install anti-gravity`)
- Config: `config.yaml`
- Plugins: via marketplace or manually

---

## What to Install in AI Agent

### Required

1. **Core** — Hermes / OpenClaw / Anti-Gravity
2. **Python 3.11+ / Node.js 18+ / Git**
3. **LLM Model** — API key (Claude, GPT-4o, Gemini) or local (Ollama)
4. **Memory** — MEMORY.md, Mem0, LanceDB, USER.md
5. **Skills** — SKILL.md, Skills Hub, ClawHub
6. **Persona** — SOUL.md, AGENTS.md, TOOLS.md
7. **Tools** — Terminal, Git, Web Search (Brave API)

### Optional

- Messengers (Telegram Bot, Discord, Slack)
- Cron / task scheduler
- MCP servers
- Blockchain auto-memory (Autonomys)

---
## Полные гайды
## Full Guides

- [Troubleshooting (English)](docs/troubleshooting(EN).md)
- [Troubleshooting (Русский)](docs/troubleshooting(RU).md)
- [Security Details (English)](docs/security(en).md)
- [Детали безопасности (Русский)](docs/security(RU).md)
- [AI Agent Setup (English)](docs/setup-agents(EN).md)
- [Установка AI-агентов (Русский)](docs/setup-agents(RU).md)
- [Security Checklist](docs/checklist(RU\EN).md)
- [Partition Script](scripts/setup-partition(RU\EN).ps1)
---

## MIT License
