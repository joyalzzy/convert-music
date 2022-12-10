FROM alpine:latest
LABEL Name=convertmusic Version=0.0.1
RUN apk update && apk add bash
ADD ./convert.sh /root/
VOLUME /music
VOLUME /converted
ENTRYPOINT ["sh", "-c", "/root/convert.sh /music /converted"]
