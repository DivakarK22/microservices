pipeline {
    agent any
    
    stages {
        stage('Checkout and Pull') {
            steps {
                dir('/root/git/microservices') {
                    git branch: 'portfolio', url: 'https://github.com/DivakarK22/microservices.git'
                }
            }
        }
        
        stage('Clean images/containers') {
            steps {
                sh 'docker rmi -f portfolio || true'
                sh 'docker rm -f portfolio || true'
                sh 'docker stop portfolio || true'
            }
        }
        
        stage('Build') {
            steps {
                dir('/root/git/microservices/portfolio') {
                    sh 'docker build -t portfolio .'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'docker run -d --name portfolio -p 1234:1234 portfolio'
            }
        }
        
        stage('Check the container is up') {
            steps {
                script {
                    def containerStatus = sh(returnStdout: true, script: 'docker ps -f name=portfolio --format "{{.Names}}"').trim()
                    if (containerStatus.contains('portfolio')) {
                        echo 'Container is running'
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
    }
}
