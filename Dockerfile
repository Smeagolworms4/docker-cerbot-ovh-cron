FROM certbot/dns-ovh

MAINTAINER Damien Duboeuf <smeagolworms4@gmail.com>

## install cron
COPY /scripts/* /
RUN apk update && apk add dcron
RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d

ENTRYPOINT ["/docker-entry.sh"]
CMD ["/docker-cmd.sh"]