FROM alpine:latest

RUN apk add --no-cache transmission-cli
RUN apk add --no-cache transmission-daemon

RUN mkdir -p /var/lib/transmission/{downloads,incomplete,config} && \
    adduser -D -h /var/lib/transmission transmission && \
    chown -R transmission:transmission /var/lib/transmission

COPY settings.json /var/lib/transmission/config/settings.json

EXPOSE 9091 51413/tcp 51413/udp

USER transmission
CMD ["transmission-daemon", "--foreground", "--config-dir", "/var/lib/transmission/config"]
