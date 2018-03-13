#!/usr/bin/env zsh
source ~/.dotfiles/ohmyzsh-conf.sh


# User configuration

  export PATH="/home/miles/dev/util/scripts:/home/miles/bin/firefox:/home/miles/bin:/home/miles/dev/util/scripts:/home/miles/bin/firefox:/home/miles/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin:/home/miles/bin:/home/miles/.dotfiles/scripts:/opt/gradle/gradle-4.2/bin"

source $ZSH/oh-my-zsh.sh

source ~/.dotfiles/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status load root_indicator context custom_kube_cluster background_jobs virtualenv dir vcs vi_mode)
DEFAULT_USER=miles

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_COLOR_SCHEME=dark

POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$i_fa_github
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=$i_fa_bitbucket

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='blue'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_SHOW_CHANGESET=true

source ~/.dotfiles/nerd/i_all.sh

POWERLEVEL9K_DIR_SHOW_WRITABLE=true

POWERLEVEL9K_HOME_ICON=$i_fa_home
POWERLEVEL9K_HOME_SUB_ICON=$i_fa_folder_open
POWERLEVEL9K_FOLDER_ICON=$i_fa_folder
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=""

POWERLEVEL9K_VI_INSERT_MODE_STRING=$i_fa_i_cursor
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='blue'
POWERLEVEL9K_VI_COMMAND_MODE_STRING=$i_fa_cog
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='white'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='244'

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="$i_ple_flame_thick"

POWERLEVEL9K_CUSTOM_KUBE_CLUSTER="current_context=\$(kubectl config current-context);echo k8s:\$current_context:\$(kubectl config get-contexts \$current_context --no-headers=true | awk '{ print \$3 }')"


for f in $(ls ~/.dotfiles/aliases/*); do
    source $f
done

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi
