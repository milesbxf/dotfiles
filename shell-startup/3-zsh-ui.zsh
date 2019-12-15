#!/usr/bin/env zsh

# Neovim all the way (https://github.com/neovim/neovim)
export EDITOR='nvim'

# Load custom key-bindings
source ~/.dotfiles/zsh/key-bindings.zsh

# For gnome terminal/tmux setup; for some reason it doesn't recognise HOME/END
# escape sequences properly
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

