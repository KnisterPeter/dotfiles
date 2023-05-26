#!/usr/bin/env bash

if [ "$INSIDE_WSL" = "true" ]; then
  if ! which socat 2> /dev/null; then
    if which apt 2> /dev/null ; then
        sudo apt update
        sudo apt install -yy socat
    elif which dnf 2> /dev/null ; then
        echo "todo: check which RPM package contains socat"
        exit 1
    else
        echo "Unknown system"
        exit 1
    fi
  fi

  if ! which npiperelay.exe 2> /dev/null; then
    go get -d github.com/jstarks/npiperelay
    GOOS=windows go build -o "$HOME/bin/npiperelay.exe" github.com/jstarks/npiperelay
  fi

  if ! which wsl-open 2> /dev/null; then
    yarn global add wsl-open
  fi
fi
