#!/usr/bin/env bash

TAR_URL="https://artifactory.nathanrahm.com/artifactory/third-party/SwarmUI/SwarmUI.tar"
TMP_TAR="/tmp/SwarmUI.tar"

# Check if directory is empty
if [ -z "$(ls -A "/SwarmUI/")" ]; then
    echo "Directory is empty — downloading and extracting..."
    curl -L "$TAR_URL" -o "$TMP_TAR"
    tar -xzf "$TMP_TAR" -C "/"
    echo "Extraction complete."
else
    echo "Directory is not empty — skipping download/extraction."
fi

echo "Continuing with remaining commands..."

/SwarmUI/launchtools/docker-standard-inner.sh
