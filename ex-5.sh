#!/bin/bash

# Directory to store the output files
OUT_DIR="/var/log/passwd_snapshots"
mkdir -p "$OUT_DIR"

# File name with current date
FILE_NAME="$(date +%F).passwd"
FILE_PATH="$OUT_DIR/$FILE_NAME"

# Extract fields and save to file
cut -d: -f1,3 /etc/passwd > "$FILE_PATH"

# Delete files older than 2 days
find "$OUT_DIR" -type f -name "*.passwd" -mtime +2 -exec rm {} \;

echo "Saved passwd snapshot to $FILE_PATH"