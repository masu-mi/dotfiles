#!/usr/bin/env bash

set -ue

TOOLS=(
  "github.com/evilmartians/lefthook@latest"
  "github.com/x-motemen/ghq@latest"
  "golang.org/x/tools/cmd/goimports@latest"
  "github.com/go-delve/delve/cmd/dlv@latest"
)

for tool in "${TOOLS[@]}"; do
  echo "Installing $tool..."
  go install "$tool"
done
