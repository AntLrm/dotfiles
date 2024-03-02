#!/bin/sh

i3lock -i ~/.config/i3/wallpaper.png -t -ef -n &
while [ $(pgrep i3lock | wc -l ) -ne 0 ];
do
    sleep 10
    if [ $(pgrep i3lock | wc -l ) -ne 0 ]
    then
        xset dpms force off
    fi
done
