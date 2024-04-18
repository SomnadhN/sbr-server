# Use a base image with Java installed
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file into the container at the defined working directory
COPY target/*.jar app.jar

# Expose the port that the application will run on
EXPOSE 9192

# Define the command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]
