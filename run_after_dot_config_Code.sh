#!/bin/bash

# This script runs after .config/Code is synced
# It imports VSCode extensions from the saved list

echo "Importing VSCode extensions..."
~/.local/scripts/manage-vscode-extensions.sh import