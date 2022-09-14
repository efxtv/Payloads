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

checko() 
{
if [[ -e $HOME/ngrok ]]
then
  echo ""
else
echo -e "[${Green}✔${clear}] ${Red} Ngrok error \$HOME/ngrok. Try again${clear}"
echo -en "[${Green}✔${clear}] ${IYellow} Link may not be generated press [ctrl + c]: ${clear}"
read
sleep 20
fi
}

checko

clear;ls -la |grep "^-"|awk '{print $NF}'|awk '{print "<b><a href=\""$1"\">"$NF"</a></b><br />"}'|awk '!/index.html/' >index.html
chmod a=r index.html;chmod u=rw index.html


pkill php
pkill ngrok 
echo -e "
${clear}[${Green}✔${clear}] ${Yellow}Local server scripts:${clear}
   ${IGreen}├──${clear}${Green} python -m SimpleHTTPServer 8000
   ${IGreen}├──${clear}${Green} python3 -m SimpleHTTPServer 8000
   ${IGreen}├──${clear}${Green} twistd -n web -p 8000 --path .
   ${IGreen}├──${clear}${Green} ruby -run -ehttpd . -p8000
   ${IGreen}├──${clear}${Green} php -S 0.0.0.0:8000
   ${IGreen}├──${clear}${Green} command | ncat -v -lk -p 8080
   ${IGreen}└──${clear}${Green} live-server ${clear}"

php -S localhost:5555 > /dev/null 2>&1 &
#Starting ngrok
echo
echo -e "[${Green}✔${clear}] ${IYellow}GENERATING LINK PLEASE WAIT... ${clear}"

$HOME/ngrok http 5555 > /dev/null 2>&1 &
$HOME/cloudflared tunnel -url localhost:5555 --logfile $HOME/.cf.log > /dev/null 2>&1 &
sleep 7
#below lines can be sued for generating direct link.
url=$(curl -s -N http://127.0.0.1:4040/api/tunnels|sed 's#"# #g'|sed 's#http#\nhttp#g'|sed 's#.io#.io\n#g'|grep https|head -n 1)
cdf=$(cat $HOME/.cf.log | grep -o 'https://[-0-9a-z]*\.trycloudflare.com')
echo -e "
\t${IGreen}├──${clear}${Green} Your link
\t${IGreen}├──${clear}${Green} $cdf ${clear}
\t${IGreen}└──${clear}${Green} $url ${clear}"
echo

