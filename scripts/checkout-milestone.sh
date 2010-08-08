#!/bin/bash

set +e

RELEASE="$1"

(
echo "cd google/platform/frameworks/base/"
cd google/platform/frameworks/base/
git fetch korg "$RELEASE"
git rev-parse "$RELEASE" >/dev/null 2>/dev/null || git branch "$RELEASE" --track korg/"$RELEASE"
git checkout -f "$RELEASE"
)

(
echo "cd google/platform/external/webkit/"
cd google/platform/external/webkit/
git fetch korg "$RELEASE"
git rev-parse "$RELEASE" >/dev/null 2>/dev/null || git branch "$RELEASE" --track korg/"$RELEASE"
git checkout -f "$RELEASE"
)

echo "$RELEASE fetched and checked out successfully."
