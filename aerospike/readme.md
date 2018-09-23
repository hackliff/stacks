# [Aerospike](http://www.aerospike.com/)

## Getting started

### Server

```Bash
$ TODO advanced usage at https://github.com/aerospike/aerospike-server.docker

$ docker run -tid --name aerospike \
  -v $PWD/etc:/opt/aerospike/etc \
   -p 3000:3000 \
   -p 3001:3001 \
   -p 3002:3002 \
   -p 3003:3003 \
  aerospike/aerospike-server:latest
```

### Clients

```Bash
$ # using python 3.5.1 and pip 8.1.2
$ pip install "aerospike==2.0.5"
```
