FROM openjdk:8

COPY ./bootstrap.sh /opt/bootstrap.sh
COPY ./run.sh /opt/run.sh
COPY ./reference.yml /opt/reference.yml

RUN /opt/bootstrap.sh

EXPOSE 8081
EXPOSE 8082

CMD ["/opt/run.sh"]
