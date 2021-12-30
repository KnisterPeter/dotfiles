#!/usr/bin/env sh

ROOT="$(dirname "$(readlink -f "$(pwd)/$0")")"

for file in $(echo "$ROOT"/setup/*) ; do
    . "$file"
done

for file in $(ls -A "$ROOT"/home/) ; do
    src=$(readlink -f "$ROOT/home/$file")
    dst="$HOME/$(basename $src)"
    if [ ! -L "$dst" ] ; then
        if [ -e "$dst" ] ; then
            mv "$dst" "$dst.bak"
        fi
        ln -s "$src" "$dst"
    fi
done
