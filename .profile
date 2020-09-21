#!/bin/sh

xrdb /home/guillaume/.config/X11/.Xressources

picom & # compton composition manager
feh --randomize --bg-scale --no-fehbg ~/Media/images/wallpapers/Landscapes/* &


