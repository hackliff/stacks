#! /usr/bin/env bash

readonly DRUID_DL_URL="http://static.druid.io/artifacts/releases"
# NOTE change /opt by /usr/local ?
readonly DRUID_HOME=/opt/druid

install_druid() {
  # TODO detect it ?
  local druid_version=${1:-"0.9.1.1"}
  local dl_url="${DRUID_DL_URL}/druid-${druid_version}-bin.tar.gz"

  test -d ${DRUID_HOME} || mkdir -m ${DRUID_HOME}

  # TODO check artifact digest integrity
  curl ${dl_url} | tar xvzf - -C ${DRUID_HOME}
}

configuring_druid() {
  # TODO test this command
  local IP=$(grep "\s${HOSTNAME}$" /etc/hosts | head -n 1 | awk '{print $1}')
  local ZOOKEEPER_CONNECTION_STRING=${ZOOKEEPER_ADDR:-"zookeeper:2181"}

  # TODO configure
}

start_druid() {
  echo "rendering configuration files"
  configuring_druid $@

  echo "starting druid"
  # TODO start druid services
}

if [ "$1" == "bootstrap" ]; then
  shift
  install_druid $@
elif [ "$1" == "start" ]; then
  shift
  start_druid $@
elif [ -z "$1" ]; then
  echo "please provide a command (bootstrap|start)"
else
  echo "unknown instructions: $@"
fi
