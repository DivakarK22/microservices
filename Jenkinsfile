pipeline {
    agent any
    
    stages {
        stage('Checkout and Pull') {
            steps {
                dir('/git/microservices/') {
                    git branch: 'jenkins-tomcat', url: 'https://github.com/DivakarK22/microservices.git'
                }
            }
        }

        stage('Clean images/containers') {
            steps {
                sh 'sudo docker rm -f jenkins-tomcat || true'
                sh 'sudo docker rmi -f jenkins-tomcat || true'
            }
        }
        
        stage('Build') {
            steps {
                dir('/git/microservices/jenkins') {
                    sh 'sudo docker build --no-cache -t jenkins-tomcat .'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'sudo docker stop jenkins-tomcat || true'
                sh 'sudo docker run -d --name jenkins-tomcat -p 8082:8080 -p 50001:50000 jenkins-tomcat || true'
            }
        }
        
        stage('Check the container is up') {
            steps {
                script {
                    def containerStatus = sh(returnStdout: true, script: 'sudo docker ps -f name=jenkins-tomcat --format "{{.Names}}"').trim()
                    if (containerStatus.contains('jenkins-tomcat')) {
                        echo 'Container jenkins is running'
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
    }
}