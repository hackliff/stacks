FROM openjdk:8

EXPOSE 8081 9000

ENV SCALA_VERSION 2.9.3
ENV FLINK_VERSION 1.1.3
ENV SCALA_HOME /opt/scala-${SCALA_VERSION}
ENV FLINK_HOME /opt/flink-${FLINK_VERSION}
ENV PATH $PATH:$FLINK_HOME/bin:$SCALA_HOME/bin

COPY ./bootstrap.sh /tmp/bootstrap.sh
COPY ./bootstrap-scala.sh /tmp/bootstrap-scala.sh

RUN /tmp/bootstrap.sh
RUN /tmp/bootstrap-scala.sh

COPY ./run.sh ${FLINK_HOME}/bin
RUN apt-get update && apt-get install -y netcat

EXPOSE 8081 9000

# as stolen from https://github.com/apache/flink/blob/master/flink-contrib/docker-flink/Dockerfile
ENTRYPOINT ["run.sh"]
CMD ["nc", "-p", "9000", "-l"]
