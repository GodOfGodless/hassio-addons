ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.8
FROM ${BUILD_FROM}

# Installiere Node.js und Abhängigkeiten
RUN apk add --no-cache \
    nodejs \
    npm \
    dbus \
    avahi-compat-libdns_sd \
    avahi-dev

# Homebridge Installation
RUN npm install -g --unsafe-perm homebridge homebridge-config-ui-x

# Kopiere Start-Skript
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
