#!/bin/bash

# Autora: Carla Silva
# Este código es para crear respaldos de mi home cada minuto con un mensaje automático por Telegram

# Token del bot
TOKEN="aqui va el token"

# Chat ID
CHAT_ID="aqui va el chat id"

# Carpeta donde se guardarán los respaldos
DESTINO="$HOME/backups"


while true
do
    FECHA=$(date +"%d-%m-%Y %H:%M:%S")

    # Crear respaldo
    tar -czf $DESTINO/home_backup_$FECHA.tar.gz -C $HOME

    # Mensaje
    MENSAJE="Respaldo de HOME completado a las: $FECHA"

    # Enviar mensaje a Telegram
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d chat_id="$CHAT_ID" \
        -d text="$MENSAJE"

    # Enviar cada minuto
    60 sleep
done
