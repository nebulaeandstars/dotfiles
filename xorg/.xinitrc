#!/bin/sh

xrdb ~/.Xresources &

# keyboard settings
sxhkd &
sudo -n setxkbmap -option caps:swapescape &
sudo -n setkeycodes e038 125 &
xset r rate 300 50 &

# daemons
picom -b &
# nm-applet &
# blueman-applet &
timidity -iA &
dunst &

# other
dwmblocks &
feh --bg-fill --recursive --randomize ~/.local/share/backgrounds/ &

dwm

# session=${1:-i3}
# case $session in
#     i3                ) i3;;
#     dwm               ) dwm;;
#     openbox           ) openbox;;

#     # No known session, try to run it as command
#     *                 ) exec "$1";;
# esac
