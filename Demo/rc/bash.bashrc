# Command history tweaks:
# - Append history instead of overwriting
#   when shell exits.
# - When using history substitution, do not
#   exec command immediately.
# - Do not save to history commands starting
#   with space.
# - Do not save duplicated commands.
shopt -s histappend
shopt -s histverify
export HISTCONTROL=ignoreboth

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

#mms ps1 starts

fro=$(free -h|grep Mem|awk '{print $4}')
mmo=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -10|grep -v PID|awk '{print $NF" "$1}'|sort -rk3|sed 's#^#MMS #g'|head -1)

PS1='\[\e[0;31m\]\[\e[0;31m\]┌──▶(\[\e[0;91m\]EFX Tv\[\e[0;31m\])\[\e[0;31m\]──\[\e[0;31m\]\[\e[0;31m\][\e[0m\]\[\e[0;33m\]\W\[\e[0m\]\[\e[0;31m\]]\[\e[0m\]\[\[\e[0m\]\[\e[0;31m\]──\[\e[0;31m\]\[\e[0;31m\][\e[0m\]\[\e[0;33m$mmo $fro\[\e[0m\]\[\e[0;31m\]]\[\e[0m\]\[\[\e[0m\]\n\[\e[0;31m\]└\[\e[0;31m\]●\[\e[0;37m\]●\[\e[0;32m\]● \[\e[0m\]'
#mms ps1 ends
# Handles nonexistent commands.
# If user has entered command which invokes non-available
# utility, command-not-found will give a package suggestions.
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
	}
fi
alias sdcard='cd /sdcard'
alias telegram='cd /sdcard/Download/Telegram'
alias downloads='cd /sdcard/Download'
alias ifconfig='ifconfig 2>/dev/null'
alias usr='cd /data/data/com.termux/files/usr'
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='colordiff'
alias tab='column -t'
alias reload='termux-reload-settings'
alias remove='pkg remove'
alias i='pkg install'
kali(){
PS1='\[\e[0;31m\]\[\e[0;32m\]┌──(\[\e[0;36m\]Kali💀️Linux\[\e[0;31m\]\[\e[0;32m\])\[\e[0;31m\]-\[\e[0;31m\]\[\e[0;32m\][\e[0m\]\[\e[0;37m\]\w\[\e[0m\]\[\e[0;32m\]]\[\e[0m\]\[\[\e[0m\]\n\[\e[0;32m\]└─$\[\e[0m\]'
}
su(){
PS1='\[\e[1;32m\](\[\e[1;31m\]root@127.0.0.1\[\e[33;0m\]\[\e[1;32m\])─────┐\n ┌───────────────────┘ \n ├[\[\e[1;33m\]\w\[\e[1;32m\]]\n \[\e[1;32m\]└─▶\[\e[0m\] '
}
su2(){
PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]┌[✔]"; else echo "\[\033[01;32m\]┌[\[\033[01;31m\]✘\[\033[01;32m\]]"; fi`\[\033[01;32m\]─(\[\033[01;31m\]root\[\033[01;32m\])┐\[\033[01;32m\] \n└──────────┘\[\033[35m\]$(__git_ps1 " %s") \[\033[01;32m\]\n  ┌[\w]\n  \[\033[01;32m\]└───────$\[\033[00m\]'
}
ip(){
ifconfig|grep inet|sed 's#inet 127.0.0.1#LOCAL 127.0.0.1#g;s#inet 192#BEIDG 192#g;s#inet#OTHER#g'|awk '{print "\033[0;32m"$1":\033[0m","\t"$2,"\t"$4}'
}

alias delete='rm -rf'
alias update='pkg update && pkg upgrade --yes'


lt(){
ls -lth|awk '{print "\033[0;32m"$1"\033[0m"" "$7"-"$6"-("$8")",$5,$NF}'|sed -e "1d"|sed "1i $(tput setaf 8)PERMISSIONS MODIFIED K/M FILE-NAME$(tput sgr0)"|column -t
}

la(){
ls -lath|awk '{print "\033[0;32m"$1"\033[0m"" "$7"-"$6"-("$8")",$5,$NF}'|sed -e "1d"|sed "1i $(tput setaf 8)PERMISSIONS MODIFIED K/M FILE-NAME$(tput sgr0)"|column -t
}

absolute(){
echo -e "$PWD/$1"
}

alias code='pv -qL 6'
alias code2='pv -qL $[10+(-2 + RANDOM%5)]'
alias code3='pv -qL $[10+(-2 + RANDOM%5)]'
#code three can skip the characters \b\b\b\ will skip 4 characters
#example: echo -e "You are a goog\b\b\b\lovely person" | pv -qL $[10+(-2 + RANDOM%5)]
center()
{
echo -e "$1"|sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
}

alias start='nh kex &'
alias stop='nh kex stop'

pcurl (){
curl --socks5 127.0.0.1:9050 https://check.torproject.org |& grep -Po "(?<=strong>)[\d\.]+(?=</strong)"|sed 's/^/IP Changed with────────────────────█──<><><>───[ /g'|sed 's/$/ ]/g'
curl --socks5 127.0.0.1:9050 $1 --output $2
}

alias ubuntu='/data/data/com.termux/files/home/start-ubuntu20.sh'
server(){
python2 -m SimpleHTTPServer 8000 2>/dev/null
}

server2(){
ls -la |grep "^-"|awk '{print $NF}'|awk '{print "<b><a href=\""$1"\">"$NF"</a></b><br />"}'|awk '!/index.html/' >index.html
ip
chmod a=r index.html;chmod u=rw index.html
echo >$HOME/.cf.log > /dev/null 2>&1 &
echo -n "ENTER IP: "
read ips
pkill php > /dev/null 2>&1 &
php -S 0.0.0.0:5555 > /dev/null 2>&1 &
$HOME/cloudflared tunnel -url localhost:5555 --logfile $HOME/.cf.log > /dev/null 2>&1 &
echo "PLEASE WAIT..."
sleep 6
cdf=$(cat $HOME/.cf.log | grep -o 'https://[-0-9a-z]*\.trycloudflare.com')
sleep 3
echo -e "YOUR LINK: $cdf"
}
su
