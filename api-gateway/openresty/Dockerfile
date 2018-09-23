FROM centos:7

#COPY OpenResty.repo /etc/yum.repos.d/OpenResty.repo
RUN yum-config-manager --add-repo https://openresty.org/yum/centos/OpenResty.repo && \
  yum install -y openresty && \
  mkdir -p /opt/openresty/{conf,logs,scripts}
COPY nginx.conf /opt/openresty/conf/
COPY *.lua /opt/openresty/scripts/

WORKDIR /opt/openresty

ENV PATH /usr/local/openresty/nginx/sbin:$PATH

EXPOSE 80 443

CMD ["nginx", "-p", "/opt/openresty/", "-c", "conf/nginx.conf", "-g", "daemon off;"]
