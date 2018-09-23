# Marionette - Scrapy spider under Nats Control

Build an interactive spider woth [Scrapy](), [Nats]() and [Python 3
asyncio]().

- https://github.com/nats-io/asyncio-nats
- https://github.com/nats-io/go-nats
- https://doc.scrapy.org/en/latest/topics/signals.html
- https://doc.scrapy.org/en/latest/topics/extensions.html#topics-extensions

## Install

```Bash
$ # TODO install without Go
$ # what about https://github.com/nats-io/nats-streaming-server
$ go get github.com/nats-io/gnatsd
$ gnatsd --debug
```

```Bash
$ go get github.com/nats-io/go-nats
$ # start the client first
$ go run client.go
```

```Bash
$ mkvirtualenv \
  -a . \
  -r ./requirements.txt \
  --python="$(which python3)" \
  stacks-nats

$ # then start the server/spider simulator
$ python spider-simulator.py
```


## Usage


```Bash
$ alias scrape='scrapy crawl --loglevel DEBUG -o - -t jl'
$ scrape Basic -a url=http://google.com
```

