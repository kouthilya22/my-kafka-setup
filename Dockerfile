# Use a base image that includes Docker and necessary tools
FROM docker:latest

# Install Docker Compose (if not included in base image)
RUN apk add --no-cache docker-compose

# Set working directory
WORKDIR /app

# Copy docker-compose.yml to the working directory
COPY docker-compose.yml .

# Install any additional dependencies or setup commands needed

# Define default command to start Kafka services (example)
CMD ["docker-compose", "up"]
