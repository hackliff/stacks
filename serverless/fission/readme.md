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
$ curl http://fission.io/mac/fission > fission && \
  chmod +x fission && \
  sudo mv fission /usr/local/bin/
$ chmod +x /usr/local/bin/fission
```

## Usage

```
$ fission function create --name hello --env nodejs --code hello.js
$ fission route create --method GET --url /hello --function hello
```
