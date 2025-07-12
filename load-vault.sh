#!/bin/bash
# Script para cargar credenciales del vault como variables de entorno

# Verificar que existe el archivo de contraseña
if [ ! -f .vault-pass ]; then
    echo "Error: .vault-pass no encontrado"
    exit 1
fi

# Cargar variables del vault y exportarlas
eval $(ansible-vault view group_vars/all/vault.yml --vault-password-file .vault-pass | sed 's/^vault_proxmox_/export PROXMOX_/' | sed 's/: /=/')

echo "Variables de entorno cargadas desde vault:"
echo "PROXMOX_URL=$PROXMOX_URL"
echo "PROXMOX_USER=$PROXMOX_USER"
echo "PROXMOX_TOKEN_ID=$PROXMOX_TOKEN_ID"
echo "PROXMOX_DOMAIN=$PROXMOX_DOMAIN"
echo ""
echo "Ejecuta: source load-vault.sh && ansible-inventory -i inventory.proxmox.yml --list"