FROM gradle:jdk-21-and-22-alpine AS build-stage
LABEL authors="yashghatti"
WORKDIR /home/gradle/src
COPY --chown=gradle:gradle . /home/gradle/src
RUN gradle clean assemble --refresh-dependencies

FROM amazoncorretto:21.0.3-alpine3.19 AS run-stage
RUN mkdir -p /opt/app
WORKDIR /opt/app
EXPOSE 8080
COPY --from=build-stage /home/gradle/src/build/libs/sbt-0.0.1.jar /opt/app/sbt.jar
ENTRYPOINT ["java","-jar","/opt/app/sbt.jar"]