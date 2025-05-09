#! /usr/bin/env bash

~/.local/share/chezmoi/bootstrap/install_pixi.sh

echo "Syncing global pixi manifest..."
~/.pixi/bin/pixi global sync

