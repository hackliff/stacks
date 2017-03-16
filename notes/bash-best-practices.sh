#! /usr/bin/env bash

# forbid undefined variables
set -o nounset
# exit on errors
set -o errexit

readonly script_PID="$$"

example () {
  # declare read-only variable (superior than local in options)
  # learn more: http://www.tldp.org/LDP/abs/html/declareref.html
  declare -r some_variable="$1"

  # create a temporary directory from a templated name
  directory=$(mktemp -d "hello-XXXXX")
  echo "${directory}"  # hello-vC5rB

  # generate a random value, thanks to built-in bash $RANDOM
  printf "%x" $RANDOM  # 57f1

  # download and diff two webpages
  diff <(wget -O - url1) <(wget -O - url2)
}
