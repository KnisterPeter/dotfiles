#!/usr/bin/env bash

echo -n "Setup pnpm ..."

export PNPM_HOME="/home/markusw/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

echo "✔️"
