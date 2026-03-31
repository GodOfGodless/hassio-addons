#!/usr/bin/with-contenv bashio

# Verzeichnis für die Config erstellen, falls nicht vorhanden
mkdir -p /config/homebridge

# Startet Homebridge mit dem Web-Interface (UI-X)
# Der Pfad /config/homebridge sorgt dafür, dass deine Einstellungen 
# ein Backup von Home Assistant überstehen.
homebridge-config-ui-x -U /config/homebridge
