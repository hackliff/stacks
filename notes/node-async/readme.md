# Job Queue for Node.js App

## Challengers

- [Bull](https://github.com/OptimalBits/bull) - _A NodeJS persistent job and message queue based on Redis_
- [Async]() - _utility module which provides straight-forward, powerful functions for working with asynchronous JavaScript_
- [Kue](Kue is a priority job queue backed by redis, built for node.js) - _Kue is a priority job queue backed by redis, built for node.js_

## Usage

```Bash
$ npm init --yes
$ npm install --save bull kue async
$ docker run -d --name redis -p 6379:6379 redis:3.2.5-alpine
2f4094fn67...
```

```Bash
$ node server-{bull,kue,async}.js

Queue app listening on port 3000!
$  curl -X POST localhost:3000/jobs/34
{"queued":true,"id":"34"}%

$ # for bull
$ curl -XGET localhost:3000/jobs
{"count":0}% 
```
