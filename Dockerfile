ARG BASE 
FROM ${BASE}
MAINTAINER Rui Carmo https://github.com/rcarmo

#RUN apt-get update \
# && apt-get dist-upgrade -y \
# && i
RUN apt-get update \
 && apt-get install \
    apt-transport-https \
    build-essential \
    curl \
    git \
    libavahi-compat-libdnssd-dev \
    wget \
    -y --force-yes  \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get install \
    nodejs \
    -y --force-yes \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


RUN adduser --disabled-password --gecos "" -u 1001 user
USER user
RUN npm config set prefix=/home/user/.npm-packages \
 && echo -e '\nexport PATH="/home/user/.npm-packages/bin:$PATH"' >> /home/user/.bashrc \
 && npm install -g --build-from-source \
    node-red \
    node-red-node-daemon \
    node-red-contrib-inotify \
    node-red-contrib-cron \
    node-red-node-base64 \
    node-red-node-random \
    node-red-node-smooth \
    node-red-node-suncalc \
    node-red-contrib-kalman \
    node-red-contrib-msg-resend \
    node-red-contrib-roster \
    node-red-contrib-yield \
    node-red-node-feedparser \
    node-red-node-twilio \
    node-red-contrib-cognitive-services \
    node-red-contrib-shorturl \
    node-red-contrib-httpauth \
    node-red-contrib-https \
    node-red-contrib-rss \
    node-red-contrib-gzip \
    node-red-contrib-markdown \
    node-red-dashboard \
    node-red-node-exif \
    node-red-node-wol \
    node-red-node-ping \
    node-red-contrib-advanced-ping \
    node-red-contrib-chromecast \
    node-red-contrib-homekit \
    node-red-contrib-n2n \
    node-red-contrib-zmq \
    node-red-node-msgpack \
    node-red-contrib-mqttssl \
    node-red-contrib-mqtt-env \
    node-red-contrib-ssdp-discover \
    node-red-node-discovery \
    node-red-contrib-meobox \
    node-red-node-redis \
    node-red-node-mongodb \
    node-red-node-sqlite \
    node-red-contrib-broadlink  

VOLUME /home/user/.node-red
CMD /home/user/.npm-packages/bin/node-red

ARG VCS_REF
ARG VCS_URL
ARG BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.build-date=$BUILD_DATE
