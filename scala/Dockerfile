FROM openjdk:8

ADD ./bootstrap.sh /opt/
RUN /opt/bootstrap.sh

ENV SCALA_HOME /opt/scala
ENV PATH $PATH:$SCALA_HOME/bin

# better scala repl
CMD ["amm"]
