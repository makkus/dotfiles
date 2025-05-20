# ==================================================
# shell aliases

# cat
if has_command bat
   alias cat='bat'
   alias c='bat -pp'
end

# ls
if has_command eza
  alias ls='eza'
  alias lr='eza -lasmodified'
  alias lss='eza -lassize'
  alias lR='eza -R'
  alias ll='eza -la'

  alias e='eza'
  alias el='eza --long --header --git'
  #alias et='eza --long --tree --level=3'
  alias et2='eza --long --tree --level=2'
  alias et3='eza --long --tree --level=3'
  alias et4='eza --long --tree --level=4'
  alias et5='eza --long --tree --level=5'
  alias ett='eza --long --tree --level '

  alias tree='eza --tree'
  alias tree1='eza --tree -L1'
  alias tree2='eza --tree -L2'
  alias tree3='eza --tree -L3'

  alias treel='eza --tree|less -R'
  alias treel1='eza --tree -L1|less -R'
  alias treel2='eza --tree -L2|less -R'
  alias treel3='eza --tree -L3|less -R'
end

if has_command distrobox
  alias db='distrobox'
  alias dbe='distrobox enter'
end

## pass
if has_command pass
  alias old-pass="PASSWORD_STORE_DIR=~/.pass/old command pass"
  #alias pass="PASSWORD_STORE_DIR=~/.pass/current command pass"
end

## git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias gd='git diff '
alias gco='git checkout '
alias gl='git hist '
#alias gh='git_select_hash'
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

# misc
if has_command curl
  alias my_ip='curl https://ipinfo.io'
end
alias ssh-no-key='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias port="netstat -tulanp"
alias listen="lsof -P -i -n"
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

## apps
if has_command htop
    alias htop='TERM=xterm-256color command htop'
end

if has_command chezmoi
   alias ccd='chezmoi cd'
end



