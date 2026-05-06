#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$HOME/.claude"

# User-authored files tracked in this repo. Plugin-installed agents under
# ~/.claude/agents/ (e.g. gsd-*) are intentionally excluded.
files=(
    CLAUDE.md
    settings.json
    agents/codex-delegate.md
)

for f in "${files[@]}"; do
    src="$SOURCE_DIR/$f"
    dest="$SCRIPT_DIR/$f"
    if [[ ! -f "$src" ]]; then
        echo "skip: $src not found"
        continue
    fi
    if cmp -s "$src" "$dest" 2>/dev/null; then
        echo "unchanged: $f"
    else
        mkdir -p "$(dirname "$dest")"
        cp "$src" "$dest"
        echo "updated: $f"
    fi
done
