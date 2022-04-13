#!/usr/bin/env bash

___select_commit_from_current_branch() {
  git ls --color |fzf --layout=reverse-list --ansi |sed -e 's/^[| *]\+//' |cut -d ' ' -f 1
}

___select_commit_from_all_branches() {
  git la --color |fzf --layout=reverse-list --ansi |sed -e 's/^[| *]\+//' |cut -d " " -f 1
}

__git_show_commit() {
  sha="$(___select_commit_from_current_branch)"
  if [ -z "$sha" ]; then
    exit
  fi

  git show "$sha"
}

__git_show_files() {
  sha="$(___select_commit_from_current_branch)"
  if [ -z "$sha" ]; then
    exit
  fi

  git show --name-only "$sha"
}

__git_fixup_select_commit() {
  sha="$(___select_commit_from_current_branch)"
  if [ -z "$sha" ]; then
    exit
  fi

  git commit --fixup "$sha"
}

__git_fixup_rebase_branch() {
  sha="$(___select_commit_from_current_branch)"
  if [ -z "$sha" ]; then
    exit
  fi

  git rebase --interactive --autosquash "$sha"
}

__git_rebase_interactive() {
  sha="$(___select_commit_from_current_branch)"
  if [ -z "$sha" ]; then
    exit
  fi
  
  git rebase --interactive "$sha"
}

__git_rebase_change_parent() {
  child_sha="$(___select_commit_from_all_branches)"
  if [ -z "$child_sha" ] ; then
    exit
  fi

  new_parent_sha="$(___select_commit_from_all_branches)"
  if [ -z "$new_parent_sha" ] ; then
    exit
  fi

  git rebase --onto "$new_parent_sha" "$child_sha"^
}
