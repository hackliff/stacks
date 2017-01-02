# [Kubernetes](http://kubernetes.io/)

- [minikube](https://github.com/kubernetes/minikube) - _Run Kubernetes locally_
- [Bootstrap Kubernetes the hard way](https://github.com/kelseyhightower/kubernetes-the-hard-way)
- [CoreOS+Kubernetes documentation](https://github.com/coreos/coreos-kubernetes)
- [Kubernetes workshop](https://github.com/kelseyhightower/intro-to-kubernetes-workshop)

## [Getting started](http://kubernetes.io/docs/getting-started-guides/minikube/#install-kubectl)

```Bash
$ # install kubectl
$ curl \
  -Lo kubectl \
  http://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/darwin/amd64/kubectl
$ chmod +x kubectl
$ sudo mv kubectl /usr/local/bin/

$ # install minikube
$ curl \
  -Lo minikube \
  https://storage.googleapis.com/minikube/releases/v0.11.0/minikube-darwin-amd64
$ chmod +x minikube
$ sudo mv minikube /usr/local/bin/

$ # install xhyve driver
$ brew install docker-machine-driver-xhyve
$ sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
$ sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
```

```Bash
$ # setup cluster with OSX native virtualizer
$ minikube start --vm-driver=xhyve
Starting local Kubernetes cluster...
Kubectl is now configured to use the cluster.

$ kubectl get nodes
NAME       STATUS    AGE
minikube   Ready     2m

$ kubectl run hello-minikube \
  --image=gcr.io/google_containers/echoserver:1.4 \
  --port=8080
deployment "hello-minikube" created
$ kubectl expose deployment hello-minikube --type=NodePort
service "hello-minikube" exposed
```

## [Kubernetes quick start](http://kubernetes.io/docs/hellonode/)

```Bash
$ docker build -t gcr.io/stacks/hello-node:v1 ./hellonode/
$ docker run -d -p 8080:8080 --name hello_tutorial gcr.io/stacks/hello-node:v1
```

## Udacity - Microservices

```Bash
$ # prepare dependencies
$ mkdir -p $GOPATH/src/github.com/udacity
$ git clone https://github.com/udacity/ud615 $GOPATH/src/github.com/udacity/ud615
$ go get github.com/braintree/manners

$ mkdir bin
$ go build -o ./bin/hello ./hello
$ sudo ./bin/hello -http 0.0.0.0:10082

$ # build containers
$ cd auth && go build --tags netgo --ldflags '-extldflags "-lm -lstdc++
-static"'
$ docker build -t auth:1.0.0 .
$ CID2=$(docker run -d auth:1.0.0)
```

```Bash
$ minikube start --vm-driver=xhyve
$ kubectl run nginx --image=nginx:1.10.0
$ kubectl expose deployment nginx --port 80 --type LoadBalancer
$ kubectl exec nginx-452959208-cpgkf --stdin --tty -c nginx /bin/sh
$ kubectl logs -f nginx-452959208-cpgkf
$ kubectl describe pods monolith
```

__Secrets__

```Bash
$ kubectl create secret generic tls-certs --from-file=tls/
secret "tls-certs" created
$ kubectl describe secrets tls-certs
$ kubectl create configmap nginx-proxy-conf --from-file=nginx/proxy.conf
```
