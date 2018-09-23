# [Jenkins](https://jenkins.io)

- [Docker image](https://hub.docker.com/r/library/jenkins/)

```Bash
$ CID=$(docker run -d --name jenkins -p 8080:8080 -p 50000:50000 jenkins:2.19.1-alpine)
$ docker exec -it ${CID} cat /var/jenkins_home/secrets/initialAdminPassword | pbcopy
$ open localhost:8080
$ # paste the password in you clipboard
$ # and install the required plugins
$ # follow the ui until you reach the dashboard
$ # enable experimental plugins: https://jenkins.io/blog/2013/09/23/experimental-plugins-update-center/
$ # then you can search for "BlueOcean" and install Blue Ocean UI
$ #once done, come back to the dashboard and click on the top banner: "Try Blue Ocean UI"
```
