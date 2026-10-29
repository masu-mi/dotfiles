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
  sudo apt update
  sudo apt install $(eval echo $(cat ${list_file}  | grep -v '#'))
}

function install_brew_from_file() {
  list_file=$1
  brew update
  brew install $(eval echo $(cat ${list_file}  | grep -v '#'))
}
