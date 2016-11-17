# -*- mode: sh -*-
# User configuration sourced by interactive shells
#
# Source oh-my-zsh
source $HOME/dotfiles/oh-my-zsh.zsh
#
# User configuration sourced by interactive shells
#

# set up emacs
alias e="emacsclient -t"
alias ec="emacsclient -c"
export EDITOR="emacsclient -t"

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

# set info for multi-term zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Zonar Alias
alias zsync='ssh dev "\$HOME/dotfiles/scripts/sync_branch.sh $(gbr)"'

# start ssh agent
eval $($DOTHOME/zshrc_agent)

###-tns-completion-start-###
if [ -f /Users/an.nguyen/.tnsrc ]; then 
    source /Users/an.nguyen/.tnsrc 
fi
###-tns-completion-end-###
