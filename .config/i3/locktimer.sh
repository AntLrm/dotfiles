#!/bin/sh

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 20 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .2' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  --timer 300 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .7; i3lock -i ~/.config/i3/wallpaper.png -t -ef -n' \
    '' \
  --timer 10 \
    'xset dpms force off' \
    '' \
  --timer 2000 \
    'systemctl suspend' \
    ''
