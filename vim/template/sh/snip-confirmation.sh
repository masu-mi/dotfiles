{{_cursor_}}
function confirmation() {
  echo "$1 [y/N]" >&2
  read answer
  case $answer in
    [yY])
      ;;
    *)
      {{_input_:failed_cmd}}
      ;;
  esac
}
