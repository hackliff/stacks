# [Iron Functions](https://github.com/iron-io/functions)

```Bash
$ # bootstrap server
$ docker run --rm -it --name functions --privileged -v $PWD/data:/app/data -p 8080:8080 iron/functions
$ # install client
$ curl -sSL http://get.iron.io/fn | sh
fn version 0.1.39
```

```Bash
$ docker pull iron/go:dev
$ fn init $USERNAME/hello
$ fn build
```
