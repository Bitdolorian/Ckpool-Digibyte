#!/bin/bash
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DATADIR="$ROOT/data/digibyte"
CONF="$ROOT/configs/digibyte.conf.example"
mkdir -p "$DATADIR"
"$ROOT/digibyte-core/src/digibyted" -datadir="$DATADIR" -conf="$CONF" -daemon
echo "DigiByte daemon starting."
