#!/usr/bin/env bash

echo -n "  🔹 GitHub CLI"

eval "$(gh completion -s bash)"

if ! gh alias list | grep "create-draft:" > /dev/null ; then
    gh alias set create-draft "pr create --assignee @me --fill-first --draft"
fi
if ! gh alias list | grep "ssh:" > /dev/null ; then
    gh alias set ssh "codespace ssh -- -A -X"
fi

echo ""
