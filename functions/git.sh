#!/usr/bin/env bash

___select_commit_from_current_branch() {
  git ls --color |fzf --layout=reverse-list --ansi |sed -e 's/^[| *]\+//' |cut -d ' ' -f 1
}

___select_commit_from_all_branches() {
  git la --color |fzf --layout=reverse-list --ansi |sed -e 's/^[| *]\+//' |cut -d " " -f 1
}

__git_show_commit() {
  id="$(___select_commit_from_current_branch)"
  if [ -z "$id" ]; then
    exit
  fi

  git show "$id"
}

__git_show_files() {
  id="$(___select_commit_from_current_branch)"
  if [ -z "$id" ]; then
    exit
  fi

  git show --name-only "$id"
}

__git_fixup_select_commit() {
  id="$(___select_commit_from_current_branch)"
  if [ -z "$id" ]; then
    exit
  fi

  git commit --fixup "$id"
}

__git_fixup_rebase_branch() {
  id="$(___select_commit_from_current_branch)"
  if [ -z "$id" ]; then
    exit
  fi

  git rebase --interactive --autosquash "$id"
}

__git_rebase_interactive() {
  id="$(___select_commit_from_current_branch)"
  if [ -z "$id" ]; then
    exit
  fi
  
  git rebase --interactive "$id"
}

__git_rebase_change_parent() {
  id="$(___select_commit_from_current_branch)"
  if [ -z "$child" ] ; then
    exit
  fi

  new_parent="$(git la --color |fzf --layout=reverse-list --ansi |cut -d ' ' -f 1)"
  if [ -z "$new_parent" ] ; then
    exit
  fi

  git rebase --onto "$new_parent" "$child"^
}
