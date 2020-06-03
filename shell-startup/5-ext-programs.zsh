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

# Check if 'kubectl' is a command in $PATH
if [ $commands[kubectl] ]; then

  # Placeholder 'kubectl' shell function:
  # Will only be executed on the first call to 'kubectl'
  kubectl() {

    # Remove this function, subsequent calls will execute 'kubectl' directly
    unfunction "$0"

    # Load auto-completion
    source <(kubectl completion zsh)

    # Execute 'kubectl' binary
    $0 "$@"
  }
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/milesbryant/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/milesbryant/google-cloud-sdk/path.zsh.inc'; fi

# Check if 'kubectl' is a command in $PATH
if [ $commands[gcloud] ]; then

  # Placeholder 'kubectl' shell function:
  # Will only be executed on the first call to 'kubectl'
  gcloud() {

    # Remove this function, subsequent calls will execute 'kubectl' directly
    unfunction "$0"

    # Load auto-completion
    if [ -f '/Users/milesbryant/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/milesbryant/google-cloud-sdk/completion.zsh.inc'; fi

    # Execute 'gcloud' binary
    $0 "$@"
  }
fi


# Check if 'jira' is a command in $PATH
if [ $commands[jira] ]; then

  # Placeholder 'jira' shell function:
  # Will only be executed on the first call to 'jira'
  jira() {

    # Remove this function, subsequent calls will execute 'kubectl' directly
    unfunction "$0"

    eval "$(jira --completion-script-zsh)"

    # Execute binary
    $0 "$@"
  }
fi


#GOPATH should be home dir
export GOPATH=~
# export GOFLAGS="-mod=vendor" 
# export GO111MODULE=on

eval "$(jump shell)"
