# credits: https://github.com/victorcoder/docker-dkron/blob/master/Dockerfile
FROM alpine:3.4

ARG DKRON_VERSION=0.9.1

COPY ./bootstrap-dkron.sh /tmp/bootstrap-dkron.sh
RUN /tmp/bootstrap-dkron.sh

EXPOSE 8946 8080 6868

ENTRYPOINT ["/opt/local/dkron/dkron"]
CMD ["--help"]
