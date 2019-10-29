#!/bin/sh
set -e

rm -rf /var/spool/cron/crontabs && mkdir -m 0644 -p /var/spool/cron/crontabs

echo "#!/bin/sh"/usr/bin/cert_domain
echo "/usr/local/bin/certbot certonly --dns-ovh --dns-ovh-credentials /root/.ovhapi --non-interactive --agree-tos --email $CERT_EMAIL -d $CERT_DOMAIN" >> /usr/bin/cert_domain
chmod +x /usr/bin/cert_domain

[ "$(ls -A /etc/cron.d)" ] && cp -f /etc/cron.d/* /var/spool/cron/crontabs/ || true
[ ! -z "$CRON_PERIOD" ] && echo -e "$CRON_PERIOD /usr/bin/cert_domain\n" > /var/spool/cron/crontabs/CRON_STRINGS

echo "dns_ovh_endpoint = $DNS_OVH_ENDPOINT" >> /root/.ovhapi
echo "dns_ovh_application_key = $DNS_OVH_APPLICATION_KEY" >> /root/.ovhapi
echo "dns_ovh_application_secret = $DNS_OVH_APPLICATION_SECRET" >> /root/.ovhapi
echo "dns_ovh_consumer_key = $DNS_OVH_CONSUMER_KEY" >> /root/.ovhapi
chmod -R 0600 /var/spool/cron/crontabs

exec "$@"