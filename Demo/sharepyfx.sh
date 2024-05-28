sharepyfx() {
    local GREEN="\e[32m"
    local IGREEN="\e[92m"
    local IYELLOW="\e[93m"
    local CLEAR="\e[0m"

    # Function to check if a command exists
    command_exists() {
        command -v "$1" >/dev/null 2>&1
    }

    # Detect the operating system
    if command_exists termux-info; then
        OS="Termux"
    elif command_exists lsb_release; then
        OS=$(lsb_release -si)
    else
        OS=$(uname -s)
    fi

    # Function to install dependencies based on the operating system
    install_dependencies() {
        case "$OS" in
            "Termux")
                pkg install -y git python
                ;;
            "Ubuntu" | "Debian" | "Kali")
                sudo apt install -y git python3
                ;;
            "Arch" | "Manjaro")
                sudo pacman -S --noconfirm git python
                ;;
            "Fedora")
                sudo dnf install -y git python3
                ;;
            *)
                echo "Unsupported OS: $OS"
                return 1
                ;;
        esac
    }

    # Check if the repository is already installed
    if [[ -e ~/.sharepyfx ]]; then
        echo -e "${GREEN}[${IGREEN}✔${CLEAR}${GREEN}] ${IYELLOW}Installed...${CLEAR}"
    else
        echo -e "${GREEN}[${IGREEN}✔${CLEAR}${GREEN}] ${IYELLOW}Installing dependencies for $OS...${CLEAR}"
        if ! install_dependencies; then
            echo "Failed to install dependencies"
            return 1
        fi

        echo -e "${GREEN}[${IGREEN}✔${CLEAR}${GREEN}] ${IYELLOW}Cloning repository...${CLEAR}"
        sleep 2

        if git clone https://github.com/efxtv/sharepyfx.git ~/.sharepyfx; then
            cd ~/.sharepyfx || { echo "Failed to change directory"; return 1; }
            if ! bash install.sh; then
                echo "Installation script failed"
                return 1
            fi
        else
            echo "Failed to clone repository"
            return 1
        fi

        echo -en "${GREEN}[${IGREEN}➜${CLEAR}${GREEN}] ${IYELLOW}Enter bot Token:${CLEAR}"
        read -r token
        sed -i "s/BOT_TOKEN =.*/BOT_TOKEN = \"$token\"/g" ~/.sharepyfx/sharepyfx.py

        echo -en "${GREEN}[${IGREEN}➜${CLEAR}${GREEN}] ${IYELLOW}Enter ID:${CLEAR}"
        read -r ids
        sed -i "s/ATTACKER_ID =.*/ATTACKER_ID = \"$ids\"/g" ~/.sharepyfx/sharepyfx.py

        echo -e "${GREEN}[${IGREEN}✔${CLEAR}${GREEN}] ${IYELLOW}sharepyfx -h${CLEAR}"
    fi
}

sharepyfx
