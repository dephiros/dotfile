# -*- mode: sh -*-
# User configuration sourced by interactive shells
#
# Source oh-my-zsh
export ZSH_DISABLE_COMPFIX=true
source $HOME/dotfiles/oh-my-zsh.zsh
bindkey -e
export DOTHOME=$HOME/dotfiles
export SHELL=$(type -p bash)
source $DOTHOME/shellrc.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

