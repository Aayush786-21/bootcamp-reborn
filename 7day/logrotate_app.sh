#!/bin/bash

LOG_DIR="/var/log/app_logs"
TODAY=$(date +"%Y-%m-%d")
NEW_LOG="$LOG_DIR/app_log_$TODAY.log"

# 1. Delete logs older than 30 days
find "$LOG_DIR" -type f -mtime +30 -exec rm -f {} \;

# 2. Compress logs older than 1 day but not yet compressed
find "$LOG_DIR" -type f -name "*.log" -mtime +1 -exec gzip {} \;

# 3. Create a new log file for today (only if not already created)
if [ ! -f "$NEW_LOG" ]; then
    touch "$NEW_LOG"
    echo "[$(date)] New log file created: $NEW_LOG"
fi

