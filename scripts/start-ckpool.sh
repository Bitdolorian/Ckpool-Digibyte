#!/bin/bash
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT/ckpool-source"
./ckpool -c "$ROOT/configs/ckpool.conf.example"
