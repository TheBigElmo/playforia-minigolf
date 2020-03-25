FROM frekele/ant:1.10-jdk8 AS builder
COPY /server .
RUN ant compile

FROM openjdk:8-jre-alpine
EXPOSE 4242
COPY --from=builder /bin/server.jar .
CMD ["java", "-jar", "server.jar"]