#!/usr/bin/env bash

ANDROID_HOME="$HOME/Android/Sdk"
if [ -d "$ANDROID_HOME" ] ; then
    echo -n "  🔹 Android SDK"

    export ANDROID_HOME
    export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"

    echo ""
fi
