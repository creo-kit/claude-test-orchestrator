#!/usr/bin/env bash
set -euo pipefail

# claude-test-orchestrator uninstaller
# Removes the test orchestration skill and both subagents from .claude/

SKILL_DIR=".claude/skills/creo-test"
AGENT_DIR=".claude/agents"

echo "Uninstalling claude-test-orchestrator..."

# Remove skill
if [ -f "$SKILL_DIR/SKILL.md" ]; then
  rm "$SKILL_DIR/SKILL.md"
  rmdir "$SKILL_DIR" 2>/dev/null || true
  echo "  Removed $SKILL_DIR/SKILL.md"
fi

# Remove agents
for agent in creo-unit-test.md creo-e2e-test.md; do
  if [ -f "$AGENT_DIR/$agent" ]; then
    rm "$AGENT_DIR/$agent"
    echo "  Removed $AGENT_DIR/$agent"
  fi
done

echo ""
echo "Done. claude-test-orchestrator has been removed."
