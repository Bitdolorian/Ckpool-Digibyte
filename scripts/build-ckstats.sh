#!/bin/bash
set -e
cd "$(dirname "$0")/../ckstats"
if [ ! -d node_modules ]; then npm install; fi
npm run build
echo "CKStats built."
