#!/bin/bash

# Check if correct number of arguments is given
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <IP> <username> <password>"
    exit 1
fi

IP=$1
USER=$2
PASS=$3

# Check if server is reachable
ping -c 1 -W 2 "$IP" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Server is reachable. Sending /etc/passwd to /home/user on remote server..."

    # Check if sshpass is installed
    if ! command -v sshpass &> /dev/null; then
        echo "Error: sshpass is not installed. Install it with: sudo apt install sshpass"
        exit 2
    fi

    # Send file using scp and sshpass
    sshpass -p "$PASS" scp /etc/passwd "$USER@$IP:/home/user/passwd"

    if [ $? -eq 0 ]; then
        echo "File sent successfully."
    else
        echo "Failed to send file."
    fi
else
    echo "Server $IP is not accessible."
fi

# chmod +x send_passwd.sh
# ./send_passwd.sh 192.168.1.100 root yourpassword