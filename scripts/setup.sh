#!/bin/bash
set -e

echo "=== Ckpool-Digibyte setup ==="

if [ "$(id -u)" -ne 0 ]; then
  echo "This script should be run with sudo for package installation."
  echo "Example: sudo ./scripts/setup.sh"
  exit 1
fi

apt-get update

echo "Installing DigiByte Core build dependencies..."
apt-get install -y \
  build-essential libtool autotools-dev automake pkg-config \
  libssl-dev libevent-dev libboost-all-dev libzmq3-dev

echo "Installing CKPool build dependencies..."
apt-get install -y \
  libcurl4-openssl-dev libjansson-dev

if ! command -v node >/dev/null 2>&1; then
  echo "Installing Node.js + npm..."
  apt-get install -y nodejs npm || true
fi

echo "Setup complete. You can now run:"
echo "  ./scripts/build-all.sh"
