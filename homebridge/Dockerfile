ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.8
FROM ${BUILD_FROM}

# Installiere Node.js und Build-Tools
RUN apk add --no-cache \
    nodejs \
    npm \
    dbus \
    avahi-compat-libdns_sd \
    avahi-dev \
    python3 \
    make \
    g++ \
    git

# Erstelle festen Installationsordner
WORKDIR /opt/homebridge

# Installation direkt in diesen Ordner (nicht global)
RUN npm install homebridge homebridge-config-ui-x

# Kopiere Start-Skript
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
