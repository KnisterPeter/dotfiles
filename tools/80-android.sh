#!/usr/bin/env bash

echo -n "  🔹 Android SDK"

export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"

echo ""
