# [Stdlib](www.stdlib.com)

https://github.com/poly/stdlib


```Bash
$ # TODO version
$ npm install lib -g

$ project="negate"
$ username="hackliff"

$ lib init
$ lib info ${username}

User hackliff has 0 service packages

$ lib create negate
$ cd ${username}/${project}

$ # match env.json environment
$ environment="dev"
$ lib up $environment
$ curl https://${username}.stdlib.com/${project}@${environment}
"hello world"%
$ f ${username}/${project}@${environment}
"hello world"
$ curl https://f.stdlib.com/${username}/${project}@${environment}
"hello world"%

$ lib down ${environment}
```
