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
# Keep the JVM within the 512MB limit of small hosting plans
CMD ["java", "-Xmx256m", "-Xss512k", "-XX:MaxMetaspaceSize=128m", "-XX:ReservedCodeCacheSize=48m", "-XX:+UseSerialGC", "-XX:TieredStopAtLevel=1", "-jar", "app.war"]
