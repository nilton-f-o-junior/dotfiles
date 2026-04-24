#!/bin/sh

# Caminho da pasta (ajustado para a pasta 'wallpaper')
WALL_DIR="$HOME/.config/niri/wallpaper"
#WALL_DIR="/etc/nixos/config/wallpaper"

# Mata qualquer instância anterior do swaybg para não sobrepor processos
killall swaybg 2>/dev/null

# Aplica o primeiro wallpaper imediatamente
# Busca por .png e .jpg para garantir que funcione
# swaybg -i $(find "$WALL_DIR" -type f \( -name "*.png" -o -name "*.jpg" \) | shuf -n1) -m fill &
swaybg -i $(find "$WALL_DIR" -follow -type f \( -name "*.png" -o -name "*.jpg" \) | shuf -n1) -m fill &
OLD_PID=$!

while true; do
    # Intervalo de 3 horas (10800 segundos)
    sleep 10800

    # Escolhe o novo wallpaper
    swaybg -i $(find "$WALL_DIR" -type f \( -name "*.png" -o -name "*.jpg" \) | shuf -n1) -m fill &
    NEXT_PID=$!

    # Aguarda 3 segundos para o novo carregar e mata o antigo (evita tela preta)
    sleep 3
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done
