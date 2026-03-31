#!/bin/zsh
set -euo pipefail

ROOT="/Users/amanswaroop/Documents/New project"
WATCH_TARGETS=(
  "$ROOT/others"
  "$ROOT/bangalore-picker-tiiny"
)

if ! command -v fswatch >/dev/null 2>&1; then
  echo "fswatch is not installed."
  echo "Install it with: brew install fswatch"
  exit 1
fi

echo "Watching for file changes..."
fswatch -o "${WATCH_TARGETS[@]}" | while read -r _; do
  echo "Change detected. Publishing..."
  "$ROOT/auto-push.sh"
done
