#!/bin/sh

xrdb ~/.Xresources &

# keyboard settings
# sxhkd -m -1 &
sxhkd &
setxkbmap -option caps:escape &
setkeycodes e038 125 &
xset r rate 300 50 &

# daemons
picom -b &
# nm-applet &
# blueman-applet &
timidity -iA &
unclutter --timeout 2 --jitter 50 --ignore-scrolling &
dunst &

# other
abar &
bgset "$(xdg-user-dir PICTURES)/backgrounds/"

while true
    do
    dwm 2> /dev/null
done

# session=${1:-i3}
# case $session in
#     i3                ) i3;;
#     dwm               ) dwm;;
#     openbox           ) openbox;;

#     # No known session, try to run it as command
#     *                 ) exec "$1";;
# esac
