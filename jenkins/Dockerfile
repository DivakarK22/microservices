# Use the official Jenkins image from Docker Hub
FROM jenkins/jenkins:latest

# Skip initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install any plugins you need using the install-plugins.sh script
# Example:
# COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Copy your Jenkins configuration files if needed
# Example:
# COPY config.xml /var/jenkins_home/config.xml

# Copy any custom scripts or files you need
# Example:
# COPY script.sh /usr/local/bin/script.sh

# Set permissions if needed
# Example:
# RUN chmod +x /usr/local/bin/script.sh
VOLUME /var/jenkins_home

# Expose the Jenkins port
EXPOSE 8080

# Start Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]