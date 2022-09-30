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
ls -la |grep "^-"|awk '{print $NF}'|awk '{print "<b><a href=\""$1"\">"$NF"</a></b><br />"}'|awk '!/index.html/' >index.html
chmod a=r index.html;chmod u=rw index.html
echo clear >$HOME/.cf.log /dev/null 2>&1 &
echo -en "${IYellow}ENTER IP: ${Yellow}"
read ips
php -S 0.0.0.0:5555 > /dev/null 2>&1 &
$HOME/cloudflared tunnel -url localhost:5555 --logfile $HOME/.cf.log > /dev/null 2>&1 &
echo -e "${Green}PLEASE WAIT...${clear}"
sleep 7
cdf=$(cat $HOME/.cf.log | grep -o 'https://[-0-9a-z]*\.trycloudflare.com')
sleep 3
echo -e "${Green}YOUR LINK: ${IGreen}$cdf"
echo -e "${Green}[RUN] pkill cloudflared${clear}"
echo -e "${Green}[RUN] pkill php${clear}"
