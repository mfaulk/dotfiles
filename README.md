# dotfiles

Personal configuration files for macOS and Fedora.

## Structure

```
claude/        # Claude Code config (CLAUDE.md, settings.json)
codex/         # Codex CLI config (AGENTS.md, config.toml)
fedora/        # Fedora: bashrc, bash_aliases, emacs
macOS/         # macOS: zshrc, gitconfig, emacs, claude settings, codex config
```

## Usage

### Sync Claude dotfiles

Copy the latest `~/.claude/CLAUDE.md` and `settings.json` into this repo:

```sh
./claude/sync.sh
```

### Sync Codex dotfiles

Copy the latest `~/.codex/AGENTS.md` and `config.toml` into this repo:

```sh
./codex/sync.sh
```

### Symlink platform configs

Symlink or copy the files for your platform to their expected locations. For example, on Fedora:

```sh
ln -sf ~/projects/dotfiles/fedora/bashrc ~/.bashrc
ln -sf ~/projects/dotfiles/fedora/bash_aliases ~/.bash_aliases
ln -sf ~/projects/dotfiles/fedora/emacs.d/init.el ~/.emacs.d/init.el
```

On macOS:

```sh
ln -sf ~/projects/dotfiles/macOS/zshrc ~/.zshrc
ln -sf ~/projects/dotfiles/macOS/gitconfig ~/.gitconfig
ln -sf ~/projects/dotfiles/macOS/emacs.d/init.el ~/.emacs.d/init.el
```
