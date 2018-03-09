#!/usr/bin/env bash
DOTFILES=$HOME/dotfiles
SCRIPTS=$DOTFILES/scripts
cd $HOME/org
$SCRIPTS/git-sync
cd $DOTFILES
$SCRIPTS/git-sync
