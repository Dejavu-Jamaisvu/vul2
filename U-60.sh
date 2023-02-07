#!/bin/bash

 

. function.sh

 
TMP1=`SCRIPTNAME`.log

> $TMP1  
 

BAR

CODE [U-60] ssh 원격접속 허용

cat << EOF >> $result

[양호]: 원격 접속 시 SSH 프로토콜을 사용하는 경우

[취약]: 원격 접속 시 Telnet, FTP 등 안전하지 않은 프로토콜을 사용하는 경우

EOF

BAR

# Flag to indicate if any insecure protocol is installed and running
secure=1

# Check if Telnet is installed and running
if dpkg -s telnet &> /dev/null && ps aux | grep -v grep | grep telnetd; then
    echo "WARNING: Telnet is installed and running on this system. It is an insecure protocol and should not be used."
    secure=0
fi

# Check if FTP is installed and running
if dpkg -s ftp &> /dev/null && ps aux | grep -v grep | grep ftpd; then
    echo "WARNING: FTP is installed and running on this system. It is an insecure protocol and should not be used."
    secure=0
fi

# Check if no insecure protocol is installed and running
if [ $secure -eq 1 ]; then
    echo "This system is secure."
fi


cat $result

echo ; echo 
