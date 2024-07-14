pipeline {
    agent {
        docker {
            image 'python:3.8'
            args '-u root:root'
            // Change the working directory to a Unix-style path
            customWorkspace '/workspace/SampleDockerPipeline'
        }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Clone your repository or use any existing code
                    git 'https://github.com/kouthilya22/my-kafka-setup.git'
                }
                echo 'Building the Docker container'
            }
        }
        stage('Run') {
            steps {
                sh 'python --version'
                echo 'Running some tests in Docker container'
                // Run your tests (ensure you have tests in your repository)
                sh 'pytest tests'
            }
        }
    }
    post {
        always {
            echo 'Cleaning up'
        }
    }
}
