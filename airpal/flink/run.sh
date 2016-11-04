#! /bin/sh

echo "starting local flink cluster..."
/opt/flink-1.1.3/bin/start-local.sh start

$@
