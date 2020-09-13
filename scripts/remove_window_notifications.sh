#!/usr/bin/env bash
#
# remove_window_notifications.sh: remove 'demands_attention' window notifications from all windows
#
# copyright Markus Binsteiner, 2020


if [[ -n $1 ]]; then
    sleep $1
fi

# echo "slept ${1} seconds...." >> "/tmp/notifications_removal_${1}"

while ! wmctrl -l
do
    # echo "failed" >> "/tmp/notifications_removal_${1}"
    sleep 1
done

IFS='
'
for x in `wmctrl -l | cut -f5- -d " "`;
do
    wmctrl -r "${x}" -b remove,demands_attention
    # echo "removing notification from: ${x}" >> "/tmp/notifications_removal_${1}"
done
