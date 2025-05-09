#! /usr/bin/env bash
# VS Code Extensions Manager

case "$1" in
  export)
    code --list-extensions > $HOME/.config/Code/.vscode-extensions
    ;;
  import)
    if [ -f $HOME/.vscode-extensions ]; then
      cat $HOME/.config/Code/.vscode-extensions | xargs -L 1 code --install-extension
    fi
    ;;
  *)
    echo "Usage: $0 {export|import}"
    exit 1
    ;;
esac
