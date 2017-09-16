FROM rcarmo/alpine:3.6-armhf
MAINTAINER https://github.com/rcarmo

ADD build.sh /root/build.sh

RUN apk update \
 && apk upgrade \
 && apk add --no-cache --virtual .run-deps \
    ca-certificates \
    supervisor \
    nodejs \
 && apk add --no-cache --virtual .build-deps \
    musl-dev \
    libc-dev \
    build-base \
    nodejs-dev \
    nodejs-npm \
    avahi-dev \
    sqlite-dev \
    zeromq-dev \
 && sh /root/build.sh \
 && RUNTIME_DEPENDENCIES="$( \
        scanelf --needed --nobanner --recursive /usr/local \
                | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
                | sort -u \
                | xargs -r apk info --installed \
                | sort -u \
    )" \
 && apk add --virtual .run-deps $RUNTIME_DEPENDENCIES \
 && apk del .build-deps

RUN adduser -D -h /home/user -s /bin/ash -u 1001 user
USER user
EXPOSE 1880

CMD ["node-red"]
