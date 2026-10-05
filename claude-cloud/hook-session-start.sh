#!/usr/bin/env bash

# SessionStart hook: refreshes the config, then injects the workflow rules as context so they are
# present from the first turn, alongside the environment's own attribution instructions.

set -o errexit -o pipefail -o nounset

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$script_dir/sync.sh"

jq -nc --rawfile ctx "$script_dir/hook-reminder.txt" \
  '{hookSpecificOutput:{hookEventName:"SessionStart",additionalContext:$ctx}}'
