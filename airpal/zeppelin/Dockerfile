FROM openjdk:8

ENV ZEPPELIN_VERSION 0.6.2

COPY ./bootstrap.sh /tmp/bootstrap.sh
RUN /tmp/bootstrap.sh

EXPOSE 8080

CMD ["/opt/zeppelin-0.6.2-bin-all/bin/zeppelin.sh"]
