#!/usr/bin/env bash
# this function to include if exist
dir=$HOME/dotfiles                    # dotfiles directory
source $dir/scripts/utils.sh
export SHELL=$(which bash)
# Only load in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/dotfiles/sensible.bash
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

export DOTHOME=$HOME/dotfiles
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
# set up localpath
export PATH=$PATH:~/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# this is for setting up emacs
export ALTERNATE_EDITOR=""
# setup go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# set up path for script
export PATH=$PATH:$DOTHOME/scripts
export PATH=$HOME/.local/bin:$PATH

# alias
alias dc="docker-compose"

include "$HOME/.localenv.bash"
export DOTHOME=$HOME/dotfiles
#
# User configuration sourced by interactive shells

# set up emacs
alias e="emacsclient -t"
alias ec="emacsclient -c"

# set up nvim
if command_exist nvim; then
  VIMEDITOR="nvim"
  alias e=$VIMEDITOR
  alias vi=$VIMEDITOR
  alias vim=$VIMEDITOR
fi
alias vi=vim
export EDITOR=vim

# set info for multi-term zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
# reduce the lag of vi-mode in zsh
export KEYTIMEOUT=1

alias gdiff="git difftool -y"
alias gdiffc='git difftool -y --cached'
alias gbr='git rev-parse --abbrev-ref HEAD'
alias gbclean='git branch --merged origin/master | grep -v "\*" | xargs -n 1 git branch -d'
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

include ~/.local.bash
eval "$(direnv hook $SHELL)" || true


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# asdf extensible env manager
if [ ! -d "$HOME/.asdf" ]; then
   echo 'could not find asdf. installing asdf'
   git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1
   echo "\n"
fi

include $HOME/.asdf/asdf.sh

include $HOME/.asdf/completions/asdf.bash

export NVM_DIR="$HOME/.nvm"
include "$NVM_DIR/nvm.sh"  # This loads nvm
include "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rust
export PATH="$HOME/.cargo/bin:$PATH"
