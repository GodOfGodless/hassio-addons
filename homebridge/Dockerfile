ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.8
FROM ${BUILD_FROM}

# Installiere Node.js, System-Abhängigkeiten UND Build-Tools
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

# Homebridge & UI Installation
# --unsafe-perm ist wichtig für die Installation als root im Container
RUN npm install -g --unsafe-perm homebridge homebridge-config-ui-x

# Kopiere Start-Skript (muss im selben Ordner wie das Dockerfile liegen!)
COPY run.sh /
RUN chmod a+x /run.sh

# Start-Befehl
CMD [ "/run.sh" ]
