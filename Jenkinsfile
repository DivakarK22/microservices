pipeline {
    agent Ansible(deploy)
    stages {
        stage('Checkout and Pull') {
            steps {
                dir('/git/microservices') {
                    git branch: 'jenkins-centos-docker-tomcat', url: 'https://github.com/DivakarK22/microservices.git'
                }
            }
        }
        stage('Clean images/containers') {
            steps {
                sh 'sudo docker rm -f jenkins-centos-docker-tomcat || true'
                sh 'sudo docker rmi -f jenkins-centos-docker-tomcat || true'
            }
        }     
        stage('Build') {
            steps {
                dir('/git/microservices/jenkins-centos-docker-tomcat') {
                    sh 'sudo docker build --no-cache -t jenkins-centos-docker-tomcat .'
                }
            }
        }       
        stage('Deploy') {
            steps {
                sh 'sudo docker stop jenkins-centos-docker-tomcat || true'
                sh 'sudo docker run -d --name jenkins-centos-docker-tomcat -p 8083:8080 jenkins-centos-docker-tomcat || true'
            }
        }     
        stage('Check the container is up') {
            steps {
                script {
                    def containerStatus = sh(returnStdout: true, script: 'sudo docker ps -f name=jenkins-centos-docker-tomcat --format "{{.Names}}"').trim()
                    if (containerStatus.contains('jenkins-centos-docker-tomcat')) {
                        echo 'Container jenkins is running'
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
    }
}