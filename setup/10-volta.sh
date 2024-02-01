#!/usr/bin/env bash

echo -n "Install volta ... "

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

if ! which volta > /dev/null 2>&1 ; then
    echo "Volta not found. Installing..."
    curl https://get.volta.sh | bash -s -- --skip-setup
fi

echo "✔️"
