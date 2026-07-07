#!/usr/bin/env bash

# tabtab source for packages
# uninstall by removing these lines
if [ -f ~/.config/tabtab/bash/__tabtab.bash ] ; then
  echo -n "  🔹 tabtab"

  # shellcheck disable=SC1090
  source ~/.config/tabtab/bash/__tabtab.bash

  echo ""
fi
