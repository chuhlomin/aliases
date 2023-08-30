#!/bin/sh

# Print each command as it executes
set -x

STASHED=0
# Stash any local changes if any
if [ -n "$(git status --porcelain)" ]; then
  git stash
  STASHED=1
fi

# Pull the latest changes
git pull --rebase

# Apply any stashed changes
if [ $STASHED -eq 1 ]; then
  git stash pop
fi
