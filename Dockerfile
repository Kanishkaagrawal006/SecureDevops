FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /build

COPY pom.xml .

RUN mvn -B dependency:go-offline

COPY src ./src

RUN mvn -B clean package -DskipTests


FROM eclipse-temurin:21-jre

WORKDIR /app

RUN useradd --system --create-home spring

COPY --from=build /build/target/*.jar app.jar

RUN chown -R spring:spring /app

USER spring

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]