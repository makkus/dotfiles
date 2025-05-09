#! /usr/bin/env bash

echo "Running final tasks..."
which code
if command -v code 2>&1 >/dev/null
then
    ~/.local/scripts/manage-vscode-extensions.sh import
fi

