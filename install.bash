#!/usr/bin/env bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/dotfiles              # dotfiles directory

##########
source "${dir}/scripts/utils.sh"

##########
if is_mac; then
  echo "* Installing stuffs for mac"
elif command_exist apt-get; then
  echo "* Installing stuffs with apt-get"
  sudo apt-get update -y
  sudo apt-get install -y build-essential curl file git
fi
printf "\n* Install brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle

echo "* Installing volta"
curl https://get.volta.sh | bash

printf "\n Change default shell to zsh"
chsh -s zsh
printf "\n"

# set up git
if ! command_exist git; then
  echo "git is not installed, install git and rerun install script"
else
  gitEditor="$(which vi)"
  if command_exist nvim; then
    gitEditor="nvim"
    git config --global merge.conflictstyle diff3
    git config --global diff.tool vimdiff3
    git config --global difftool.vimdiff3.path nvim
    git config --global merge.tool vimdiff3
    git config --global mergetool.vimdiff3.path
  elif command_exist vim; then
    gitEditor="vim"
    git config --global merge.tool vimdiff
    git config --global merge.conflictstyle diff3
  else
    echo "could not find vim, setting git editor to vi"
  fi
  echo "setting up git"
  git config --global gpg.program gpg
  git config --global core.editor "$gitEditor"
  git config --global core.excludesfile "$HOME/.gitignore_global"
  git config --global difftool.prompt "true"
  git config --global push.default simple
  echo "finished setting up git"
fi

printf "...done\n"

# link nvimrc with vim
#ln -s $dir/vimrc ~/.nvimrc
#ln -s $dir/vim ~/.nvim
