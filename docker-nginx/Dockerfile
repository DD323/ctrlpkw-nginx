FROM nginx
MAINTAINER mbr@touk.pl

RUN apt-get update
RUN apt-get install -yq dnsutils
RUN apt-get install -yq cron

ADD . /etc/nginx/
RUN chmod a+x /etc/nginx/*.sh

WORKDIR /etc/nginx

CMD ./start.sh
