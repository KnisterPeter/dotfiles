#!/usr/bin/env bash

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# shellcheck disable=SC1090
source <(volta completions bash)
