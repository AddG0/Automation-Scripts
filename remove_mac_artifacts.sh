#!/bin/bash

# Set the directory to monitor - use the first script argument or the current directory if no argument is provided
MONITOR_DIR="${1:-$(pwd)}"

# Function to remove ._ files
remove_dot_underscore_files() {
    find "$MONITOR_DIR" -name '._*' -exec rm {} \;
}

echo "Monitoring $MONITOR_DIR for ._* files..."

# Using fswatch to monitor the directory
fswatch -o "$MONITOR_DIR" | while read; do
    remove_dot_underscore_files
done
