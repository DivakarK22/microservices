pipeline {
    agent any
    
    stages {
        stage('Checkout and Pull') {
            steps {
                dir('/git/microservices/') {
                    git branch: 'jenkins', url: 'https://github.com/DivakarK22/microservices.git'
                }
            }
        }

        stage('Clean images/containers') {
            steps {
                sh 'sudo docker rm -f jenkins-local || true'
                sh 'sudo docker rmi -f jenkins-local || true'
            }
        }
        
        stage('Build') {
            steps {
                dir('/git/microservices/jenkins') {
                    sh 'sudo docker build --no-cache -t jenkins-local .'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'sudo docker run -v /var/lib/jenkins:/var/jenkins_home -d --name=jenkins-local -p 8081:8080  jenkins-local'
            }
        }
        
        stage('Check the container is up') {
            steps {
                script {
                    def containerStatus = sh(returnStdout: true, script: 'sudo docker ps -f name=jenkins-local --format "{{.Names}}"').trim()
                    if (containerStatus.contains('jenkins-local')) {
                        echo 'Container jenkins is running'
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
    }
}