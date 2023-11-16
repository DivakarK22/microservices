# Use the official CentOS 7 base image
FROM centos:7

# Set the working directory
COPY ./ /etc/yum.repos.d/
# Install necessary dependencies
RUN yum install -y sensu uchiwa && \
    touch /var/log/sensu/sensu-server.log

# Expose any necessary ports
EXPOSE 4567
COPY ./ /etc/sensu/
# Copy startup script or service start command
COPY server.sh /usr/local/bin/
COPY api.sh /usr/local/bin/
COPY client.sh /usr/local/bin/
RUN touch /etc/sensu/sensu-server.log
RUN touch /etc/sensu/sensu-client.log
RUN touch /etc/sensu/sensu-api.log
RUN chmod +x /usr/local/bin/server.sh
RUN chmod +x /usr/local/bin/api.sh
RUN chmod +x /usr/local/bin/client.sh
RUN chmod 777 /var/log/sensu/*

RUN /usr/local/bin/api.sh
RUN /usr/local/bin/client.sh

# Define the command to start the service
CMD ["/usr/local/bin/server.sh"]
# Specify the command to run your application
