#!/usr/bin/env zsh

# Start loading Prezto (https://github.com/sorin-ionescu/prezto)
source ~/.dotfiles/.zprezto/runcoms/zshrc

if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh"
fi

source ~/.dotfiles/.zpreztorc
