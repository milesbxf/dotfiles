#!/usr/bin/env zsh

export PATH="${HOME}/.dotfiles/scripts:${PATH}"

source ~/.dotfiles/nerd/i_all.sh

for f in $(ls ~/.dotfiles/zsh/*); do
    source $f
done

source $ZSH/oh-my-zsh.sh

for f in $(ls ~/.dotfiles/aliases/*); do
    source $f
done

export EDITOR='nvim'


