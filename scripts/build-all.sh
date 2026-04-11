#!/bin/bash
set -e
./scripts/build-digibyte.sh
./scripts/build-ckpool.sh
./scripts/build-ckstats.sh
echo "All components built."
