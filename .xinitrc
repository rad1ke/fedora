#!/bin/sh
[[ -f /etc/profile.d/lang.sh ]] && . /etc/profile.d/lang.sh
[[ -f ~/.Xresources ]] && xrdb -load "${HOME}/.Xresources"

for file in /etc/X11/xinit/xinitrc.d/* ; do
  . $file
done

prlcc &
prlcp &

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1

exec dbus-launch --sh-syntax --exit-with-session i3
