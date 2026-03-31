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

# Homebridge global installieren
RUN npm install -g --unsafe-perm homebridge homebridge-config-ui-x

# Sicherstellen, dass die globalen npm-Binaries im Pfad sind
ENV PATH="${PATH}:/usr/local/bin"

# Kopiere Start-Skript
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
