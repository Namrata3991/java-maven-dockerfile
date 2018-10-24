FROM openjdk:8-jdk-alpine3.7 AS builder
RUN java -version

COPY . /Users/apple/Downloads/simple-java-maven-app-master
WORKDIR /Users/apple/Downloads/simple-java-maven-app-master
RUN apk --no-cache add maven && mvn --version
RUN mvn package

FROM openjdk:8-jre-alpine3.7
WORKDIR /root/
COPY --from=builder /Users/apple/Downloads/simple-java-maven-app-master/target/my-app-1.0-SNAPSHOT.jar .

EXPOSE 8123
ENTRYPOINT ["java", "-jar", "./my-app-1.0-SNAPSHOT.jar"]
