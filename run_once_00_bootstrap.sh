#! /usr/bin/env bash

~/.local/share/chezmoi/bootstrap/install_pixi.sh

~/.pixi/bin/pixi exec -s pyinfra pyinfra -y @local ~/.local/share/chezmoi/bootstrap/deploy.py

