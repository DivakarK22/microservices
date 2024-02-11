# Use the official Jenkins image from Docker Hub
FROM centos:7

#Install Java and tomcat
RUN yum install sudo wget epel-release java-11-openjdk-devel  -y && \
    export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::") && \
    source ~/.bashrc && \
    wget --no-check-certificate https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.18/bin/apache-tomcat-10.1.18.tar.gz  -O /tmp/tomcat.tar.gz && \
    tar -xvf /tmp/tomcat.tar.gz -C /tmp/ && \
    mv /tmp/apache-tomcat-10.1.18 /opt/ && \
    mv /opt/apache-tomcat-10.1.18 /opt/tomcat && \
    export CATALINA_HOME=/opt/tomcat && \
    rm -rf /opt/tomcat/webapps/* && \
    source ~/.bashrc

COPY ./ROOT.war /opt/tomcat/webapps

# Expose the Jenkins port
EXPOSE 8080
# Start Jenkins
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
