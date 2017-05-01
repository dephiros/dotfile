#!/usr/bin/env bash
source ./util.sh

# don't use [[ (or [) when running a command and checking the result code.
# http://stackoverflow.com/a/8117867
have_command yum && HAVE_YUM=true
have_command apt-get && HAVE_APT=true
have_command brew && HAVE_BREW=true
echo $HAVE_BREW brew
echo $HAVE_YUM yum
echo $HAVE_APT apt

# setup brew if not installed and is mac
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "run install_mac_dep"
    ./install_mac_dep.sh
elif [[ $HAVE_APT = true ]]; then
    echo "run install_apt_dep"
    ./install_apt_dep.sh
fi
