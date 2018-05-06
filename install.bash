#!/usr/bin/env bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/dotfiles                    # dotfiles directory
configdir=$HOME/dotfiles/config       # dotfiles/config directory
olddir=$HOME/dotfiles_old             # old dotfiles backup directory
config=$HOME/.config
oldconfig=$HOME/init_old
dotfiles=("editorconfig" "bashrc" "bash_profile" "gitignore_global" "abcde.conf" "tmux.conf" "spacemacs" "vimrc" "gvimrc")    # list of files/folders to symlink in homedir with added dot
files=("docker-compose.yml")
configfiles=("nvim" "liquidpromptrc")    # list of files/folders to symlink to .config

##########
source $dir/scripts/utils.sh

##########
echo "* Installing stuffs for mac"
if is_mac; then
  mac_brew_install_if_exist
  brew tap caskroom/fonts
  brew tap d12frosted/emacs-plus
  brew update
  brew install emacs-plus git bash vim tmux
  brew cask install font-source-code-pro
  brew cask install font-m-plus
  brew cask install font-fantasque-sans-mono
  brew cask install iterm2
  brew cask install dropbox
  brew cask install google-drive-file-stream
  brew cask install docker
fi

set up space emacs
if [ ! -d "$HOME/.emacs.d" ]; then
   echo 'could not find emacs.d. installing spacemacs'
   rm -rf ~/.emacs ~/.emacs.d #otherwise this will conflict
   git clone git://github.com/syl20bnr/spacemacs $HOME/.emacs.d
   echo "\n"
fi

# echo - set up oh-my-zsh
# if [ ! -d "$HOME/.oh-my-zsh" ]; then
#     git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
#     chsh -s zsh
#     echo "\n"
# fi

chsh -s bash
echo - set up liquidprompt
rm -rf ~/liquidprompt
git clone git://github.com/nojhan/liquidprompt.git ~/liquidprompt

echo - set up tmux
if [ ! -d "$HOME/.tmux" ]; then
    git clone git://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    echo "\n"
fi
# set up ssh-find-agent
if [ ! -d "$HOME/ssh-find-agent" ]; then
  echo 'Pulling ssh-find-agent'
  git clone git://github.com/wwalker/ssh-find-agent.git "$HOME/ssh-find-agent"
  echo "\n"
fi

# create dotfiles_old and config_old in homedir
echo "Creating $olddir and $oldconfig and $config for backup of any existing dotfiles in ~"
mkdir -p $olddir
mkdir -p $oldconfig
echo "...done\n"

#
echo "Linking normal files"
for file in ${files[@]}; do
    echo "Moving existing $file from ~ to $olddir"
    mv $HOME/.$file $olddir 2> /dev/null
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file $HOME/$file 2> /dev/null
done
echo "...done\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Linking dotfiles"
for file in ${dotfiles[@]}; do
    echo "Moving existing $file from ~ to $olddir"
    mv $HOME/.$file $olddir 2> /dev/null
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file $HOME/.$file 2> /dev/null
done
echo "...done\n"

# move any existing config folder to config_old directory, then create symlinks
## make sure config folder is created
echo "make sure to create $config"
mkdir -p $config
echo "Linking configfiles"
for file in ${configfiles[@]}; do
    echo "Moving existing $file from ~ to $oldconfig"
    mv $config/$file $oldconfig 2> /dev/null
    echo "Creating symlink to $file in config directory."
    ln -s $configdir/$file $config/$file 2> /dev/null
done
echo "...done\n"

# set up git
if ! type "git" > /dev/null; then
    echo "git is not installed, install git and rerun install script"
else
    gitEditor="$(which vi)"
    if ! type "vim" 2> /dev/null; then
        echo "could not find vim, setting git editor to vi"
    else
        gitEditor="vim"
	git config --global merge.tool vimdiff
	git config --global merge.conflictstyle diff3
    fi
    echo "setting up git"
    git config --global core.editor "$gitEditor"
    git config --global core.excludesfile "$HOME/.gitignore_global"
    git config --global difftool.prompt "true"
    git config --global push.default simple
    echo "finished setting up git"
fi

echo "...done\n"

# link nvimrc with vim
#ln -s $dir/vimrc ~/.nvimrc
#ln -s $dir/vim ~/.nvim
