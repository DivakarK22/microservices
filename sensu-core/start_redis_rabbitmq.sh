#!/bin/bash
docker run -d --name sensu-rabbitmq -p 5672:5672 -p 15672:15672 \
    -e RABBITMQ_DEFAULT_USER=sensu \
    -e RABBITMQ_DEFAULT_PASS=sensu \
    -e RABBITMQ_DEFAULT_VHOST=/sensu \
    rabbitmq:3-management

docker run -d --name sensu-redis -p 6379:6379 redis:6.2

docker exec -it sensu-rabbitmq rabbitmqctl add_user sensu sensu

docker exec -it sensu-rabbitmq rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"
