FROM eclipse-temurin:latest
RUN mkdir /app
COPY target/simple-java-app-1.0-SNAPSHOT.jar /app
CMD ["java", "-jar", "/app/simple-java-app-1.0-SNAPSHOT.jar"]
