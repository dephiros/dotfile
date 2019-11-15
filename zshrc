# -*- mode: sh -*-
# User configuration sourced by interactive shells
#
# Source oh-my-zsh
# export ZSH_DISABLE_COMPFIX=true
# source $HOME/dotfiles/oh-my-zsh.zsh
bindkey -e
export DOTHOME=$HOME/dotfiles
export SHELL=$(type -p zsh)
setopt share_history # allow zsh terminal to save and share history across different tab
source $DOTHOME/shellrc.sh

# load autocomplete
autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
