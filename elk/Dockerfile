FROM centos:7
MAINTAINER Xavier Bruhiere

#ENV FILEABEAT_VERSION 1.3.1-x86_64
#ENV FILEBEAT_URL  https://download.elastic.co
# or beta
ENV FILEABEAT_VERSION 5.0.0-beta1-x86_64
ENV FILEBEAT_URL https://artifacts.elastic.co/downloads

RUN curl -L -O ${FILEBEAT_URL}/beats/filebeat/filebeat-${FILEABEAT_VERSION}.rpm && \
  rpm -vi filebeat-${FILEABEAT_VERSION}.rpm
