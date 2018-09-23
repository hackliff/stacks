#! /usr/bin/env bash

# unofficial strict mode
set -eo pipefail

BRANCH="$(git rev-parse --abbrev-ref HEAD)"

git checkout master

git merge --no-ff "$BRANCH"

git push
git push --delete origin "$BRANCH"
git branch --delete "$BRANCH"
