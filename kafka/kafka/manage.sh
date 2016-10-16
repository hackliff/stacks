#! /usr/bin/env bash

readonly APACHE_DL_URL="http://apache.mindstudios.com"
readonly KAFKA_HOME=/opt/kafka

install_kafka() {
  # TODO detect it ?
  local scala_version="2.11"
  local kafka_version=${1:-"0.10.0.0"}
  local dl_url="${APACHE_DL_URL}/kafka/${kafka_version}/kafka_${scala_version}-${kafka_version}.tgz"

  mkdir -p ${KAFKA_HOME}/{logs,data}

  # TODO check artifact digest integrity
  curl ${dl_url} | tar xvzf - -C ${KAFKA_HOME}
}

configuring_kafka() {
  # TODO test this command
  local IP=$(grep "\s${HOSTNAME}$" /etc/hosts | head -n 1 | awk '{print $1}')
  local ZOOKEEPER_CONNECTION_STRING=${ZOOKEEPER_ADDR:-"zookeeper:2181"}

  cat /opt/kafka/config/server.properties.template | sed \
    -e "s|{{ZOOKEEPER_CONNECTION_STRING}}|${ZOOKEEPER_CONNECTION_STRING}|g" \
    -e "s|{{ZOOKEEPER_CHROOT}}|${ZOOKEEPER_CHROOT:-}|g" \
    -e "s|{{KAFKA_BROKER_ID}}|${KAFKA_BROKER_ID:-0}|g" \
    -e "s|{{KAFKA_ADVERTISED_HOST_NAME}}|${KAFKA_ADVERTISED_HOST_NAME:-$IP}|g" \
    -e "s|{{KAFKA_PORT}}|${KAFKA_PORT:-9092}|g" \
    -e "s|{{KAFKA_ADVERTISED_PORT}}|${KAFKA_ADVERTISED_PORT:-9092}|g" \
    -e "s|{{KAFKA_DELETE_TOPIC_ENABLE}}|${KAFKA_DELETE_TOPIC_ENABLE:-false}|g" \
    > /opt/kafka/config/server.properties
}

start_kafka() {
  echo "rendering configuration files"
  configuring_kafka $@

  echo "starting kafka"
  exec ${KAFKA_HOME}/kafka_2.11-0.10.0.0/bin/kafka-server-start.sh ${KAFKA_HOME}/config/server.properties
}

if [ "$1" == "bootstrap" ]; then
  shift
  install_kafka $@
elif [ "$1" == "start" ]; then
  shift
  start_kafka $@
elif [ -z "$1" ]; then
  echo "please provide a command (bootstrap|start)"
else
  echo "unknown instructions: $@"
fi
