FROM debian:8
MAINTAINER Daniel Jensen version: 0.1
WORKDIR /server
ENV SERVER_URL http://ftb.cursecdn.com/FTB2/modpacks/FTBTrident/1_4_0/FTBTridentServer.zip
RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless curl unzip && apt-get clean
RUN curl -o server.zip $SERVER_URL
RUN unzip server.zip -d /server && rm server.zip
RUN ls -la /server/
RUN mv /server/TridentMap /map && mv /server/server.properties /server.properties
RUN ln -s /map /server/TridentMap
RUN ln -s /server.properties /server/server.properties
EXPOSE 25565
CMD ["sh", "ServerStart.sh"]
