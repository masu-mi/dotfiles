# apt or brew; defaults to brew on macOS
PKG_MANAGER=${PKG_MANAGER:-$([ "$(uname)" = Darwin ] && echo brew || echo apt)}

function install_package_set() {
  group=$1

  # premise: called from ./dotfiles
  pkg_dir=./scripts/pkgs/
  case $PKG_MANAGER in
    apt) install_apt_from_file $pkg_dir${group}.txt ;;
    brew) install_brew_from_file $pkg_dir${group}.brew.txt ;;
    *) echo "[ERROR] unknown PKG_MANAGER: $PKG_MANAGER" >&2; return 1 ;;
  esac
}

function install_apt_from_file() {
  list_file=$1
  # non-interactive: no prompts (tzdata, needrestart, conffile) even when stdin is a pipe
  export DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a
  sudo -E apt-get update </dev/null
  sudo -E apt-get install -y -o Dpkg::Options::=--force-confold \
    $(eval echo $(cat ${list_file}  | grep -v '#')) </dev/null
}

function install_brew_from_file() {
  list_file=$1
  brew update
  brew install $(eval echo $(cat ${list_file}  | grep -v '#'))
}
