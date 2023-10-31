#!/bin/sh

threshhold_green=0
threshhold_yellow=25
threshhold_red=100

# ----------------------------------------------------- 
# Calculate available updates xbps, flatpak
# ----------------------------------------------------- 

if ! updates_void=$(xbps-install -nu 2> /dev/null | sed -n "s/\([^ ]*\).*/\1/p" | wc -l ); then
    updates_void=0
fi

if ! updates_flat=$(flatpak remote-ls --updates 2> /dev/null | sed -n "s/\([^ \t\n]*\).*/\1/p" | wc -l); then
    updates_flat=0
fi

updates=$((updates_void + updates_flat))

# ----------------------------------------------------- 
# Testing
# ----------------------------------------------------- 

# Overwrite updates with numbers for testing
# updates=100

# test JSON output
# printf '{"text": "0", "alt": "0", "tooltip": "0 Updates", "class": "red"}'
# exit

# ----------------------------------------------------- 
# Output in JSON format for Waybar Module custom-updates
# ----------------------------------------------------- 

css_class="green"

if [ "$updates" -gt $threshhold_yellow ]; then
    css_class="yellow"
fi

if [ "$updates" -gt $threshhold_red ]; then
    css_class="red"
fi

if [ "$updates" -gt $threshhold_green ]; then
    printf '{"text": "%s", "alt": "%s", "tooltip": "%s Updates", "class": "%s"}' "$updates" "$updates" "$updates" "$css_class"
else
    printf '{"text": "0", "alt": "0", "tooltip": "0 Updates", "class": "green"}'
fi
