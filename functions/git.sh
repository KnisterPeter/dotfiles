#!/usr/bin/env bash

__select_branch() {
  header="$1"

  git branch -a --color |sed -e 's/^\*\?\s*//g' |cut -d " " -f 1 |sed -e 's|remotes/||' |grep -v "HEAD" |fzf --no-sort --ansi --header "$header"
}

___select_commit_from_current_branch() {
  header="$1"

  git ls --color |fzf --layout=reverse-list --no-sort --ansi --header "$header" |sed -e 's/^[| *]\+//' |cut -d ' ' -f 1
}

___select_commit_from_all_branches() {
  git la --color |fzf --layout=reverse-list --no-sort --ansi |sed -e 's/^[| *]\+//' |cut -d " " -f 1
}

___select_commit_from_branch() {
  branch="$1"
  header="$2"

  git ls "$branch" --color |fzf --layout=reverse-list --no-sort --ansi --header "$header" |sed -e 's/^[| *]\+//' |cut -d ' ' -f 1
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
  ref="$1"
  if [ -z "$ref" ] ; then
    ref="$(___select_commit_from_current_branch)"
    if [ -z "$ref" ]; then
      exit
    fi
    ref="$ref^"
  fi

  git rebase --interactive --autosquash "$ref"
}

__git_rebase_interactive() {
  sha="$(___select_commit_from_current_branch)"
  if [ -z "$sha" ]; then
    exit
  fi
  
  git rebase --interactive "$sha"^
}

__git_rebase_change_parent() {
  target_branch="$1"

  child_sha="$(___select_commit_from_current_branch "Commit to rebase")"
  if [ -z "$child_sha" ] ; then
    exit
  fi

  if [ -z "$target_branch" ] ; then
    target_branch="$(__select_branch "Branch to rebase onto")"
    if [ -z "$target_branch" ] ; then
      exit
    fi
  fi

  new_parent_sha="$(___select_commit_from_branch "$target_branch" "Commit to rebase onto")"
  if [ -z "$new_parent_sha" ] ; then
    exit
  fi

  git rebase --onto "$new_parent_sha" "$child_sha"^
}

__git_drop_changes() {
  git stash push --keep-index --include-untracked --message=drop-stash --quiet
  stash="$(git stash list | grep 'drop-stash' | sed -e 's|:.*||')"
  if [ -n "$stash" ]; then
    git stash drop "$stash" --quiet
  else
    echo "No changes found to drop."
  fi
}
