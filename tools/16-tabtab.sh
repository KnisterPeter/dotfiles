#!/usr/bin/env bash

echo -n "Setup tabtab ..."

# tabtab source for packages
# uninstall by removing these lines
if [ -f ~/.config/tabtab/bash/__tabtab.bash ] ; then
  # shellcheck disable=SC1090
  source ~/.config/tabtab/bash/__tabtab.bash
fi

echo "✔️"
