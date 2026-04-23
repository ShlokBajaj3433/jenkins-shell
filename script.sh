#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8083}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PUBLIC_DIR="$SCRIPT_DIR/public"

mkdir -p "$PUBLIC_DIR"

echo "Shell web server running on port $PORT"
exec python3 -m http.server "$PORT" --directory "$PUBLIC_DIR"
