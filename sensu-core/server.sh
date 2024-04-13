#!/bin/bash

/bin/sensu-server -c /etc/sensu/config.json -l /var/log/sensu/sensu-server.log -b && /bin/sensu-client -c /etc/sensu/config.json -l /var/log/sensu/sensu-client.log -b && /bin/sensu-api -c /etc/sensu/config.json -l /var/log/sensu/sensu-api.log -b && /usr/bin/uchiwa -c /etc/uchiwa/uchiwa.json -p /usr/share/uchiwa/public
