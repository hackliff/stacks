#! /usr/bin/env bash

readonly DL_URL="http://apache.mirrors.ovh.net/ftp.apache.org/dist/flink"
readonly HADOOP_VERSION="hadoop27"
readonly SCALA_VERSION="scala_2.11"

install_flink () {
  local flink_version=$1

  echo "${DL_URL}/flink-${flink_version}/flink-${flink_version}-bin-${HADOOP_VERSION}-${SCALA_VERSION}.tgz"

  wget \
    -O /tmp/flink.tgz \
    "${DL_URL}/flink-${flink_version}/flink-${flink_version}-bin-${HADOOP_VERSION}-${SCALA_VERSION}.tgz"

  tar -C /opt -xzf /tmp/flink.tgz
}

# for the record
start_flink () {
  /opt/flink-1.1.3/bin/start-local.sh start
}

install_flink "1.1.3"
