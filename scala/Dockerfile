FROM openjdk:8

COPY ./bootstrap.sh /opt/
RUN /opt/bootstrap.sh

ENV SCALA_HOME /opt/scala
ENV PATH $PATH:$SCALA_HOME/bin

# for finagle or whatever
EXPOSE 8080

# better scala repl
CMD ["amm"]
