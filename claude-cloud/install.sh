#!/usr/bin/env bash

# Installs this repo's Claude Code config for cloud sessions. Run from the environment's setup
# script:
#   git clone https://github.com/sisuresh/dotfiles ~/dotfiles && ~/dotfiles/claude-cloud/install.sh

set -o errexit -o pipefail -o nounset

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# the hooks use jq to build their JSON output
if ! command -v jq >/dev/null 2>&1; then
  echo "Installing jq..."
  DEBIAN_FRONTEND=noninteractive apt-get update
  DEBIAN_FRONTEND=noninteractive apt-get install -y jq
fi

# the cloud runtime may run sessions as root or as claude, so seed every candidate home
echo "HOME is $HOME"
for home in "${HOME%/}" /root /home/claude; do
  [ -d "$home" ] || continue
  echo "Installing Claude config into $home/.claude..."
  HOME="$home" "$script_dir/sync.sh"
  # when run as root, hand the config to the home's owner so Claude can still write there
  if [ "$(id -u)" -eq 0 ]; then
    chown -R "$(stat -c %u:%g "$home")" "$home/.claude"
  fi
done
