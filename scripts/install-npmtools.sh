#!/usr/bin/env bash

set -ue

TOOLS=(
  "@mariozechner/pi-coding-agent"
  "opencode-ai"
)

for tool in "${TOOLS[@]}"; do
  echo "Installing $tool..."
  npm install -g "$tool"
done
