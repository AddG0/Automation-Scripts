#!/bin/bash

# Check if an argument was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 /path/to/monitor"
    exit 1
fi

# Directory to monitor - taken from the first script argument
MONITOR_DIR="$1"

# Function to remove ._ files
remove_dot_underscore_files() {
    find "$MONITOR_DIR" -name '._*' -exec rm {} \;
}

# Using fswatch to monitor the directory
fswatch -o "$MONITOR_DIR" | while read; do
    remove_dot_underscore_files
done
