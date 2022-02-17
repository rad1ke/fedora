#!/bin/sh
[[ -f /etc/profile.d/lang.sh ]] && . /etc/profile.d/lang.sh
[[ -f ~/.Xresources ]] && xrdb -load "${HOME}/.Xresources"

for file in /etc/X11/xinit/xinitrc.d/* ; do
  . $file
done

prlcc &
prlcp &
SSH_AGENT="/usr/bin/ssh-agent"
eval $(keychain --eval --agents ssh --quick --quiet)
exec dbus-launch --sh-syntax --exit-with-session i3
