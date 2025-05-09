# Check if we're in a distrobox container with a different $HOME
if test -n "$CONTAINER_ID" -a -n "$DISTROBOX_HOST_HOME"
    # Get the actual home directory path
    set -l actual_home $HOME
    
    # Add container-specific paths with higher precedence (prepend)
    fish_add_path --prepend --move $actual_home/.local/share/uv/tools
    fish_add_path --prepend --move $actual_home/bin
    fish_add_path --prepend --move $actual_home/.pixi/bin
    fish_add_path --prepend --move $actual_home/.local/bin
    fish_add_path --prepend --move $actual_home/.local/scripts
else
    # Regular path setup for non-container environment
    fish_add_path ~/.local/share/uv/tools
    fish_add_path ~/bin
    fish_add_path ~/.pixi/bin
    fish_add_path ~/.local/bin
    fish_add_path ~/.local/scripts
end

