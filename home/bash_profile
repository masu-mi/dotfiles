#!/usr/bin/env bash

if [ "$(uname)" == "Linux" ]; then
  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && export SDKMAN_DIR="${HOME}/.sdkman" && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
fi

# . ~/.bashrc
exec ssh-agent $SHELL
