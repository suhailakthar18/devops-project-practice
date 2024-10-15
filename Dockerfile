# Use a specific version of OpenJDK 17
FROM openjdk:17.0.5-jdk-slim AS build

# Install Maven
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the project files
COPY . .

# Build the project using Maven
RUN mvn clean install

# Create a new image for the runtime
FROM openjdk:17.0.5-jdk-slim

# Set working directory
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/devops-project-1.0-SNAPSHOT.jar .

# Expose port 8080
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "devops-project-1.0-SNAPSHOT.jar"]

