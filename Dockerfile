FROM maven:3.9-eclipse-temurin-8 AS build
WORKDIR /app
COPY General_Stores/pom.xml .
RUN mvn -q dependency:go-offline
COPY General_Stores/src ./src
RUN mvn -q -DskipTests package

FROM eclipse-temurin:8-jre
WORKDIR /app
COPY --from=build /app/target/*.war app.war
EXPOSE 8888
CMD ["java", "-jar", "app.war"]
