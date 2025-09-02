# for different option

alias g='git'
alias cd-='cd -'
alias cdwork='cd ${HOME}/works'
alias cd..='cd ..'

alias cal='cal -m3'

alias sc='screen -U -D -RR'
alias ftmux='tmux -2u'

# util of converting char. encoding
alias euc2sjis='iconv -f euc-jp -t sjis'
alias euc2utf='iconv -f euc-jp -t utf-8'
alias sjis2euc='iconv -f sjis   -t euc-jp'
alias sjis2utf='iconv -f sjis   -t utf-8'
alias utf2euc='iconv -f utf-8  -t euc-jp'
alias utf2sjis='iconv -f utf-8  -t sjis'
alias lsf='eval $(declare -F | grep -v "declare -f _"| fzf) | less'

alias svim='sudo vim -u .vimrc'
function stvim {
    vim $(which $1)
}
function sshp() {
  local host=$(
    grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config ~/.ssh/hosts/* |\
      xargs -n 1 | grep -v Host | sort -u | \
      xargs -I{} echo 'Host {}' | fzf | \
      awk '{print $2}'
  )
  if [ -n "$host" ]; then
    echo "[ssh]: $host"
    ssh $@ $host
  fi
}
function psrc() {
  local src=$(ghq list --full-path | fzf)
  if [ -n "$src" ]; then
    echo -n '[pushd]:'
    pushd $src
  fi
}
alias gco='git checkout $(git branch | fzf)'
alias grmb='g br -d $(g br | fzf)'

alias pdots='pushd ~/dotfiles'
alias lsdrafts='head -n 1 `ls drafts/*.rst`| awk '\''!/^$/{print $0}'\'

alias vivimrc='vim ~/.vimrc'
alias viscreen='vim ~/.screenrn'
alias vitmux='vim ~/.tmux.conf'
alias vibashrc='vim ~/.bashrc'
alias vialiases='vim ~/.bash_aliases'

## change java's output encoding
alias java-utf8='java -Dfile.encoding=utf-8'
alias javac-utf8='javac -J-Dfile.encoding=utf-8'
alias jar-utf8='jar -J-Dfile.encoding=utf-8'
alias jdb-utf8='jdb -J-Dfile.encoding=utf-8'

function s3cmdl() {
  s3cmd -c ./.s3cfg $@
}

function make-s3-workspace() {
  if [ "$1" = "" ];
  then
    echo "${FUNCNAME[0]} requires space name" >&2
    return 1
  fi
  space=$1
  if [ -d "$space" ]; then
    echo "space are required not conflict existing dir!!"
    return 1
  fi
  mkdir $space
  pushd $space
  s3cmdl --configure
  popd
}

function lsbucket() {
  s3cmdl ls s3://${SRC_BUCKET}/
}

function select-dp () {
  docker ps | tail -n -1 | fzf | awk '{print $1}'
}

alias docker-braddr='docker network inspect bridge | jq -r .[0].IPAM.Config[0].Gateway'

function select-stash () {
  git stash list | fzf --preview 'git show --color $(echo {} | awk -F: "{print \$1}")' | awk 'BEGIN{FS=":"}{print $1}'
}
function swagger-editor() { docker run -p ${1:-80}:8080 swaggerapi/swagger-editor; }

loop_date() {
  start=$1
  end=$2
  format=${3:-%Y-%m-%d}
  default_step=1day
  if [ "$(uname)" = "Darwin" ]; then
    default_step=+1d
  fi
  step=${4:-"$default_step"}

  load_cmd='date -d '
  if [ "$(uname)" = "Darwin" ]; then
    load_cmd='date -j -f %Y-%m-%d '
  fi

  __internal_format='%Y-%m-%d %H:%M:%S'
  if [ "$(uname)" = "Darwin" ]; then
    instep_cmd() {
      date -v "$2" -j -f "$__internal_format" "$1" "+$3"
    }
  else
    instep_cmd() {
      date -d "$1 $2" "+$3"
    }
  fi
  idx="$($load_cmd "$start" "+$format")"
  __idx="$($load_cmd "$start" "+$__internal_format")"
  if [ "$?" != "0" ];
  then
    echo "invalid format(\$start:$start)" >&2
    return 1
  fi
  __end="$($load_cmd "$end" "+$__internal_format")"
  if [ "$?" != "0" ];
  then
    echo "invalid format(\$end:$end)" >&2
    return 1
  fi
  while [ 1 ] ; do
    echo $idx
    if [ "$__idx" = "$__end" ] ; then
      break
    fi
    idx="$(instep_cmd "$__idx" "$step" "$format")"
    __idx="$(instep_cmd "$__idx" "$step" "$__internal_format")"
  done
}

first_date() {
  date -d "$1" '+%Y-%m-01'
}
last_date() {
  date -d "$(date -d "(date -d "$1" '+%Y-%m-15') 1month" '+%Y-%m-01') -1day" '+%Y-%m-%d'
}
loop_first_date() {
  s=$1
  e=$2
  f=${3:-%Y%m01}
  loop_date $(date -d "$s" '+%Y-%m-01') $(date -d "$e" '+%Y-%m-01') "$f" '1month'
}


function cobr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

function shc() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

function cworktree() {
    git rev-parse &>/dev/null
    if [ $? -ne 0 ]; then
        echo fatal: Not a git repository.
        return
    fi

    local selectedWorkTreeDir=`git worktree list | fzf | awk '{print $1}'`

    if [ "$selectedWorkTreeDir" = "" ]; then
        # Ctrl-C.
        return
    fi

    cd ${selectedWorkTreeDir}
}

function cfind() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

function cdp() {
  set -eu
  target=$1

  mkdir -p $target
  cd $target
}

function get_currrent_github_url() {
  git config remote.origin.url | tr ':' '/' | sed 's|^git@|https://|g'|sed 's/\.git$//g'
}

run-difit() {
  npx difit --host "$(hostname -i| awk '{print $1}')"
}

alias dcqlsh='docker run -it -v $(pwd)/:/tmp/work --network bridge --rm cassandra cqlsh'
alias opgh='opbr.sh $(get_currrent_github_url)'
