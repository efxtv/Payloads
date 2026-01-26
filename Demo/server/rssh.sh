#!/bin/bash

# ------------ GLOBAL DEFAULTS ------------
PASS_LEN=15
USER_NAME=$(whoami)
SSHD_CONF="$PREFIX/etc/ssh/sshd_config"
DEFAULT_PORT=8022
SSHD_PORT=${1:-$DEFAULT_PORT}

# ------------ TERMUX FUNCTION ------------

kills() {
pkill -f ngrok 2>/dev/null
pkill -f sshd 2>/dev/null
}

termux() {
    pkill -f ngrok 2>/dev/null
    pkill -f sshd 2>/dev/null
    echo "[+] Checking for ngrok"
    echo "[+] Please wait"
    ngrok tcp ${SSHD_PORT} > /dev/null &
    sleep 12
    NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | grep -oE 'tcp://[^"]+')
    DOMAIN=$(echo "${NGROK_URL#tcp://}" | cut -d ':' -f1)
    PORT=$(echo "${NGROK_URL#tcp://}" | cut -d ':' -f2)

    #sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' "$SSHD_CONF"
    #sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' "$SSHD_CONF"
    #sed -i 's/^#\?UsePAM.*/UsePAM no/' "$SSHD_CONF"

    PASSWORD=$(tr -dc '0-9' </dev/urandom | head -c ${PASS_LEN})

    # Termux password input (TTY-safe)
    printf "%s\n%s\n" "$PASSWORD" "$PASSWORD" | passwd >/dev/null 2>&1

    sshd -p ${SSHD_PORT} &
    sleep 2

    allog=$(ifconfig | grep inet | awk '{print $2}' | \
    sed "s#^#[+] CONNECT ${USER_NAME}@#g;s#\$# -p ${SSHD_PORT}#g")

    echo "============================================="
    echo "       RSSH: TERMUX SSH SETUP                "
    echo "============================================="
    echo "[+] USER     : $USER_NAME"
    echo "[+] PASSWORD : $PASSWORD"
    echo "[+] PORT     : $SSHD_PORT"
    echo -e "[+] DOMAIN   : $DOMAIN"
    echo -e "[+] PORT     : $PORT"
    echo "---------------------------------------------"
    echo "$allog"
}
kills
sleep 1
termux
