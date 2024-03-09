pipeline {
    agent any
    stages {
        stage('Checkout and Pull') {
            steps {
                dir('/git/microservices') {
                    git branch: 'centos-docker-jenkins-sensu', url: 'https://github.com/DivakarK22/microservices.git'
                }
            }
        }
        stage('Clean images/containers') {
            steps {
                sh 'sudo docker rm -f centos-docker-jenkins-sensu || true'
                sh 'sudo docker rmi -f centos-docker-jenkins-sensu || true'
            }
        }     
        stage('Build') {
            steps {
                dir('/git/microservices/centos-docker-jenkins-sensu') {
                    sh 'sudo docker build --no-cache -t centos-docker-jenkins-sensu .'
                }
            }
        }
        stage('Restore Jenkins Backups to use as Volume') {
            steps {
                sh 'cd /jenkins_backup/ || true'
                sh 'rm -rf var || true'
                sh 'unzip /jenkins_backup/202* || true '
                sh 'mkdir /jenkins_backup/jenkins-docker || true'
                sh 'cp -R /jenkins_backup/jenkins-docker/var /jenkins_backup/jenkins-docker || true'
                sh 'rm -rf /jenkins_backup/jenkins-docker/var || true'
                sh 'chown -R jenkins:jenkins /jenkins_backup/jenkins-docker/*'
            }
        }        
        stage('Deploy') {
            steps {
                sh 'sudo docker stop centos-docker-jenkins-sensu || true'
                sh 'sudo docker run -v /jenkins_backup/jenkins-docker:/root/.jenkins -d --name  centos-docker-jenkins-sensu -p 8083:8080 centos-docker-jenkins-sensu || true'
            }
        }     
        stage('Check the container is up') {
            steps {
                script {
                    def containerStatus = sh(returnStdout: true, script: 'sudo docker ps -f name=centos-docker-jenkins-sensu --format "{{.Names}}"').trim()
                    if (containerStatus.contains('centos-docker-jenkins-sensu')) {
                        echo 'Container jenkins is running'
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
    }
}