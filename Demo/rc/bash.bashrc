# Extras added by EFX Tv
export P='/data/data/com.termux/files/usr/'
export ETC="/data/data/com.termux/files/usr/etc/"
export OPT="/data/data/com.termux/files/usr/opt/"
export TMP="/data/data/com.termux/files/usr/tmp"
export SHA="/data/data/com.termux/files/usr/share/"
export UBT="/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs"
export APACHE="/data/data/com.termux/files/usr/share/apache2/default-site/htdocs/"

# Custom alias for Emef Users
# join for more t.me/efxtv
# Proot distro alias
ubuntu(){
#USE: ubuntu username
proot-distro login --user $1 ubuntu
}

# Must install termux-api and provide all the permissions
alias server
alias clip='termux-clipboard-set'
alias del='rm -rf'
alias update='pkg update && pkg upgrade --yes && apt update && apt upgrade'
alias ifconfig='ifconfig 2>/dev/null'
alias apache='apachectl 2>/dev/null;echo [+] Please wait...;sleep 2 ;echo [▶] HOST: http://127.0.0.1:8080;echo [▶] PATH: \$APACHE'
alias apaches='apachectl -k stop 2>/dev/null'
alias pyftp="python -m pyftpdlib"
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."
alias usr='cd /data/data/com.termux/files/usr'
alias opt="cd $PREFIX/opt"
alias etc="cd $PREFIX/etc"
alias tmp="cd $PREFIX/tmp"
alias sdcard='cd /sdcard'
alias telegram='cd /sdcard/Download/Telegram'
alias download='cd /sdcard/Download'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='colordiff'
alias tab='column -t'
alias reload='termux-reload-settings'
alias remove='pkg remove'
alias i='pkg install'
alias start='nh kex &'
alias stop='nh kex stop'
alias code='pv -qL 6'
alias code2='pv -qL $[10+(-2 + RANDOM%5)]'
alias code3='pv -qL $[10+(-2 + RANDOM%5)]'
alias code4='pv -qL 40'
alias sshd='sshd -e -d -d -d'
# Alias ends

#su(){
#export PS1="\[\e[1;32m\]▶(\[\e[1;31m\]root\[\e[33;0m\]\[\e[1;32m\])──────────────┐\n ┌───────────────────┘ \n ├[\[\e[1;33m\]\W\[\e[1;32m\]]\n \[\e[1;32m\]└─▶\[\e[0m\] "
#}

#su1(){
#export PS1="\[\e[1;32m\]▶(\[\e[1;31m\]demo\[\e[33;0m\]\[\e[1;32m\])──────────────┐\n ┌───────────────────┘ \n ├[\[\e[1;33m\]\W\[\e[1;32m\]]\n \[\e[1;32m\]└─▶\[\e[0m\] "
#}

su2(){
PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]┌[✔]"; else echo "\[\033[01;32m\]┌[\[\033[01;31m\]✘\[\033[01;32m\]]"; fi`\[\033[01;32m\]─(\[\033[01;31m\]root\[\033[01;32m\])┐\[\033[01;32m\] \n└──────────┘\[\033[35m\]$(__git_ps1 " %s") \[\033[01;32m\]\n  ┌[\w]\n  \[\033[01;32m\]└───────$\[\033[00m\]'
}

su3(){
#animation start
EMOJIS=(🥱 😏 😎 👊  👍 💀️ 😉️ 🤔️ 🙄️ 😣️ 😳️ 💥 🔥 😵‍ ㉿)
RANDOM_EMOJI() {
  SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
  echo $SELECTED_EMOJI;
} 
#anomation end
PROMPT_DIRTRIM=2
PS1='\[\e[0;31m\]\[\e[0;31m\]┌──(\[\e[0;91m\]EFX$(RANDOM_EMOJI)Tv\[\e[0;31m\])\[\e[0;31m\]-\[\e[0;31m\]\[\e[0;31m\][\e[0m\]\[\e[0;33m\]\w\[\e[0m\]\[\e[0;31m\]]\[\e[0m\]\[\[\e[0m\]\n\[\e[0;31m\]└\[\e[0;31m\]●\[\e[0;37m\]●\[\e[0;32m\]● \[\e[0m\]'
}

su4(){
PS1='\[\e[1;33m\] \n EFX_Tv \[\e[1;30m\]\w\n\[\e[1;32m\] ▶ \[\e[0m\]'
}

custom(){
#YOU CAN CHANGE THIS ACCORDING TO YOUR NEED
PS1='\[\e[0;31m\]\[\e[0;32m\]┌──(\[\e[0;36m\]ROOT💀️EFX\[\e[0;31m\]\[\e[0;32m\])\[\e[0;31m\]-\[\e[0;31m\]\[\e[0;32m\][\e[0m\]\[\e[0;37m\]\w\[\e[0m\]\[\e[0;32m\]]\[\e[0m\]\[\[\e[0m\]\n\[\e[0;32m\]└─$\[\e[0m\]'
}

kali(){
PS1='\[\e[0;31m\]\[\e[0;32m\]┌──(\[\e[0;36m\]Kali💀️Linux\[\e[0;31m\]\[\e[0;32m\])\[\e[0;31m\]-\[\e[0;31m\]\[\e[0;32m\][\e[0m\]\[\e[0;37m\]\w\[\e[0m\]\[\e[0;32m\]]\[\e[0m\]\[\[\e[0m\]\n\[\e[0;32m\]└─$\[\e[0m\]'
}

mms(){
fro=$(free -h|grep Mem|awk '{print $4}')
mmo=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -10|grep -v PID|awk '{print $NF" "$1}'|sort -rk3|sed 's#^#MMS #g'|head -1)

PS1='\[\e[0;31m\]\[\e[0;31m\]┌──▶(\[\e[0;91m\]EFX Tv\[\e[0;31m\])\[\e[0;31m\]──\[\e[0;31m\]\[\e[0;31m\][\e[0m\]\[\e[0;33m\]\W\[\e[0m\]\[\e[0;31m\]]\[\e[0m\]\[\[\e[0m\]\[\e[0;31m\]──\[\e[0;31m\]\[\e[0;31m\][\e[0m\]\[\e[0;33m$mmo $fro\[\e[0m\]\[\e[0;31m\]]\[\e[0m\]\[\[\e[0m\]\n\[\e[0;31m\]└\[\e[0;31m\]●\[\e[0;37m\]●\[\e[0;32m\]● \[\e[0m\]'
#mms ps1 ends
}

lt(){
ls -lth|awk '{print "\033[0;32m"$1"\033[0m"" "$7"-"$6"-("$8")",$5,$NF}'|sed -e "1d"|sed "1i $(tput setaf 8)PERMISSIONS MODIFIED K/M FILE-NAME$(tput sgr0)"|column -t
}


# HUE PS one 
hueps(){
reset="\[\e[0m\]"

# Magic Bash Prompt Version 1.0.1
next_hue()
{
    color=$((31 + (++color % 7)))   # set 31 to 30 for dark on light
    PS1="\[\e[1;${color}m\]\\$ $reset"  # set 1 to 0 for dark on light
}

random_hue()
{
    color=$(($RANDOM % 7 + 31)) # set 31 to 30 for dark on light
    PS1="\[\e[1;${color}m\]\\$ $reset"  # set 1 to 0 for dark on light
}

PROMPT_COMMAND="random_hue"
}

absolute(){
readlink -f $1
# find $PWD/$1
}

ip(){
ifconfig|grep inet|sed 's#inet 127.0.0.1#LOCAL 127.0.0.1#g;s#inet 192#BEIDG 192#g;s#inet#OTHER#g'|awk '{print "\033[0;32m"$1":\033[0m","\t"$2,"\t"$4}'
}

playground(){
mkdir $PREFIX/tmp/efx 2>/dev/null
cd $PREFIX/tmp/efx
}

center()
{
echo -e "$1"|sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
}

efxtv(){
echo -e "Please Subscribe\b\b\b\b\b\b\b\b\b\b Join and Subscribe to EFX Tv" | pv -qL $[10+(-2 + RANDOM%5)]
}


server(){
termux-open-url $1
}

server2(){
python3 -m http.server > /dev/null 2>&1 &echo [+] Please wait...;sleep 2 ;echo [▶] HOST: http://0.0.0.0:8000;echo [▶] HOST: http://127.0.0.1:8000;echo [▶] STOP: pkill python ;echo [▶] FORW: ssh -R 80:localhost:8000 localhost.run;echo [▶] FORW: ssh -R 80:localhost:8000 serveo.net;
}

server3(){
#1 Path
python3 -m http.server -d $1 > /dev/null 2>&1 &echo [+] Please wait...;sleep 2 ;echo [▶] HOST: http://0.0.0.0:8000;echo [▶] HOST: http://127.0.0.1:8000;echo [▶] STOP: pkill python ;echo [▶] FORW: ssh -R 80:localhost:8000 localhost.run;echo [▶] FORW: ssh -R 80:localhost:8000 serveo.net;
}

server4(){
#$1 path
#$2 IP
#$3 port
python3 -m http.server -d $1 -b $2 $3 > /dev/null 2>&1 &echo [+] Please wait...;sleep 2 ;echo [▶] HOST: http://0.0.0.0:8000;echo [▶] HOST: http://127.0.0.1:8000;echo [▶] STOP: pkill python ;echo [▶] FORW: ssh -R 80:localhost:8000 localhost.run;echo [▶] FORW: ssh -R 80:localhost:8000 serveo.net;
}

open(){
termux-open-url $1
}
#su4

sonali(){
python /data/data/com.termux/files/home/tools/python/send.py $1
}

export ANDROID_HOME=$HOME/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
