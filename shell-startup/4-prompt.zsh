#!/usr/bin/env zsh

# Add directory to ZSH functions list
fpath=($fpath ~/.dotfiles/fpath)

# Start setting up the prompt
autoload -Uz promptinit
promptinit
prompt mpurer

function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; # block cursor
      viins|main) print -n '\033[5 q';; # line cursor
  esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

