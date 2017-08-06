FROM debian:8
MAINTAINER Daniel Jensen version: 0.1
WORKDIR /server
ADD server /server
RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless curl && apt-get clean
RUN ln -s /map /server/TridentMap
RUN ln -s /server.properties /server/server.properties
EXPOSE 25565
CMD ["sh", "ServerStart.sh"]
