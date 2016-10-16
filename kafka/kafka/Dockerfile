# some inspiration:
#   - https://github.com/ches/docker-kafka/blob/master/Dockerfile
#   - https://github.com/wurstmeister/kafka-docker

# NOTE temporary tag before merging in master
FROM quay.io/hackliff/scala:scala
MAINTAINER Xavier Bruhiere <xavier.bruhiere@gmail.com>

ADD ./manage.sh /opt/manage-kafka.sh
RUN /opt/manage-kafka.sh bootstrap
ADD ./config /opt/kafka/config

VOLUME [ "/opt/kafka/data", "/opt/kafka/logs"  ]

# TODO set up a user to run Kafka

# broker, jmx
EXPOSE 9092 7203

CMD ["/opt/manage-kafka.sh start"]
