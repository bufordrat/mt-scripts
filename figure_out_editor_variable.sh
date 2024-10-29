#!/bin/sh

if [ echo "$INSIDE_EMACS" | grep -q "tramp" ]
then echo "no \$EDITOR over an ssh-tramp connection" ; exit 1
elif [ "$TERM" = ansi ]
then echo "no \$EDITOR when \$TERM is 'ansi'" ; exit 1
elif [ -n "$INSIDE_EMACS" -o 'emacs --version > /dev/null' ]
then emacsclient -a emacs "$@"
else vim "$@" || vi "$@" || echo 'no available $EDITOR in this terminal' 1>&2
fi

# else
# fi

# if [ -n "$INSIDE_EMACS" -o "$TERM" = ansi ]
# then if emacs --version > /dev/null
#      then emacsclient -a emacs "$@"
#      else echo 'no available $EDITOR; are you in an Emacs shell?'; exit 1
# 	  # echo Message here; read msg; echo "$msg" > "$1"
#      fi
# else if emacs --version > /dev/null
#      then emacsclient -nw -a 'emacs -nw' "$@"
#      else vim "$@" || vi "$@" || echo 'no available $EDITOR in this terminal' 1>&2
#      fi
# fi
