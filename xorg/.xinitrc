#!/bin/sh

xrdb ~/.Xresources &

# keyboard settings
sxhkd &
sudo -n setxkbmap -option caps:escape &
sudo -n setkeycodes e038 125 &
xset r rate 300 50 &

# daemons
picom -b &
# nm-applet &
# blueman-applet &
timidity -iA &
unclutter --timeout 2 --jitter 50 --ignore-scrolling &
dunst &

# other
dwmblocks &
bgset "$(xdg-user-dir PICTURES)/backgrounds/"

dwm

# session=${1:-i3}
# case $session in
#     i3                ) i3;;
#     dwm               ) dwm;;
#     openbox           ) openbox;;

#     # No known session, try to run it as command
#     *                 ) exec "$1";;
# esac
