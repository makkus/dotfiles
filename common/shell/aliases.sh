# ==================================================
# shell aliases

# cat
if exists bat; then
   alias cat='bat'
   alias c='bat -pp'
fi

# ls
alias ls='ls --color=tty'
alias lr='ls -larth'
alias lR='ls -R'
alias ll='ls -lah'

# tree
alias t='tree -L 2'
alias t1='tree -L 1'
alias t2='tree -L 2'
alias t3='tree -L 3'

## git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias gd='git diff '
alias gco='git checkout '
alias gl='git hist '
alias gh='git_select_hash'
alias gt='git tag '
alias gsu='git submodule update --recursive'

## systemctl
alias sc='systemctl'
alias scs='systemctl start'
alias scu='systemctl status'
alias scr='systemctl restart'
alias sct='systemctl stop'
alias sce='systemctl enable'
alias scd='systemctl disable'

alias scu='systemctl --user'
alias scus='systemctl --user start'
alias scuu='systemctl --user status'
alias scur='systemctl --user restart'
alias scut='systemctl --user stop'
alias scue='systemctl --user enable'
alias scud='systemctl --user disable'

# processes
alias p='get_process_id'
alias pp='get_process_parents'
#alias k='fkill -1'
#alias kk='fkill -9'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


## nix
alias ns='nix-env -qaP|grep'
alias ni='nix-env -i'
alias nun='nix-env --uninstall'
alias nup='nix-channel --update && nix-env --upgrade'

# vagrant

#alias vs='vagrant ssh'
#alias vu='vagrant up'
#alias vd='vagrant destroy'



# misc
alias my_ip='curl https://ipinfo.io'
alias ssh-no-key='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias psg="ps aux|grep"
alias port="netstat -tulanp"
alias listen="lsof -P -i -n"
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias pt='pytest -s -q --disable-warnings --no-cov'
alias ptk='pytest -s -q --disable-warnings --no-cov -k'


alias emacs="emacs --dump-file ${HOME}/.emacs.d/.cache/dumps/spacemacs.pdmp"
alias k="kubectl"

## apps
if exists htop; then
    alias top='htop'
fi

# freckles
alias ffa="freckles frecklet args"
alias fnl="freckles nsbl log"
alias fni="freckles nsbl info"
alias fx="frecklecute"
alias fxd="frecklecute -c dev"
alias fcl="freckles run-info current-logs"


# kitty
alias d="kitty +kitten diff"
alias icat="kitty +kitten icat"
alias to_clipboard="kitty +kitten clipboard"
alias from_clipboard="kitty +kitten clipboard --get-clipboard"

