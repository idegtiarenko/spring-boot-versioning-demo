FROM openjdk:11-jdk-slim
WORKDIR /home/app
ARG VERSION
COPY build/libs/spring-boot-versioning-demo-${VERSION}.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
