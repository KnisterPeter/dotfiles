#!/usr/bin/env bash

ROOT="$(readlink -f "$HOME/.bashrc")"
ROOT="$(dirname "$(dirname "$ROOT")")"

for file in $(echo "$ROOT"/setup/*) ; do
    # source file
    . "$file"
done

for file in $(ls -A "$ROOT"/home/) ; do
    src=$(readlink -f "$ROOT/home/$file")
    dst="$HOME/$(basename $src)"
    [ ! -e "$dst" ] && ln -s "$src" "$dst"
done
