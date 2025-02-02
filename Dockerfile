FROM maven:3.8.2-openjdk-8 as build
ARG BUILD_VERSION=1.0.0
WORKDIR /darsh
COPY . .
RUN mvn clean package

# Runtime stage using Tomcat with OpenJDK 8
FROM tomcat:9.0-jdk8-openjdk as runtime
ARG BUILD_VERSION=1.0.0
COPY --from=build /darsh/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps/
