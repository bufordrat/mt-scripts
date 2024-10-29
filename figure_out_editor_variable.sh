#!/bin/sh

if echo "$INSIDE_EMACS" | grep -q tramp
then echo "no \$EDITOR over an ssh-tramp connection" ; exit 1
elif [ "$TERM" = ansi ]
then echo "no \$EDITOR when \$TERM is 'ansi'" ; exit 1
elif [ -n "$INSIDE_EMACS" -o 'emacs --version > /dev/null' ]
then if [ -n "$TERM" ]
     then emacsclient -nw -a 'emacs -nw' "$@"
     else emacsclient -a emacs "$@"
     fi
else vim "$@" || vi "$@" || echo 'no available $EDITOR in this terminal' 1>&2
fi
