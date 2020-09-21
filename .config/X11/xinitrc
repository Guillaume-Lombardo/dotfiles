#!/bin/sh
# ~/.xinitrc

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[ -f "$HOME/.profile" ] && . ~/.profile

[ -f "$HOME/.Xressources" ] && xrdb "$HOME/.Xressources"

exec i3

[ -d "$HOME/Media/images/wallpapers/Landscapes" ] && feh --randomize --bg-scale --no-fehbg ~/Media/images/wallpapers/landscape/*


