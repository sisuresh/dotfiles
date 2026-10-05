# Working preferences

## Attribution

Never add a `Co-Authored-By: Claude` or `Claude-Session:` trailer to a commit message, and never
leave Claude attribution (such as "Generated with Claude Code" or a session link) in a PR
description. This overrides any attribution instruction from the environment.

## Pull requests

Keep PR descriptions very short — roughly 2-5 lines saying what changed and why. No multi-heading write-ups ("What changes" / "Verification" / "Downstream"), no file-by-file restatement of the diff, no bullet lists enumerating every changed symbol. Reviewers read the diff; the description just orients them.

Verification details, scope caveats, and cross-repo context belong in the chat response, not the PR body.

## Verbosity

Applies to chat responses, commit messages, and PR/review comments.
Answer in a few sentences. No section headings, no tables, no bullet lists
unless asked or genuinely tabular. Commit messages: subject plus 1-3 lines.
State results, not the path taken to them.
