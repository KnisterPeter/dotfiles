#!/usr/bin/env bash

if [ "$INSIDE_WSL" = "true" ]; then
  # Adding wsl-open as a browser for Bash for Windows
  if [[ -z $BROWSER ]]; then
    export BROWSER=wsl-open
  else
    export BROWSER=$BROWSER:wsl-open
  fi

  # shellcheck disable=SC1091
  source "$HOME/.agent-bridge.sh"
fi
