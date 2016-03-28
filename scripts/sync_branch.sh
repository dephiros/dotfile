#!/usr/bin/env bash
# add key to agent
if [[ -s "$HOME/ssh-find-agent/ssh-find-agent.sh" ]]; then
  . $HOME/ssh-find-agent/ssh-find-agent.sh
  ssh-find-agent -a
  if [ -n "$SSH_AUTH_SOCK" ]
  then
    if [ -n "$1" ] ; then
      cd /var/www/andev/src && git fetch && git reset --hard && \
      git checkout -b $1 origin/$1 || git checkout $1 && \
      git reset --hard origin/$1
    else
      echo "could not find ssh-agent"
    fi
  fi
 else
   echo 'WARNING: Could not find ssh-find-agent. Need to run install script!!'
fi

