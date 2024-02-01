#!/usr/bin/env bash

echo -n "Setup n ..."

mkdir -p "$HOME/.local/n/"
export N_PREFIX="$HOME/.local/n/"
export PATH=$N_PREFIX/bin:$PATH

echo "✔️"
