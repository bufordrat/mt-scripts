#!/bin/sh
set -x

if echo "$INSIDE_EMACS" | grep -q tramp
then echo "no \$EDITOR over a tramp connection" ; exit 1
elif [ -z "$INSIDE_EMACS" -a "$TERM" = ansi ]
then echo "no \$EDITOR in an ssh-ed Emacs shell" ; exit 1
elif [ -n "$INSIDE_EMACS" ] || emacs --version > /dev/null
# fix this below
then if [ "I'm in a real terminal" ]
     then emacsclient -a emacs "$@"
     else emacsclient -nw -a 'emacs -nw' "$@"
     fi
else vim "$@" || vi "$@" || echo 'no available $EDITOR in this terminal' 1>&2
fi
