FROM alpine:latest
LABEL Name=convertmusic Version=0.0.1
RUN apk update && apk add bash && apk add ffmpeg
ADD ./convert.sh /root/
RUN ["chmod", "+x", "/root/convert.sh"]
VOLUME ["/music", "/converted"]
ENTRYPOINT ["sh", "-c", "/root/convert.sh /music /converted"]
