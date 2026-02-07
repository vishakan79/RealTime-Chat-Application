FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy Spring Boot project
COPY chatApplication/ /app/

# Fix permissions
RUN chmod +x mvnw

# Build the app
RUN ./mvnw clean package -DskipTests

# DEBUG: show files (important)
RUN ls -l target

# Rename jar to fixed name
RUN cp target/*.jar app.jar

EXPOSE 8080

# IMPORTANT: use exec form
ENTRYPOINT ["java","-jar","/app/app.jar"]

