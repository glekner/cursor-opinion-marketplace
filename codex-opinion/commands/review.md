---
description: Send git diff to Codex for code review
allowed-tools:
  - Bash
  - Read
  - Glob
  - Grep
---

# Codex Code Review

The user wants Codex to review current git changes.

## Important: This is a READ-ONLY operation

Codex will analyze the diff but will NOT make any changes to files. This is a SLOW operation - expect 2-5 minutes.

When calling Bash, you MUST set a long timeout:
- Use `timeout: 600000` (10 minutes) for the Bash tool call

## Your Task

1. **Check for Git Repository**: Verify we're in a git repository:
   ```bash
   git rev-parse --git-dir 2>&1
   ```
   If this fails, inform the user they're not in a git repository.

2. **Gather Git Changes**: Get both staged and unstaged changes:
   ```bash
   git diff HEAD
   ```

   If that returns empty (no commits yet or no changes), try:
   ```bash
   git diff
   ```

   Or for only staged changes:
   ```bash
   git diff --cached
   ```

3. **Validate Changes Exist**: If no changes are found in any of the above, inform the user there are no uncommitted changes to review.

4. **Send to Codex for Review**: Pipe the diff to the review script.

   **CRITICAL**: Set timeout to 600000ms (10 minutes):
   ```bash
   # timeout: 600000
   git diff HEAD | "${CLAUDE_PLUGIN_ROOT}/scripts/review-codex.sh"
   ```

5. **Present the Review**: Share Codex's code review feedback with the user clearly.

6. **Synthesize (Optional)**: If you have additional observations about the code changes, add them to complement Codex's review. Highlight points of agreement or offer different perspectives.

## Notes

- If there are no uncommitted changes, inform the user - don't call Codex
- This is a read-only operation - Codex cannot modify files
- The review focuses on practical issues: bugs, security, quality
- If the diff is very large, warn that the review may be incomplete or take longer
- If the `codex` command is not found, they need to install the Codex CLI (`npm install -g @openai/codex`)
- If auth fails, they need to configure their provider in `~/.codex/config.toml`
