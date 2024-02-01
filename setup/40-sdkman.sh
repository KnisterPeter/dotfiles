#!/usr/bin/env bash

echo -n "Install SDKMan ... "

if [ ! -d "$HOME/.sdkman" ] ; then
    curl -s "https://get.sdkman.io" | bash
fi

echo "✔️"
