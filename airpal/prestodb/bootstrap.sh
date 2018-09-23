#! /usr/bin/env bash

readonly DL_URL="https://repo1.maven.org/maven2/com/facebook/presto"

install_presto_server () {
  local presto_version=${1}

  apt-get update && apt-get install -y less
  wget \
    -O /opt/presto-server.tar.gz \
    "${DL_URL}/presto-server/${presto_version}/presto-server-${presto_version}.tar.gz"

  tar -C /opt -xvf /opt/presto-server.tar.gz
}

install_presto_cli () {
  local presto_version=${1}

  wget \
    -q -O /usr/local/bin/presto \
    ${DL_URL}/presto-cli/${presto_version}/presto-cli-${presto_version}-executable.jar
  chmod +x /usr/local/bin/presto
}

install_presto_server "0.145"
install_presto_cli "0.145"
