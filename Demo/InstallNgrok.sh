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

auth()
{
echo -e "${clear}[${Green}✔${clear}] ${Green}Copy paste:${IYellow} ************************************************* ${clear}"
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} ************************************************* ${clear}"
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} ************************************************* ${clear}"
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} ************************************************* ${clear}"
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} ************************************************* ${clear}"
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} ************************************************* ${clear}"
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} 1lNm1F0ELHXjToHhMOPlbNqLEWe_6RM7XzPnj4yec6AWHXCKL ${clear}"

echo -en "[${Green}✔${clear}] ${Green}Please enter your authtoken : ${clear}"
read autho
$HOME/ngrok authtoken $autho 1>/dev/null
echo -e "[${Green}✔${clear}]${Green} Status    :${IYellow} Installed... ${clear}"
echo -e "[${Green}✔${clear}]${Green} Note      :${IYellow} For devices ${clear}"
echo -e "[${Green}✔${clear}]${Green} Up to Android 10: ${clear}${IGreen} Enable mobile data + Hotspot${clear}"
echo -e "[${Green}✔${clear}]${Green} Android 11, 12 +: ${clear}${IGreen} Enable wifi/mobiledata + Hotspot${clear}"

}


rmngr()
{
rm ngrok* > /dev/null 2>&1
}
architecturee()
{
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
echo -e "[${Green}✔${clear}] ${IYellow}Downloading ngrok..${clear}"
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip -q --show-progress
if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
mv ngrok $HOME > /dev/null 2>&1
rm -rf ngrok-stable-linux-arm.zip > /dev/null 2>&1
echo -e "[${Green}✔${clear}] ${IYellow}Download complete. Run the server..${clear}"

else
echo -e "[${Green}✔${clear}] ${Red}Delete older files and try again..${clear}"
exit
fi

else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip -q --show-progress
if [[ -e ngrok-stable-linux-386.zip ]]; then
chmod +x ngrok-stable-linux-386.zip
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok 
mv ngrok $HOME > /dev/null 2>&1
rm -rf ngrok-stable-linux-386.zip > /dev/null 2>&1
echo -e "[${Green}✔${clear}] ${IYellow}Download complete. Run the server..${clear}"


else
echo -e "[${Green}✔${clear}] ${Red}Delete older files and try again..${clear}"
exit
fi
fi
}

phpo()
{
cphp=$(which php|grep -o php)
if [ "$cphp" == "php" ]; then
echo -e "\t${IGreen}├──${clear} ${Green}PHP is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}PHP is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}Install and try again${clear}"
exit
fi
}

wgeto()
{
cwget=$(which wget|grep -o wget)
if [ "$cwget" == "wget" ]; then
echo -e "\t${IGreen}├──${clear} ${Green}Wget is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}Wget is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}Install and try again${clear}"
exit
fi
}

zipo()
{
czip=$(which zip|grep -o zip)
if [ "$czip" == "zip" ]; then
echo -e "\t${IGreen}├──${clear} ${Green}Zip is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}Zip is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}Install and try again${clear}"
exit
fi
}

unzipo()
{
cunzip=$(which unzip|grep -o unzip)
if [ "$cunzip" == "unzip" ]; then
echo -e "\t${IGreen}├──${clear} ${Green}Unzip is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}Unzip is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}Install and try again${clear}"
exit
fi
}

curlo()
{
ccurl=$(which curl|grep -o curl)
if [ "$ccurl" == "curl" ]; then
echo -e "\t${IGreen}├──${clear} ${Green}Curl is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}Curl is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}Install and try again ${clear}"
exit
fi
}


jqo()
{
cjq=$(which jq|grep -o jq)
if [ "$cjq" == "jq" ]; then
echo -e "\t${IGreen}├──${clear} ${Green}Jq is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}JQ is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}Install and try again ${clear}"
exit
fi
}


nco()
{
cnc=$(which ncat|grep -o ncat)
if [ "$cnc" == "ncat" ]; then
echo -e "\t${IGreen}├──${clear} ${Green}Ncat is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}Ncat is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}Ncat and try again ${clear}"
exit
fi
}

dnso()
{
cdnso=$(which host|grep -o host)
if [ "$cdnso" == "host" ]; then
echo -e "\t${IGreen}└──${clear} ${Green}DNSutils is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}DNSutils is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}pkg install dnsutils ${clear}"
exit
fi
}
if [[ -e $HOME/ngrok ]]; then
echo -e "[${Green}✔${clear}] ${Green}Checking Ngrok.. ${clear}"
sleep 1
echo -e "[${Green}✔${clear}] ${Green}Checking /Home/ngrok.. ${clear}"
sleep 1
echo -e "[${Green}✔${clear}] ${Green}Ngrok is already installed run server.. ${clear}"
else
rmngr
echo -e "[${Green}✔${clear}] ${IYellow}Checking dependency.. ${clear}"
phpo

wgeto

zipo

unzipo

curlo

jqo

nco

dnso

architecturee

auth
fi
