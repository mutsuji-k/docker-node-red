FROM rcarmo/alpine:3.5-armhf
MAINTAINER https://github.com/rcarmo

RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
    musl \
    build-base \
    ca-certificates \
    supervisor \
    nodejs \
    nodejs-dev \
    zeromq-dev 

RUN npm install --loglevel verbose -g \
      node-red \
      node-red-contrib-inotify \
      node-red-node-daemon \
      node-red-contrib-cron \
      # Logic
      node-red-node-random \
      node-red-node-smooth \
      node-red-node-base64 \
      node-red-node-geohash \
      node-red-node-suncalc \
      node-red-contrib-msg-resend \
      node-red-contrib-kalman \
      node-red-contrib-yield \
      node-red-contrib-flow-dispatcher \
 && rm -rf /root/.npm
      
RUN npm install --loglevel verbose -g \
      node-red-contrib-roster \
      # Services
      node-red-contrib-ifttt \
      node-red-node-feedparser \
      node-red-node-twitter \
      node-red-contrib-twitter \
      node-red-contrib-twitter-text \
      node-red-contrib-twitter-stream \
      node-red-contrib-push \
      node-red-contrib-slack \
      node-red-node-pushbullet \
      node-red-node-google \
      node-red-node-twilio \
      node-red-contrib-shorturl \
      node-red-contrib-wit-ai \
      node-red-contrib-cognitive-services \
      node-red-node-wordpos \
      node-red-node-badwords \
      # Web
      node-red-contrib-httpauth \
      node-red-contrib-https \
      node-red-contrib-get-feeds \
      node-red-contrib-rss \
      node-red-contrib-gzip \
      node-red-node-exif \
      node-red-contrib-markdown \
 && rm -rf /root/.npm

RUN npm install -g \
      # Dashboards
      node-red-contrib-web-worldmap \
      node-red-dashboard \
      node-red-contrib-metrics \
      # Networking
      node-red-node-wol \
      node-red-node-ping \
      node-red-contrib-advanced-ping \
      node-red-contrib-n2n \
      node-red-contrib-zmq \
      node-red-node-msgpack \
      node-red-contrib-mqttssl \
      node-red-contrib-mqtt-env \
      node-red-contrib-ssdp-discover \
      node-red-contrib-meobox \
      # Databases
      node-red-node-redis \
      node-red-contrib-elasticsearchcdb \
      node-red-contrib-azure-blob-storage \
      node-red-contrib-azure-table-storage \
      node-red-contrib-azure-iot-hub \
      node-red-contrib-azure-documentdb \
      node-red-node-mongodb \
      node-red-contrib-postgres \
 && rm -rf /root/.npm

# Modules we can't install in Alpine 3.5 armhf just yet
#RUN npm install --loglevel verbose -g \
      #bcrypt \
      # Hardware
      #node-red-contrib-gpio \
      #raspi-io \
      #node-red-contrib-alexa \
      #node-red-contrib-camerapi \
      #node-red-contrib-pdf \
      #node-red-contrib-graphs \
      #node-red-node-discovery \
      #node-red-node-sqlite

RUN adduser -D -h /home/user -s /bin/ash -u 1001 user
USER user
EXPOSE 1880

CMD ["node-red"]
