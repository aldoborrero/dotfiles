#
# Aldo Borrero's config file for ZSH on OS X.
# -------------------------------------------
#
# Useful Urls:
#   - https://github.com/jdnavarro/dotfiles/blob/master/.zshrc
#   - http://stackoverflow.com/questions/171563/whats-in-your-zshrc
#

ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(brew bundler dircycle git git-extras git-flow osx rbenv gem vi-mode vagrant knife)
ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh

export EDITOR='subl'

# Correct UTF8 display in DVTM & CO
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# http://www.oradba.ch/2011/04/mac-os-x-terminal-compatibility-settings/
COMMAND_MODE=unix2003

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export RBENV_ROOT=/usr/local/opt/rbenv

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH