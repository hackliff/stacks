FROM java:8

ADD ./bootstrap.sh /opt/
RUN /opt/bootstrap.sh

ENV SCALA_HOME /opt/scala
ENV PATH $PATH:$SCALA_HOME/bin

CMD ["scala"]
