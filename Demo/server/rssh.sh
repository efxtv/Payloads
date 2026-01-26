#!/bin/bash

# ------------ DYNAMIC PATHS & DEFAULTS ------------
if [ -d "/data/data/com.termux/files/usr" ]; then
    BASE_DIR="$PREFIX"
    SSHD_CONF="$PREFIX/etc/ssh/sshd_config"
    SUDO=""
    DEFAULT_PORT=8022
    OS_TYPE="Termux"
else
    BASE_DIR="/usr/local"
    SSHD_CONF="/etc/ssh/sshd_config"
    SUDO="sudo"
    DEFAULT_PORT=22
    OS_TYPE="Linux (Debian/Ubuntu/Kali)"
fi
# --------------------------------------------------

# ------------ PORT LOGIC ------------
# Use $1 if provided, otherwise use the OS default
SSHD_PORT=${1:-$DEFAULT_PORT}
PASS_LEN=15
USER_NAME=$(whoami)
# ------------------------------------

# Check Core Dependencies
for cmd in sshd curl tr head sed grep passwd; do
  command -v $cmd >/dev/null 2>&1 || {
    echo "Error: Missing core dependency '$cmd'. Please install it."
    exit 1
  }
done

# Cleanup existing processes to avoid "Port in use" errors
pkill -f ngrok 2>/dev/null
$SUDO pkill -f sshd 2>/dev/null

# Configure SSHD
$SUDO sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' "$SSHD_CONF"
$SUDO sed -i 's/^#\?UsePAM.*/UsePAM no/' "$SSHD_CONF"

# Set Random Password
PASSWORD=$(tr -dc '0-9' </dev/urandom | head -c ${PASS_LEN})
echo -e "${PASSWORD}\n${PASSWORD}" | $SUDO passwd "$USER_NAME" >/dev/null 2>&1

# Start SSH Service
$SUDO sshd -p ${SSHD_PORT} &
sleep 2

echo "============================================="
echo "       RSSH: UNIVERSAL SSH SETUP             "
echo "============================================="
echo "OS DETECTED : $OS_TYPE"
echo "TARGET PORT : $SSHD_PORT"

# Attempt Ngrok if available
NGROK_URL=""
if command -v ngrok >/dev/null 2>&1; then
    echo "[+] Ngrok found. Starting tunnel..."
    ngrok tcp ${SSHD_PORT} > /dev/null &
    sleep 7
    NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | grep -oE 'tcp://[^"]+')
fi

if [ -n "$NGROK_URL" ]; then
    # --- NGROK MODE (Remote) ---
    DOMAIN=$(echo "${NGROK_URL#tcp://}" | cut -d ':' -f1)
    PORT=$(echo "${NGROK_URL#tcp://}" | cut -d ':' -f2)
    
    if command -v dig >/dev/null 2>&1; then
        IP=$(dig +short "$DOMAIN" | tail -n 1)
    else
        IP="$DOMAIN"
    fi
    METHOD="NGROK REMOTE ACCESS"
else
    # --- LOCAL MODE (Fallback) ---
    echo "[!] Ngrok not found/active. Falling back to Local IP."
    IP=$(hostname -I | awk '{print $1}')
    # Extra check for Termux local IP if hostname -I is empty
    [ -z "$IP" ] && IP=$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1 | head -n1)
    PORT=${SSHD_PORT}
    METHOD="LOCAL NETWORK ACCESS"
fi
echo "============================================="
echo "               RSSH By EFXTv
echo "============================================="
echo "METHOD   : $METHOD"
echo "USER     : $USER_NAME"
echo "PASSWORD : $PASSWORD"
echo "IP       : $IP"
echo "PORT     : $PORT"
echo "CONNECT  : ssh ${USER_NAME}@${IP} -p ${PORT}"
echo "============================================="
