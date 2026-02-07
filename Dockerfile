FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy project files
COPY . .

# Make mvnw executable
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# Copy the built JAR to a fixed name
RUN cp target/*.jar app.jar

EXPOSE 8080

# Run the app
CMD ["java", "-jar", "app.jar"]

