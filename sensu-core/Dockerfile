# Use the official CentOS 7 base image
FROM centos:7

# Copy sensu repo
COPY ./ /etc/yum.repos.d/

# Install necessary pkg

RUN yum -y epel-release sensu sudo python3 python3-pip && \
    pip3 install requests && \
    yum clean all

# Expose sensu-api port
EXPOSE 4567

# Copy Sensu Configs
COPY ./ /etc/sensu/

# Copy startup script
COPY server.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/server.sh
RUN chmod 777 /var/log/sensu/*

#Copy Checks
COPY checks /etc/sensu/
# Define the command to start the service
CMD /usr/local/bin/server.sh
