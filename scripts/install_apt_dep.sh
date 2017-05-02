#!/usr/bin/env bash
source ./util.sh

echo "installing neovim"
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install vim

echo "installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "installing python stuff"
sudo apt-get install python-dev python-pip python3-dev python3-pip

echo "installing git"
sudo apt-get install git -y
echo "installing clang clang-tidy"
sudo apt-get install clang clang-tidy
