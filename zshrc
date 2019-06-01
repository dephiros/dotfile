# -*- mode: sh -*-
# User configuration sourced by interactive shells
#
# Source oh-my-zsh
source $HOME/dotfiles/oh-my-zsh.zsh
export DOTHOME=$HOME/dotfiles
export SHELL=$(type -p bash)
source $DOTHOME/shellrc.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
