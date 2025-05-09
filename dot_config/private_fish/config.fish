if status is-interactive
    # Commands to run in interactive sessions can go here
    if has_command atuin
      atuin init fish | source
    end
    if has_command zoxide
      zoxide init fish | source
    end
end

