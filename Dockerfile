FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy only the Spring Boot project folder
COPY chatApplication/ .

# Make mvnw executable
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# Rename jar to fixed name
RUN cp target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]

