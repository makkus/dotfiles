if status is-interactive
    # Commands to run in interactive sessions can go here
    if has_command atuin
      atuin init fish | source
    end
    if has_command zoxide
      zoxide init fish | source
    end
end

# Check if we're in a distrobox container with a different $HOME
if test -n "$CONTAINER_ID" -a -n "$DISTROBOX_HOST_HOME"
    # Get the actual home directory path
    set -l actual_home $HOME
    
    # Add container-specific paths with higher precedence
    fish_add_path --prepend --move $actual_home/.pixi/bin
    fish_add_path --prepend --move $actual_home/.local/scripts
else
    # Regular path setup for non-container environment
    fish_add_path /home/markus/.pixi/bin
    fish_add_path /home/markus/.local/scripts
end

