# [Srclib](https://srclib.org/)

## Bootstrap

```Bash
$ go version
go version go1.7 darwin/amd64
$ go get -u -v sourcegraph.com/sourcegraph/srclib/cmd/srclib
$ pip install virtualenv  # needed for python toolchain
$ srclib toolchain install go javascript python
$ srclib toolchain list
sourcegraph.com/sourcegraph/srclib-javascript
sourcegraph.com/sourcegraph/srclib-go
sourcegraph.com/sourcegraph/srclib-python
$ srclib version
dev
```

```Bash
$ # repo = https://github.com/prasmussen/gdrive
$ cd $GOPATH/cd src/sourcegraph.com/sourcegraph/srclib-go
$ srclib config && srclib make
```

```Bash
$ srclib repo --verbose
# Current repository:
VCS: git
Root dir:
/Users/xav/.gvm/pkgsets/go1.7/global/src/sourcegraph.com/sourcegraph/srclib-go
Commit ID: 3ef3b95aa665ba2004881ac42f6518cc34f90b98

$ # analyze source successfully covered

$ # print dependencies
$ srclib units --output json

$ # build srclib store
$ srclib store import
$ srclib store index
$ echo "scanning project version $(srclib store versions)"
```
