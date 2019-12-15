#!/usr/bin/env zsh

if [[ ! -z "$ZSH_TRACE_ON" ]]; then
    zmodload zsh/datetime
    setopt PROMPT_SUBST
    PS4='+$EPOCHREALTIME %N:%i> '

    logfile=~/.zsh_profile_log
    echo "Logging to $logfile"
    exec 3>&2 2>$logfile

    setopt XTRACE
fi
