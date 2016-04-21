# -*- mode: sh -*-
# User configuration sourced by interactive shells
#
export DOTHOME=$HOME/dotfiles

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
#
# User configuration sourced by interactive shells
#

# add comment
# this function to include if exist
include () {
    [[ -f "$1" ]] && source "$1"
}

alias ec="emacsclient"
alias eserver="emacs --daemon"

# set info for multi-term zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

alias gdiff="git difftool -y"
alias gdiffc='git difftool -y --cached'
alias gbr='git rev-parse --abbrev-ref HEAD'
alias gbclean='git branch --merged | grep -v "*" | grep -v master | grep -v dev | xargs -n 1 git branch -d'
alias gdiff="git difftool -y"
alias gdiffc='git difftool -y --cache'
grreset()
{
  git fetch | grep -q `gbr`
  if [ $? -eq 0 ]; then
    echo 'Reseting to origin'
    git reset --hard origin/`gbr`
  else
    echo 'No change'
  fi
}
alias cddot="cd $DOTHOME"

# set up path in this file
alias ec="emacsclient"
alias et="emacsclient -t"
alias eserver="emacs --daemon"

# set info for multi-term zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export PATH="/usr/local/sbin:$PATH"
# set up localpath
export PATH=$PATH:~/bin
include "$HOME/.pathrc"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Zonar Alias
alias zsync='ssh dev "\$HOME/dotfiles/scripts/sync_branch.sh $(gbr)"'

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# start ssh agent
eval $($DOTHOME/zshrc_agent)
