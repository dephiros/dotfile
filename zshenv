# -*- mode: sh -*-
#
# this function to include if exist
include () {
    [[ -f "$1" ]] && source "$1"
}

export DOTHOME=$HOME/dotfiles
export PATH="/usr/local/sbin:$PATH"
# set up localpath
export PATH=$PATH:~/bin
include "$HOME/.pathrc"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# this is for setting up emacs
export ALTERNATE_EDITOR=""
# setup go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
