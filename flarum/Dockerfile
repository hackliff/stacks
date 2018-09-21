# installation forbid 7.2
FROM php:7.1
MAINTAINER Xavier Bruhiere <xavier.bruhiere@gmail.com>
LABEL Version="0.1.2"

ADD ./ /usr/local/share/applications/flarum
RUN /usr/local/share/applications/flarum/bootstrap.sh
RUN mv /usr/local/share/applications/flarum/nginx-flarum.conf /etc/nginx/sites-enabled/flarum.conf

# Persistence
VOLUME ["/var/www/flarum"]

EXPOSE 80

CMD ["/usr/local/share/applications/flarum/run.sh"]
