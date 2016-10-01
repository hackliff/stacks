# [OSQuery](https://osquery.io/)

## [Installation](https://osquery.readthedocs.io/en/stable/installation/install-linux/)

Tested on `Amazon Linux AMI release 2016.03` and a centos 7 container
image (which gives you nice root permissions).

```Bash
$ docker run -it --rm centos:7 bash

$ sudo yum install -y libudev-devel
$ sudo ln -sf /lib64/libudev.so.0 /lib64/libudev.so.1

$ sudo rpm -ivh https://osquery-packages.s3.amazonaws.com/centos7/noarch/osquery-s3-centos7-repo-1-0.0.noarch.rpm
$ sudo yum install osquery

$ osqueryi
[ ... ]
osqueryi> .help
[ ... ]
```

## [Interesting usages](https://osquery.readthedocs.io/en/stable/introduction/sql/)

 ```SQL
 osqueryi> .mode pretty
 osqueryi> .tables
 [ ... ]
 osqueryi> SELECT pid, name, path FROM processes LIMIT 1;
 +-----+------+---------------+
 | pid | name | path          |
 +-----+------+---------------+
 | 1   | bash | /usr/bin/bash |
 +-----+------+---------------+
 ```

## Resources

- [Tables](https://osquery.io/docs/tables/)
