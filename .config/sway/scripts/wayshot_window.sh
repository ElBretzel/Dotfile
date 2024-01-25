#!/bin/sh
#

file="window_$(date +%Y-%m-%d-%T).png"
directory="$HOME/Images/screenshots/"
wayshot -s "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" -f "$directory$file" 2> /tmp/smanager.out
if [ "$(cat /tmp/smanager.out | wc -c)" -eq 0 ]; then
    dunstify -t 8000 -i "$directory$file" "Saved window screenshot as: $file"
    kitty +kitten clipboard "$directory$file"
fi

