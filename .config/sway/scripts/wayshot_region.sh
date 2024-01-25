#!/bin/sh
#

file="region_$(date +%Y-%m-%d-%T).png"
directory="$HOME/Images/screenshots/"
wayshot -s "$(slurp)" -f "$directory$file" 2> /tmp/smanager.out
if [ "$(cat /tmp/smanager.out | wc -c)" -eq 0 ]; then
    dunstify -t 8000 -i "$directory$file" "Saved region screenshot as: $file"
    kitty +kitten clipboard "$directory$file"
fi
