#! /usr/bin/env bash

# Check if uv is already installed
if [ ! -f "$HOME/.local/bin/uv" ]; then
  echo "Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
else
  echo "uv is already installed at $HOME/.local/bin"
fi
