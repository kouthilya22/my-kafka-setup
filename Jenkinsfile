pipeline {
    agent any

    environment {
        KAFKA_HOME = 'C:\\opt\\confluent'
        PLUGIN_VERSION = 'latest' // Replace with the desired version
        CONNECTOR_NAME = 'confluentinc-kafka-connect-s3'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git 'https://github.com/kouthilya22/my-kafka-setup.git'
            }
        }

        stage('Install Kafka and Plugins') {
            steps {
                echo 'Installing Kafka and Plugins...'
                bat """
                    mkdir ${KAFKA_HOME}
                    curl -sS https://packages.confluent.io/archive/6.2/confluent-community-${PLUGIN_VERSION}.tar.gz | tar -xz -C ${KAFKA_HOME} --strip-components 1
                    mkdir ${KAFKA_HOME}\\plugins\\${CONNECTOR_NAME}
                    curl -sS https://packages.confluent.io/maven/${CONNECTOR_NAME}/${CONNECTOR_NAME}-${PLUGIN_VERSION}.tar.gz | tar -xz -C ${KAFKA_HOME}\\plugins\\${CONNECTOR_NAME} --strip-components 1
                """
            }
        }

        stage('Start Kafka and Test') {
            steps {
                echo 'Starting Kafka and Testing...'
                bat """
                    ${KAFKA_HOME}\\bin\\windows\\zookeeper-server-start.bat ${KAFKA_HOME}\\etc\\kafka\\zookeeper.properties
                    ${KAFKA_HOME}\\bin\\windows\\kafka-server-start.bat ${KAFKA_HOME}\\etc\\kafka\\server.properties
                    ${KAFKA_HOME}\\bin\\windows\\kafka-topics.bat --create --topic test-topic --bootstrap-server localhost:9092
                """
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            bat """
                ${KAFKA_HOME}\\bin\\windows\\kafka-server-stop.bat
                ${KAFKA_HOME}\\bin\\windows\\zookeeper-server-stop.bat
            """
        }
    }
}
