# Use the official Jenkins image from Docker Hub
FROM jenkins/jenkins:latest

# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Copy Jenkins configuration files (optional)
# COPY config/* /var/jenkins_home/

# Expose port 8080 for Jenkins web interface
EXPOSE 8080

# Expose port 50000 for Jenkins agent communication
EXPOSE 50000

# Set the Jenkins home directory
ENV JENKINS_HOME /var/jenkins_home

# Run Jenkins as the Jenkins user (UID 1000) to avoid permission issues
USER jenkins

