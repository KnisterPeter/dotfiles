#!/usr/bin/env bash

echo -n "  🔹 npm"

# shellcheck disable=SC1090
source <(npm completion)

if [ -n "$GH_NPM_TOKEN" ] ; then
    npm config set //npm.pkg.github.com/:\_authToken=$GH_NPM_TOKEN
fi

echo ""
