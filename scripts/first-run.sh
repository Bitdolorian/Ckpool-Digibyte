#!/bin/bash
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "=== Ckpool-Digibyte first run ==="

[ -d "$ROOT/data/digibyte" ] || mkdir -p "$ROOT/data/digibyte"

if [ ! -f "$ROOT/configs/digibyte.conf" ] && [ -f "$ROOT/configs/digibyte.conf.example" ]; then
  cp "$ROOT/configs/digibyte.conf.example" "$ROOT/configs/digibyte.conf"
  echo "Created configs/digibyte.conf from example."
fi

if [ ! -f "$ROOT/configs/ckpool.conf" ] && [ -f "$ROOT/configs/ckpool.conf.example" ]; then
  cp "$ROOT/configs/ckpool.conf.example" "$ROOT/configs/ckpool.conf"
  echo "Created configs/ckpool.conf from example."
fi

if [ ! -f "$ROOT/ckstats/.env" ] && [ -f "$ROOT/configs/ckstats.env.example" ]; then
  cp "$ROOT/configs/ckstats.env.example" "$ROOT/ckstats/.env"
  echo "Created ckstats/.env from example."
fi

echo "Checking core directories..."
for d in digibyte-core ckpool-source ckstats; do
  if [ ! -d "$ROOT/$d" ]; then
    echo "WARNING: missing directory: $d"
  fi
done

echo "First run complete."
echo "Next steps:"
echo "  1) sudo ./scripts/setup.sh"
echo "  2) ./scripts/build-all.sh"
echo "  3) ./scripts/start-all.sh"
