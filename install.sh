#!/usr/bin/env bash

ROOT="$(dirname "$(readlink -f "$(pwd)/$0")")"
# shellcheck disable=SC2034
INSTALL_SECRETS=${1:-false}

for file in $(echo "$ROOT"/setup/*) ; do
    # shellcheck disable=SC1090
    . "$file"
done

# shellcheck disable=SC2045
for file in $(ls -A "$ROOT"/home/) ; do
    src=$(readlink -f "$ROOT/home/$file")
    dst="$HOME/$(basename "$src")"
    if [ ! -L "$dst" ] ; then
        if [ -e "$dst" ] ; then
            mv "$dst" "$dst.bak"
        fi
        ln -s "$src" "$dst"
    fi
done
