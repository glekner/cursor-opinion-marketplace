# Cursor Opinion Plugin

A Claude Code plugin that lets you get a second opinion from Cursor AI during your conversation with Claude.

## Features

- `/ask-cursor [context]` - Get Cursor's opinion on the current topic (optional additional context)
- `/delegate [task]` - Have Cursor make code changes in your project directory
- `/review` - Send git diff to Cursor for a concise code review
- Automatically gathers conversation context and relevant files
- Creates comprehensive prompts for Cursor with full context
- Claude synthesizes both AI perspectives for better recommendations

## Prerequisites

- **Cursor CLI** - The `agent` command must be available in your PATH

## Installation

This plugin is installed locally at `~/.claude/plugins/cursor-opinion/`.

To enable it in Claude Code:
```
/plugin install ~/.claude/plugins/cursor-opinion
```

Or add it to your Claude Code settings.

## Usage

### `/ask-cursor [additional context]`

Get Cursor's opinion on the current topic:
```
/ask-cursor
/ask-cursor what about performance implications?
```

Claude will gather context, consult Cursor, and synthesize both perspectives.

### `/delegate [task description]`

Have Cursor make code changes in your project:
```
/delegate add input validation to the login form
/delegate refactor the API handlers to use async/await
```

Cursor runs with write permissions in your current working directory.

### `/review`

Get a code review of your uncommitted changes:
```
/review
```

Cursor reviews your git diff and provides concise, actionable feedback.

## Configuration

Optional environment variables:

| Variable | Default | Description |
|----------|---------|-------------|
| `CURSOR_MODEL` | `claude-sonnet-4-20250514` | Override the model Cursor uses |

## Plugin Structure

```
cursor-opinion/
├── .claude-plugin/
│   └── plugin.json           # Plugin manifest
├── commands/
│   ├── ask-cursor.md         # /ask-cursor slash command
│   ├── delegate.md           # /delegate slash command
│   └── review.md             # /review slash command
├── skills/
│   └── cursor-opinion/
│       └── SKILL.md          # Skill instructions
├── scripts/
│   ├── ask-cursor.sh         # Cursor CLI wrapper for opinions
│   ├── delegate-cursor.sh    # Cursor CLI wrapper for code changes
│   └── review-cursor.sh      # Cursor CLI wrapper for code review
└── README.md
```

## Troubleshooting

**"agent command not found"**
- Ensure Cursor CLI is installed and `agent` is in your PATH

**Script permission denied**
- Run: `chmod +x ~/.claude/plugins/cursor-opinion/scripts/*.sh`
