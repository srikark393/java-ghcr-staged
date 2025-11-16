FROM maven:3.9.9-eclipse-temurin-17

WORKDIR /app

# Copy Maven project files
COPY pom.xml .
RUN mvn -B -q -DskipTests dependency:go-offline

COPY src ./src

# Build the fat JAR: target/app.jar
RUN mvn -B -q test package && ls -al target

# Run the jar directly from /app/target/app.jar
ENTRYPOINT ["java","-jar","target/app.jar"