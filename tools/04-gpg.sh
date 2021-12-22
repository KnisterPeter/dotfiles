#!/usr/bin/env bash

if [ -z "$GPG_TTY" ] ; then
    GPG_TTY=$(tty); export GPG_TTY
fi
