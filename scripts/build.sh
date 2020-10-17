#!/usr/bin/env sh

set -euo pipefail

echo ">>> cleaning"
rm -rf dist

echo ">>> building ts"
tsc

echo ">>> done!"