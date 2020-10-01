# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# .zshrc

# ==================================================
# source common functions, vars, aliases

source "${HOME}/.local/setup/dotfiles/common/shell/functions.sh"
source "${HOME}/.local/setup/dotfiles/common/shell/vars.sh"
source "${HOME}/.local/setup/dotfiles/common/shell/aliases.sh"

# ==================================================
# general options

set IGNORE_EOF                   # Do net exit on end-of-file
setopt autocd autopushd pushdignoredups

# autoloads
export WORDCHARS="_-"
autoload select-word-style
select-word-style normal


# ==================================================
# history stuff

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# ==================================================
# keys

bindkey -e
bindkey '^L' backward-kill-word  # helm-like delete last part of path


# ==================================================
# asdf

source "${HOME}/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

# ==================================================
# zinit

declare -A ZINIT
ZINIT[BIN_DIR]="${HOME}/.local/setup/git_repos/zinit"
source "${ZINIT[BIN_DIR]}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light ajeetdsouza/zoxide

zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
    direnv/direnv

zinit light-mode lucid wait has"kubectl" for \
  id-as"kubectl_completion" \
  as"completion" \
  atclone"kubectl completion zsh > _kubectl" \
  atpull"%atclone" \
  run-atpull \
  zdharma/null

zstyle ":history-search-multi-word" page-size "11"
zinit ice wait"1" lucid
zinit load zdharma/history-search-multi-word

# zinit ice wait"0c" lucid reset \
#     atclone"local P=${${(M)OSTYPE:#*darwin*}:+g}
#             \${P}sed -i \
#             '/DIR/c\DIR 38;5;63;1' LS_COLORS; \
#             \${P}dircolors -b LS_COLORS > c.zsh" \
#     atpull'%atclone' pick"c.zsh" nocompile'!' \
#     atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
# zinit light trapd00r/LS_COLORS

# Autosuggestions & fast-syntax-highlighting
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# zsh-autosuggestions
zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions



autoload -Uz compinit
compinit

zinit cdreplay -q

# mcfly

# if [[ -r "/opt/mcfly/mcfly.zsh" ]]; then
#     # export MCFLY_LIGHT=TRUE
#     source "/opt/mcfly/mcfly.zsh"
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

