#!/usr/bin/env bash
# Copies the Cursor rules into a project and the Claude Code instructions into your home folder.
# usage: ./install.sh /path/to/project
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
project="${1:-.}"

mkdir -p "$project/.cursor/rules"
cp -n "$here"/cursor/rules/*.mdc "$project/.cursor/rules/" && echo "Cursor rules copied to $project/.cursor/rules (existing files kept)"

mkdir -p "$HOME/.claude"
if [ -e "$HOME/.claude/CLAUDE.md" ]; then
  echo "~/.claude/CLAUDE.md already exists, so it was left alone. Merge claude/CLAUDE.md by hand if you want it."
else
  cp "$here/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md" && echo "Claude Code instructions copied to ~/.claude/CLAUDE.md"
fi

if [ -e "$HOME/.claude/settings.json" ]; then
  echo "~/.claude/settings.json already exists, so it was left alone. Add the \"attribution\" block from claude/settings.json by hand."
else
  cp "$here/claude/settings.json" "$HOME/.claude/settings.json" && echo "Claude Code settings copied to ~/.claude/settings.json"
fi
