#!/usr/bin/with-contenv bashio

# Pfad definieren
CONFIG_PATH="/homeassistant/homebridge_test"

# Falls der Ordner noch nicht existiert, erstelle ihn
if [ ! -d "$CONFIG_PATH" ]; then
    echo "Erstelle neuen Konfigurationsordner in $CONFIG_PATH..."
    mkdir -p "$CONFIG_PATH"
    
    # Erstelle eine initiale config.json mit anderen Ports
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

# Starte Homebridge UI auf Port 8582
echo "Starte Homebridge auf Port 8582..."
# Suche den Pfad zum Programm automatisch
UI_X_PATH=$(which homebridge-config-ui-x)

if [ -z "$UI_X_PATH" ]; then
    echo "FEHLER: homebridge-config-ui-x wurde nirgendwo gefunden!"
    echo "Installierte Binaries in /usr/local/bin:"
    ls /usr/local/bin
    exit 1
fi

echo "Programm gefunden unter: $UI_X_PATH"
echo "Starte Homebridge auf Port 8582..."

# Starte das Programm mit dem gefundenen Pfad
exec "$UI_X_PATH" -U "$CONFIG_PATH" -P 8582
