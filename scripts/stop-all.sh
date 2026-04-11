#!/bin/bash
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
if [ -x "$ROOT/digibyte-core/src/digibyte-cli" ]; then
  "$ROOT/digibyte-core/src/digibyte-cli" -datadir="$ROOT/data/digibyte" stop || true
fi
pkill -f ckpool || true
pkill -f "node .*ckstats" || true
echo "All services stopped."
