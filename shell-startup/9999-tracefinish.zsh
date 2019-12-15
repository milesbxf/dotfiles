#!/usr/bin/env zsh

if [[ ! -z "$ZSH_TRACE_ON" ]]; then

    unsetopt XTRACE
    exec 2>&3 3>&-

fi
