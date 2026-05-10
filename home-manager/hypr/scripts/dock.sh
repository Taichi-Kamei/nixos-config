#!/bin/bash

socat - UNIX-CONNECT:/run/user/1000/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | \
grep -E "monitoradded|monitorremoved" | \
while read -r _; do
    pkill nwg-dock-hyprland
    sleep 0.5
    hyprctl monitors | awk '/Monitor/{print $2}' | \
    while read -r mon; do
        nwg-dock-hyprland -d -nolauncher -hd 0 -mb 3 -i 40 -m -o "$mon" &
    done
done &
