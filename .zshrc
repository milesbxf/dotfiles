#!/usr/bin/env zsh

for f in $(ls ~/.dotfiles/shell-startup/*); do
    source $f
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
