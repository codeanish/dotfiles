# Set directory to store zinit and plugins
ZINIT_HOME=~/.local/share/zinit/zinit.git

# Doenload zinit if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  makedir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# ZSH plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# ZSH
autoload -U compinit && compinit

zinit cdreplay -q

alias zshrc='nvim ~/.zshrc'

# History
HISTSIZE=500
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Key bindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -T -L 1 --icons --git $realpath'
# ALIASES
#
# Kubectl
alias k='kubectl'
alias kg='kubectl get'
alias kuc='kubectl config use-context'

alias reload='source ~/.zshrc'

# Code editor
alias oc='opencode'
alias vi='nvim'

# Talos Cluster config
alias talos-dev='export TALOSCONFIG=~/talos-clusters/dev/talosconfig'
alias talos-prod='export TALOSCONFIG=~/talos-clusters/prod/talosconfig'
alias talos-obs='export TALOSCONFIG=~/talos-clusters/obs/talosconfig'
alias talos-mgmt='export TALOSCONFIG=~/talos-clusters/mgmt/talosconfig'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd='z '

# List
alias ls='ls --color'
alias l='eza -l --icons --git -a'
alias lt='eza -T -L 2 --icons --git'
alias ltree='eza -T -L 2 --icons --git --long'

export EDITOR="nvim"
export PATH="$PATH:/Users/anish/.local/bin"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"


# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/Users/anish/.lmstudio/bin"
