#!/bin/bash

# Colors
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

clear

echo -e "${CYAN}================== SERVER DASHBOARD ==================${RESET}"

# Server name and uptime
echo -e "${GREEN}Hostname:${RESET} $(hostname)"
echo -e "${GREEN}Uptime:${RESET} $(uptime -p)"

# Current user & date
echo -e "${GREEN}User:${RESET} $USER"
echo -e "${GREEN}Date:${RESET} $(date)"

# CPU, RAM, Disk usage
echo -e "\n${YELLOW}---- RESOURCE USAGE ----${RESET}"

echo -e "${GREEN}CPU Load:${RESET} $(top -bn1 | grep 'load average:' | awk '{print $10 $11 $12}')"
echo -e "${GREEN}Memory Usage:${RESET}"
free -h | awk '/Mem/{print "Used: " $3 " / Total: " $2}'

echo -e "${GREEN}Disk Usage:${RESET}"
df -h / | awk 'NR==2{print "Used: " $3 " / Total: " $2 " (" $5 ")"}'

# Public IP
echo -e "\n${YELLOW}---- NETWORK ----${RESET}"
echo -e "${GREEN}Private IP:${RESET} $(hostname -I | awk '{print $1}')"
echo -e "${GREEN}Public IP:${RESET} $(curl -s ifconfig.me)"

# Last 3 login attempts
echo -e "\n${YELLOW}---- LAST 3 LOGIN ATTEMPTS ----${RESET}"
last -n 3

echo -e "${CYAN}========================================================${RESET}"

