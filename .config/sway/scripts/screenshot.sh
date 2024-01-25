#!/bin/bash

options=$(echo -e "🖥️ Whole screen\n🪟 Current window\n📐 Region\n🎨 Color picker")

selected_option=$(echo -e "$options" | rofi -dmenu -i -mesg "📸 Screenshots Manager:" -theme "$HOME/.config/sway/scripts/rofi/style-1.rasi")

# Handle the selected option
case $selected_option in
    "🖥️ Whole screen")
        sh "$HOME/.config/sway/scripts/wayshot_full.sh"
        ;;
    "🪟 Current window")
        sh "$HOME/.config/sway/scripts/wayshot_window.sh"
        ;;
    "📐 Region")
        sh "$HOME/.config/sway/scripts/wayshot_region.sh"
        ;;
    "🎨 Color picker")
        sh "$HOME/.config/sway/scripts/wayshot_colorpicker.sh"
        ;;
esac

