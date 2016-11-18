# [Fission](http://fission.io)

```Bash
$ minikube start --vm-driver=xhyve
$ minikube status
$ curl http://fission.io/fission.yaml | kubectl create -f -

$ # check everything is running smoothly
$ kubectl --namespace fission get pods
```

```Bash
$ curl http://fission.io/fission > /usr/local/bin/fission
$ chmod +x /usr/local/bin/fission
```


## TODO

- fix controller container (`/filepath` doesn't exist)
- integrate with Carina or Hyper.sh
- write a beautiful abstraction
- experiment on serverless cron
