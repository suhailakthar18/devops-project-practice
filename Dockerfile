# Use an official OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the project files
COPY . .

# Build the project using Maven
RUN ./mvnw clean install

# Expose port 8080
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "target/devops-project-1.0-SNAPSHOT.jar"]


