#!/usr/bin/env bash

if [ "$INSIDE_WSL" = "true" ]; then
  to_install=
  if ! which socat 2> /dev/null; then
      echo "Missing socat."
      to_install="$to_install socat"
  fi

  if [ -n "$to_install" ] ; then
      if which apt 2> /dev/null ; then
          sudo apt update
          # shellcheck disable=SC2086
          sudo apt install -yy $to_install
      elif which dnf 2> /dev/null ; then
          # shellcheck disable=SC2086
          sudo dnf install -y $to_install
      else
          echo "Unknown system"
          exit 1
      fi
  fi

  if ! which npiperelay.exe 2> /dev/null; then
    mkdir ~/source/npiperelay
    pushd ~/source/npiperelay
    wget https://github.com/jstarks/npiperelay/archive/refs/heads/master.zip
    unzip master.zip
    rm master.zip
    cd npiperelay-master
    GOOS=windows go build -o "$HOME/bin/npiperelay.exe"
    popd
  fi

  if ! which wsl-open 2> /dev/null; then
    npm install --global wsl-open
  fi
fi
