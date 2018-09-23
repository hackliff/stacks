# [Elasticsearch](https://www.elastic.co/)

## Ressources

- [The definitive guide](https://www.elastic.co/guide/en/elasticsearch/guide/current/intro.html)
- [Official getting started](https://www.elastic.co/webinars/getting-started-elasticsearch)
- [Build a search engine with Node and elasticsearch](https://www.sitepoint.com/search-engine-node-elasticsearch/)
- [Index your Gmail Inbox with Elasticsearch](https://github.com/oliver006/elasticsearch-gmail)
- [Index & Search Hacker News using Elasticsearch and the HN API](https://github.com/oliver006/elasticsearch-hn)

- [Official Docker image](https://store.docker.com/images/1090e442-627e-4bf2-b29a-555f57a64ecd?tab=description)
- [Official Elasticsearch client library for Node.js and the browser](https://github.com/elastic/elasticsearch-js)


## Getting started

### Managed

```
$ // TODO clustering
$ docker run --detached --name es \
  -v "$PWD/config":/usr/share/elasticsearch/config \
  -v "$PWD/esdata":/usr/share/elasticsearch/data \
  -p 9200:9200 -p 9300:9300 \
  elasticsearch:5.1.2-alpine -Des.node.name="TestNode"
```

Once **elasticsearch** is ready, build Kibana and visit the dashboard at `localhost:5601`.

```Bash
$ docker run -d --name kibana \
  -p 5601:5601 \
  --link es:elasticsearch \
  kibana:5.1.2
```

### Manual

```Bash
$ java -version
openjdk version "1.8.0_111"
OpenJDK Runtime Environment (build 1.8.0_111-8u111-b14-2~bpo8+1-b14)
OpenJDK 64-Bit Server VM (build 25.111-b14, mixed mode)
$ echo $JAVA_HOME
/usr/lib/jvm/java-8-openjdk-amd64

$ export ES_VERSION="5.1.2"
$ curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ES_VERSION}.tar.gz
$ tar -xvf elasticsearch-${ES_VERSION}.tar.gz
$ ./elasticsearch-${ES_VERSION}/bin/elasticsearch

```


### Node

```Shell
$ node --version
v6.2.2
$ npm --version
3.9.5
```

## Usage

### HTTP API

```Bash
$ curl http://${ES_HOST}:${ES_PORT}/${INDEX}/${TYPE}/${DOC_INDEX}
```
