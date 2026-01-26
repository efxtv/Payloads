#!/bin/bash

# ------------ DYNAMIC PATHS ------------
# Detect if we are in Termux or standard Linux
if [ -d "/data/data/com.termux/files/usr" ]; then
    BASE_DIR="$PREFIX"
    SSHD_CONF="$PREFIX/etc/ssh/sshd_config"
    SUDO=""
else
    BASE_DIR="/usr/local"
    SSHD_CONF="/etc/ssh/sshd_config"
    SUDO="sudo"
fi
# ---------------------------------------

# ------------ CONFIG ------------  
SSHD_PORT=8802
PASS_LEN=15
USER_NAME=$(whoami)
# --------------------------------

[ -n "$1" ] && SSHD_PORT="$1"

# Check dependencies
for cmd in sshd ngrok curl dig tr head sed grep passwd; do
  command -v $cmd >/dev/null 2>&1 || {
    echo "Error: Missing dependency '$cmd'. Please install it first."
    exit 1
  }
done

# Kill existing processes
pkill -f ngrok 2>/dev/null
$SUDO pkill -f sshd 2>/dev/null

# Configure SSHD (Ensure Password Auth is ON)
# We use sudo here for Kali/Ubuntu; it will be empty for Termux
$SUDO sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' "$SSHD_CONF"
$SUDO sed -i 's/^#\?UsePAM.*/UsePAM no/' "$SSHD_CONF"

# Generate Random Password
PASSWORD=$(tr -dc '0-9' </dev/urandom | head -c ${PASS_LEN})

# Change User Password
echo -e "${PASSWORD}\n${PASSWORD}" | $SUDO passwd "$USER_NAME" >/dev/null 2>&1

# Start SSHD
$SUDO sshd -p ${SSHD_PORT} &
sleep 2

# Start Ngrok
ngrok tcp ${SSHD_PORT} > /dev/null &
sleep 7

# Get Ngrok URL
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | grep -oE 'tcp://[^"]+')

if [ -z "$NGROK_URL" ]; then
    echo "Error: Ngrok failed to start. Check your authtoken or internet."
    exit 1
fi

DOMAIN=$(echo "${NGROK_URL#tcp://}" | cut -d ':' -f1)
PORT=$(echo "${NGROK_URL#tcp://}" | cut -d ':' -f2)
IP=$(dig +short "$DOMAIN" | tail -n 1)

echo
echo "============================================="
echo "       UNIVERSAL SSH CONNECT SCRIPT          "
echo "============================================="
echo
echo "ENV      : $([[ -n "$PREFIX" ]] && echo "Termux" || echo "Linux/Kali")"
echo "USER     : $USER_NAME"
echo "PASSWORD : $PASSWORD"
echo "IP       : $IP"
echo "PORT     : $PORT"
echo "CONNECT  : ssh ${USER_NAME}@${IP} -p ${PORT}"
echo
echo "============================================"
