# select default shell
export SHELL=$(command -v zsh)
export DOTHOME=$HOME/dotfiles
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
source $DOTHOME/scripts/utils.sh
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
# python homebrew path
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# alias
alias dc="docker-compose"
## Taskfile
## From https://github.com/adriancooney/Taskfile
TASKFILE="Taskfile"
alias run="./$TASKFILE"
function run-init {
  if [ -e "./Taskfile" ]; then
    echo "$TASKFILE already exists. Please remove it first"
    return 1
  fi
  cp $DOTHOME/$TASKFILE.template ./$TASKFILE
  echo "Taskfile initialized!"
}

include "$HOME/.localenv.bash" || true
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

# fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'


# vscode to vscode-insiders
alias code=code-insiders

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

export NVM_DIR="$HOME/.nvm"
include "$NVM_DIR/nvm.sh"          # This loads nvm
include "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# rust
export PATH="$HOME/.cargo/bin:$PATH"

export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

export PATH="$VOLTA_HOME/bin:$PATH"
