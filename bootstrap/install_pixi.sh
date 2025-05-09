#! /usr/bin/env bash

# Check if pixi is already installed
if [ ! -d "$HOME/.pixi/bin" ]; then
  echo "Installing pixi..."
  curl -fsSL https://pixi.sh/install.sh | PIXI_NO_PATH_UPDATE=true sh
else
  echo "pixi is already installed at $HOME/.pixi/bin"
fi
