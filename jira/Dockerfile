# Use a base image with Java and other dependencies installed
FROM openjdk:11-jre-slim

# Set environment variables
ENV JIRA_HOME /var/atlassian/application-data/jira
ENV JIRA_INSTALL /opt/atlassian/jira

# Install necessary dependencies
RUN apt-get update && \
      apt-get install -y wget && \
      apt-get clean

# Download and install Jira Data Center
RUN mkdir -p ${JIRA_HOME} && \
      mkdir -p ${JIRA_INSTALL} && \
      wget -q -O /tmp/atlassian-jira.tar.gz https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-9.12.7.tar.gz && \
      tar -xzf /tmp/atlassian-jira.tar.gz --strip-components=1 -C "${JIRA_INSTALL}" && \
      rm -f /tmp/atlassian-jira.tar.gz

# Expose necessary ports
EXPOSE 8080

# Set entry point
ENTRYPOINT ["/opt/atlassian/jira/bin/start-jira.sh", "-fg"]