# ==================================================
# exported environment variables

# editor

export ALTERNATE_EDITOR=""

if [[ -f "$HOME/.emacs.d/.cache/dumps/spacemacs.pdmp" ]]; then
    export EDITOR="emacs --dump-file $HOME/.emacs.d/.cache/dumps/spacemacs.pdmp -nw"
    export VISUAL="emacs --dump-file $HOME/.emacs.d/.cache/dumps/spacemacs.pdmp"
else
    export EDITOR="emacs -nw"
    export VISUAL="emacs"
fi

# pager

# less (from: https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/ )
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

USER_PATH="$HOME/.local/setup/dotfiles/scripts:$HOME/.local/bin:$HOME/.local/bring:$HOME/.local/opt/emacs/bin:$HOME/.local/apps:/opt/mcfly"
GIT_REPOS_BASE_PATH="$HOME/.local/setup/git_repos"
GIT_REPOS_PATH="$GIT_REPOS_BASE_PATH/rofi-pass"

export PATH="${USER_PATH}:${GIT_REPOS_PATH}:${PATH}"

