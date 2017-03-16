FROM rcarmo/alpine:3.5-x86_64
MAINTAINER https://github.com/rcarmo

RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
    avahi-dev \
    musl-dev \
    libc-dev \
    build-base \
    g++ \
    ca-certificates \
    supervisor \
    nodejs \
    nodejs-dev \
    zeromq-dev 

RUN npm install -g \
      node-red \
      node-red-node-daemon \
      node-red-contrib-inotify \
      node-red-contrib-cron \
      # Logic
      node-red-node-base64 \
      node-red-node-geohash \
      node-red-node-random \
      node-red-node-smooth \
      node-red-node-suncalc \
      node-red-contrib-flow-dispatcher \
      node-red-contrib-kalman \
      node-red-contrib-msg-resend \
      node-red-contrib-roster \
      node-red-contrib-yield 
      
RUN npm install -g \
      # Services
      node-red-node-feedparser \
      node-red-node-google \
      node-red-node-twilio \
      node-red-node-twitter \
      node-red-node-pushbullet \
      node-red-node-wordpos \
      node-red-contrib-alexa \
      node-red-contrib-chatbot \
      node-red-contrib-cognitive-services \
      node-red-contrib-ifttt \
      node-red-contrib-twitter \
      node-red-contrib-twitter-text \
      node-red-contrib-twitter-stream \
      node-red-contrib-shorturl \
      node-red-contrib-slack \
      node-red-contrib-push \
      node-red-contrib-wit-ai \
      # Web
      node-red-node-exif \
      node-red-contrib-httpauth \
      node-red-contrib-https \
      node-red-contrib-get-feeds \
      node-red-contrib-rss \
      node-red-contrib-gzip \
      node-red-contrib-markdown 

RUN npm install -g \
      # Dashboards
      node-red-dashboard \
      node-red-contrib-graphs \
      node-red-contrib-metrics \
      node-red-contrib-web-worldmap \
      # Networking
      node-red-node-msgpack \
      node-red-node-ping \
      node-red-node-wol \
      node-red-contrib-advanced-ping \
      node-red-contrib-homekit \
      node-red-contrib-meobox \
      node-red-contrib-mqttssl \
      node-red-contrib-mqtt-env \
      node-red-contrib-n2n \
      node-red-contrib-ssdp-discover \
      node-red-contrib-zmq \
      # Databases
      node-red-node-sqlite \
      node-red-node-mongodb \
      node-red-node-redis \
      node-red-contrib-elasticsearchcdb \
      node-red-contrib-azure-blob-storage \
      node-red-contrib-azure-table-storage \
      node-red-contrib-azure-iot-hub \
      node-red-contrib-azure-documentdb \
      node-red-contrib-postgres 

RUN adduser -D -h /home/user -s /bin/ash -u 1001 user
USER user
EXPOSE 1880

CMD ["node-red"]
