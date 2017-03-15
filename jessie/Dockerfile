FROM resin/rpi-raspbian:jessie
MAINTAINER https://github.com/rcarmo

RUN apt-get update && apt-get dist-upgrade -y && apt-get install \
    build-essential \
    ca-certificates \
    libavahi-compat-libdnssd-dev \
    libsqlite3-dev \
    libzmq-dev \
    python2.7-dev \
    wget \
 && apt-get clean && rm -rf /var/lib/apt/lists/*


# Get an updated Node runtime that will run on ARM6
RUN cd /tmp \
 && wget https://nodejs.org/dist/v6.9.2/node-v6.9.2-linux-armv6l.tar.xz \
 && tar -xvf node-v6.9.2-linux-armv6l.tar.xz \
 && cd node-v6.9.2-linux-armv6l \
 && cp -R bin/ /usr/local/ \
 && cp -R include /usr/local/ \
 && cp -R lib/ /usr/local/ \
 && cp -R share/ /usr/local/ \
 && rm -rf /tmp/node-v6.9.2-linux-armv6l*

RUN npm install -g \
      node-red \
      node-red-contrib-inotify \
      node-red-node-daemon \
      node-red-contrib-cron \
      # Hardware
      node-red-contrib-gpio \
      raspi-io \
      node-red-contrib-camerapi \
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
      node-red-contrib-yield \
 && rm -rf /root/.npm
      
RUN npm install --loglevel verbose -g \
      # Services
      node-red-contrib-alexa \
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
      node-red-contrib-chatbot \
      node-red-node-wordpos \
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
      node-red-dashboard \
      node-red-contrib-web-worldmap \
      node-red-contrib-metrics \
      # Networking
      node-red-node-msgpack \
      node-red-node-ping \
      node-red-node-wol \
      node-red-contrib-advanced-ping \
      node-red-contrib-homekit \
      node-red-contrib-meobox \
      node-red-contrib-mqtt-env \
      node-red-contrib-mqttssl \
      node-red-contrib-n2n \
      node-red-contrib-ssdp-discover \
      node-red-contrib-zmq \
      # Databases
      node-red-node-redis \
      node-red-contrib-elasticsearchcdb \
      node-red-contrib-azure-blob-storage \
      node-red-contrib-azure-table-storage \
      node-red-contrib-azure-iot-hub \
      node-red-contrib-azure-documentdb \
      node-red-node-mongodb \
      node-red-contrib-postgres \
      node-red-node-sqlite \
 && rm -rf /root/.npm


# Modules we can't install in Alpine 3.5 armhf just yet
#RUN npm install --loglevel verbose -g \
      #bcrypt \
      # Hardware
      #node-red-contrib-pdf \
      #node-red-contrib-graphs \
      #node-red-node-discovery \

RUN adduser -D -h /home/user -s /bin/ash -u 1001 user
USER user
EXPOSE 1880

CMD ["node-red"]
