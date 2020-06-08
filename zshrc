# -*- mode: sh -*-
# User configuration sourced by interactive shells
#
# Source oh-my-zsh

# uncomment below to start profiling
zmodload zsh/zprof

export ZSH_DISABLE_COMPFIX=true

# select default shell
export SHELL=$(command -v zsh)

# Make ZSH load faster https://github.com/ohmyzsh/ohmyzsh/issues/5569
## DISABLE_MAGIC_FUNCTIONS=true
## source $HOME/dotfiles/oh-my-zsh.zsh
bindkey -e
export DOTHOME="$HOME/dotfiles"
source "$DOTHOME/scripts/history.zsh"
source "$DOTHOME/shellrc.sh"

# include is available from shellrc.sh
include ~/.fzf.zsh
eval "$(starship init zsh)"

# Enable auto completion
autoload -Uz compinit
compinit
