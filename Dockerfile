FROM alpine:latest

RUN apk update && \
	apk add --no-cache transmission-cli transmission-daemon transmission-extra transmission-remote   yt-dlp ffmpeg  && \
	apk del --purge && \
	rm -rf /var/cache/apk/* && \
	mkdir -p /var/lib/transmission/downloads && \
	mkdir -p /var/lib/transmission/incomplete && \
	mkdir -p /var/lib/transmission/config
    #adduser -D -h /var/lib/transmission transmission && \
    #chown -R transmission:transmission /var/lib/transmission
#
COPY settings.json /var/lib/transmission/config/settings.json

EXPOSE 9091 51413/tcp 51413/udp

USER root
CMD ["transmission-daemon", "--foreground", "--config-dir", "/var/lib/transmission/config"]
