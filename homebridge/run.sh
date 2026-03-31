#!/usr/bin/with-contenv bashio
set -e

CONFIG_PATH="/homeassistant/homebridge_test"
mkdir -p "$CONFIG_PATH"

echo "--- SYSTEM DIAGNOSE ---"
echo "Node Version: $(node -v)"
echo "NPM Version: $(npm -v)"
echo "Suche homebridge-config-ui-x..."

# Suche in allen üblichen Verdächtigen
which homebridge-config-ui-x || echo "Nicht im PATH gefunden"
ls /usr/local/bin/homebridge-config-ui-x || echo "Nicht in /usr/local/bin"
ls /usr/bin/homebridge-config-ui-x || echo "Nicht in /usr/bin"

# Versuche den Start über den absoluten NPM-Pfad (der sicherste Weg)
UI_X_PATH=$(npm bin -g)/homebridge-config-ui-x

if [ -f "$UI_X_PATH" ]; then
    echo "Gefunden über npm bin: $UI_X_PATH"
    exec "$UI_X_PATH" -U "$CONFIG_PATH" -P 8582
else
    echo "Kritischer Fehler: Binary auch über npm bin nicht gefunden!"
    exit 1
fi
