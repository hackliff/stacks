# Analytics with Presto and Airpal

## [Presto]()

```Bash
$ java -version
openjdk version "1.8.0_91"
OpenJDK Runtime Environment (build 1.8.0_91-8u91-b14-1~bpo8+1-b14)
OpenJDK 64-Bit Server VM (build 25.91-b14, mixed mode)
$ wget \
  -O /tmp/preto-server.tar.gz \
  https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.155/presto-server-0.155.tar.gz
$ tar C /opt -xvf /tmp/presto-server.tar.gz
$ cd /opt/presto-server-0.155
$ mkdir -p /usr/local/presto/data ./etc
$ [ ... create configuration ... ]
$ bin/launcher run --verbose
[ ... ]
2016-11-01T14:06:55.631Z        INFO    main com.facebook.presto.server.PrestoServer ======== SERVER STARTED ========
```

```Bash
$ wget \
  -O /usr/local/bin/presto \
  https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.155/presto-cli-0.155-executable.jar
$ chmod +x /usr/local/bin/presto
$ presto --server localhost:8080 --catalog mysql
presto> SHOW SCHEMAS FROM mysql;
```


## [Flink](https://flink.apache.org/)


## TODO

- Use Cassandra instead of MySQL
