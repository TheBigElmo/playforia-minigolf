FROM frekele/ant:1.10-jdk8 AS builder
COPY /server /server
COPY /shared /shared
COPY /lib /lib
COPY /tracks /tracks
WORKDIR /server
RUN ant compile

FROM openjdk:8-jre-alpine
EXPOSE 4242
COPY --from=builder /server/server.jar .
CMD ["java", "-jar", "server.jar"]