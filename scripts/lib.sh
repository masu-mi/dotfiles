function reload_rc() {
  . ~/.bashrc
}

function install_apt_package_set() {
  group=$1

  # premise: called from ./dotfiles
  pkg_dir=./scripts/pkgs/
  sudo apt install $(eval echo "$(cat $pkg_dir${group}.txt  | grep -v '#')")
}
