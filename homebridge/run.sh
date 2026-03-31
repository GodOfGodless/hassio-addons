#!/usr/bin/with-contenv bashio

# Eigenes Verzeichnis für die Test-Instanz erstellen
mkdir -p /config/homebridge_test

# Startet Homebridge auf Port 8582 im neuen Verzeichnis
# -P 8582 erzwingt das UI auf diesen Port
homebridge-config-ui-x -U /config/homebridge_test -P 8582
