#!/usr/bin/env zsh

export PATH="${HOME}/.dotfiles/scripts:${PATH}"

source ~/.dotfiles/nerd/i_all.sh


for f in $(ls ~/.dotfiles/zsh/*); do
    source $f
done

for f in $(ls ~/.dotfiles/aliases/*); do
    source $f
done

export EDITOR='nvim'

source ~/.zprezto/runcoms/zshrc

fpath=($fpath ~/.dotfiles/fpath)

autoload -Uz promptinit
promptinit
prompt mpurer

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.dotfiles/zsh/key-bindings.zsh

# For gnome terminal/tmux setup; for some reason it doesn't recognise HOME/END
# escape sequences properly
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# load virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
