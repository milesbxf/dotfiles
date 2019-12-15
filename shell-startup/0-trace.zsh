#!/usr/bin/env zsh

zmodload zsh/datetime
setopt PROMPT_SUBST
PS4='+$EPOCHREALTIME %N:%i> '

logfile=~/.zsh_profile_log
echo "Logging to $logfile"
exec 3>&2 2>$logfile

setopt XTRACE
