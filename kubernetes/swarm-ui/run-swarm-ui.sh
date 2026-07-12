#!/usr/bin/env bash
set -euo pipefail

TAR_URL="https://artifactory.nathanrahm.com/artifactory/third-party/SwarmUI/SwarmUI-0.9.8-Beta.tar.gz"
TMP_TAR="/tmp/SwarmUI.tar"

# Check if directory is empty
if [ -z "$(ls -A "/SwarmUI/")" ]; then
    echo "Directory is empty — downloading and extracting..."
    curl -L "$TAR_URL" -o "$TMP_TAR"
    tar --no-same-owner --strip-components=1 -xzf "$TMP_TAR" -C "/SwarmUI"
    echo "Extraction complete."
else
    echo "Directory is not empty — skipping download/extraction."
fi

echo "Continuing with remaining commands..."

/SwarmUI/launchtools/docker-standard-inner.sh
