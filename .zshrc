#!/bin/sh

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# Sourcing
source $HOME/.path
source $HOME/.env
source $HOME/.aliases

# direnv
if [[ -x "$(command -v direnv)" ]]; then
  eval "$(direnv hook zsh)"
fi

# Oh-my-zsh
export ZSH="/home/aldo/.oh-my-zsh"
ZSH_THEME="bira"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh
