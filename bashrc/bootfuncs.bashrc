function pathmunge () {
  case ":${PATH}:" in
    *:"$1":*)
      ;;
    *)
      if [ "$2" = "after" ] ; then
        export PATH=$PATH:$1
      else
        export PATH=$1:$PATH
      fi
  esac
}
function add_path {
  if test -d $1; then
    pathmunge $1 $2
  fi
}
