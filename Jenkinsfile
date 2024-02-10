pipeline {
    agent any
    stages {
        stage('Checkout and Pull') {
            steps {
                cd /root/git/microservices
                git checkout portfolio
                git pull

            }
        }
        stage('Clean images/containers') {
            steps {
                sudo docker rmi -f portfolio 
                sudo docker rm -f portfolio
                sudo docker stop portfolio || true
            }
        }
        stage('Build') {
            steps {
                cd /root/git/microservices/portfolio
                sudo docker build -t portfolio .
            }
        }
        stage('Deploy') {
            steps {
                sudo docker run -d --name portfolio -p 1234:1234 portfolio
            }
        }
        stage('Check the container is up') {
            steps {
                docker ps -f name=portfolio --format '{{.Names}}' | grep -q portfolio && echo "Container is running" || echo "Container is not running"
            }
        }
    }
}
