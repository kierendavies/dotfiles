#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap us -variant colemak -option caps:backspace
xset r 66

case $1 in
  gnome) exec gnome-session;;
  i3);;
  *) exec i3;;
esac
