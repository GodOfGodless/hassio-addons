#!/usr/bin/with-contenv bashio
set -e

# Pfad für deine Konfiguration im Home Assistant Verzeichnis
CONFIG_PATH="/homeassistant/homebridge_test"

echo "--- VORBEREITUNG ---"

# Falls der Ordner noch nicht existiert, erstelle ihn
if [ ! -d "$CONFIG_PATH" ]; then
    echo "Erstelle neuen Konfigurationsordner in $CONFIG_PATH..."
    mkdir -p "$CONFIG_PATH"
fi

# Erstelle eine initiale config.json, falls keine vorhanden ist
if [ ! -f "$CONFIG_PATH/config.json" ]; then
    echo "Erstelle Standard-Konfiguration für Test-Instanz..."
    cat <<EOF > "$CONFIG_PATH/config.json"
{
    "bridge": {
        "name": "Homebridge Test-Instanz",
        "username": "CC:22:3D:E3:CE:31",
        "port": 51827,
        "pin": "031-45-154"
    },
    "accessories": [],
    "platforms": [
        {
            "platform": "config",
            "name": "Config",
            "port": 8582
        }
    ]
}
EOF
fi

# Der Pfad zur lokalen Installation im Container
BINARY="/opt/homebridge/node_modules/.bin/hb-service"

echo "--- STARTVORGANG ---"

if [ -f "$BINARY" ]; then
    echo "hb-service gefunden! Starte Homebridge UI auf Port 8582..."
    
    # Startet Homebridge mit Web-Interface
    # -U: Verzeichnis für Config/Plugins
    # -P: Port für das Web-Interface
    # --allow-root: Erlaubt die Ausführung als Administrator im Container
    exec "$BINARY" run -U "$CONFIG_PATH" -P 8582 --allow-root
else
    echo "FEHLER: hb-service nicht gefunden in $BINARY"
    echo "Prüfe Inhalt von /opt/homebridge/node_modules/.bin/:"
    ls -la /opt/homebridge/node_modules/.bin/ || echo "Verzeichnis existiert nicht!"
    exit 1
fi
