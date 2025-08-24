#!/usr/bin/env bash
set -euo pipefail
# Run package tests then example tests to avoid package resolution issues when running from repo root
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"
echo "Running package tests..."
flutter test --concurrency=1 -r expanded
STATUS=$?
if [ $STATUS -ne 0 ]; then
  echo "Package tests failed with status $STATUS"
  exit $STATUS
fi

echo "Running example tests (cd example)..."
cd "$ROOT_DIR/example"
flutter test --concurrency=1 -r expanded
STATUS=$?
if [ $STATUS -ne 0 ]; then
  echo "Example tests failed with status $STATUS"
  exit $STATUS
fi

echo "All tests passed"
