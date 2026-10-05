#!/usr/bin/env bash

# Copies this repo's Claude config into $HOME/.claude. Run by install.sh at environment setup and
# by the SessionStart/Stop hooks, so edits pulled into the clone take effect without a re-setup.

set -o errexit -o pipefail -o nounset

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.claude"
cp "$script_dir/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

# hook commands reference the scripts by absolute path, so substitute this dir for the
# placeholder as we copy.
sed "s|__CLAUDE_CLOUD_DIR__|$script_dir|g" "$script_dir/settings.json" > "$HOME/.claude/settings.json"
