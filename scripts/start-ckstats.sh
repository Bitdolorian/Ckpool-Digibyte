#!/bin/bash
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT/ckstats"
if [ ! -f .env ]; then cp "$ROOT/configs/ckstats.env.example" .env; fi
npm run start
