#!/usr/bin/env zsh

# Load FZF (https://github.com/junegunn/fzf)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


load_virtualenvwrapper() {
    if [[ -z $VIRTUALENVWRAPPER_SCRIPT ]]; then
        source /usr/local/bin/virtualenvwrapper.sh
    fi
}

mkvirtualenv() {
    load_virtualenvwrapper
    mkvirtualenv ${@}
}
rmvirtualenv() {
    load_virtualenvwrapper
    rmvirtualenv ${@}
}

# Kubectl completion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

#GOPATH should be home dir
export GOPATH=~
# export GOFLAGS="-mod=vendor" 
# export GO111MODULE=on


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/milesbryant/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/milesbryant/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/milesbryant/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/milesbryant/google-cloud-sdk/completion.zsh.inc'; fi


# added by travis gem
[ -f /Users/milesbryant/.travis/travis.sh ] && source /Users/milesbryant/.travis/travis.sh


