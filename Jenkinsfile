pipeline {
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    environment {
        DOCKER_COMPOSE_VERSION = '1.29.2'
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub repository
                git url: 'https://github.com/your-repo/my-kafka-setup.git', branch: 'main'
            }
        }
        stage('Install Docker Compose') {
            steps {
                sh '''
                apk add --no-cache py-pip
                pip install docker-compose==${DOCKER_COMPOSE_VERSION}
                '''
            }
        }
        stage('Build and Start Services') {
            steps {
                // Build Docker images and start services using docker-compose
                sh 'docker-compose up -d --build'
            }
        }
        stage('Verify Setup') {
            steps {
                // Verify Kafka and connectors are running
                sh '''
                docker-compose ps
                curl -s http://localhost:8083/connectors | jq .
                '''
            }
        }
    }
    post {
        always {
            // Clean up Docker containers
            sh 'docker-compose down'
        }
    }
}
