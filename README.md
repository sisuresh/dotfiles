# dotfiles

`claude-cloud/` configures Claude Code cloud sessions: it installs `~/.claude/CLAUDE.md` and
`~/.claude/settings.json`, and adds hooks that keep Claude attribution out of commits and PRs.

To use it, set the cloud environment's setup script to:

```
git clone https://github.com/sisuresh/dotfiles ~/dotfiles && ~/dotfiles/claude-cloud/install.sh
```
