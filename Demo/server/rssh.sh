#!/bin/bash


# SETUP NGROK
# wget -qO- https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz | tar -xz -C "$PREFIX/bin" && chmod +x "$PREFIX/bin/ngrok"
# ngrok config add-authtoken AUTHTOKEN-WILL-GO-HERE

# ------------ CONFIG ------------  
SSHD_PORT=8802
PASS_LEN=15
USER_NAME=$(whoami)
SSHD_CONF="$PREFIX/etc/ssh/sshd_config"
# --------------------------------

[ -n "$1" ] && SSHD_PORT="$1"

for cmd in sshd ngrok curl dig tr head sed grep passwd; do
  command -v $cmd >/dev/null 2>&1 || {
    echo "Missing dependency: $cmd"
    exit 1
  }
done

pkill -f ngrok 2>/dev/null
pkill -f sshd 2>/dev/null

sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' "$SSHD_CONF"
sed -i 's/^#\?UsePAM.*/UsePAM no/' "$SSHD_CONF"

PASSWORD=$(tr -dc '0-9' </dev/urandom | head -c ${PASS_LEN})

echo -e "${PASSWORD}\n${PASSWORD}" | passwd >/dev/null 2>&1

sshd -p ${SSHD_PORT} &
sleep 2

ngrok tcp ${SSHD_PORT} > /dev/null &
sleep 7

NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | grep -oE 'tcp://[^"]+')

DOMAIN=$(echo "${NGROK_URL#tcp://}" | cut -d ':' -f1)
PORT=$(echo "${NGROK_URL#tcp://}" | cut -d ':' -f2)
IP=$(dig +short "$DOMAIN" | tail -n 1)
echo
echo "============================================="
echo "       CLIENT SIDE SSH CONNECT BY EFXTV      "
echo "============================================="
echo
echo "USER     : $USER_NAME"
echo "PASSWORD : $PASSWORD"
echo "IP       : $IP"
echo "PORT     : $PORT"
echo "CONNECT  : ssh ${USER_NAME}@${IP} -p ${PORT}"
echo
echo "============================================"
echo
