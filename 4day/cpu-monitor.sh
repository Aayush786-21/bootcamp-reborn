#!/bin/bash

# Find the process using the most CPU
process_info=$(ps -eo pid,comm,%cpu --sort=-%cpu | sed -n '2p')

pid=$(echo "$process_info" | awk '{print $1}')
name=$(echo "$process_info" | awk '{print $2}')
cpu=$(echo "$process_info" | awk '{print $3}')

# Log the results
echo "PID: $pid | Process: $name | CPU Usage: ${cpu}%" >> cpu_report.txt

