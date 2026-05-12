# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

- `.zshrc` — Z shell configuration
- `.tmux.conf` — Tmux configuration
- `.config/ghostty/config` — Ghostty terminal config
- `.config/nvim/` — Neovim config (LazyVim)
- `.config/starship.toml` — Starship prompt

## Prerequisites

```bash
brew install stow
```

## Usage

```bash
# Clone this repo
git clone <repo-url> ~/dotfiles
cd ~/dotfiles

# Create symlinks in ~ for everything in this repo
stow .

# Stow specific items only
stow .zshrc .tmux.conf .config

# Remove symlinks (does not delete the target files)
stow -D .
```

### How it works

`stow .` creates symbolic links from each file/directory in this repo into your home directory. For example, `.zshrc` here becomes `~/.zshrc` pointing back to this repo.

### Updating

After pulling changes, re-run stow to update symlinks:

```bash
git pull
stow .
```

### Troubleshooting

If stow complains about existing files, either remove the conflicting file or use `-t` to specify a different target directory. Use `stow -n .` (dry-run) to preview what would happen.
