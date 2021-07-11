function have_command {
    type "$1" &> /dev/null ;
}

is_mac() {
    [[ "$(uname -s)" == *"Darwin"* ]]
}

mac_brew_install_if_exist() {
  package=$1
  (command_exist ${package} && echo " - skip ${package}") || \
    (echo " - installing ${package}" && brew install ${package})
}

command_exist() {
  command -v $1 >/dev/null 2>&1
}

include () {
  start=`date +%s`
  [[ -f "$1" ]] && source "$1"
  end=`date +%s`
  # echo "Source $1 in $((end-start))s"
}

# From Red Hat .profile. Idempotently modify path
pathmunge () {
  if [[ ":$PATH:" != *":${1}:"* ]]; ; then
    if [ "$2" = "after" ] ; then
      export PATH=$PATH:$1
    else
      export PATH=$1:$PATH
    fi
  else
    # echo "Duplicate path munge for ${1}"
    # echo $(ps -o comm= $PPID)
  fi
}

