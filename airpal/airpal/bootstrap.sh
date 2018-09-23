#! /usr/bin/env bash

# assumptions:
#  mysql table named airpal

install_airpal () {
  local presto_version="$1"

  # install make
  apt-get update && apt-get install -y build-essential git

  git clone https://github.com/airbnb/airpal /opt/airpal && cd /opt/airpal

  # install node and npm
  ./gradlew -Dairpal.prestoVersion=${presto_version} clean shadowJar
}

install_airpal "0.145"
