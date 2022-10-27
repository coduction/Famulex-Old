# syntax=docker/dockerfile:1.2

# Install Maven for the multi stage build
# If you want to run the image on a ARM based machine, swap out these lines
#FROM --platform=linux/arm64 maven:3.8.6-eclipse-temurin-17 AS MAVEN_BUILD
FROM maven:3.8.6-eclipse-temurin-17 AS MAVEN_BUILD

# Set working directory
ENV HOME=/usr/famulex
RUN mkdir -p $HOME
WORKDIR $HOME

COPY . .

# Buildkit is required
RUN --mount=type=cache,target=frontend/node  \
    --mount=type=cache,target=frontend/node_modules  \
    --mount=type=cache,target=/root/.m2 \
    mvn clean package -Dmaven.test.skip

# Second stage
# If you want to run the image on a ARM based machine, swap out these lines
FROM arm64v8/eclipse-temurin:17-jre
#FROM eclipse-temurin:17-jre-alpine

# Copy the jar created in stage one
COPY --from=MAVEN_BUILD /usr/famulex/backend/target/backend.jar /famulex.jar

# Expose port 8080
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "famulex.jar"]