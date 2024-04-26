#!/usr/bin/env bash

echo -n "  🔹 pnpm"

version="$(pnpm -v 2> /dev/null)"
# shellcheck disable=SC2001
major="$(echo "${version}" | sed -e 's/\(^[0-9]\+\).*/\1/')"

echo -n " (${version})"

if [[ $((major)) -ge 9 ]] ; then
  eval "$(pnpm completion bash)"
fi

echo ""
