# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/evanbancroft/.zsh/completions:"* ]]; then export FPATH="/Users/evanbancroft/.zsh/completions:$FPATH"; fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=~/bin:$PATH


eval "$(/opt/homebrew/bin/brew shellenv)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi  

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found

# Load Completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

silent-sessionizer-command() {
    zle kill-whole-line
    tmux display-popup -E "tmux-sessionizer"
    zle reset-prompt
}
zle -N silent-sessionizer-command


# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^y' autosuggest-accept
bindkey '^f' silent-sessionizer-command


# History
HISTSIZE=10000
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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases 
alias ls='ls --color'
alias dt='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias oo='cd $HOME/library/Mobile\ Documents/iCloud~md~obsidian/Documents/v2.0.1'


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

export EDITOR="nvim"

export PATH=$PATH:/Users/evanbancroft/.spicetify

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# bun completions
[ -s "/Users/evanbancroft/.bun/_bun" ] && source "/Users/evanbancroft/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/bin/env"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
