#!/bin/bash
#
# delegate-cursor.sh - Delegate code changes to Cursor agent
#
# Usage: ./delegate-cursor.sh "task prompt" [workspace-path]
#
# Environment variables (optional):
#   CURSOR_MODEL       - Model to use (default: gpt-5.2-codex)
#

set -e

# Configuration with defaults
CURSOR_MODEL="${CURSOR_MODEL:-gpt-5.2-codex}"

# Get prompt from first argument
PROMPT="$1"

# Get workspace from second argument or use current directory
WORKSPACE="${2:-$(pwd)}"

if [ -z "$PROMPT" ]; then
    echo "Error: No task prompt provided" >&2
    echo "Usage: delegate-cursor.sh \"task description\" [workspace-path]" >&2
    exit 1
fi

# Check if cursor agent CLI is available
if ! command -v agent &> /dev/null; then
    echo "Error: 'agent' command not found. Is Cursor agent CLI installed?" >&2
    exit 1
fi

echo "Delegating task to Cursor..."
echo "Workspace: $WORKSPACE"
echo "---"

# Call cursor agent WITH workspace flag
# --force allows tool execution, sandbox disabled for file changes
agent -p "$PROMPT" \
    --model "$CURSOR_MODEL" \
    --output-format text \
    --workspace "$WORKSPACE" \
    --approve-mcps \
    --sandbox disabled \
    --force
