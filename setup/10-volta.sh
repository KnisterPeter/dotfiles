#!/usr/bin/env bash

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

if ! which volta > /dev/null ; then
    echo "Volta not found. Installing..."
    curl https://get.volta.sh | bash -s -- --skip-setup
fi
