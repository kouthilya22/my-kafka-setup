pipeline {
    agent {
        docker {
            image 'docker:latest'
            
        }
    }
    environment {
        WORKSPACE_DIR = "${env.WORKSPACE}"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Checkout the repository
                    checkout scm
                    // Build Docker image using Dockerfile
                    sh 'docker build -t kafka-setup .'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deploy Kafka using docker-compose.yml
                    sh 'docker-compose up -d'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Add any testing steps if required
                }
            }
        }
        stage('Cleanup') {
            steps {
                script {
                    // Cleanup steps if needed
                    sh 'docker-compose down'
                }
            }
        }
    }
    post {
        always {
            script {
                // Ensure cleanup is always done
                sh 'docker-compose down'
            }
        }
    }
}
