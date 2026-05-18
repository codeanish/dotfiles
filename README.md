# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

| File | Description |
|------|-------------|
| `.zshrc` | Z shell configuration (zinit, aliases, history, keybindings) |
| `.tmux.conf` | Tmux configuration (Catppuccin Mocha theme, TPM) |
| `.config/ghostty/config` | Ghostty terminal config |
| `.config/nvim/` | Neovim config (lazy.nvim, LSP, Telescope, Neo-tree) |
| `.config/starship.toml` | Starship prompt (Catppuccin Mocha palette, Kubernetes context) |
| `.config/gh-dash/config.yml` | gh-dash dashboard (PRs, issues, notifications) |

## Tooling

### Shell — zsh

- **Plugin manager**: [zinit](https://github.com/zdharma-continuum/zinit)
- **Plugins**: zsh-syntax-highlighting, zsh-completions, zsh-autosuggestions, fzf-tab
- **Navigation**: [zoxide](https://github.com/ajeetdsouza/zoxide) (`cd` aliased to `z`)
- **Fuzzy find**: [fzf](https://github.com/junegunn/fzf)
- **History**: 500 entries, duplicate-free, append mode, `^p`/`^n` for history search

### Terminal — Ghostty

- **Theme**: Catppuccin Mocha
- **Font**: JetBrainsMono Nerd Font Mono, size 19
- **Blur**: 20px background blur
- **Option key**: acts as Alt

### Multiplexer — tmux

- **Prefix**: `Ctrl+A`
- **Theme**: Catppuccin Mocha (pane status, border styling, window separators)
- **Plugin manager**: [TPM](https://github.com/tmux-plugins/tpm)
- **Mouse**: enabled, vi mode keys, auto-renaming, renumbering

### Editor — Neovim

- **Plugin manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Theme**: Catppuccin Mocha
- **LSP**: lua_ls, gopls (via mason)
- **Plugins**:
  - [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) — file explorer (`Ctrl+n`)
  - [telescope](https://github.com/nvim-telescope/telescope.nvim) — fuzzy finder (`Ctrl+p` for files, `<leader>fg` for grep)
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — syntax highlighting
  - [lualine](https://github.com/nvim-lualine/lualine.nvim) — statusline
- **Options**: 2-space tabs, leader key = space, line numbers

### Prompt — Starship

- **Palette**: Catppuccin Mocha
- **Format**: Simple `➜` character prompt (left), tools on the right
- **Enabled modules**: Kubernetes context

### GitHub — gh-dash

- **Views**: Pull requests, issues, notifications
- **Diff pager**: [delta](https://github.com/dandavison/delta)
- **Sections**: My PRs, Needs My Review, Involved / My Issues, Assigned, Involved / notification categories

### Aliases

| Alias | Command |
|-------|---------|
| `k` / `kg` / `kuc` | kubectl shortcuts |
| `talos-dev` / `talos-prod` / `talos-obs` / `talos-mgmt` | Talos cluster config switches |
| `oc` | opencode |
| `vi` | nvim |
| `l` / `lt` / `ltree` | eza listings (long, tree, tree+long) |
| `..` / `...` / `....` | Navigate up directories |

## Prerequisites

```bash
brew install stow zsh tmux neovim fzf zoxide eza delta gh ghostty
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
