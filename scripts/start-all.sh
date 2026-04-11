#!/bin/bash
set -e
./scripts/start-digibyte.sh
sleep 5
./scripts/start-ckpool.sh &
sleep 2
./scripts/start-ckstats.sh &
echo "Full DigiByte mining stack starting."
