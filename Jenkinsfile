pipeline {
    agent any
    stages {
        stage('Checkout and Pull') {
            steps {
                dir('/git/microservices') {
                    git branch: 'grafana', url: 'https://github.com/DivakarK22/microservices.git'
                }
            }
        }
        stage('Clean images/containers') {
            steps {
                sh 'sudo docker rm -f grafana || true'
                sh 'sudo docker rmi -f grafana || true'
                sh 'sudo docker rm -f prometheus || true'
                sh 'sudo docker rmi -f prometheus || true'
            }
        }           
        stage('Deploy') {
            steps {
                sh 'sudo docker stop grafana || true'
                sh 'sudo docker stop prometheus || true'
                sh 'docker run -d --name=grafana -v /prom_grafana_data:/var/lib/grafana -p 3001:3000 grafana/grafana || true'
                sh 'docker run -d -p 9080:9090 --name prometheus -v /prom_grafana_data/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file="/etc/prometheus/prometheus.yml"'
            }
        }     
        stage('Check the Grafana container is up') {
            steps {
                script {
                    def containerStatus = sh(returnStdout: true, script: 'sudo docker ps -f name=grafana --format "{{.Names}}"').trim()
                    if (containerStatus.contains('grafana')) {
                        echo 'Container grafana is running'
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
        stage('Check the Prometheus container is up') {
            steps {
                script {
                    def containerStatus = sh(returnStdout: true, script: 'sudo docker ps -f name=prometheus --format "{{.Names}}"').trim()
                    if (containerStatus.contains('prometheus')) {
                        echo 'Container prometheus is running'
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
    }
}