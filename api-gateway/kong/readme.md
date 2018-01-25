# [Kong](https://getkong.org)

- [Official docker image](https://hub.docker.com/_/kong/)
- [Official documentation](https://getkong.org/docs/)
- [Lua Nginx module](https://github.com/openresty/lua-nginx-module)

## Installation

```Bash
$ docker-compose up -d
$ # or
$ ./bootstrap.sh

$ curl http://127.0.0.1:8001 | python -m json.tool
$ curl http://127.0.0.1:8001/status | python -m json.tool

$ docker-compose exec kong kong health
```

## [Usage](https://getkong.org/docs/0.12.x/getting-started/adding-your-api/)

```Bash
$ # register upstream
$ curl -i -X POST \
  --url http://localhost:8001/apis/ \
  --data 'name=ipify' \
  --data 'upstream_url=https://api.ipify.org?format=json' \
  --data 'request_host=ipify.org'
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
