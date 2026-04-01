#!/bin/bash

clear

ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
AZUL='\033[0;34m'
CYAN='\033[0;36m'
GRIS='\033[0;90m'
NC='\033[0m'
BOLD='\033[1m'

echo -e "${CYAN}${BOLD}[-] Iniciando preparación del entorno...${NC}"

if command -v apt-get &> /dev/null; then
    INSTALL_CMD="sudo apt-get install -y"
    UPDATE_CMD="sudo apt-get update -qq"
elif command -v dnf &> /dev/null; then
    INSTALL_CMD="sudo dnf install -y"
    UPDATE_CMD="sudo dnf check-update"
elif command -v pacman &> /dev/null; then
    INSTALL_CMD="sudo pacman -S --noconfirm"
    UPDATE_CMD="sudo pacman -Sy"
else
    echo -e "${ROJO}[!] No se detectó un gestor de paquetes compatible (apt, dnf, pacman).${NC}"
    exit 1
fi

if ! command -v unzip &> /dev/null; then
	echo -e "${AMARILLO}[!] 'unzip' no encontrado. Instalando...${NC}"
	$UPDATE_CMD > /dev/null 2>&1
    $INSTALL_CMD unzip > /dev/null 2>&1
fi

if [ ! -f "data.assets" ]; then
    echo -e "${ROJO}${BOLD}[!] Error: data.assets no encontrado.${NC}"
    exit 1
fi

echo -e "${CYAN}${BOLD}[?] Introduce la clave para desplegar el laboratorio (password123):${NC}"
read -s password

unzip -P "$password" data.assets > /dev/null 2>&1

if [ $? -eq 0 ]; then
    if [ -d "src" ]; then
        mv src/* .
        rmdir src
    fi

    echo -e "${AZUL}${BOLD}[+] Recursos desplegados. Iniciando motor...${NC}"
    chmod +x init.sh
    chmod +x cleanup.sh
    sudo ./init.sh
else
    echo -e "${ROJO}${BOLD}[X] Clave incorrecta o archivo dañado.${NC}"
    exit 1
fi
