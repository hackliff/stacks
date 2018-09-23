#! /usr/bin/env sh

set -eo pipefail
IFS=$'\n\t'

readonly DL_URL="https://github.com/victorcoder/dkron/releases/download"

# credits: https://github.com/victorcoder/docker-dkron
download_dkron () {
  local dkron_version="$1"
  local dkron_home="${2:-/opt/local/dkron}"
  local platform="linux_amd64"

  # reinstall wget with https support (needed for later verisons of alpine ?)
  apk add --update bash ca-certificates openssl wget
  rm -rf /var/cache/apk/*

  # download dkron
  wget \
    --no-check-certificate \
    -O dkron.tar.gz \
    "${DL_URL}/v${dkron_version}/dkron_${dkron_version}_${platform}.tar.gz"
  tar -xzf dkron.tar.gz

  # install it system wide
  mkdir -p ${dkron_home}
  mv dkron_${dkron_version}_linux_amd64/* ${dkron_home}
  rm dkron.tar.gz
  rm -rf dkron_${dkron_version}_linux_amd64
}

download_dkron "${DKRON_VERSION}"
