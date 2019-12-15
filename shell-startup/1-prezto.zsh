#!/usr/bin/env zsh


# Load NERD font variables (https://github.com/ryanoasis/nerd-fonts)
source ~/.dotfiles/nerd/i_all.sh

# Start loading Prezto (https://github.com/sorin-ionescu/prezto)
source ~/.dotfiles/.zprezto/runcoms/zshrc

if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh"
fi

source ~/.dotfiles/.zpreztorc
