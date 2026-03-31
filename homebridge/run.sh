#!/usr/bin/with-contenv bashio
set -e

# Pfad für deine Konfiguration
CONFIG_PATH="/homeassistant/homebridge_test"
mkdir -p "$CONFIG_PATH"

# Der Pfad, den wir gerade im Log gesehen haben
BINARY="/opt/homebridge/node_modules/.bin/hb-service"

echo "--- STARTVORGANG ---"
if [ -f "$BINARY" ]; then
    echo "hb-service gefunden! Starte Homebridge UI auf Port 8582..."
    
    # 'hb-service run' startet Homebridge inklusive Web-Interface
    # -U gibt das Konfigurationsverzeichnis an
    # -P gibt den Port für das Web-Interface an
    exec "$BINARY" run -U "$CONFIG_PATH" -P 8582
else
    echo "FEHLER: hb-service nicht gefunden in $BINARY"
    exit 1
fi
