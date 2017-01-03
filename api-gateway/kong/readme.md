# [Kong](https://getkong.org)

- [Official docker image](https://hub.docker.com/_/kong/)
- [Official documentation](https://getkong.org/docs/)
- [Lua Nginx module](https://github.com/openresty/lua-nginx-module)

## Installation

```Bash
$ docker run -d --name kong-database \
  -p 5432:5432 \
  -e "POSTGRES_USER=kong" \
  -e "POSTGRES_DB=kong" \
  postgres:9.6.1-alpine

$ docker run -d --name kong \
  --link kong-database:kong-database \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-database" \
  -p 8000:8000 \
  -p 8443:8443 \
  -p 8001:8001 \
  -p 7946:7946 \
  -p 7946:7946/udp \
  kong:0.9.7

$ curl http://127.0.0.1:8001 | python -m json.tool
$ curl http://127.0.0.1:8001/status | python -m json.tool
```

## Usage

```Bash
$ # register upstream
$ curl -i -X POST \
  --url http://localhost:8001/apis/ \
  --data 'name=mockbin' \
  --data 'upstream_url=http://mockbin.com/' \
  --data 'request_host=mockbin.com'
```

## Plugins

### Key auth

```Bash
$ # enable the key-auth plugin
$ curl -i -X POST \
  --url http://localhost:8001/apis/mockbin/plugins/ \
  --data 'name=key-auth'
$ # register a consumer
$ curl -i -X POST \
  --url http://localhost:8001/consumers/ \
  --data "username=Jason"
$ # create an api key
$ curl -i -X POST \
  --url http://localhost:8001/consumers/Jason/key-auth/ \
  --data 'key=ENTER_KEY_HERE'
$ # did it work ?
$ curl -i -X GET \
  --url http://localhost:8000 \
  --header "Host: mockbin.com" \
  --header "apikey: ENTER_KEY_HERE"
```


### Plugin development

```Bash
$ docker exec -it $(basename ${PWD})_kong_1 bash
[kong] $ cd /usr/local/kong 
```

---

## Todo

- Fix docker-comppose

## Module Ideas

- AB Test module
- Traffic Replication
- Feature Flags
- Events forwarding / messaging / normalizer / enrichment
- InfluxDB / Grafana monitoring
