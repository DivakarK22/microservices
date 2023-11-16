#!/bin/sh
#/bin/sensu-server -c /etc/sensu/config.json -d /etc/sensu/conf.d -e /etc/sensu/extensions -l /var/log/sensu/sensu-client.log -b && /bin/sensu-api -c /etc/sensu/config.json -d /etc/sensu/conf.d -e /etc/sensu/extensions -l /var/log/sensu/sensu-client.log -b

/bin/sensu-server -c /etc/sensu/config.json -l /var/log/sensu/sensu-server.log -b

/bin/sensu-api -c /etc/sensu/config.json -l /var/log/sensu/sensu-api.log -b

/bin/sensu-client -c /etc/sensu/config.json -l /var/log/sensu/sensu-client.log -b
