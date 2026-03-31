#!/usr/bin/with-contenv bashio
set -e

# Pfad für deine Konfiguration (Test-Instanz)
CONFIG_PATH="/homeassistant/homebridge_test"
mkdir -p "$CONFIG_PATH"

# Der Pfad zu unserer lokalen Installation
BINARY="/opt/homebridge/node_modules/.bin/homebridge-config-ui-x"

echo "--- STARTVORGANG ---"
if [ -f "$BINARY" ]; then
    echo "Homebridge UI gefunden! Starte auf Port 8582..."
    # Starte das Programm
    exec "$BINARY" -U "$CONFIG_PATH" -P 8582
else
    echo "FEHLER: Programm nicht gefunden in $BINARY"
    echo "Inhalt von /opt/homebridge/node_modules/.bin/:"
    ls -la /opt/homebridge/node_modules/.bin/ || echo "Ordner existiert nicht"
    exit 1
fi
