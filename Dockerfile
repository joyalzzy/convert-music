FROM docker/debian:latest
LABEL Name=convertmusic Version=0.0.1
RUN apt-get -y update && apt-get install -y fortunes
ADD ./convert.sh /root/
VOLUME /music
VOLUME /converted
RUN ["sh", "-c", "/root/convert.sh /music /converted"]
