#!/usr/bin/env zsh

# Load ZSH tab completion
autoload -Uz compinit
compinit


# Add scripts to paths
export PATH="${HOME}/.dotfiles/scripts:${PATH}:/usr/local/kubebuilder/bin"

# Load NERD font variables (https://github.com/ryanoasis/nerd-fonts)
source ~/.dotfiles/nerd/i_all.sh

# Source more dotfiles/aliases
for f in $(ls ~/.dotfiles/zsh/*); do
    source $f
done

for f in $(ls ~/.dotfiles/aliases/*); do
    source $f
done

# Neovim all the way (https://github.com/neovim/neovim)
export EDITOR='nvim'

# Start loading Prezto (https://github.com/sorin-ionescu/prezto)
source ~/.dotfiles/.zprezto/runcoms/zshrc

if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh"
fi

# Add directory to ZSH functions list
fpath=($fpath ~/.dotfiles/fpath)

# Start setting up the prompt
autoload -Uz promptinit
promptinit
prompt mpurer

# Load FZF (https://github.com/junegunn/fzf)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load custom key-bindings
source ~/.dotfiles/zsh/key-bindings.zsh

# For gnome terminal/tmux setup; for some reason it doesn't recognise HOME/END
# escape sequences properly
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# load virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# Kubectl completion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

#GOPATH should be home dir
export GOPATH=~
# export GOFLAGS="-mod=vendor" 
# export GO111MODULE=on

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# JIRA CLI autocompletion
eval "$(jira --completion-script-zsh)"

source ~/.dotfiles/.zpreztorc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/milesbryant/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/milesbryant/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/milesbryant/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/milesbryant/google-cloud-sdk/completion.zsh.inc'; fi

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


# added by travis gem
[ -f /Users/milesbryant/.travis/travis.sh ] && source /Users/milesbryant/.travis/travis.sh
