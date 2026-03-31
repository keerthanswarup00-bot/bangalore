#!/bin/zsh
set -euo pipefail

ROOT="/Users/amanswaroop/Documents/New project"
LOCK_DIR="$ROOT/.publish-lock"

if ! mkdir "$LOCK_DIR" 2>/dev/null; then
  exit 0
fi

trap 'rmdir "$LOCK_DIR"' EXIT

"$ROOT/publish.sh"
