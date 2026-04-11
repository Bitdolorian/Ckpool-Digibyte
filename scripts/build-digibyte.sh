#!/bin/bash
set -e
cd "$(dirname "$0")/../digibyte-core"
./autogen.sh
./configure --without-gui
make -j"$(nproc)"
echo "DigiByte Core built."
