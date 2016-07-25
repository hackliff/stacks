FROM php:latest
MAINTAINER Xavier Bruhiere <xavier.bruhiere@gmail.com>
LABEL Version="0.1.1"

ADD ./ /usr/local/share/applications/flarum
RUN /usr/local/share/applications/flarum/bootstrap.sh && \
  mv /usr/local/share/applications/flarum/nginx-flarum.conf /etc/nginx/sites-enabled/flarum.conf

# Persistence
VOLUME ["/var/www/flarum"]

EXPOSE 80

CMD ["/usr/local/share/applications/flarum/run.sh"]
