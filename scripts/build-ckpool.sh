#!/bin/bash
set -e
cd "$(dirname "$0")/../ckpool-source"
make clean || true
make -j"$(nproc)"
echo "CKPool-DGB built."
