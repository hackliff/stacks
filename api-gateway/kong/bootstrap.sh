#! /usr/bin/env bash

c_start_postgres() {
  local db_name="$1"

  docker run -d --name kong-database \
    -p 5432:5432 \
    -e "POSTGRES_USER=kong" \
    -e "POSTGRES_DB=kong" \
    postgres:9.6.1-alpine
}

c_start_kong() {
  local db_name="$1"

  docker run -d --name kong \
    --link ${db_name}:${db_name} \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=${db_name}" \
    -p 8000:8000 \
    -p 8443:8443 \
    -p 8001:8001 \
    -p 7946:7946 \
    -p 7946:7946/udp \
    kong:0.9.7
}

c_start_postgres "kong-database"
sleep 5
c_start_kong "kong-database"
