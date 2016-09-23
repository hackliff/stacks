# dev image for kong and plugins
FROM centos:7
MAINTAINER Xavier Bruhiere <xavier.bruhiere@gmail.com>

ENV KONG_VERSION 0.9.2
ENV OPENRESTY_VERSION 1.11.2.1
ENV KONG_SERF_PATH /opt

# TODO move it into a script

# install dependencies
RUN yum install -y \
  dnsmasq wget tar make curl ldconfig gcc pcre-devel openssl-devel unzip git lua-devel

# install lua and luarocks
RUN wget http://luarocks.org/releases/luarocks-2.4.0.tar.gz && \
  tar zxpf luarocks-2.4.0.tar.gz && \
  cd luarocks-2.4.0 && \
  ./configure && \
  make bootstrap

# install openresty
RUN wget https://openresty.org/download/openresty-1.11.2.1.tar.gz && \
  tar xvzf openresty-1.11.2.1.tar.gz && \
  cd cd openresty-1.11.2.1 && \
  ./configure \
    --with-pcre-jit \
    --with-ipv6 \
    --with-http_realip_module \
    --with-http_ssl_module \
    --with-http_stub_status_module 11 \
  make && make install

# install serf
RUN cd /opt && \
  wget https://releases.hashicorp.com/serf/0.8.0/serf_0.8.0_solaris_amd64.zip && /
  unzip serf_0.8.0_solaris_amd64.zip

# install kong
RUN git clone https://github.com/Mashape/kong /opt/kong
# TODO move it to volumes
COPY ./replication /opt/kong/kong/plugins/
# TODO edit kong-$VERSION.rockspec
# TODO edit kong.yml
RUN cd /opt/kong && \
  OPENSSL_DIR=/usr make dev

EXPOSE 8000 8443 8001 7946

CMD ["kong", "start"]
