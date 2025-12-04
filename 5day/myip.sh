#!/bin/bash

BLUE="\e[34m"
GREEN="\e[32m"
RESET="\e[0m"

PRIVATE_IP=$(hostname -I | awk '{print $1}')
PUBLIC_IP=$(curl -s ifconfig.me)

echo -e "${BLUE}=========== SERVER IP ADDRESSES ===========${RESET}"
echo -e "${GREEN}Private IP:${RESET} $PRIVATE_IP"
echo -e "${GREEN}Public IP:${RESET}  $PUBLIC_IP"
echo -e "${BLUE}============================================${RESET}"

