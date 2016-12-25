# Node.js

## [Immutable](https://facebook.github.io/immutable-js/)

- [Introduction Introduction to Immutable.js and Functional Programming
  Concepts](https://auth0.com/blog/intro-to-immutable-js)

### Setup

```Bash
$ node --version
v6.2.2
$ npm --version
3.9.5
$ npm install immutable@3.8.1
```

### Usage

```Javascript
const Immutable = require('immutable')

// immutable, lazy loaded mapreduce
var oddSquares = Immutable.Seq.of(1, 2, 3, 4)
                          .filter(x => x % 2)
                          .map(x => x * x)
```

---
