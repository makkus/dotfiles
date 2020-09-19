#!/usr/bin/env bash

MBSYNC_CONFIG_PATH="${HOME}/.local/setup/dotfiles/mbsync"

function retrieve_current {
    local account_name=${1}
    local mb_config="${MBSYNC_CONFIG_PATH}/${account_name}.mb"
    mbsync -c ${mb_config} ${account_name}-inbox ${account_name}-current-archive ${account_name}-sent ${account_name}-drafts ${account_name}-trash
}


retrieve_current frkl &
retrieve_current markus &
retrieve_current posteo &

wait

