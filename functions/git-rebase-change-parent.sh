#!/usr/bin/env bash

git_rebase_change_parent() {
  child="$(git lsng |fzf |cut -d ' ' -f 1)"
  if [ -z "$child" ] ; then
    exit
  fi

  new_parent="$(git lsng |fzf |cut -d ' ' -f 1)"
  if [ -z "$new_parent" ] ; then
    exit
  fi

  git rebase --onto "$new_parent" "$child"^
}
