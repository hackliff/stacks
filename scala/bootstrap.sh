#! /usr/bin/env bash

readonly INSTALL_PATH="/opt"
readonly SCALA_HOME="${INSTALL_PATH}/scala"
readonly SBT_URL="https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt"

install_scala() {
  local scala_version=${1:-"2.9.3"}

  cd ${INSTALL_PATH}

  curl "http://www.scala-lang.org/files/archive/scala-${scala_version}.tgz" | tar xz
  ln -s "$PWD/scala-${scala_version}" "$PWD/scala"

  export SCALA_HOME=$PWD/scala
  export PATH=$PATH:$SCALA_HOME/bin

  scala -version
}

# http://www.lihaoyi.com/Ammonite/#Ammonite-REPL
install_repl() {
  curl -L \
    -o ${SCALA_HOME}/bin/amm \
    https://git.io/v1rPf
  chmod +x ${SCALA_HOME}/bin/amm
}

install_old_sbt() {
  local sbt_version=${1:-"0.13.11"}
  wget -q \
    -O ${INSTALL_PATH}/scala/bin/sbt-launch.jar \
    "${SBT_URL}/sbt-launch/${sbt_version}/sbt-launch.jar"

  # wrap sbt
  cat << EOF > ${INSTALL_PATH}/scala/bin/sbt
#!/bin/bash
SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
java $SBT_OPTS -jar ${SCALA_HOME}/bin/sbt-launch.jar "$@"
EOF

  chmod +x ${INSTALL_PATH}/scala/bin/sbt
}

install_extra_sbt() {
  curl -L \
    -o ${SCALA_HOME}/bin/sbt \
    https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt
  chmod +x ${SCALA_HOME}/bin/sbt
}

install_scala "2.11.8"
install_extra_sbt
install_repl
