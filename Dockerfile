#
# Build stage
#
FROM maven:3.8.2-openjdk-11 AS build
WORKDIR /build

COPY . .

RUN mvn clean install

#
# Package stage
#
FROM maven:openjdk
WORKDIR /demoDocker

COPY --from=build /build/target/*.jar demoDocker.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","demoDocker.jar"]

