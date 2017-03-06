# [Teamcity]()

```
$ # TODO use a postgres DB
$ mkdir -p ./_workspace/{agent,data,logs}
$ docker run -it --name teamcity  \
  -v $PWD/_workspace/data:/data/teamcity_server/datadir \
  -v $PWD/_workspace/logs:/opt/teamcity/logs  \
  -p 8111:8111 \
  jetbrains/teamcity-server
```

Open `localhost:8111` and configure the server in the brower ui.
Monitor the log and copy the *super user auth token*.

```
$ docker run -it -e SERVER_URL="teamcity:8111"  \ 
  -v $PWD/_workspace/agent:/data/teamcity_agent/conf  \      
  -v /var/run/docker.sock:/var/run/docker.sock  \
  --link teamcity \
  jetbrains/teamcity-agent
```

Then go on the server dashboard -> agents -> Unauthorized aaaaand
authorize it.

