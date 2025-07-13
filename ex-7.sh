#!/bin/bash

# File containing list of IPs (one per line)
IP_LIST_FILE="ip_list.txt"

# Get hostname and date
HOSTNAME=$(hostname)
DATE=$(date +%F)
LOG_FILE="${HOSTNAME}_${DATE}.log"

# Make sure the IP list file exists
if [ ! -f "$IP_LIST_FILE" ]; then
    echo "IP list file '$IP_LIST_FILE' not found."
    exit 1
fi

echo "Ping results - $DATE" > "$LOG_FILE"
echo "Running on host: $HOSTNAME" >> "$LOG_FILE"
echo "----------------------------" >> "$LOG_FILE"

# Read and ping each IP
while IFS= read -r ip; do
    if [ -n "$ip" ]; then
        echo "Pinging $ip..."
        if ping -c 1 -W 2 "$ip" > /dev/null 2>&1; then
            echo "$ip is reachable" >> "$LOG_FILE"
        else
            echo "$ip is NOT reachable" >> "$LOG_FILE"
        fi
    fi
done < "$IP_LIST_FILE"

echo "Ping test complete. Results saved in $LOG_FILE"