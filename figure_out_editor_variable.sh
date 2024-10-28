#!/bin/sh

if [ -n "$INSIDE_EMACS" -o "$TERM" = ansi ]
then if emacs --version > /dev/null
     then emacsclient -a emacs "$@"
     else echo 'no available $EDITOR; are you in an Emacs shell?'; exit 1
	  # echo Message here; read msg; echo "$msg" > "$1"
     fi
else if emacs --version > /dev/null
     then emacsclient -nw -a 'emacs -nw' "$@"
     else vim "$@" || vi "$@" || echo 'no available $EDITOR in this terminal' 1>&2
     fi
fi
