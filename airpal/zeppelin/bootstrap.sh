#! /usr/bin/env bash

readonly DL_URL="http://apache.crihan.fr/dist/zeppelin"
readonly DL_TMP="/tmp"

install_zeppelin () {
  local zeppelin_version=$1
  local install_path=${2:-/opt}
  wget \
    -O ${DL_TMP}/zeppelin.tgz \
    "${DL_URL}/zeppelin-${zeppelin_version}/zeppelin-${zeppelin_version}-bin-all.tgz"

  tar -C ${install_path} -xvzf ${DL_TMP}/zeppelin.tgz
}

install_zeppelin "0.6.2"
