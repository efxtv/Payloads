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

stop(){
pkill cloudflared
pkill cloudflared
pkill php
echo -e "${Green}PLEASE WAIT...${clear}"
sleep 3
echo -e "${Green}VISIT: ${IGreen} Done ${Yellow}"
echo
}


lan(){
ls -la |grep "^-"|awk '{print $NF}'|awk '{print "<b><a href=\""$1"\">"$NF"</a></b><br />"}'|awk '!/index.html/' >index.html
echo -en "${Yellow}ENTER IP: ${IYellow}"
read ips
echo -e "${Green}PLEASE WAIT...${clear}"
sleep 3
python2 -m SimpleHTTPServer 8000 > /dev/null 2>&1 &
echo -e "${Green}VISIT: ${IGreen}http://$ips:8000 ${Yellow}"
}

wan(){
ls -la |grep "^-"|awk '{print $NF}'|awk '{print "<b><a href=\""$1"\">"$NF"</a></b><br />"}'|awk '!/index.html/' >index.html
chmod a=r index.html;chmod u=rw index.html
echo clear >$HOME/.cf.log /dev/null 2>&1 &
php -S 0.0.0.0:5555 > /dev/null 2>&1 &
$HOME/cloudflared tunnel -url localhost:5555 --logfile $HOME/.cf.log > /dev/null 2>&1 &
echo -e "${Green}PLEASE WAIT...${clear}"
sleep 7
cdf=$(cat $HOME/.cf.log | grep -o 'https://[-0-9a-z]*\.trycloudflare.com')
sleep 3
echo -e "${Green}YOUR LINK: ${IGreen}$cdf"
echo -e "${Green}[RUN] ${IGreen}pkill cloudflared${clear}"
echo -e "${Green}[RUN] ${IGreen}pkill php${clear}"
}



cus(){
#ls -la |grep "^-"|awk '{print $NF}'|awk '{print "<b><a href=\""$1"\">"$NF"</a></b><br />"}'|awk '!/index.html/' >index.html
echo -en "${Yellow}ENTER IP: ${IYellow}"
read ips
echo -en "${Yellow}ENTER port: ${IYellow}"
read pos
echo -e "${Green}PLEASE WAIT...${clear}"
sleep 3
#chmod a=r index.html;chmod u=rw index.html
echo clear >$HOME/.cf.log /dev/null 2>&1 &
$HOME/cloudflared tunnel -url $ips:$pos --logfile $HOME/.cf.log > /dev/null 2>&1 &
echo -e "${Green}PLEASE WAIT...${clear}"
sleep 7
cdf=$(cat $HOME/.cf.log | grep -o 'https://[-0-9a-z]*\.trycloudflare.com')
sleep 3
echo -e "${Green}YOUR LINK: ${IGreen}$cdf"
echo -e "${Green}[RUN] ${IGreen}pkill cloudflared${clear}"
echo -e "${Green}[RUN] ${IGreen}pkill php${clear}"
}

nomod(){
#ls -la |grep "^-"|awk '{print $NF}'|awk '{print "<b><a href=\""$1"\">"$NF"</a></b><br />"}'|awk '!/index.html/' >index.html
#chmod a=r index.html;chmod u=rw index.html
echo clear >$HOME/.cf.log /dev/null 2>&1 &
php -S 0.0.0.0:5555 > /dev/null 2>&1 &
$HOME/cloudflared tunnel -url localhost:5555 --logfile $HOME/.cf.log > /dev/null 2>&1 &
echo -e "${Green}PLEASE WAIT...${clear}"
sleep 7
cdf=$(cat $HOME/.cf.log | grep -o 'https://[-0-9a-z]*\.trycloudflare.com')
sleep 3
echo -e "${Green}YOUR LINK: ${IGreen}$cdf"
echo "http://0.0.0.0:5555"
echo -e "${Green}[RUN] ${IGreen}pkill cloudflared${clear}"
echo -e "${Green}[RUN] ${IGreen}pkill php${clear}"
}


echo -en "
${Green}[${IGreen}1${Green}]${IYellow} LAN [no link]
${Green}[${IGreen}2${Green}]${IYellow} WAN [share pwd]
${Green}[${IGreen}3${Green}]${IYellow} STOP [stop service]
${Green}[${IGreen}4${Green}]${IYellow} CUSTOM [set as your need]
${Green}[${IGreen}5${Green}]${IYellow} NOMOD [no modification]
${Green}[${IGreen}0${Green}]${IYellow} EXIT

Enter it now: "
read sotl

if [[ $sotl == "LAN" || $sotl == "1" ]];
then
lan
  
elif [[ $sotl == "WAN" || $sotl == "2" ]];
then
wan

elif [[ $sotl == "STOP" || $sotl == "3" ]];
then
stop

elif [[ $sotl == "NOMOD" || $sotl == "4" ]];
then
cus

elif [[ $sotl == "CUSTOM" || $sotl == "5" ]];
then
nomod

elif [[ $sotl == "EXIT" || $sotl == "0" ]];
then
echo "Thank you"
exit

#elif [[ $sotl == "demo" || $sotl == "04" ]];
#then
#exit

else
echo "You need to improve..."
fi
