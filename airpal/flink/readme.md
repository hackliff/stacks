# [Flink](https://flink.apache.org/)

```Bash
$ root@8ed0e198f7df:/opt/flink-1.1.3# java -version
openjdk version "1.8.0_91"
OpenJDK Runtime Environment (build 1.8.0_91-8u91-b14-1~bpo8+1-b14)
OpenJDK 64-Bit Server VM (build 25.91-b14, mixed mode)

$ wget http://wwwftp.ciril.fr/pub/apache/flink/flink-1.1.3/flink-1.1.3-bin-hadoop27-scala_2.11.tgz
$ tar xzvf flink-*.tgz
$ cd flink-1.1.3 && bin/start-local.sh
```

Dashboard available at localhost:8081

```Bash
$ apt-get update && apt-get install -y netcat
$ nc -l -p 9000
$ bin/flink run examples/streaming/SocketWindowWordCount.jar --port 9000
```

Use Python

```Bash
$ python --version
2.7.9
$ # install pip
$ curl https://bootstrap.pypa.io/get-pip.py|python
$ export PYTHONPATH=$PYTHONPATH:/$FLINK_HOME/resources/python
```

Use scala

```Bash
$ git clone https://github.com/tillrohrmann/flink-project.git
$ cd flink-project && sbt clean assembly
```

---

```
$ # flink shell
$ ./bin/start-scala-shell.sh local
Scala-Flink> val input = benv.fromElements(1, 2, 3, 4)
Scala-Flink> val double = input.map(_ * 2)
Scala-Flink> double.print()
[ ... ]
```

