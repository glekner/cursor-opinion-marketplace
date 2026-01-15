---
description: Get OpenAI Codex's opinion on the current topic or question
argument-hint: "[additional context or specific question]"
allowed-tools:
  - Bash
  - Read
  - Glob
  - Grep
---

# Ask Codex for Opinion

The user wants to get OpenAI Codex's perspective as a second opinion.

## User's Additional Context

$ARGUMENTS

## Important: This is a SLOW operation

Codex runs in non-interactive mode and may take time to analyze and respond. **Expect the command to take 2-5 minutes to complete.** This is normal behavior, not a timeout issue.

When calling Bash, you MUST set a long timeout:
- Use `timeout: 600000` (10 minutes) for the Bash tool call

## Your Task

1. **Summarize the Current Context**: Review the entire conversation and identify:
   - What problem or question is being discussed
   - What code or files are relevant
   - What approaches have been considered
   - What the user's constraints and preferences are
   - If additional context was provided above (in "User's Additional Context"), prioritize that as the specific question or focus area

2. **Build a Comprehensive Prompt**: Create a detailed prompt for Codex that includes all relevant context. The prompt should be self-contained so Codex can understand the situation without seeing our conversation.

3. **Call Codex**: Execute the following command with your constructed prompt.

   **CRITICAL**: Set timeout to 600000ms (10 minutes):
   ```bash
   # timeout: 600000
   ${CLAUDE_PLUGIN_ROOT}/scripts/ask-codex.sh "YOUR_COMPREHENSIVE_PROMPT"
   ```

   If the prompt is very long, you can pipe it:
   ```bash
   # timeout: 600000
   echo "YOUR_COMPREHENSIVE_PROMPT" | ${CLAUDE_PLUGIN_ROOT}/scripts/ask-codex.sh
   ```

4. **Present Codex's Response**: Share what Codex said with the user and integrate it into our discussion.

5. **Synthesize Opinions**: Compare your own analysis with Codex's response:
   - Highlight points of agreement
   - Explain any differences in perspective
   - Provide a unified recommendation that considers both viewpoints

## Notes

- **The command will take several minutes** - this is expected, be patient
- If the `codex` command is not found, inform the user they need to install the Codex CLI (`npm install -g @openai/codex`)
- Always be transparent that this is Codex's opinion, not your own
