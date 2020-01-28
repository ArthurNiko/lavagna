FROM maven:3.6.3-jdk-8 AS mavenBuilder
WORKDIR /app
COPY ./minimal .
RUN rm -rf ./minimal/src/main/webapp
# RUN mvn dependency:go-offline
# COPY . .
# && apt-get install default-jdk -y && apt-get install nodejs -y
# RUN node -v
# RUN npm install
RUN mvn verify

FROM openjdk:8-jre-alpine
WORKDIR /app
RUN apk update && apk add wget && apk add ca-certificates && update-ca-certificates
COPY --from=mavenBuilder /app/target .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]