#!/usr/bin/env bash

SWWW_CONFIG_DIR="$HOME/.config/swww"
WALLPAPERS_DIR="$SWWW_CONFIG_DIR/backgrounds"

# Verifica se o diretório de imagens existe
if [ ! -d "$WALLPAPERS_DIR" ]; then
    echo "Erro: Diretório não foi encontrado em $WALLPAPERS_DIR"
    exit 1
fi

WALLPAPER=$(find "$WALLPAPERS_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | shuf -n 1)

if [ -z "$WALLPAPER" ]; then
    echo "Nenhuma imagem de papel de parede encontrada!"
    exit 1
fi

# simple // grow // wipe
swww img "$WALLPAPER" \
    --transition-type simple \
    --transition-duration 0.7 \
    --transition-fps 60
