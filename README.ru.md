[English version](README.md)
##AI Agent Dual Boot Isolation

Изоляция AI-агентов (Hermes, OpenClaw, Anti-Gravity) через dual boot Windows + BitLocker.
Бесплатно. Железное разделение. Нулевая стоимость.

---

## Суть

Два независимых Windows на одном компьютере:

- **Windows Твой** — личные данные, пароли, банки, Telegram. Зашифрован BitLocker.
- **Windows ИИ** — только AI-агент и рабочие задачи. Без личных данных.

Переключение через меню загрузки при включении компьютера.

---

## Почему это безопасно

| Угроза | Защита |
| --- | --- |
| Агент получает admin-права | Он admin только внутри Windows ИИ |
| Доступ к диску с данными | Диск зашифрован BitLocker, пароль не вводится в Windows ИИ |
| Prompt injection | Даже если обманут — действия ограничены пустой системой |
| Кража паролей | Паролей нет в Windows ИИ, некуда лезть |

---

## Что нужно

- Свободное место на диске (~400 ГБ)
- Флешка для установки Windows (опционально — для ключа BitLocker)
- Интернет

---

## Схема разделов

```
┌─────────────────────────────────────────────────────┐
│  Диск SSD/HDD                                        │
├────────────────────────┬────────────────────────────┤
│  Windows Твой (400 ГБ)  │  Windows ИИ (400 ГБ)       │
│  ├─ Профиль пользователя│  ├─ AI-агент                │
│  ├─ Браузеры с паролями │  ├─ Рабочие файлы           │
│  ├─ Telegram            │  ├─ Браузер (чистый)        │
│  ├─ Документы           │                              │
│  ├─ BitLocker включён   │  ├─ BitLocker НЕ включён   │
│                         │  └─ Нет личных данных       │
├────────────────────────┴────────────────────────────┤
│  Загрузчик (меню выбора Windows при старте)          │
└─────────────────────────────────────────────────────┘
```

---

## Пошаговая настройка (кратко)

### 1. Создать раздел из диска C

`Win + X` → Управление дисками → Правый клик на Диск C: → Сжать том → 400000 МБ → Создать простой том.

### 2. Включить BitLocker на Windows Твой

`Win + S` → BitLocker → Управление BitLocker → Включить для диска C: → Сохранить ключ в Microsoft аккаунт (или флешку/распечатку) → Ввод пароля при запуске.

### 3. Установить Windows ИИ

Скачать ISO с microsoft.com → Записать на флешку через Rufus → Перезагрузить → F12 (загрузка с флешки) → Выборочная установка → Указать свободный раздел 400 ГБ.

### 4. Настроить меню загрузки

После установки при включении появится меню: Windows Твой / Windows ИИ. Выбор стрелками → Enter.

### 5. Защита Windows ИИ

- **UAC на максимум**: Панель управления → Учётные записи → Изменить параметры контроля учётных записей → Всегда уведомлять.
- **Запрет отключения Защитника**: `Win + R` → `gpedit.msc` → Конфигурация компьютера → Административные шаблоны → Компоненты Windows → Антивирусная программа Microsoft Defender → Выключить антивирусную программу → Отключено.
- **Образ диска**: Установить Macrium Reflect Free → Создать образ всего диска Windows ИИ → Сохранить на внешний диск.

### 6. Установить AI-агент

См. раздел "Установка AI-агентов" ниже.

---

## Правила использования

| Действие | Когда |
| --- | --- |
| Загружать Windows Твой | Банки, личное, Telegram, покупки, игры |
| Загружать Windows ИИ | Только работа с AI-агентом |
| Не вводить пароль BitLocker в Windows ИИ | Иначе агент получит доступ |
| Не монтировать диск Windows Твой в Windows ИИ | Windows не покажет его, если BitLocker включён |

---

## Ограничения

- Перезагрузка при переключении между системами
- AI-агент не работает, пока вы в Windows Твой
- Цена за безопасность: удобство.

---

## Сравнение с альтернативами

| Способ | Стоимость | Надёжность | Удобство |
| --- | --- | --- | --- |
| Отдельный ПК | 5000-30000 ₽ | Максимум | Удобно |
| **Dual boot (этот)** | **0 ₽** | **Высокая** | **Среднее** |
| VM / Docker | 0 ₽ | Средняя | Удобно |
| Облако | Подписка | Средняя | Удобно |

---

## Установка AI-агентов

### Hermes

- GitHub: https://github.com/NousResearch/hermes-agent
- Документация: https://hermes-agent.nousresearch.com/docs
- Установка: `curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash`
- Требования: Python 3.11+, Node.js 18+, Git, WSL (если Windows)
- Память: `~/.hermes/memories/`, `~/.hermes/SOUL.md`, `~/.hermes/USER.md`
- Скилы: `~/.hermes/skills/`, `hermes skills tap add <owner/repo>`
- Конфиг: `~/.hermes/config.yaml`, `~/.hermes/.env`

### OpenClaw

- GitHub: https://github.com/openclaw/openclaw
- Установка: `npm install -g openclaw@latest` → `openclaw onboard --install-daemon`
- Или из исходников: `git clone` → `pnpm install` → `pnpm openclaw setup`
- Конфиг: `openclaw.json`
- Память: Mem0 (`openclaw plugins install @mem0/openclaw-mem0`), LanceDB (встроено)
- Скилы: `openclaw agents add`, ClawHub (`npx clawhub install <skill>`)

### Anti-Gravity

- YouTube-гайд: https://www.youtube.com/watch?v=4gxd9A4L0PU
- Установка: Docker (`docker run anti-gravity`) или Python (`pip install anti-gravity`)
- Конфиг: `config.yaml`
- Плагины: через marketplace или вручную

---

## Что устанавливать в AI-агент

### Обязательно

1. **Ядро** — Hermes / OpenClaw / Anti-Gravity
2. **Python 3.11+ / Node.js 18+ / Git**
3. **Модель LLM** — API-ключ (Claude, GPT-4o, Gemini) или локальная (Ollama)
4. **Память** — MEMORY.md, Mem0, LanceDB, USER.md
5. **Скилы** — SKILL.md, Skills Hub, ClawHub
6. **Личность** — SOUL.md, AGENTS.md, TOOLS.md
7. **Инструменты** — Terminal, Git, Web Search (Brave API)

### Опционально

- Мессенджеры (Telegram Bot, Discord, Slack)
- Cron / планировщик задач
- MCP серверы
- Auto-memory на блокчейне (Autonomys)

---

## Лицензия

MIT

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
