#!/bin/bash
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
IGreen='\033[0;92m'
Yellow='\033[0;33m'
IYellow='\033[0;93m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'
clear='\033[0m'

zshinstall(){
pkg install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

plugins(){
export ZSH_CUSTOM='~/.oh-my-zsh/custom'
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions;git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sleep 3
# plugins=(git)
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
sleep 3
#echo >/data/data/com.termux/files/usr/etc/motd;echo >/data/data/com.termux/files/usr/etc/motd-playstore;echo >/data/data/com.termux/files/usr/etc/motd.sh;echo >/data/data/com.termux/files/usr/etc/motd-playstore.dpkg-old
}



echo -en "
${Green}[${IGreen}1${Green}]${IYellow} [IZ] Install ZSH
${Green}[${IGreen}2${Green}]${IYellow} [IP] Install Plugins
${Green}[${IGreen}0${Green}]${IYellow} [EX] EXIT

Enter it now: "
read sotl

if [[ $sotl == "IZ" || $sotl == "1" ]];
then
zshinstall

elif [[ $sotl == "IP" || $sotl == "2" ]];
then
plugins

elif [[ $sotl == "EX" || $sotl == "0" ]];
then
echo "Thank you"
exit

#elif [[ $sotl == "demo" || $sotl == "04" ]];
#then
#exit

else
echo "Numbers and upper case only..."
fi
#exec zsh
