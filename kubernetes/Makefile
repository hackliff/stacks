# Makefile
# vim:ft=make

kubectl:
	curl \
		-Lo kubectl \
		http://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/darwin/amd64/kubectl
	chmod +x kubectl
	mv kubectl /usr/local/bin/

minikube:
	# install xhyve driver
	brew install docker-machine-driver-xhyve
	sudo chown root:wheel $(shell brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
	sudo chmod u+s $(shell brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
	curl \
		-Lo minikube \
		https://storage.googleapis.com/minikube/releases/v0.11.0/minikube-darwin-amd64
	chmod +x minikube
	mv minikube /usr/local/bin/

udacity_course:
	@mkdir -p $GOPATH/src/github.com/udacity
	git clone https://github.com/udacity/ud615 $(GOPATH)/
	go get github.com/braintree/manners
