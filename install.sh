#!/usr/bin/env bash

find ./home -type f -exec sh -c '
    src="$(readlink -f $1)"
    dst="$HOME/$(basename $1)"
    [ ! -e "$dst" ] && ln -s "$src" "$dst"
' sh {} \;
