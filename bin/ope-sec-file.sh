#!/usr/bin/env bash
# This script is used in build pipelin

set -eu

function usage() {
  echo "USAGE"
  echo "  DECRYPT_KEY=secret_key_value $0 (encrypt|decrypt) {plain text file path}"
}

mode=$1
target_name=$2
case $mode in
  encrypt)
    # IV=$(v=$(openssl rand -hex 32); echo ${v^^} | perl -pe 's/\n//g')
    IV=$(openssl rand -hex 16 | perl -pe 's/\n//g')
    echo $IV
    openssl aes-256-cbc -iv "${IV}" -K "$DECRYPT_KEY" -e -in "$target_name" -out  "$target_name.enc"
    echo "$IV" > "$target_name.iv"
    ;;
  decrypt)
    IV=$(cat "$target_name.iv" | perl -pe 's/\n//g')
    openssl aes-256-cbc -iv ${IV} -K "$DECRYPT_KEY" -d -in "$target_name.enc" -out "$target_name"
    ;;
  *)
    usage
    exit 1
esac
