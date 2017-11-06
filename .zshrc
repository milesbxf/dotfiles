#!/usr/bin/env zsh
source ~/.dotfiles/ohmyzsh-conf.sh


# User configuration

  export PATH="/home/miles/dev/util/scripts:/home/miles/bin/firefox:/home/miles/bin:/home/miles/dev/util/scripts:/home/miles/bin/firefox:/home/miles/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin:/home/miles/bin:/home/miles/.dotfiles/scripts:/opt/gradle/gradle-4.2/bin"

source $ZSH/oh-my-zsh.sh

source ~/.dotfiles/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator aws virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(load status vi_mode)

POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_SHOW_CHANGESET=true


source ~/.dotfiles/aliases/*

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi
