FROM confluentinc/cp-kafka-connect-base:latest

COPY connectors/confluentinc-kafka-connect-s3-10.5.13 /usr/share/java/

