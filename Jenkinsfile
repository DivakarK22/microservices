pipeline {
    agent any
    stages {
        stage('Checkout and Pull') {
            steps {
                dir('/git/microservices') {
                    git branch: 'jenkins-alma-docker-tomcat', url: 'https://github.com/DivakarK22/microservices.git'
                }
            }
        }
        stage('Clean images/containers') {
            steps {
                sh 'sudo docker rm -f jenkins-alma-docker-tomcat || true'
                sh 'sudo docker rmi -f jenkins-alma-docker-tomcat || true'
            }
        }     
        stage('Build') {
            steps {
                dir('/git/microservices/jenkins-alma-docker-tomcat') {
                    sh 'sudo docker build --no-cache -t jenkins-alma-docker-tomcat .'
                }
            }
        }
        stage('Restore Jenkins Backups to use as Volume') {
            steps {
                sh 'cd /jenkins_backup/ || true'
                sh 'rm -rf var || true'
                sh 'unzip /jenkins_backup/* || true '
                sh 'mkdir /jenkins_backup/jenkins-docker || true'
                sh 'cp -R /jenkins_backup/var /jenkins_backup/jenkins-docker || true'
            }
        }        
        stage('Deploy') {
            steps {
                sh 'sudo docker stop jenkins-alma-docker-tomcat || true'
                sh 'sudo docker run -v /jenkins_backup/jenkins-docker/var/lib/jenkins/:/root/.jenkins -d --name  jenkins-alma-docker-tomcat -p 8083:8080 jenkins-alma-docker-tomcat || true'
            }
        }     
        stage('Check the container is up') {
            steps {
                script {
                    def containerStatus = sh(returnStdout: true, script: 'sudo docker ps -f name=jenkins-alma-docker-tomcat --format "{{.Names}}"').trim()
                    if (containerStatus.contains('jenkins-alma-docker-tomcat')) {
                        echo 'Container jenkins is running'
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
    }
}