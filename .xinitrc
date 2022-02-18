#!/bin/sh
[[ -f /etc/profile.d/lang.sh ]] && . /etc/profile.d/lang.sh
[[ -f ~/.Xresources ]] && xrdb -load "${HOME}/.Xresources"

for file in /etc/X11/xinit/xinitrc.d/* ; do
  . $file
done

prlcc &
prlcp &

export PATH="~/.cargo/bin:$PATH"

exec dbus-launch --sh-syntax --exit-with-session i3
