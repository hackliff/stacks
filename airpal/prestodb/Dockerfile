FROM java:8

ENV PRESTO_VERSION 0.145

COPY ./bootstrap.sh /opt/bootstrap.sh
RUN /opt/bootstrap.sh

# copy configurations
COPY ./etc /opt/presto-server-${PRESTO_VERSION}/etc

EXPOSE 8080

CMD ["/opt/presto-server-0.145/bin/launcher", "run", "--verbose"]
