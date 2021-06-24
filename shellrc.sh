# set info for multi-term zsh
source $DOTHOME/scripts/utils.sh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
# reduce the lag of vi-mode in zsh
export KEYTIMEOUT=1

export DOTHOME=$HOME/dotfiles
pathmunge "/usr/local/sbin:/usr/local/bin"
# set up localpath
pathmunge "$HOME/bin"
# this is for setting up emacs
export ALTERNATE_EDITOR=""
pathmunge "$HOME/.emacs.d/bin" "after"
# setup go path
export GOPATH=$HOME/go
pathmunge "$GOPATH/bin" "after"
# set up path for script
pathmunge "$DOTHOME/scripts" "after"
pathmunge "$HOME/.local/bin" "after"
# node_modules
pathmunge "node_modules/.bin"
pathmunge "$HOME/.yarn/bin"
pathmunge "$HOME/.config/yarn/global/node_modules/.bin"

export VOLTA_HOME="$HOME/.volta"
pathmunge "$VOLTA_HOME/bin"

pathmunge "$HOME/lib/flutter/bin"


# less
# -e quit at eof
# -F quit if one screen
# -X no init
# -x2 should display tab as 2 space
export LESS="eFRXx2"

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

# User configuration sourced by interactive shells

# set up emacs
alias e="emacsclient -t"
alias ec="emacsclient -c -n"

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

include ~/.local.bash || true

# rust
source "$HOME/.cargo/env"

include "$VOLTA_HOME/load.sh"

# GPG
export GPG_TTY=`tty`
