#!/bin/bash

echo "[-] Iniciando preparación del entorno..."

if ! command -v unzip &> /dev/null; then
    sudo apt-get update && sudo apt-get install unzip -y
fi

if [ ! -f "data.assets" ]; then
    echo "[!] Error: No se encuentra data.assets."
    exit 1
fi

echo "[?] Introduce la clave para desplegar el laboratorio (password123):"
read -s password

unzip -P "$password" data.assets > /dev/null 2>&1

if [ $? -eq 0 ]; then
    if [ -d "src" ]; then
        mv src/* .
        rmdir src
    fi

    echo "[+] Recursos desplegados. Iniciando motor..."
    chmod +x init.sh
    chmod +x cleanup.sh
    sudo ./init.sh
else
    echo "[X] Clave incorrecta."
    exit 1
fi
