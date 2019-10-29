# Certbot OVH with Cron Docker


## For run with cron

```shell
docker run -ti --rm \
	-v $(pwd)/letsencrypt:/etc/letsencrypt/ \
	-e 'DNS_OVH_ENDPOINT=ovh-XX' \
	-e 'DNS_OVH_APPLICATION_KEY=XXXXXXXXXXXXXXXX' \
	-e 'DNS_OVH_APPLICATION_SECRET=XXXXXXXXXXXXXXXX' \
	-e 'DNS_OVH_CONSUMER_KEY=XXXXXXXXXXXXXXXX' \
	-e 'CERT_EMAIL=mail@mydomain.com' \
	-e 'CERT_DOMAIN=mydomain.com' \
	-e 'CRON_PERIOD=0 3 * * *' \
	smeagolworms4/cerbot-ovh-cron
```

## For run only once

```shell
docker run -ti --rm \
	-v $(pwd)/letsencrypt:/etc/letsencrypt/ \
	-e 'DNS_OVH_ENDPOINT=ovh-XX' \
	-e 'DNS_OVH_APPLICATION_KEY=XXXXXXXXXXXXXXXX' \
	-e 'DNS_OVH_APPLICATION_SECRET=XXXXXXXXXXXXXXXX' \
	-e 'DNS_OVH_CONSUMER_KEY=XXXXXXXXXXXXXXXX' \
	-e 'CERT_EMAIL=mail@mydomain.com' \
	-e 'CERT_DOMAIN=mydomain.com' \
	smeagolworms4/cerbot-ovh-cron cert_domain
```
	
## Create your Token

 - Go to https://api.ovh.com/createToken/

 - Add this rule for all domain
    - GET /domain/zone/*
    - PUT /domain/zone/*
    - POST /domain/zone/*
    - DELETE /domain/zone/*
 
 - Or dor only one domain
    - GET /domain/zone/
    - GET /domain/zone/{your_zone}/status
    - GET /domain/zone/{your_zone}/record
    - GET /domain/zone/{your_zone}/record/*
    - POST /domain/zone/{your_zone}/record
    - POST /domain/zone/{your_zone}/refresh
    - DELETE /domain/zone/{your_zone}/record/*
  - And validate
