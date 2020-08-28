#!/usr/bin/env bash
if [ -f ~/.bashrc ]; then
  . ${HOME}/.bashrc
fi
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
