FROM frekele/ant:1.10-jdk8 AS builder
WORKDIR /server
RUN ant compile

FROM openjdk:8-jre-alpine
EXPOSE 4242
COPY --from=builder /server/bin/server.jar .
CMD ["java", "-jar", "server.jar"]