#!/bin/sh
. /etc/profile.d/lang.sh

for file in /etc/X11/xinit/xinitrc.d/* ; do
  . $file
done

xrdb -load $HOME/.Xresources

if [ -z "$SSH_AGENT" ] && [ -z "$SSH_AUTH_SOCK" ] && [ -z "$SSH_AGENT_PID" ] && [ -x /usr/bin/ssh-agent ]; then
  if [ "x$TMPDIR" != "x" ]; then
    SSH_AGENT="/usr/bin/ssh-agent /bin/env TMPDIR=$TMPDIR"
  else
    SSH_AGENT="/usr/bin/ssh-agent"
  fi
fi

exec i3
