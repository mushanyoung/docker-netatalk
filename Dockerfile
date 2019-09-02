FROM alpine:edge

LABEL maintainer="mushanyoung@gmail.com"

ADD afp.conf init /

RUN apk add --no-cache netatalk \
 && chmod +x /init

VOLUME /conf /data /timemachine
EXPOSE 548/tcp

ENTRYPOINT ["/init"]
CMD ["/usr/sbin/netatalk", "-d"]
