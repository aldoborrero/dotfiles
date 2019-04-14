#!/usr/bin/env bash

set -e

if [ ! -d ~/code/dotfiles ]; then
  echo "Cloning dotfiles"
  cd ~/code
  git clone https://github.com/aldoborrero/dotfiles.git
fi

cd ~/code/dotfiles
git remote set-url origin git@github.com:aldoborrero/dotfiles.git

ln -s $(pwd)/zshrc ~/.zshrc
ln -s $(pwd)/tmuxconf ~/.tmux.conf
ln -s $(pwd)/gitconfig ~/.gitconfig
ln -s $(pwd)/ssh/config ~/.ssh/config

/usr/sbin/sshd -D
