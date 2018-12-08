# [Mesosphere Course](https://mesosphere.com/)

## Notes

- Mesos hosting
  - [Official DCOS](https://mesosphere.com/product/#)
  - [terminal.com](https://www.terminal.com/explore#query=featured%3Atrue+mesos&sortby=popularity&category=All)
  - [magnetic.io](http://magnetic.io/), service powered by [vamp.io](http://vamp.io/)
- Monitoring
  - Is there a telegraf plugin ? It would fit nicely
  - What about statsd integration or collectd plugin ?
  - A prometheus exporter [already exists](https://github.com/prometheus/mesos_exporter)

__Q/A__

- how to use docker for processes ?
- Is it possible to replace zookeeper with consul ?


## Install

__inside chef/centos box (hostname : node1)__

```sh
# install mesos and marathon
sudo rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
sudo yum -y install mesos marathon

# install zookeeper
sudo rpm -Uvh http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm
sudo yum -y install zookeeper zookeeper-server
# initialize and start zookeeper
sudo -u zookeeper zookeeper-server-initialize --myid=1
sudo service zookeeper-server start
# zookeeper shell: /usr/lib/zookeeper/bin/zkCli.sh

# start mesos master and slave
sudo service mesos-master start
sudo service mesos-slave start
# check : sudo netstat -nlp | grep mesos
# gui is now available at http://192.168.33.10:5050/

# start marathon
sudo service marathon start
# check : sudo netstat -nlp | grep 8000
# gui is now available at http://192.168.33.10:8080
# use it to start a simple python http server (python -m SimpleHTTPServer)
# check : curl http://192.168.33.10:8000/stderr

# install mesos DNS
# install Go
sudo yum -y install golang git bind-utils
# build mesos DNS project
mkdir ~/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
go get github.com/tools/godep
go get github.com/mesosphere/mesos-dns
cd $GOPATH/src/github.com/mesosphere/mesos-dns
make restoredeps build
sudo echo "nameserver 192.168.33.10" > /etc/resolv.conf
cp config.json.sample config.json
sed -i 's|127.0.0.1|192.168.33.10|' config.json
sed -i 's|8053|53|' config.json
# check : sudo /home/vagrant/go/src/github.com/mesosphere/mesos-dns/mesos-dns -v=1 -config=/home/vagrant/go/src/github.com/mesosphere/mesos-dns/config.json
# use this command in marathon, with constraint : hostname:CLUSTER:node1
# check : host google.com

# install and run chronos
sudo yum -y install chronos
sudo service chronos start
# or better yet, run '/usr/bin/chronos' inside chronos
# chronos should be available at http://192.168.33.10:4400/

# Make sure that all of the services are properly set to start on boot with chkconfig
sudo chkconfig zookeeper-server on
sudo chkconfig mesos-master on
sudo chkconfig mesos-slave on
sudo chkconfig marathon on
 # if you are running chronos with marathon then do not do this
sudo chkconfig chronos on
```

__Docker support__

```sh
sudo yum install -y docker
sudo chkconfig docker on
# run service
sudo service docker start
echo 'docker,mesos' | sudo tee /etc/mesos-slave/containerizers
sudo service mesos-slave restart
```

__Notes on multi nodes__

- On each nodes, edit `/etc/hosts` to point to each nodes of the cluster.
- On the slave node, install mesos package, edit `/etc/mesos/zk` to point to master, and run `sudo service mesos-slave start`

__Mesos Cli__

```sh
curl "https://bootstrap.pypa.io/get-pip.py" | sudo python
sudo pip install virtualenv
sudo pip install mesos.cli
```


## Usage

### Mesos cli

```sh
export MASTER=$(mesos-resolve `cat /etc/mesos/zk` 2>/dev/null)
mesos help
mesos-execute --master=$MASTER --name="cluster-test" --command="sleep 40"
```

### Mesos api

```sh
# get metrics on the running apps
curl http://0.0.0.0:8080/metrics | python -m json.tool | less

# look at the apps you have installed
curl http://0.0.0.0:8080/v2/apps | python -m json.tool

# look at a specific app, named test from Ex4 and Ex5
curl http://0.0.0.0:8080/v2/apps/test | python -m json.tool

# delete that app
curl -X DELETE http://0.0.0.0:8080/v2/apps/test | python -m json.tool

# show that the app is gone
curl http://0.0.0.0:8080/v2/apps/test | python -m json.tool
```

### docker

```sh
# build a sample go web app
export GOPATH=~/go
go get github.com/golang/example/outyet
cd $GOPATH/src/github.com/golang/example/outyet
sudo docker build -t outyet .

# just run a regular docker command, or use built-in docker support :
cat /vagrant/outyet.json
{
  "id": "outyet",
  "cpus": 0.2,
  "mem": 20.0,
  "instances": 1,
  "constraints": [["hostname", "UNIQUE", ""]],
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "outyet",
      "network": "BRIDGE",
      "portMappings": [
        { "containerPort": 8080, "hostPort": 0, "servicePort": 0, "protocol": "tcp" }
      ]
    }
  }
}
curl -X POST http://192.168.33.10:8080/v2/apps -d @/vagrant/outyet.json -H "Content-type: application/json"
```
