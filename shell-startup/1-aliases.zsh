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

