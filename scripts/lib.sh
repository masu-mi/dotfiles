function install_apt_package_set() {
  group=$1

  # premise: called from ./dotfiles
  pkg_dir=./scripts/pkgs/
  install_apt_from_file $pkg_dir${group}.txt
}

function install_apt_from_file() {
  list_file=$1
  sudo apt install $(eval echo $(cat ${list_file}  | grep -v '#'))
}
