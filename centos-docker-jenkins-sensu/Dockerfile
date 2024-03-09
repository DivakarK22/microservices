# Use the official Jenkins image from Docker Hub#
FROM centos:7

COPY ./ /etc/yum.repos.d/
COPY ./ /etc/sensu/
COPY server.sh /usr/local/bin/


#Install Java and tomcat and move to path
RUN yum install sudo wget epel-release java-11-openjdk-devel sensu  -y && \
    wget --no-check-certificate https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.98/bin/apache-tomcat-8.5.98.tar.gz  -O /tmp/tomcat.tar.gz && \
    tar -xvf /tmp/tomcat.tar.gz -C /tmp/ && \
    mv /tmp/apache-tomcat-8.5.98 /opt/ && \
    mv /opt/apache-tomcat-8.5.98 /opt/tomcat 


#Remove default war's from webapps folder
RUN rm -rf /opt/tomcat/webapps/*

#Copy or Download war file
#COPY ./ROOT.war /opt/tomcat/webapps/
RUN wget --no-check-certificate https://updates.jenkins.io/download/war/2.446/jenkins.war -O /opt/tomcat/webapps/ROOT.war

# Expose the Jenkins port
EXPOSE 8080
EXPOSE 1122
EXPOSE 50000
EXPOSE 4567

#Copy sensu-client
RUN chmod +x /usr/local/bin/server.sh

# Start Jenkins
CMD [ "/usr/local/bin/server.sh" ]