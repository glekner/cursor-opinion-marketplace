# AI Opinion Marketplace

A Claude Code plugin marketplace containing plugins for getting second opinions from other AI coding assistants.

## Installation

```bash
# Add the marketplace
/plugin marketplace add glekner/ccli-opinion-marketplace

# Install a plugin
/plugin install cursor-opinion@ccli-opinion-marketplace
/plugin install codex-opinion@ccli-opinion-marketplace
```

## Plugins

### cursor-opinion

Delegate questions to Cursor AI agent for a second opinion during your Claude Code conversation.

**Commands:**
- `/ask-cursor [context]` - Get Cursor's opinion on the current topic
- `/delegate [task]` - Have Cursor make code changes in your project
- `/review` - Send git diff to Cursor for code review

**Prerequisites:**
- Cursor CLI (`agent` command) installed and in PATH

**Optional model override:**
```bash
export CURSOR_MODEL='claude-sonnet-4-20250514'  # default model
```

---

### codex-opinion

Delegate questions to OpenAI Codex CLI for a second opinion during your Claude Code conversation.

**Commands:**
- `/ask-codex [context]` - Get Codex's opinion on the current topic
- `/delegate [task]` - Have Codex make code changes in your project
- `/review` - Send git diff to Codex for code review

**Prerequisites:**
- Codex CLI installed: `npm install -g @openai/codex`

**Optional model override:**
```bash
export CODEX_MODEL='gpt-4o'  # override default model
```

---

## Usage

During any Claude Code conversation:

**Cursor:**
```
/ask-cursor                              # Get Cursor's opinion
/ask-cursor what about performance?      # With additional context
/delegate add error handling to api.js   # Have Cursor make changes
/review                                  # Get code review of git diff
```

**Codex:**
```
/ask-codex                               # Get Codex's opinion
/ask-codex what about performance?       # With additional context
/delegate add error handling to api.js   # Have Codex make changes
/review                                  # Get code review of git diff
```

Claude will gather context, consult the external AI, and synthesize both opinions.

## Features

- Automatically gathers full conversation context + relevant files
- Creates comprehensive mega-prompts for the external AI
- Claude synthesizes both AI perspectives
- Read-only mode for opinions/reviews, write mode for delegation

## License

MIT License
