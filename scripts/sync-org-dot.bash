#!/usr/bin/env bash
DOTFILES=$HOME/dotfiles
SCRIPTS=$DOTFILES/scripts
cd $HOME/org
# emacs wiki/index.org -l ~/.emacs.d/init.el --batch -f org-html-export-to-html --kill
$SCRIPTS/git-sync
cd $DOTFILES
$SCRIPTS/git-sync
