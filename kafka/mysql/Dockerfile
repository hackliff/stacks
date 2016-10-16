FROM mysql:5.7.13
MAINTAINER Xavier Bruhiere <xavier.bruhiere@gmail.com>

ADD sample-data.sql /tmp/sample-data.sql
RUN /etc/init.d/mysql start \
  && mysql -u root -e "GRANT ALL ON druid.* TO 'druid'@'localhost' IDENTIFIED BY 'diurd'; CREATE database druid CHARACTER SET utf8;" \
  && java -cp /usr/local/druid/lib/druid-services-*-selfcontained.jar \
    -Ddruid.extensions.directory=/usr/local/druid/extensions \
    -Ddruid.extensions.loadList=[\"mysql-metadata-storage\"] \
    -Ddruid.metadata.storage.type=mysql \
    io.druid.cli.Main tools metadata-init \
    --connectURI="jdbc:mysql://localhost:3306/druid" \
    --user=druid --password=diurd \
  && mysql -u root druid < sample-data.sql \
  && /etc/init.d/mysql stop
