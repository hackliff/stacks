# Scala

## Setup

Either edit and run `bootstrap.sh` or use docker : `docker build --rm -t local/scala .`

## [Hello World](http://scala-lang.org/documentation/getting-started.html#your_first_lines_of_code)

_Assuming [Scala]() and [sbt]() are installed, and `SCALA_HOME` and
`PATH` are set (see bootstrap.sh or Dockerfile otherwise)_

```
$ # compile code
$ scalac HelloWorld.scala

$ scala HelloWorld
Hello, World!
```


## Frameworks to try

- [Akka](http://akka.io/) - _Build powerful concurrent & distributed applications more easily_
- [Finagle](https://twitter.github.io/finagle/) - _extensible RPC system for the JVM_


## Resources

- [Scala School](http://twitter.github.io/scala_school/)

- [Finagle](http://twitter.github.io/finagle/guide/index.html) -
  _extensible RPC system for the JVM, used to construct high-concurrency
  servers_

- [Scala exercices](https://www.scala-exercises.org/) - _an Open Source project for learning different technologies based in the Scala Programming Language_

- [Scala best practices](https://github.com/alexandru/scala-best-practices)

- [Twitter's effective scala guide](http://twitter.github.io/effectivescala/)

- [Awesome Scala](https://github.com/lauris/awesome-scala)

- [Vim-scala](https://github.com/derekwyatt/vim-scala) - _My work on
  integration of Scala into Vim_

- [Getting started gist](https://gist.github.com/djspiewak/cb72c41ac335a3a9b28b3307be04aa43)
