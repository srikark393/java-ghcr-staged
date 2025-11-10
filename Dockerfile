FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /src
COPY pom.xml .
RUN mvn -B -q -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -B -q test package verify

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /src/target/app-jar-with-dependencies.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]