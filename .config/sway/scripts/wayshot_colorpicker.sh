#!/bin/sh

file="/tmp/smanager.out"
wayshot -s "$(slurp -p)" --stdout | convert - -format '%[pixel:p{0,0}]' txt:-|grep -E "#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})" -o > "$file"
magick convert -size 100x100 xc:$(cat "$file") /tmp/.smanager-picker.png
if [ ! "$(cat "$file" | wc -c)" -eq 0 ]; then
    dunstify -t 8000 -i "/tmp/.smanager-picker.png" "You picked color: $(cat $file)"
    cat "$file" | wl-copy
fi

