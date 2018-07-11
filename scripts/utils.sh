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
    [[ -f "$1" ]] && source "$1"
}
