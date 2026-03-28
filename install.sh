#!/usr/bin/env bash
set -euo pipefail

# claude-test-orchestrator installer
# Copies the test orchestration skill and both subagents into .claude/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SKILL_DIR=".claude/skills/creo-test"
AGENT_DIR=".claude/agents"

echo "Installing claude-test-orchestrator..."

# Create directories
mkdir -p "$SKILL_DIR"
mkdir -p "$AGENT_DIR"

# Copy skill
cp "$SCRIPT_DIR/skills/creo-test/SKILL.md" "$SKILL_DIR/SKILL.md"

# Copy agents
cp "$SCRIPT_DIR/agents/creo-unit-test.md" "$AGENT_DIR/creo-unit-test.md"
cp "$SCRIPT_DIR/agents/creo-e2e-test.md" "$AGENT_DIR/creo-e2e-test.md"

echo "Installed:"
echo "  $SKILL_DIR/SKILL.md"
echo "  $AGENT_DIR/creo-unit-test.md"
echo "  $AGENT_DIR/creo-e2e-test.md"
echo ""
echo "Done. Use: /creo test unit | e2e | plan | coverage"
