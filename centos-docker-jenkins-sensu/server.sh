#!/bin/bash

/bin/sensu-client -c /etc/sensu/config.json -l /var/log/sensu/sensu-client.log -b && /opt/tomcat/bin/catalina.sh run