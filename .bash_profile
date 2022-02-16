if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx -- vt1 &> /dev/null
else
  sudo loadkeys de
fi
