#!/bin/bash
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m ENTER THE  HOST :👉 \e[0m\e[1;93m ";read hosttt
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m ENTER THE  PORT :👉 \e[0m\e[1;93m ";read porttt
php -S $hosttt:$porttt > /dev/null 2>&1 &
~/ngrok http $hosttt:$porttt > /dev/null 2>&1 &
echo clear >$HOME/.cf.log /dev/null 2>&1 &
$HOME/cloudflared tunnel -url $hosttt:$porttt --logfile $HOME/.cf.log > /dev/null 2>&1 &
sleep 7
cdf=$(cat $HOME/.cf.log | grep -o 'https://[-0-9a-z]*\.trycloudflare.com')
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m SHARE THIS LINK :👉 \e[0m\e[1;93m %s \n" http://$hosttt:$porttt
ngrok_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels|sed 's#"#\n"\n#g'|grep https|head -1)
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m SHARE THIS LINK :👉 \e[0m\e[1;93m %s \n" $ngrok_link
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m SHARE THIS LINK :👉 \e[0m\e[1;93m %s \n" $cdf
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m SHARE THIS LINK :👉 \e[0m\e[1;93m %s \n"
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m SHARE THIS LINK :👉 SHARE THIS LINK :👉 USE TO KILL PROCESS \e[0m\e[1;93m %s \n"
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m SHARE THIS LINK :👉 pkill cloudflared \e[0m\e[1;93m %s \n"
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m SHARE THIS LINK :👉 pkill php \e[0m\e[1;93m %s \n"
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m SHARE THIS LINK :👉 pkill ngrok \e[0m\e[1;93m %s \n"
