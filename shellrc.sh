# set info for multi-term zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
# reduce the lag of vi-mode in zsh
export KEYTIMEOUT=1

export DOTHOME=$HOME/dotfiles
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
source $DOTHOME/scripts/utils.sh
# set up localpath
export PATH=$PATH:~/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# this is for setting up emacs
export ALTERNATE_EDITOR=""
export PATH=$PATH:$HOME/.emacs.d/bin
# setup go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# set up path for script
export PATH=$PATH:$DOTHOME/scripts
export PATH=$HOME/.local/bin:$PATH
# python homebrew path
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# linux homebrew path
export PATH="/home/linuxbrew/.linuxbrew/bin/:$PATH"
# node_modules
PATH="node_modules/.bin:$PATH"

# alias
alias dc="docker-compose"
## Taskfile
## From https://github.com/adriancooney/Taskfile
TASKFILE="Taskfile"
alias run="./$TASKFILE"

taskfile() {
  if [ -e "./$TASKFILE" ]; then
    echo "$TASKFILE already exists. Please remove it first"
    return 1
  fi
  cp $DOTHOME/$TASKFILE.template ./$TASKFILE
  echo "Taskfile initialized!"
}


makefile() {
  if [ -e "./Makefile" ]; then
    echo "Makefile already exists. Please remove it first"
    return 1
  fi
  cp ${DOTHOME}/Makefile.template ./Makefile
  echo "Makefile initialized!"
}

include "$HOME/.localenv.bash" || true
export DOTHOME=$HOME/dotfiles
#
# User configuration sourced by interactive shells

# set up emacs
alias e="emacsclient -t"
alias ec="emacsclient -c"

# set up nvim
VIMEDITOR="vim"
if command_exist nvim; then
  VIMEDITOR="nvim"
  alias vi="$VIMEDITOR"
  alias vim="$VIMEDITOR"
fi
export EDITOR="$VIMEDITOR"

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--bind ctrl-a:select-all'
# fd - cd to selected directory
fd () {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# vscode to vscode-insiders
alias code=code-insiders

alias gdiff="git difftool -y"
alias gdiffc='git difftool -y --cached'
alias gbr='git rev-parse --abbrev-ref HEAD'
alias gbclean='git branch --merged origin/master | grep -v "\*" | xargs -n 1 git branch -d'
alias gdiff="git difftool -y"
alias gdiffc='git difftool -y --cache'
grreset() {
  git fetch | grep -q $(gbr)
  if [ $? -eq 0 ]; then
    echo 'Reseting to origin'
    git reset --hard origin/$(gbr)
  else
    echo 'No change'
  fi
}
alias cddot="cd $DOTHOME"

# set info for multi-term zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

include ~/.local.bash || true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# rust
source "$HOME/.cargo/env"

export VOLTA_HOME="$HOME/.volta"
include "$VOLTA_HOME/load.sh"

export PATH="$VOLTA_HOME/bin:$PATH"
export PATH=$PATH:$HOME/lib/flutter/bin/

# GPG
export GPG_TTY=`tty`

# pyenv just slow everything down
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
