#!/usr/bin/env bash

if [ -z "$GPG_TTY" ] ; then
    export GPG_TTY=$(tty)
fi
