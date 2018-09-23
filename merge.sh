#! /usr/bin/env bash

# unofficial strict mode
set -eo pipefail

BRANCH="$1"

git checkout master

git merge --no-ff "$BRANCH"

git push
git push --delete origin "$BRANCH"
git branch --delete "$BRANCH"
