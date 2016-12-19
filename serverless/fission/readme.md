# [Fission](http://fission.io)

## Bootstrap

**Infrastructure**

```Bash
$ minikube start --vm-driver=xhyve
$ minikube status
$ kubectl create -f http://fission.io/fission.yaml
$ # or curl http://fission.io/fission.yaml | kubectl create -f -
$ kubectl create -f http://fission.io/fission-nodeport.yaml

$ # check everything is running smoothly
$ kubectl --namespace fission get pods

$ export FISSION_URL=http://$(minikube ip):31313
$ export FISSION_ROUTER=$(minikube ip):31314
```

**Client**

```Bash
$ curl http://fission.io/fission > /usr/local/bin/fission
$ chmod +x /usr/local/bin/fission
```

## Usage



## TODO

- fix controller container (`/filepath` doesn't exist)
- integrate with Carina or Hyper.sh
- write a beautiful abstraction
- experiment on serverless cron
