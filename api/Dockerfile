# Use the official CentOS 7 base image
FROM centos:7

# Set the working directory
COPY ./ /etc/yum.repos.d/
# Install necessary dependencies
RUN yum install -y sensu uchiwa

# Expose any necessary ports
EXPOSE 4567
COPY ./ /etc/sensu/
# Copy startup script or service start command
COPY api.sh /usr/local/bin/
RUN touch /etc/sensu/sensu-api.log
RUN chmod +x /usr/local/bin/api.sh
RUN chmod 777 /var/log/sensu/*

# Define the command to start the service
CMD ["/usr/local/bin/api.sh"]
# Specify the command to run your application
