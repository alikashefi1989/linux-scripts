#!/bin/bash

# Variables
USER_HOME="$HOME"
BACKUP_DIR="/home/$USER/backups"
TIMESTAMP=$(date +%F_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/home_backup_$TIMESTAMP.tar.gz"

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

# Create compressed backup
tar -czf "$BACKUP_FILE" "$USER_HOME"

# Optional: keep only last 3 backups
ls -tp "$BACKUP_DIR"/home_backup_*.tar.gz | tail -n +4 | xargs -I {} rm -- {}
