#!/bin/bash

for DEV in /sys/block/sd*; do
    if readlink "$DEV/device" | grep -q usb; then
        DEV=$(basename "$DEV")

        # Check if the device is mounted
        MOUNT_POINT=$(df -H | grep "$DEV" | awk '{print $NF}' | head -n 1)
        if [ -n "$MOUNT_POINT" ]; then
            echo "$DEV is a mounted USB device at $MOUNT_POINT"

            # Perform git operation on the mount point
            echo "Adding directories containing a .git folder to Git safe.directory..."
            find "$MOUNT_POINT" -type d -name .git | while read -r gitDir; do
                repoDir=$(dirname "$gitDir")
                git config --global --add safe.directory "$repoDir"
            done
        else
            echo "$DEV is a USB device but not mounted"
        fi
    fi
done

exit 0
