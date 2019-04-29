#!/bin/sh

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Sourcing
source $HOME/.path
source $HOME/.env
source $HOME/.aliases

# Oh-my-zsh
export ZSH="/home/aldo/.oh-my-zsh"
ZSH_THEME="bira"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git docker docker-compose vi-mode)

source $ZSH/oh-my-zsh.sh