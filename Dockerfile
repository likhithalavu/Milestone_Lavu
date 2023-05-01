FROM maven:3.8-openjdk-17 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests


FROM openjdk:17-jdk-slim
COPY --from=build /target/DogManagemntSystem-0.0.1-SNAPSHOT.jar DogManagemntSystem.jar
CMD ["java", "-jar", "DogManagemntSystem.jar"]
