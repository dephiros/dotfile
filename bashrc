#!/usr/bin/env bash
# this function to include if exist
export DOTHOME=$HOME/dotfiles # dotfiles directory
# Only load in interactive shells, not from a script or from scp
[[ $- == *i* ]] && source ~/dotfiles/sensible.bash
[[ $- == *i* ]] && source ~/liquidprompt/liquidprompt
source $DOTHOME/shellrc.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(starship init bash)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
source "$HOME/.cargo/env"
