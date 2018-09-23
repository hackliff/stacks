#! /usr/bin/env bash

readonly CONF_PATH="/opt/reference.yml"

cd /opt/airpal

# migrate database
java \
  -Duser.timezone=UTC \
  -cp build/libs/airpal-*-all.jar com.airbnb.airpal.AirpalApplication \
  db migrate ${CONF_PATH}

# start server
java -server \
  -Duser.timezone=UTC \
  -cp build/libs/airpal-*-all.jar com.airbnb.airpal.AirpalApplication \
  server ${CONF_PATH}
