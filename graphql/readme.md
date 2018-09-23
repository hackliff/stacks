# [GraphQL](http://graphql.org/)

## Usage

### Servers

```Bash
$ npm install express express-graphql graphql
$ node server.js
```

### Clients

```Bash
$ # in bash witout dependencies, see client.bash
$ curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"query": "{ hello  }"}' \
  http://localhost:4000/graphql

$ pip install requests
$ python client.py
```
