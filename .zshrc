# ZSH Config

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="~/.oh-my-zsh"

ZSH_THEME="bira"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git docker docker-compose vi-mode)

source $ZSH/oh-my-zsh.sh
source $HOME/.env.sh

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# Aliases
alias zshrc="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
