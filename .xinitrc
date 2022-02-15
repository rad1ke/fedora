#!/bin/sh
if [ -r /etc/profile.d/lang.sh ]; then
  . /etc/profile.d/lang.sh
fi

userresources=$HOME/.Xresources

sysresources=/etc/X11/Xresources
sysmodmap=/etc/X11/Xmodmap
sysxkbmap=/etc/X11/Xkbmap

[ -r "$sysresources" ] && xrdb -nocpp -merge "$sysresources"
[ -r "$userresources" ] && xrdb -merge "$userresources"

if [ -r "$sysxkbmap" ]; then
    setxkbmap $(cat "$sysxkbmap")
fi

if [ -r "$userxkbmap" ]; then
    setxkbmap $(cat "$userxkbmap")
fi

if ! [ -r "$sysxkbmap" -o -r "$userxkbmap" ] ; then
    [ -r "$sysmodmap" ] && xmodmap "$sysmodmap"
    [ -r "$usermodmap" ] && xmodmap "$usermodmap"
fi

for file in /etc/X11/xinit/xinitrc.d/* ; do
        . $file
done

if [ -z "$SSH_AGENT" ] && [ -z "$SSH_AUTH_SOCK" ] && [ -z "$SSH_AGENT_PID" ] && [ -x /usr/bin/ssh-agent ]; then
    if [ "x$TMPDIR" != "x" ]; then
        SSH_AGENT="/usr/bin/ssh-agent /bin/env TMPDIR=$TMPDIR"
    else
        SSH_AGENT="/usr/bin/ssh-agent"
    fi
fi

exec i3
