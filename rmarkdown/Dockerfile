FROM r-base:3.3.1
MAINTAINER Xavier Bruhiere "xavier.bruhiere@gmail.com"

# TODO install pandoc

# install Shiny
RUN R -e 'install.packages(c("rmarkdown"))'

# TODO use docker build parameters ?
ADD ./report.Rmd /tmp/report.Rmd
ADD ./renderer.R /opt/renderer.R

CMD ["Rscript", "/opt/renderer.R"]
