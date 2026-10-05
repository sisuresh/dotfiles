#!/usr/bin/env bash

# Stop hook: blocks the stop once to re-inject the workflow rules so Claude checks it complied
# before finishing. The next Stop arrives with stop_hook_active:true and is let through, so this
# never loops.

set -o errexit -o pipefail -o nounset

input=$(cat)
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$script_dir/sync.sh"

if [[ $(jq -r '.stop_hook_active // false' <<<"$input") == true ]]; then
  exit 0
fi

reason="Before finishing, verify this session followed these rules; fix anything that does not comply, then stop again. Do the verification silently: say nothing about the checks or that everything is fine. Only produce output if something did not comply, and then only about what you fixed.
$(cat "$script_dir/hook-reminder.txt")"
jq -nc --arg reason "$reason" '{decision:"block",reason:$reason}'
