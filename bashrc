#!/usr/bin/env bash
# this function to include if exist
export DOTHOME=$HOME/dotfiles # dotfiles directory
export SHELL=$(type -p bash)
# Only load in interactive shells, not from a script or from scp
[[ $- == *i* ]] && source ~/dotfiles/sensible.bash
[[ $- == *i* ]] && source ~/liquidprompt/liquidprompt
source $DOTHOME/shellrc.sh
