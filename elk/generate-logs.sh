#! /usr/bin/env bash
#
# Copyright (C) 2016 bruhierexavier <bruhierexavier@MacBook-Pro-de-Admin-99.local>

set -x

_write_log() {
  local message="$1"
  local message="$2"
  local container="$(basename $PWD)_filebeat_1"

  docker exec -it ${container} bash -c "echo ${message} >> ${log_path}"
}

main() {
  local log_path="$1"

  test -d ${log_path} || mkdir ${log_path}

  _write_log ${log_path} '{\"verified\": false, \"user\": \"arthur\", \"session_id\": \"91e5b9d\", \"id\": 42, \"event\": \"logged_in\"}'
}

main /var/log/nodejs/app.log
