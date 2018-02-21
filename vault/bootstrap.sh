#!/usr/bin/env bash

set -eo pipefail

readonly PKG_URL="https://releases.hashicorp.com"
readonly BIN_DIR="/usr/local/bin"
readonly PKG_NAME="vault"
readonly PKG_DEFAULT_VERSION="0.9.3"
readonly CONSUL_DEFAULT_VERSION="1.0.6"

install_vault() {
  local tmp_dest="/tmp/${PKG_NAME}.zip"
  local pkg_version=${1:-"${PKG_DEFAULT_VERSION}"}
  # TODO automatic detection (uname -m ?)
  local bitsize="amd64"
  local platform="$(echo "$(uname)" | awk '{print tolower($0)}')_${bitsize}"

  echo -e "\ndownloading ${PKG_NAME} v${pkg_version}..."
  echo "${PKG_URL}/${PKG_NAME}/${pkg_version}/${PKG_NAME}_${pkg_version}_${platform}.zip"
  curl -Lk \
    -o ${tmp_dest} \
    "${PKG_URL}/${PKG_NAME}/${pkg_version}/${PKG_NAME}_${pkg_version}_${platform}.zip"
  unzip -d ${BIN_DIR} ${tmp_dest}

  vault --version
  echo "installing autocompletino"
  vault -autocomplete-install

  # clean up
  rm -rf ${tmp_dest}
}

install_consul() {
  local tmp_dest="/tmp/consul.zip"
  local pkg_version=${1:-"${CONSUL_DEFAULT_VERSION}"}
  local bitsize="amd64"
  local platform="$(echo "$(uname)" | awk '{print tolower($0)}')_${bitsize}"

  local package="consul_${pkg_version}_${platform}.zip"

  echo "downloading consul (${PKG_URL}/consul/${pkg_version}/${package})"
  curl -Lk \
    -o ${tmp_dest} \
    "${PKG_URL}/consul/${pkg_version}/${package}"
  unzip -d ${BIN_DIR} ${tmp_dest}

  # clean up
  rm -rf ${tmp_dest}
}

install_foreman() {
  pip install -U honcho
}

main() {
  # idempotent execution
  command -v ${PKG_NAME} > /dev/null 2>&1 || install_vault
  echo "done: $(command -v ${PKG_NAME})"

  command -v consul > /dev/null 2>&1 || install_consul
  echo "done: $(command -v consul)"

  command -v honcho > /dev/null 2>&1 || install_foreman
  echo "done: $(command -v honcho)"
}

main $@
