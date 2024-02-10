pipeline {
    agent any
    
    stages {
        stage('Checkout and Pull') {
            steps {
                dir('/git/microservices/') {
                    git branch: 'sensu-core', url: 'https://github.com/DivakarK22/microservices.git'
                }
            }
        }

        stage('Clean images/containers') {
            steps {
                sh 'sudo docker rm -f sensu-master || true'
                sh 'sudo docker rm -f sensu-redis || true'
                sh 'sudo docker rm -f sensu-rabbitmq || true'
            }
        }
        
        stage('Build') {
            steps {
                dir('/git/microservices/sensu-core') {
                    sh 'sudo docker build -t sensu-core .'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'sudo docker run -d --name sensu-redis -p 6379:6379 redis:6.2'
                sh 'sudo docker run -d --name sensu-rabbitmq -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=sensu -e RABBITMQ_DEFAULT_PASS=sensu -e RABBITMQ_DEFAULT_VHOST=/sensu rabbitmq:3-management'
                sh 'sudo docker run -d --name=sensu-master -p 4567:4567  sensu-master'
            }
        }
        
        stage('Check the container is up') {
            steps {
                script {
                    def containerStatus = sh(returnStdout: true, script: 'sudo docker ps -f name=sensu-master --format "{{.Names}}"').trim()
                    if (containerStatus.contains('sensu-master')) {
                        echo 'Container is running'
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
    }
}