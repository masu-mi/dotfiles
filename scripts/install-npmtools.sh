#!/usr/bin/env bash

set -ue

TOOLS=(
  "@anthropic-ai/claude-code"
  "@google/gemini-cli"
  "@openai/codex"
  "@github/copilot"
)

for tool in "${TOOLS[@]}"; do
  echo "Installing $tool..."
  npm install -g "$tool"
done
