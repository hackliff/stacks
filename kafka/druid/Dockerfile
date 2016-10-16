# some inspiration:
#   - https://github.com/druid-io/docker-druid

FROM java:8
MAINTAINER Xavier Bruhiere <xavier.bruhiere@gmail.com>

ADD ./manage.sh /opt/manage-druid.sh
RUN /opt/manage-druid.sh bootstrap

# TODO create druid user

# Expose ports:
# - 8081: HTTP (coordinator)
# - 8082: HTTP (broker)
# - 8083: HTTP (historical)
# - 8090: HTTP (overlord)
EXPOSE 8081 8082 8083 8090

CMD ["/opt/manage-druid.sh start"]
