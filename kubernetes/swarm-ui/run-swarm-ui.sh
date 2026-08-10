#!/usr/bin/env bash
set -euo pipefail

# SwarmUI version tracking
# Using master branch for MiniMax H3 support (added Aug 2026)
# Set SWARMUI_VERSION env var to force update (e.g. "master-9a4055a")
SWARMUI_VERSION="${SWARMUI_VERSION:-master-9a4055a}"
VERSION_FILE="/SwarmUI/.swarmui_version"

needs_update() {
    # Update if directory is mostly empty (only user dirs like Data, Models, Output)
    local file_count=$(find /SwarmUI -maxdepth 1 -type f 2>/dev/null | wc -l)
    [ "$file_count" -eq 0 ] && return 0
    # Update if version file missing or version changed
    [ ! -f "$VERSION_FILE" ] && return 0
    [ "$(cat "$VERSION_FILE")" != "$SWARMUI_VERSION" ] && return 0
    return 1
}

if needs_update; then
    echo "Installing/updating SwarmUI to version $SWARMUI_VERSION..."

    # Clone fresh from GitHub master
    rm -rf /tmp/SwarmUI-clone
    git clone --depth 1 https://github.com/mcmonkeyprojects/SwarmUI.git /tmp/SwarmUI-clone

    # Copy new SwarmUI files (excluding user data dirs which should remain)
    # Use rsync-like approach: copy all files except Data, Models, Output
    for item in /tmp/SwarmUI-clone/*; do
        name=$(basename "$item")
        if [[ "$name" != "Data" && "$name" != "Models" && "$name" != "Output" ]]; then
            cp -r "$item" "/SwarmUI/"
        fi
    done
    # Also copy hidden files
    for item in /tmp/SwarmUI-clone/.*; do
        name=$(basename "$item")
        if [[ "$name" != "." && "$name" != ".." && "$name" != ".git" ]]; then
            cp -r "$item" "/SwarmUI/" 2>/dev/null || true
        fi
    done

    # Mark version
    echo "$SWARMUI_VERSION" > "$VERSION_FILE"
    rm -rf /tmp/SwarmUI-clone

    echo "SwarmUI $SWARMUI_VERSION installed."
else
    echo "SwarmUI $SWARMUI_VERSION already installed — skipping update."
fi

echo "Continuing with remaining commands..."

/SwarmUI/launchtools/docker-standard-inner.sh
