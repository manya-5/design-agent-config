#!/usr/bin/env bash
# Copies the config files into docs/files so the preview site shows the current versions.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p docs/files
cp cursor/rules/*.mdc claude/CLAUDE.md claude/settings.json docs/files/
echo "Synced $(ls docs/files | wc -l | tr -d ' ') files into docs/files"
